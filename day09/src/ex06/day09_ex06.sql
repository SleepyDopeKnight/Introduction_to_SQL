create or replace function fnc_person_visits_and_eats_on_date(IN pperson varchar default 'Dmitriy',
                                                              IN pprice numeric default '500',
                                                              IN pdate date default '2022-01-08')
    returns table
            (
                name varchar
            )
as
$$
begin
    return query select distinct p2.name
                 from person_order po
                          INNER JOIN person_visits pv on po.person_id = pv.person_id
                          INNER JOIN menu m on m.id = po.menu_id
                          INNER JOIN person p on po.person_id = p.id
                          INNER JOIN pizzeria p2 on p2.id = m.pizzeria_id
                 where p.name = pperson
                   and pv.visit_date = pdate
                   AND po.order_date = pdate
                   AND m.price < pprice;
end
$$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);
select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := '1300', pdate := '2022-01-01');