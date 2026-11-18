### Key Settings  
max_connections
shared_buffers
effective_cache_size
work_mem
maintenance_work_mem
autovacuum_max_workers
wal_buffers
effective_io_concurrency
random_page_cost
seq_page_cost
log_min_duration_statement

```SELECT
    name AS setting_name,
    setting AS setting_value,
    unit AS setting_unit
FROM pg_settings
WHERE name IN (
    'max_connections',
    'shared_buffers',
    'effective_cache_size',
    'work_mem',
    'maintenance_work_mem',
    'autovacuum_max_workers',
    'wal_buffers',
    'effective_io_concurrency',
    'random_page_cost',
    'seq_page_cost',
    'log_min_duration_statement'
)
``` 

# Good Read 
- https://vladmihalcea.com/postgresql-performance-tuning-settings/

DB connections : https://vladmihalcea.com/maximum-database-connections/ 
Universal scalibility law : https://www.perfdynamics.com/Manifesto/USLscalability.html
pool sizing - https://github.com/brettwooldridge/HikariCP/wiki/About-Pool-Sizing
