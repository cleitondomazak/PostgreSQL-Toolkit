/* Values to much lower 1
1-Force more CHECKPOINTS
2-Increase the shared_buffer
*/
select
	buffers_checkpoint / (buffers_checkpoint + buffers_backend) :: numeric AS checkpointer_ratio
from
	pg_stat_bgwriter
