WITH data AS (SELECT *
    FROM generate_series('2022-01-01'::timestamp, '2022-01-10', '1 day') AS missing_date)

SELECT to_char(missing_date, 'YYYY-MM-DD') AS missing_date
FROM data
         LEFT JOIN (SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) AS pv
                   ON missing_date = pv.visit_date WHERE visit_date IS NULL ORDER BY missing_date;