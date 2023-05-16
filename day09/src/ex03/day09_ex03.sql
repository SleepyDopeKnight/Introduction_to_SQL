create or replace function fnc_trg_person_audit() returns trigger as
$$
begin
    if (tg_op = 'INSERT') then
        insert into person_audit values (now(), 'I', new.*);
        return new;
    elsif (tg_op = 'DELETE') then
        insert into person_audit values (now(), 'D', old.*);
        return new;
    elsif (tg_op = 'UPDATE') then
        insert into person_audit values (now(), 'U', new.*);
        return new;
    end if;
end
$$ language plpgsql;

drop trigger if exists trg_person_audit ON person;
create trigger trg_person_audit
    after insert or update or delete
    on person
    for each row
execute procedure fnc_trg_person_audit();

INSERT INTO person
values (10, 'Damir', 22, 'male', 'Irkutsk');
UPDATE person
set name = 'Bulat'
where id = 10;
UPDATE person
set name = 'Damir'
where id = 10;
DELETE
FROM person
WHERE id = 10;