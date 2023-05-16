WITH not_used_menu AS (SELECT id AS menu_id
                       FROM menu
                       EXCEPT
                       SELECT menu_id
                       FROM person_order
                       ORDER BY 1
)

SELECT DISTINCT pizza_name, price, (SELECT name AS pizzeria_name FROM pizzeria WHERE id = menu.pizzeria_id)
FROM menu,
     pizzeria,
     not_used_menu
WHERE not_used_menu.menu_id = menu.id
ORDER BY pizza_name, price;