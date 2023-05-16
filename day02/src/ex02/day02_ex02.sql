SELECT CASE
           WHEN p.name IS NULL THEN '-'
           ELSE p.name
           END AS person_name,
       pv.visit_date,
       CASE
           WHEN pz.name IS NULL THEN '-'
           ELSE pz.name
           END AS pizzria_name
FROM (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') pv
         FULL JOIN person p on p.id = pv.person_id
         FULL JOIN pizzeria pz on pv.pizzeria_id = pz.id
ORDER BY person_name, visit_date, pizzria_name;