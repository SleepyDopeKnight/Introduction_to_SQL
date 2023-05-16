SELECT name AS pizzeria_name
FROM (SELECT *
      FROM (SELECT pizzeria_id
            FROM person_order
                     JOIN person ON person_order.person_id = person.id
                     Join menu on person_order.menu_id = menu.id
            WHERE person.gender = 'male'
            EXCEPT
            SELECT pizzeria_id
            FROM person_order
                     JOIN person ON person_order.person_id = person.id
                     Join menu on person_order.menu_id = menu.id
            WHERE person.gender = 'female') AS first
      UNION
      SELECT *
      FROM (SELECT pizzeria_id
            FROM person_order
                     JOIN person ON person_order.person_id = person.id
                     Join menu on person_order.menu_id = menu.id
            WHERE person.gender = 'female'
            EXCEPT
            SELECT pizzeria_id
            FROM person_order
                     JOIN person ON person_order.person_id = person.id
                     Join menu on person_order.menu_id = menu.id
            WHERE person.gender = 'male') AS second) AS JOJO
         JOIN pizzeria ON pizzeria_id = pizzeria.id
ORDER BY 1;