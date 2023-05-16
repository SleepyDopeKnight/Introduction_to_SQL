create table person_audit
(
    created    timestamp with time zone not null default (current_timestamp at time zone 'UTC'),
    type_event char(1)                  not null,
    row_id     bigint                   not null,
    name       varchar,
    age        integer,
    gender     varchar,
    address    varchar
);

alter table person_audit
    add constraint ch_type_event check (type_event in ('I', 'D', 'U'));

create or replace function fnc_trg_person_insert_audit() returns trigger as
$$
begin
    if (tg_op = 'INSERT') then
        insert into person_audit values (now(), 'I', new.*);
        return new;
    end if;
end
$$ language plpgsql;

drop trigger if exists trg_person_insert_audit ON person;
create trigger trg_person_insert_audit
    after insert
    on person
    for each row
execute procedure fnc_trg_person_insert_audit();


INSERT INTO person
values (10, 'Damir', 22, 'male', 'Irkutsk');