WITH jojo AS (SELECT *
              FROM person
                       JOIN person_visits on person.id = person_visits.person_id
              WHERE visit_date = '2022-01-08'
                AND person.id = person_visits.person_id
                AND person.name = 'Dmitriy')

SELECT pizzeria.name FROM pizzeria
  INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
  INNER JOIN jojo ON jojo.pizzeria_id = pizzeria.id
WHERE menu.price < 800;
