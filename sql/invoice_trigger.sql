DELIMITER //
create trigger rental_invoice after update on alsm_rentals
for each row
begin
	declare amount int default 0;
    declare bor_id_ int default 0;
    declare act_rdate_ date;
    declare exp_rdate_ date;
    declare bor_date_ date;
    declare prev_inv_id_ int default 0;
    select bor_id, act_rdate, exp_rdate, bor_date into bor_id_, act_rdate_, exp_rdate_, bor_date_ from inserted;
    select max(inv_id) as prev_inv_id into prev_inv_id_ from alsm_invoice;
	IF act_rdate THEN
		IF act_rdate > bor_date THEN
			set amount = (exp_rdate_ - bor_date_) * 0.2 + (act_rdate_ - exp_rdate_) * 0.4;
		ELSE 
			set amount = (act_rdate_ - bor_date_) * 0.2;
        END IF;
        insert into alsm_invoice (Inv_ID, Inv_Date, Amount, bor_id)
		values (prev_inv_id_+1, act_rdate_, amount, bor_id_);
    END IF;
end;
DELIMITER;
