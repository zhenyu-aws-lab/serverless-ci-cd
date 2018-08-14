#! /bin/bash


echo "====================="
echo "$PWD"
echo "$CODEBUILD_SRC_DIR/artifacts/$env"
echo "Deploying app to $env"
echo "====================="

#### for rollback use 
export TIMESTAMP=$(sls rollback --stage $env | awk '/Timestamp: 15/ {print $NF;exit}')
sls rollback --stage $env -t $TIMESTAMP

echo "rolling back go "
echo "====================="

