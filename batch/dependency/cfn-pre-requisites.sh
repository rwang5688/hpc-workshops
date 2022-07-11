#!/bin/bash

STACK_NAME='BatchWorkshop'

# create the stack
echo "1/3 - Create Stack $STACK_NAME"
aws cloudformation create-stack --stack-name $STACK_NAME --template-body file://s3policy.yaml --capabilities "CAPABILITY_IAM"

echo "2/3 - Stack $STACK_NAME being created"
# wait for the stack to be completed
aws cloudformation wait stack-create-complete --stack-name $STACK_NAME

echo "3/3 - Stack $STACK_NAME created"
# once done get the role and bucket
export EXECUTION_ROLE=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --output text --query 'Stacks[0].Outputs[?OutputKey == \`JobExecutionRole\`].OutputValue')
export STRESS_BUCKET="s3://$(aws cloudformation describe-stacks --stack-name $STACK_NAME --output text --query 'Stacks[0].Outputs[?OutputKey == \`Bucket\`].OutputValue')"

echo "Use the following Job Execution Role ID with AWS Batch: ${EXECUTION_ROLE}"
echo "Use the following S3 Bucket for your AWS Batch jobs: ${STRESS_BUCKET}"

