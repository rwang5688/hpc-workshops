#!/bin/bash
aws batch submit-job --cli-input-json file://stress-ng-array-job.json

