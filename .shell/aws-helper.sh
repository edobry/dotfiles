#!/usr/bin/env bash


if [[ -z "${GOOGLE_USERNAME} " ]]
then
    echo "GOOGLE_USERNAME must be set to your chainalysis email address."
    exit 1
fi

export GOOGLE_IDP_ID=C01pghfef
export GOOGLE_SP_ID=869108112291
export DURATION=14400

AWS_DEFAULT_PROFILE="dev-eng"

AWS_DEV_PROFILE=dev-eng
AWS_DEV_ENG_ARN=arn:aws:iam::477596031399:role/Dev-Engineering

AWS_DATAENGDEV_PROFILE=dev-dataeng
AWS_DATAENGDEV_ARN=arn:aws:iam::413583117059:role/dataeng-dev-admin

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
    aws-google-auth -q ${AWS_GOOGLE_AUTH_EXTRA_ARGS} --profile ${_profile} --role-arn ${_arn} 
    export AWS_PROFILE=${_profile}
    aws sts get-caller-identity
}

function aws-dev(){
    do_aws_google_auth ${AWS_DEV_PROFILE} ${AWS_DEV_ENG_ARN}
}

function aws-dataeng(){
    do_aws_google_auth ${AWS_DATAENGDEV_PROFILE} ${AWS_DATAENGDEV_ARN}
}

alias helgard-up='sudo wg-quick up wg0'
alias helgard-down='sudo wg-quick down wg0'

