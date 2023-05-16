create or replace function fnc_trg_person_update_audit() returns trigger as
$$
begin
    if (tg_op = 'UPDATE') then
        insert into person_audit values (now(), 'U', new.*);
        return new;
    end if;
end
$$ language plpgsql;

drop trigger if exists trg_person_update_audit ON person;
create trigger trg_person_update_audit
    after update
    on person
    for each row
execute procedure fnc_trg_person_update_audit();

UPDATE person
set name = 'Bulat'
where id = 10;
UPDATE person
set name = 'Damir'
where id = 10;