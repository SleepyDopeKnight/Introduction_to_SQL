WITH jojo AS (SELECT person_id, count(pizzeria_id)
              FROM person_visits
              GROUP BY person_id)

SELECT person.name, jojo.count AS count_of_visits FROM jojo
INNER JOIN person ON person.id = jojo.person_id
ORDER BY 2 DESC, 1 LIMIT 4
