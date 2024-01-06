/*
1-Can indicate low work_mem values
*/
select
	pg_size_pretty(sum(temp_bytes)) as size
from
	pg_stat_database;
