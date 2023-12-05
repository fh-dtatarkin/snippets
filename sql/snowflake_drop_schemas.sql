--- DROP all chemas in Snowflake that begin with "name_"

SELECT SCHEMA_NAME
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME LIKE 'name\_%';


--- After verifying the schemas listed are the ones you expect to be dropped run the below:

-- SELECT 'DROP SCHEMA IF EXISTS ' || SCHEMA_NAME || ' CASCADE;'
-- FROM INFORMATION_SCHEMA.SCHEMATA
-- WHERE SCHEMA_NAME LIKE 'name\_%'