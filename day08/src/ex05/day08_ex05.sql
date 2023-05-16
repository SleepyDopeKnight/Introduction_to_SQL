--session #1
begin transaction;
--session #2
begin transaction;
--session #1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--session #2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--session #1
SELECT SUM(rating) FROM pizzeria;
--session #2
update pizzeria set rating = '1' where name = 'Pizza Hut';
commit;
--session #1
SELECT SUM(rating) FROM pizzeria;
commit;
SELECT SUM(rating) FROM pizzeria;
--session #2
SELECT SUM(rating) FROM pizzeria;