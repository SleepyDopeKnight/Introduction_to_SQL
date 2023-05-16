SELECT person.address, pizzeria.name, count(menu_id) as count_of_orders
FROM person_order
         INNER JOIN person ON person.id = person_order.person_id
         INNER JOIN menu ON menu.id = person_order.menu_id
         INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY person.address, pizzeria.name
ORDER BY 1, 2;