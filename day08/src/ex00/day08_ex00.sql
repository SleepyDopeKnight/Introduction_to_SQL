--session #1
begin transaction;
--session #2
select * from pizzeria where name  = 'Pizza Hut';
--session #1
update pizzeria set rating = '5' where name = 'Pizza Hut';
commit;
--session #2
select * from pizzeria where name  = 'Pizza Hut';