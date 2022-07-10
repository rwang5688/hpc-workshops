#!/bin/bash
echo \${1}
export AWS_REGION=\$(curl --silent http://169.254.169.254/latest/meta-data/placement/region)
export AWS_ACCOUNT=\$(curl -s 169.254.169.254/latest/meta-data/identity-credentials/ec2/info | jq -r '.AccountId')
aws ecr get-login-password --region \${AWS_REGION} | docker login --username AWS --password-stdin \${AWS_ACCOUNT}.dkr.ecr.\${AWS_REGION}.amazonaws.com
docker build -t \${1} .
docker tag \${1}:latest \${AWS_ACCOUNT}.dkr.ecr.\${AWS_REGION}.amazonaws.com/\${1}:latest
docker push \${AWS_ACCOUNT}.dkr.ecr.\${AWS_REGION}.amazonaws.com/\${1}:latest

