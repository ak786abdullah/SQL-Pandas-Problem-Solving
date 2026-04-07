# Write your MySQL query statement below
WITH StudentScore AS (
    SELECT
        student_id,
        subject,
        # 1st_exam's score of each student and subject 
        FIRST_VALUE(score) OVER (PARTITION BY student_id,subject ORDER BY exam_date ASC) AS first_score,
        # latest_exam's score of each student and subject 
        FIRST_VALUE(score) OVER (PARTITION BY student_id,subject ORDER BY exam_date DESC) AS latest_score
    FROM 
        Scores

)
SELECT 
    student_id,
    subject,
    first_score,
    latest_score
FROM
    StudentScore
WHERE 
    latest_score > first_score
GROUP BY 
    student_id,subject
ORDER BY 
    student_id,subject;