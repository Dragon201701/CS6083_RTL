/*SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);*/
/* find out today's all seminar sponsors who are organization and there name and amount. */
select alsm_sem_sponsor.fundid, alsm_sem_sponsor.f_amount as amount, alsm_sem_sponsor.sponid, alsm_sem_sponsor.event_id,
	   alsm_organisation.sponid, alsm_organisation.name as org_name, 
       alsm_event.event_id, alsm_event.event_name as event_name, alsm_event.startdate, alsm_event.stopdate
from ((alsm_sem_sponsor 
inner join alsm_organisation on alsm_sem_sponsor.sponid = alsm_organisation.sponid)
inner join alsm_event on alsm_event.event_id = alsm_sem_sponsor.event_id)
where alsm_event.startdate <= CURRENT_TIMESTAMP() and alsm_event.stopdate > CURRENT_TIMESTAMP();
