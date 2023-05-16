create or replace function fnc_trg_person_delete_audit() returns trigger as
$$
begin
    if (tg_op = 'DELETE') then
        insert into person_audit values (now(), 'D', old.*);
        return new;
    end if;
end
$$ language plpgsql;

drop trigger if exists trg_person_delete_audit ON person;
create trigger trg_person_delete_audit
    after delete
    on person
    for each row
execute procedure fnc_trg_person_delete_audit();

DELETE
FROM person
WHERE id = 10;