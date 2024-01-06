SELECT
	(total_exec_time / 1000 / 60) as total_min,
	mean_exec_time as avg_ms,
	calls,
	query
FROM
	pg_stat_statements
ORDER BY
	1 DESC
LIMIT
	500;
