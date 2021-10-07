create event if not exists cart_event
	on schedule 
		every 1 hour starts '2021-08-23 17:15:00'
    on completion preserve    
    enable
    do
    delete from cart
    where now() > date_add(ca_regdate,interval 30 day);
    
show events;
show variables where variable_name ='event_scheduler';
drop event cart_event;