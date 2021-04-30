alter table ALSM_Author
add constraint chk_author_email
check (aemail LIKE '%_@__%.__%');
alter table ALSM_Book_Copy
add constraint chk_copy_status
check (status = 0 or status = 1);
alter table alsm_event
add constraint chk_event_enddate
check (stopdate >= startdate);
alter table ALSM_Sem_Sponsor
add constraint chk_seminar_sponsor_fund
check (FAmount >= 0);
alter table alsm_customer
add constraint chk_customer_idtype 
check (custid_type = 0 or custid_type = 1 or custid_type = 2);
alter table alsm_customer
add constraint chk_customer_email
check (cemail LIKE '%_@__%.__%');
alter table alsm_customer
add constraint chk_customer_phone
check (LENGTH(cphone) = 10);
alter table ALSM_Invoice 
add constraint chk_invoice_amount 
check (amount >= 0);
alter table ALSM_Invoice 
add constraint chk_invoice_pay_method
check (Pay_Mthd = 'Credit' or Pay_Mthd = 'Debit' or Pay_Mthd = 'Paypal' or Pay_Mthd = 'Cash');
alter table ALSM_studyroom
add constraint chk_stuyroom_cap
check (capacity > 0 AND capacity < 200);
alter table alsm_rentals
add constraint chk_rental_status
check (status = 0 or status = 1 or status = 2);
alter table alsm_rentals
add constraint chk_rental_erdate
check (exp_rdate > bor_date);




