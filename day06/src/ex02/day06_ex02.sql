SELECT person.name                                                   AS name,
       menu.pizza_name,
       menu.price,
       round(((100 - person_discounts.discount) / 100) * menu.price) AS discount_price,
       pizzeria.name                                                 AS pizzeria_name
FROM person_discounts
         JOIN person ON person.id = person_discounts.person_id
         JOIN pizzeria on person_discounts.pizzeria_id = pizzeria.id
         JOIN menu on pizzeria.id = menu.pizzeria_id
         JOIN person_order on menu.id = person_order.menu_id
WHERE person_order.person_id = person.id
ORDER BY 1, 2;
