INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT max_id,
       person.id,
       (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
       '2022-02-25'

FROM generate_series((SELECT (max(id)) FROM person_order),
                     (SELECT max(id) + 1 FROM person) + (SELECT (max(id)) FROM person_order)) as max_id
         JOIN person ON person.id + (SELECT (max(id)) FROM person_order) = max_id