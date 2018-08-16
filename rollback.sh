#! /bin/bash
npm install serverless -g
npm install serverless-stack-output # we have to install the three plugins specified in our serverless.yml to avoid errors, even though we won't be using them


echo "====================="
echo "$PWD"
echo "$CODEBUILD_SRC_DIR/artifacts/$env"
echo "Deploying app to $env"
echo "====================="

#### for rollback use 
export TIMESTAMP=$(sls rollback --stage $env | grep Timestamp | tail -n 1| cut -d: -f3)


echo "output timestamp"

sls rollback --stage $env

echo "Timestamp"
echo $TIMESTAMP


sls rollback --stage $env | grep Timestamp | tail -n 1| cut -d: -f3

echo "rolling back go "
echo "====================="

