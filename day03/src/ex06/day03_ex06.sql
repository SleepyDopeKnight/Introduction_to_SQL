WITH first_price AS (SELECT menu.pizza_name, pizzeria.name AS pizzeria_name_1, menu.price
                     FROM menu
                              JOIN pizzeria on menu.pizzeria_id = pizzeria.id
),
     second_price AS (SELECT menu.pizza_name, pizzeria.name AS pizzeria_name_2, menu.price
                      FROM menu
                               JOIN pizzeria on menu.pizzeria_id = pizzeria.id)

SELECT DISTINCT first_price.pizza_name, first_price.pizzeria_name_1, second_price.pizzeria_name_2, first_price.price
FROM first_price,
     second_price
WHERE first_price.price = second_price.price
  AND first_price.pizzeria_name_1 < second_price.pizzeria_name_2
ORDER BY 1;

