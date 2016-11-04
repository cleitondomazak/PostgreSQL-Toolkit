#!/bin/bash
BUCKET="s3://<your_bucket_name>/"
PGBADGERLOGS="<storage_pgbadger_logs>"
INCREMENTAL=$1
JOBS=$2
RETENTION=$3

execute_analyze () {
    if [[ ${INCREMENTAL} -eq 1 && ${JOBS} -ne '' && ${RETENTION} -ne '' ]]; then
            pgbadger -j ${JOBS} --exclude-query="^(COPY|COMMIT)" -I -O ${PGBADGERLOGS} -R ${RETENTION} ${PGDATA}/pg_log/postgresql-$(date +%a).log
            aws s3 sync ${PGBADGERLOGS} ${BUCKET}
    else
            exit 1
fi
}

execute_analyze ${INCREMENTAL} ${JOBS} ${RETENTION}
