FROM public.ecr.aws/amazonlinux/amazonlinux:latest
RUN yum -y update
RUN amazon-linux-extras install epel -y
RUN yum -y install stress-ng

### Install AWS CLI version 2.
RUN yum -y install unzip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install -i /usr/local/aws-cli -b /usr/bin
RUN aws --version
RUN rm awscliv2.zip

RUN echo $'#!/bin/bash\n\
aws s3 ls ${STRESS_BUCKET}/ \n\
aws s3 cp ${STRESS_BUCKET}/stress-tests.txt / --quiet \n\
STRESS_ARGS=`sed -n $((AWS_BATCH_JOB_ARRAY_INDEX + 1))p /stress-tests.txt` \n\
echo "Passing the following arguments to stress-ng: $STRESS_ARGS" \n\
/usr/bin/stress-ng ${STRESS_ARGS} 2>&1 | aws s3 cp --quiet - ${STRESS_BUCKET}/${AWS_BATCH_JOB_ID}_${AWS_BATCH_JOB_ATTEMPT}_${AWS_BATCH_JOB_ARRAY_INDEX}.txt \n\ 
' >> /docker-entrypoint.sh 
RUN chmod 0744 /docker-entrypoint.sh
RUN cat /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

