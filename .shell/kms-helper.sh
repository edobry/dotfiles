function kmsEncrypt() {
    aws-dev;
    aws kms encrypt --key-id $AWS_KMS_KEY_ARN --plaintext $1 --output text | awk '{ print $1; }';
}

