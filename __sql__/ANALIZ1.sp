CREATE PROCEDURE ANALIZ1 
RETURNS (
    KEY_LOCATIONS INTEGER,
    KEY_ORD_TYPE SMALLINT,
    PREV_LOCATIONS INTEGER,
    UNIQL INTEGER,
    UNIQO INTEGER,
    KEY_THEME SMALLINT,
    NAME_LOCATION VARCHAR(250))
AS
begin

   for select uniqo, key_ord_type, key_locations, orders.key_theme, uniql, prev_locations
   from orders, locations
   where key_locations = uniql
   and ord_state = 1
   into :uniqo, :key_ord_type, :key_locations, :key_theme, :uniql, :prev_locations
   do begin
      select name_location
      from locations, s_location
      where uniql = :prev_locations
      and key_location = cod_location
      into :name_location;
      suspend;
      end

end
