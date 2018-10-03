--information on triggers order
SHOW TRIGGERS FROM schema_name;


SELECT
    trigger_name, action_order
FROM
    information_schema.triggers
WHERE
    trigger_schema = 'schema_name'
ORDER BY event_object_table ,
         action_timing ,
         event_manipulation