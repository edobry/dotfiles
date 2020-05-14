#!/usr/bin/env bash

export GOOGLE_USERNAME=eugene@chainalysis.com
export DEPT_ROLE=engineering-data

export AWS_AUTH_PROFILE=org-sso
export AWS_PROFILE=$AWS_AUTH_PROFILE

export AWS_HELPER_DIR=~/Projects/terraform/util/aws
source $AWS_HELPER_DIR/org-sso-helper.sh

function awsId() {
    local id
    if id=$(aws sts get-caller-identity) 2> /dev/null; then
        echo $id
        export AWS_CURRENT_ROLE=$id
    else
        return 1
    fi
}

export DATAENG_DEV=dataeng-dev-admin
export DATAENG_PROD=data-warehouse-prod-admin

function awsRole() {
    local id
    if id=$(awsId); then
        echo $id | jq '.Arn' | awk -F '/' '{ print $2 }'
    else
        return 1
    fi
}

function aws-auth() {
    if ! awsId > /dev/null; then
        echo "Reauthenticating..."
        AWS_PROFILE=$AWS_AUTH_PROFILE gimme-aws-creds
    fi

    export AWS_PROFILE=$1

    local role
    if [ -z $AWS_CURRENT_ROLE ]; then
        role=$AWS_CURRENT_ROLE
    else
        role=$(awsRole)
    fi
    echo "Assumed role: $role"
}

alias aws-dataeng-dev='aws-auth $DATAENG_DEV'
alias aws-dataeng-prod='aws-auth $DATAENG_PROD'
