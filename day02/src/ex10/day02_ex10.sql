SELECT p.name AS person_name1, person.name AS person_name2, person.address AS common_addres FROM person
FULL JOIN person p ON person.address = p.address
WHERE p.id > person.id
ORDER BY 1, 2, 3;