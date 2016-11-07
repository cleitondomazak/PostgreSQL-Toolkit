#!/bin/bash
BUCKET="s3://<your_bucket_name>/" #s3 bucket name
PGBADGERLOGS="<storage_pgbadger_logs>" #directory where out file must be saved
JOBS=$1 #number of jobs to run at same time
RETENTION=$2 #number of week to keep in incremental mode

execute_analyze () {
    if [[ ${JOBS} -ne '' && ${RETENTION} -ne '' ]]; then
            pgbadger -j ${JOBS} --exclude-query="^(COPY|COMMIT)" -I -O ${PGBADGERLOGS} -R ${RETENTION} ${PGDATA}/pg_log/postgresql-$(date --date yesterday +%a) ${PGDATA}/pg_log/postgresql-$(date +%a).log
            aws s3 sync ${PGBADGERLOGS} ${BUCKET}
    else
            exit 1
fi
}

execute_analyze ${JOBS} ${RETENTION}
