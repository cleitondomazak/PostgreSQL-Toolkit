SELECT
	relname,
	seq_scan,
	idx_scan
FROM
	pg_stat_user_tables
ORDER BY
	seq_scan DESC
limit
	10;
