CREATE VIEW v_price_with_discount AS
SELECT person.name, menu.pizza_name, menu.price, round(price - (price * 0.1)) AS discount_price
FROM menu
         JOIN person_order po on menu.id = po.menu_id
         JOIN person on po.person_id = person.id
ORDER BY name, pizza_name
