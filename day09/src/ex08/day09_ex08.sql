create or replace function fnc_fibonacci(pstop integer default 10) returns table(num numeric) as
$$
        with recursive fibonacci as (select 0 as first, 1 as second
                                             union all
                                             select second, first + second
                                             from fibonacci
                                             where second < pstop)
                select first
                from fibonacci;
$$ language sql;

select *
from fnc_fibonacci(100);
select *
from fnc_fibonacci();
