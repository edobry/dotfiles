#!/usr/bin/env bash

export GOOGLE_USERNAME=eugene@chainalysis.com
export DEPT_ROLE=engineering-data

export AWS_PROFILE=org-sso

export AWS_HELPER_DIR=~/Projects/terraform/util/aws
source $AWS_HELPER_DIR/org-sso-helper.sh

alias awsId='aws sts get-caller-identity'

export DATAENG_DEV=dataeng-dev-admin
export DATAENG_PROD=data-warehouse-prod-admin

function awsRole() {
    awsId | jq '.Arn' | awk -F '/' '{ print $2 }'
}

function aws-auth() {
    export AWS_PROFILE=$1
    echo "Assumed role: $(awsRole)"
}

alias aws-dataeng-dev='aws-auth $DATAENG_DEV'
alias aws-dataeng-prod='aws-auth $DATAENG_PROD'
