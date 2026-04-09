WITH first_half AS (
    SELECT 
        driver_id,
        AVG(distance_km / fuel_consumed) AS first_half_avg
    FROM 
        trips
    WHERE 
        MONTH(trip_date) >= 1 AND MONTH(trip_date) <= 6
    GROUP BY 
        driver_id
),second_half AS (
    SELECT 
        driver_id,
        AVG(distance_km / fuel_consumed) AS second_half_avg
    FROM 
        trips 
    WHERE 
        MONTH(trip_date) > 6 AND MONTH(trip_date) <= 12
    GROUP BY 
        driver_id
) 
    SELECT 
        f.driver_id ,
        d.driver_name,
        ROUND(f.first_half_avg,2) AS first_half_avg,
        ROUND(s.second_half_avg,2) AS second_half_avg,
        ROUND((s.second_half_avg - f.first_half_avg),2) AS efficiency_improvement 
    FROM 
        first_half f 
        JOIN second_half s ON f.driver_id = s.driver_id 
        JOIN drivers d ON d.driver_id=f.driver_id
    WHERE 
        S.second_half_avg > f.first_half_avg
    ORDER BY 
        efficiency_improvement DESC ,d.driver_name ASC;