select key_theme, count(uniqo)
from orders
where ord_state = 1 and key_ord_type not in(0,15)  and time_start >= '01.01.07' and time_start < '02.01.07'
group by key_theme

order by 1
