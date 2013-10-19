select
    o.key_theme,o.time_start,o.time_stop,
    o.ord_departure,o.ord_destination,o.ord_cost,
    o.key_smn_start,
    o.uniqo,
    s.name_ord_type,
    c.clt_info,
    c.clt_type,
    c.clt_name,
    c.uniqc

from  s_ord_type s, orders o left join clients c

on o.key_client = c.uniqc

where o.ord_state in (1,3)
and extract(YEAR from time_start) = :V_YEAR
and extract(MONTH from time_start) = :V_MONTH
and o.key_ord_type = s.cod_ord_type
and s.ord_type =3
order by c.clt_info, uniqo
