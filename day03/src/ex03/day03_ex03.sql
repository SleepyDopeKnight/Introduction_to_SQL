SELECT name AS pizzeria_name
FROM (SELECT *
      FROM (SELECT pizzeria_id
            FROM person_visits
                     JOIN person on person_visits.person_id = person.id
            WHERE person.gender = 'male'
            EXCEPT ALL
            SELECT pizzeria_id
            FROM person_visits
                     JOIN person on person_visits.person_id = person.id
            WHERE person.gender = 'female') AS first
UNION ALL
SELECT *
 FROM (SELECT pizzeria_id
       FROM person_visits
                JOIN person on person_visits.person_id = person.id
       WHERE person.gender = 'female'
       EXCEPT ALL
       SELECT pizzeria_id
       FROM person_visits
                JOIN person on person_visits.person_id = person.id
       WHERE person.gender = 'male') AS second) AS JOJO
JOIN pizzeria ON pizzeria_id = pizzeria.id
ORDER BY 1;