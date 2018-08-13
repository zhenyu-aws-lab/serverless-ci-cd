#! /bin/bash

echo "Installing serverless"
echo "====================="
npm install -g serverless
npm install serverless-dynamodb-local serverless-offline serverless-stack-output # we have to install the three plugins specified in our serverless.yml to avoid errors, even though we won't be using them

echo "====================="
echo "$PWD"
echo "$CODEBUILD_SRC_DIR/artifacts/$env"
echo "Deploying app to $env"
echo "====================="

#### for rollback use 
# export TIMESTAMP=$(sls rollback --stage $env | awk '/Timestamp: 15/ {print $NF;exit}')
# sls rollback --stage $env -t $TIMESTAMP

echo "rolling back go "
echo "====================="


serverless deploy --stage $env --package $CODEBUILD_SRC_DIR/artifacts/$env -v
