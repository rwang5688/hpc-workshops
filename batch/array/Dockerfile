FROM public.ecr.aws/amazonlinux/amazonlinux:latest
RUN yum -y update
RUN amazon-linux-extras install epel -y
RUN yum -y install stress-ng

### Build mktests.sh
RUN echo $'#!/bin/bash\n\
FILE=/stress-tests.txt\n\
rm $FILE 2>/dev/null\n\
COUNT=0\n\
for II in `stress-ng --cpu-method which 2>&1`\n\
do\n\
    if [ $COUNT -gt  5 ]; then\n\
        echo "--cpu 0 -t 120s --times --cpu-method $II" >> $FILE\n\
    fi\n\
    COUNT=`expr $COUNT + 1`\n\
done' >> /mktests.sh
RUN chmod 0744 /mktests.sh
RUN cat /mktests.sh

RUN echo $'#!/bin/bash\n\
/mktests.sh\n\
STRESS_ARGS=`sed -n $((AWS_BATCH_JOB_ARRAY_INDEX + 1))p /stress-tests.txt`\n\
echo "Passing the following arguments to stress-ng: $STRESS_ARGS"\n\
/usr/bin/stress-ng $STRESS_ARGS' \n\ >> /docker-entrypoint.sh 
RUN chmod 0744 /docker-entrypoint.sh
RUN cat /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

