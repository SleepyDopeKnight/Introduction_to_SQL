create or replace function fnc_persons(IN pgender varchar default 'female')
    returns table
            (
                name varchar
            )
as
$$
select name
from person
where gender = pgender;
$$ language sql;

select *
from fnc_persons(pgender := 'male');
select *
from fnc_persons();

