#!/usr/bin/env bash

export GOOGLE_USERNAME=eugene@chainalysis.com
export DEPT_ROLE=engineering-data

export AWS_PROFILE=org-sso
export AWS_SSO_MODE=gsts

export AWS_HELPER_DIR=~/Projects/terraform/util/aws
source $AWS_HELPER_DIR/org-sso-helper.sh

#if [ ! -f ~/.aws/config ]; then
#    ln -s $AWS_HELPER_DIR/config ~/.aws/config
#fi

alias awsId='aws sts get-caller-identity'

export DATAENG_DEV=dataeng-dev-admin
export DATAENG_PROD=data-warehouse-prod-admin

function aws-auth() {
    export AWS_PROFILE=$1
    awsId | jq '.Arn' | awk -F '/' '{ print "Assumed role: " $2 }'
}

alias aws-dataeng-dev='aws-auth $DATAENG_DEV'
alias aws-dataeng-prod='aws-auth $DATAENG_PROD'
