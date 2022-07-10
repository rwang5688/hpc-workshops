#!/bin/bash
#### Edit these environment variables.
echo "JOB_ARRAY_SIZE=${1}"
export JOB_NAME=stress-ng-array-${1}
export JOB_ARRAY_SIZE=${1}
export JOB_QUEUE=stress-ng-queue
export JOB_DEFINITION=stress-ng-array-job-definition
aws batch submit-job --job-name ${JOB_NAME} --job-queue ${JOB_QUEUE} --job-definition ${JOB_DEFINITION} --array-properties size=${JOB_ARRAY_SIZE} 

