CREATE INDEX idx_1 ON pizzeria (rating);

SET ENABLE_SEQSCAN = off;
SET ENABLE_INDEXSCAN = on;

EXPLAIN ANALYSE SELECT
    menu.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY 1,2;