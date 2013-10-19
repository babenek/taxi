select
extract(year from time_start),
extract(month from time_start),
extract(day from time_start),
extract(hour from time_start),
count(*)
from orders
where ord_state = 1 and key_ord_type in (1,2,3,5,7,8)

group by
extract(year from time_start),
extract(month from time_start),
extract(day from time_start),
extract(hour from time_start)
