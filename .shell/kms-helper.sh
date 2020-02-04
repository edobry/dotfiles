function kmsEncrypt() {
    aws-dev;
    aws kms encrypt --key-id arn:aws:kms:eu-west-1:477596031399:key/c5e8935f-75e2-4010-bc85-7629d9897374 --plaintext $1 --output text | awk '{ print $1; }';
}

