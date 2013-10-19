select uniqo,key_theme,time_start,time_stop,ord_cost,ord_departure,ord_destination from orders
where
(key_client = 39 or upper(ord_departure) like '%ÀÍÒÅ%' or upper(ord_departure) like '%ÀÍÒÝ%')
and ord_state in (1,3)
and key_ord_type = 2
and time_start >= '01.07.2006'
