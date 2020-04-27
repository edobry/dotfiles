#!/usr/bin/env bash

export GOOGLE_IDP_ID=C01pghfef
export GOOGLE_SP_ID=869108112291
export DURATION=14400

export AWS_DATAENGDEV_PROFILE=dev-dataeng
export AWS_DATAENGDEV_ARN=arn:aws:iam::413583117059:role/dataeng-dev-admin

export AWS_DATAENG_PROD_PROFILE=dataeng-prod
export AWS_DATAENG_PROD_ARN=arn:aws:iam::044506312965:role/engineering-data

export AWS_KMS_KEY_ARN=arn:aws:kms:eu-west-1:477596031399:key/c5e8935f-75e2-4010-bc85-7629d9897374

export AWS_DEFAULT_PROFILE=$AWS_DATAENGDEV_PROFILE
