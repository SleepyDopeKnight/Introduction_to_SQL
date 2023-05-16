SELECT pizzeria.name,
       count(menu.price)         AS count_of_orders,
       round(avg(menu.price), 2) AS average_price,
       max(menu.price)           AS max_price,
       min(menu.price)           AS min_price
FROM person_order
         INNER JOIN menu ON menu.id = person_order.menu_id
         INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name
ORDER BY 1