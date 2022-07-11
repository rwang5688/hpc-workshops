#!/bin/bash
echo ${1}
aws batch register-job-definition --cli-input-json file://${1}-job-definition.json

