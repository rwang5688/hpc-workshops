#!/bin/bash
aws batch register-job-definition --cli-input-json file://stress-ng-array-job-definition.json

