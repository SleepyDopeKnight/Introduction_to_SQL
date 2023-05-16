CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN = off;
SET ENABLE_INDEXSCAN = on;

EXPLAIN ANALYSE
SELECT pizzeria_id, pizza_name
FROM menu
