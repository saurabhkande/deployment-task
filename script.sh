#! /bin/bash

# creating new task definition

#aws ecs register-task-definition --cli-input-json file://taskdef.json

# Getting the revision for newly created task definition

export revision=`aws ecs describe-task-definition  --task-definition Poc-task-definition | awk '/revision/ {print $4}'`

echo $revision

# Updateing the ECS service with new task definition

aws ecs update-service --cluster ecs_poc_cluster --service poc-task-service --task-definition Poc-task-definition:$revision --no-cli-pager

exit_code=$?
if [ $exit_code -eq 0 ]; then
    echo "Service update succeeded"
else
    echo "Service update failed with exit code $exit_code"
fi
