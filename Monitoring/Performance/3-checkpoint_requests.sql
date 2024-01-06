/* Values to much lower 1
1-Increase the checkpoint_segments parameter
2-Or decrease the checkpoint_timeout value
*/
select
	checkpoints_timed / (checkpoints_timed+checkpoints_req)::numeric AS timed_ratio
from
	pg_stat_bgwriter
