--- Simple option for retrieving DB size
SELECT pg_size_pretty(pg_database_size('<DB_NAME>'))

--- Storage used by table
SELECT
    table_schema,
    table_name,
    pg_size_pretty(total_bytes) AS total_size
FROM (
    SELECT
        table_schema,
        table_name,
        pg_total_relation_size(table_schema || '.' || table_name) AS total_bytes
    FROM
        information_schema.tables
    WHERE
        table_schema NOT IN ('pg_catalog', 'information_schema')
) AS table_sizes
ORDER BY
    total_bytes DESC;

--- Sum of storage used in a database
SELECT
    pg_size_pretty(SUM(total_bytes)) AS total_storage
FROM (
    SELECT
        pg_total_relation_size(table_schema || '.' || table_name) AS total_bytes
    FROM
        information_schema.tables
    WHERE
        table_schema NOT IN ('pg_catalog', 'information_schema')
) AS table_sizes;


--- Optimization
VACUUM FULL;

VACUUM ANALYZE;
