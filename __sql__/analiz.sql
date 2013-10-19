select Uniql, prev_locations, loc_state, key_theme, name_loc_type, name_location, time_start, time_stop, key_smn_start, key_smn_stop
from locations, s_loc_type, s_location
where key_theme = 158
and key_loc_type = cod_loc_type
and key_location = cod_location
order by uniql
