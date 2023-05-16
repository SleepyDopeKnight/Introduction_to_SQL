COMMENT ON TABLE person_discounts IS 'Таблица с расчетом персональных скидок';
COMMENT ON COLUMN person_discounts.id IS 'Номер строки';
COMMENT ON COLUMN person_discounts.person_id IS 'ID человека';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'ID пицерии';
COMMENT ON COLUMN person_discounts.discount IS 'Размер персональной скидки в процентах';