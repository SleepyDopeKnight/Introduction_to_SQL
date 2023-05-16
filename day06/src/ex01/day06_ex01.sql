WITH jojo AS (SELECT *
              FROM person_order
                       INNER JOIN menu on menu.id = person_order.menu_id
    ORDER BY person_id, pizzeria_id)
 INSERT INTO person_discounts
SELECT ROW_NUMBER() OVER () AS id,
       person_id,
       pizzeria_id,
       CASE
           WHEN count(jojo) = 1 THEN 10.5
           WHEN count(jojo) = 2 THEN 22
           ELSE 30 END
FROM jojo
GROUP BY person_id, pizzeria_id;