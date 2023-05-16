WITH jojo AS (SELECT person_id, count(pizzeria_id)
              FROM person_visits
              GROUP BY person_id)

SELECT person.name, jojo.count AS count_of_visits
FROM person
         INNER JOIN jojo ON person.id = jojo.person_id AND jojo.count > 3