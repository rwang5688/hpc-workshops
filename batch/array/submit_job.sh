#!/bin/bash
echo ${1}
aws batch submit-job --cli-input-json file://${1}-job.json

