#!/bin/bash
BUCKET="s3://<your_bucket_name>/"
PGBADGERLOGS="<storage_pgbadger_logs>"
JOBS=$1
RETENTION=$2

execute_analyze () {
    if [[ ${JOBS} -ne '' && ${RETENTION} -ne '' ]]; then
            pgbadger -j ${JOBS} --exclude-query="^(COPY|COMMIT)" -I -O ${PGBADGERLOGS} -R ${RETENTION} ${PGDATA}/pg_log/postgresql-$(date +%a).log
            aws s3 sync ${PGBADGERLOGS} ${BUCKET}
    else
            exit 1
fi
}

execute_analyze ${JOBS} ${RETENTION}
