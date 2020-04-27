#!/usr/bin/env bash


if [[ -z "${GOOGLE_USERNAME} " ]]
then
    echo "GOOGLE_USERNAME must be set to your chainalysis email address."
    exit 1
fi

OWNDIR="$(dirname "$(which "$0")")"

source $OWNDIR/aws-values.sh

if [[ `uname` == 'Darwin' ]]; then
    export AWS_GOOGLE_AUTH_EXTRA_ARGS="--keyring"
else
    export AWS_GOOGLE_AUTH_EXTRA_ARGS=
fi

function do_aws_google_auth()
{
    local _profile=$1
    local _arn=$2
    unset AWS_PROFILE
    gsts -q ${AWS_GOOGLE_AUTH_EXTRA_ARGS} --aws-profile ${_profile} --aws-role-arn ${_arn} $3
    export AWS_PROFILE=${_profile}
    aws sts get-caller-identity
}

function aws-dev(){
    do_aws_google_auth ${AWS_DEV_PROFILE} ${AWS_DEV_ENG_ARN} $1
}

function aws-dataeng(){
    do_aws_google_auth ${AWS_DATAENGDEV_PROFILE} ${AWS_DATAENGDEV_ARN} $1
}

function aws-dataeng-prod(){
    do_aws_google_auth ${AWS_DATAENG_PROD_PROFILE} ${AWS_DATAENG_PROD_ARN} $1
}
