create or replace function fnc_persons_female()
    returns table
            (
                name varchar
            )
as
$$
select name
from person
where gender = 'female';
$$ language sql;

create or replace function fnc_persons_male()
    returns table
            (
                name varchar
            )
as
$$
select name
from person
where gender = 'male';
$$ language sql;

SELECT *
FROM fnc_persons_female();
SELECT *
FROM fnc_persons_male();