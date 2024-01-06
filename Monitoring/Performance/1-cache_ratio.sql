/* Values to much lower 1
1-Can indicate low shared_buffer values
*/
select
	sum(blks_hit) / sum((blks_read + blks_hit) :: numeric)
from
	pg_stat_database
where
	blks_read + blks_hit <> 0;
