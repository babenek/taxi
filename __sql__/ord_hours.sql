select uniqo,key_theme,name_ord_type,ord_state,ord_cost,ord_hours,ord_itog,time_start,time_stop,ord_departure,usr_list
from orders, smena, s_ord_type
where key_smn_start >=347
and key_smn_start = uniqs
and key_ord_type = cod_ord_type
and  ord_hours > 0




