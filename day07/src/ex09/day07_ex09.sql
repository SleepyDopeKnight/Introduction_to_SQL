SELECT address,
       round(cast(max(age)::float - (min(age)::float / max(age)::float) AS numeric), 2) AS formula,
       round(avg(age), 2)                                                               AS average,
       CASE
           WHEN round(avg(age), 2) < (max(age)::float - (min(age)::float / max(age)::float)) THEN true
           ELSE false
           END                                                                          AS comparison
FROM person
GROUP BY address
ORDER BY 1;