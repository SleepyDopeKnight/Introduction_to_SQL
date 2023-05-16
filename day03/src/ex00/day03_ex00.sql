WITH kate AS (SELECT * FROM person WHERE name = 'Kate')

SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name, pvk.visit_date
FROM (SELECT *
      FROM person_visits,
           kate
      WHERE person_id = kate.id) AS pvk
         FULL JOIN menu ON menu.pizzeria_id = pvk.pizzeria_id
         FULL JOIN pizzeria on menu.pizzeria_id = pizzeria.id
WHERE pvk.visit_date IS NOT NULL
  AND menu.price BETWEEN '800' AND '1000'
ORDER BY 1, 2, 3;