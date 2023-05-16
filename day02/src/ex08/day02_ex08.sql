SELECT DISTINCT name
FROM person
         JOIN person_order ON person.id = person_order.person_id
         JOIN menu on menu.id = person_order.menu_id
WHERE person.gender = 'male'
  AND (person.address = 'Moscow' OR person.address = 'Samara')
  AND (menu.pizza_name = 'mushroom pizza' OR menu.pizza_name = 'pepperoni pizza')
ORDER BY name DESC;
