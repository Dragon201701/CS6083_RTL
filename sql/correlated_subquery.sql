/* correlated subqueries
find out all indiviual sponsors who have sponsor event 1.*/
select alsm_individual.f_name as first_name, alsm_individual.l_name as last_name
where alsm_individual.sponid in (select alsm_sem_sponsor.sponid where alsm_sem_sponsor.event_id = 1);