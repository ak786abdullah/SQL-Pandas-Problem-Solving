WITH firstpositive AS (
    SELECT 
        patient_id,
        MIN(test_date) AS first_pos_date
    FROM 
        covid_tests
    WHERE 
        result='Positive'
    GROUP BY 
        patient_id
),firstnegitive AS (
    SELECT 
        t.patient_id,
        MIN(test_date) AS first_ng_date
    FROM 
        covid_tests t 
        JOIN firstpositive p 
        ON t.patient_id=p.patient_id
    WHERE 
        t.result = 'Negative'
        AND t.test_date > p.first_pos_date
    GROUP BY 
        t.patient_id

)
SELECT 
    p.patient_id,
    p.patient_name,
    p.age,
    DATEDIFF(ng.first_ng_date,pos.first_pos_date) AS recovery_time
FROM 
    patients p 
    JOIN firstpositive pos ON p.patient_id=pos.patient_id
    JOIN firstnegitive ng ON p.patient_id=ng.patient_id
ORDER BY
    recovery_time ASC ,patient_name ASC ;