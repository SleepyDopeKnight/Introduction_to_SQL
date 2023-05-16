INSERT INTO person_visits
VALUES ((SELECT MAX(id) + 1 FROM person_visits),
        (SELECT person.id FROM person WHERE name = 'Dmitriy'),
        (SELECT pizzeria.id
         FROM pizzeria
                  JOIN menu on pizzeria.id = menu.pizzeria_id
         WHERE name <> (SELECT name FROM mv_dmitriy_visits_and_eats)
           AND menu.price < 800 LIMIT 1),
        '2022-01-08');
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats