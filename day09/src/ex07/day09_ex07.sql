create or replace function func_minimum(arr numeric[])
returns numeric
language sql
IMMUTABLE PARALLEL SAFE AS 'select min(i) from unnest(arr) i';

select func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);