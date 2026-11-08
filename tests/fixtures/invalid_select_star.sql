-- Test fixture: intentionally invalid. Not under sql/, so validate_sql.sh does not scan it.
-- Expected result: validation rules reject SELECT * and the missing trailing semicolon.
SELECT *
FROM staging.lab_results
