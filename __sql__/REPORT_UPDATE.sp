CREATE PROCEDURE REPORT_UPDATE (
    VI_WEEK INTEGER)
AS
DECLARE VARIABLE VAR_PREV_WEEK INTEGER;
DECLARE VARIABLE VAR_ORD_ITOG DOUBLE PRECISION;
DECLARE VARIABLE VAR_REP_DOLG DOUBLE PRECISION;
DECLARE VARIABLE VAR_THEME SMALLINT;
DECLARE VARIABLE VAR_UNIQW INTEGER;
DECLARE VARIABLE VAR_UNIQR INTEGER;
DECLARE VARIABLE VAR_DATE_START DATE;
DECLARE VARIABLE VAR_DATE_STOP DATE;
begin

    select uniqw, date_start, date_stop, key_prev_week from weeks 
where uniqw = :vi_week
    into :var_uniqw, :var_date_start, :var_date_stop, :var_prev_week;

    if (var_uniqw is not null and var_uniqw <> 0) then begin

       for select uniqr, key_theme from reports where key_week = :vi_week
       into :var_uniqr, :var_theme do begin

          var_ord_itog = null;
          var_rep_dolg = null;

          select sum(ord_itog) from orders, smena
          where smn_date >= :var_date_start and smn_date <= :var_date_stop
          and key_theme = :var_theme and key_smn_start = uniqs
          and ord_state in (1, 3)
          into :var_ord_itog;

          if (var_prev_week is not null and var_prev_week <> 0) then
             select rep_ostatok from reports where key_week = :var_prev_week and key_theme = :var_theme
             into :var_rep_dolg;

         if (var_ord_itog = 0) then var_ord_itog = null;
         if (var_rep_dolg = 0) then var_rep_dolg = null;

          update reports
             set rep_orders = :var_ord_itog, rep_dolg = :var_rep_dolg
             where uniqr = :var_uniqr;
          end

       end

    suspend;
end
