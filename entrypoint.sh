#!/bin/sh

set -e

mkdir -p ~/.aws
touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

ls -la
echo '-----------'
ls -la ..
echo "file - $FILE"
echo "AWS_S3_BUCKET - $AWS_S3_BUCKET"
echo "AWS_REGION - $AWS_REGION"
aws s3 cp ${FILE} s3://${AWS_S3_BUCKET} \
            --region ${AWS_REGION} $*

rm -rf ~/.aws
