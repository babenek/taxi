CREATE PROCEDURE ORDER_UPDATE (
    VI_UNIQO INTEGER,
    VI_ORD_TYPE SMALLINT,
    VI_STATE SMALLINT,
    VI_DURATION TIME,
    VI_DISTANCE INTEGER,
    VI_COST DOUBLE PRECISION,
    VI_DEPARTURE VARCHAR(250),
    VI_DESTINATION VARCHAR(250),
    VI_TIME_START TIMESTAMP,
    VI_TIME_STOP TIMESTAMP,
    VI_SMN_STOP INTEGER,
    VI_CLIENT INTEGER,
    VI_PHONE INTEGER)
AS
begin
  update orders set KEY_ORD_TYPE=:VI_ORD_TYPE, TIME_STOP=(select current_timestamp from RDB$DATABASE),--TIME_START=:VI_TIME_START,
       ord_state=:VI_STATE, ord_duration=:VI_DURATION, ord_distance=:VI_DISTANCE, ORD_COST=:VI_COST,
       ord_departure = :VI_DEPARTURE, ord_destination = :VI_DESTINATION,
       key_smn_stop = :VI_SMN_STOP, key_client = :vi_client, ord_phone = :vi_phone
  where
    uniqo=:VI_UNIQO;
  suspend;
end
