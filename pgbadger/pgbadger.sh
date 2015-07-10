#!/bin/bash
LOG_DIR="/storage/database_log"
DBNAME="dbname"
DBUSER="dbuser"
BUCKET="s3_bucket"
S3_DIR="dir"
RANGE=$1
CORES=$2
DATELOG=$(date -d 'yesterday' '+%Y-%m-%d')

execute_analyze () {
    if [ "${RANGE}" == "daily" ]; then
            pgbadger -j ${CORES} --exclude-query="^(COPY|COMMIT)" -d ${DBNAME} -u ${DBUSER} -o ${DATELOG}.html ${LOG_DIR}/postgres-${DATELOG}*.csv --prefix='%m %u@%d %p %r'
            s3cmd put --delete-after ${DATELOG}.html s3://${BUCKET}/${S3_DIR}
    elif [ "${RANGE}" == "weekly" ]; then
            weak_range=($(find ${LOG_DIR}/* -type f -mtime -9 -mtime +0))
            pgbadger -j ${CORES} --exclude-query="^(COPY|COMMIT)" -d ${DBNAME} -u ${DBUSER} -o week_${DATELOG}.html ${weak_range}  --prefix='%m %u@%d %p %r'
            s3cmd put --delete-after week_${DATELOG}.html s3://${BUCKET}/${S3_DIR}
    else
            echo "Missing parameters! (Ex: range=daily or weekly, as well the parallel execution number of cores.)"
            exit 1
fi
}

execute_analyze ${RANGE}
