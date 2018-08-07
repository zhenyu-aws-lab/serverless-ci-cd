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

export TIMESTAMP=$(sls rollback | awk '/Timestamp: 15/ {print $NF;exit}')

sls rollback -t $TIMESTAMP

echo "rolling back "
echo "====================="

# serverless deploy --stage $env --package $CODEBUILD_SRC_DIR/artifacts/$env -v
