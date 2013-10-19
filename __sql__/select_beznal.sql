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

from orders o, s_ord_type s, clients c

where ord_state in (1,3)
and extract(YEAR from time_start) = 2008
and extract(MONTH from time_start) = 8
and o.key_client = c.uniqc
and o.key_ord_type = s.cod_ord_type
and s.ord_type = 3
order by c.clt_info, uniqo
