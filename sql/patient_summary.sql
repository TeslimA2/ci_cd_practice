SELECT
    patient_id,
    COUNT(*) AS result_count
FROM staging.lab_results
GROUP BY
    patient_id;
