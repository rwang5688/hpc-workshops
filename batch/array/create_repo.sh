#!/bin/bash
echo \${1}
aws ecr create-repository --repository-name \${1}

