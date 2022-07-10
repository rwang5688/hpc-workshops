#!/bin/bash
#### Edit these environment variables.
export JOB_NAME=stress-ng-array-6
export JOB_ARRAY_SIZE=6
export JOB_QUEUE=stress-ng-queue
export JOB_DEFINITION=stress-ng-array-job-definition
aws batch submit-job --job-name ${JOB_NAME} --job-queue ${JOB_QUEUE} --job-definition ${JOB_DEFINITION} --array-properties size=${JOB_ARRAY_SIZE} 

