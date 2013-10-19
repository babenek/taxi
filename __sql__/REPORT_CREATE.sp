CREATE PROCEDURE REPORT_CREATE (
    VI_DATE_START DATE,
    VI_DATE_STOP DATE)
AS
DECLARE VARIABLE VAR_PREV_WEEK INTEGER;
DECLARE VARIABLE VAR_ORD_ITOG NUMERIC(8,2);
DECLARE VARIABLE VAR_REP_DOLG NUMERIC(8,2);
DECLARE VARIABLE VAR_THEME SMALLINT;
DECLARE VARIABLE VAR_UNIQW INTEGER;
begin
    select uniqw from weeks where date_stop = :vi_date_start - 1 and wks_state <>2 and wks_state is not null
    into :var_prev_week;
    if (var_prev_week is null) then var_prev_week = 0;

    select uniqw from weeks where date_start = :vi_date_start and date_stop = :vi_date_stop and wks_state <>2 and wks_state is not null
    into :var_uniqw;

    if (var_uniqw is not null and var_uniqw <> 0) then begin
       if (var_prev_week is not null and var_prev_week <> 0) then
          update weeks set key_prev_week = :var_prev_week where uniqw = :var_uniqw;
       delete from reports where key_week = :var_uniqw;
       end
    else begin
       var_uniqw = gen_id(gen_uniqw, 1);
       insert into weeks (uniqw, date_start, date_stop, key_prev_week)
       values (:var_uniqw, :vi_date_start, :vi_date_stop, :var_prev_week);
       end
/*$$IBEC$$
    for select uniqs from smena where smn_date >= :vi_date_start and 
smn_date <= :vi_date_stop
    into :var_uniqs
    do execute procedure itog(var_uniqs);
  $$IBEC$$*/
    for select cod_theme from s_theme where cod_theme <> 0 order by cod_theme
    into :var_theme do begin

       var_ord_itog = null;
       var_rep_dolg = null;

       select sum(ord_itog) from orders, smena
       where smn_date >= :vi_date_start and smn_date <= :vi_date_stop
       and uniqs = key_smn_start
       and key_theme = :var_theme
       and ord_state in (1,3)
       into :var_ord_itog;

       if (var_prev_week is not null and var_prev_week <> 0) then
          select rep_ostatok from reports where key_week = :var_prev_week and key_theme = :var_theme
          into :var_rep_dolg;

       if (var_ord_itog = 0) then var_ord_itog = null;
       if (var_rep_dolg = 0) then var_rep_dolg = null;

       insert into reports(uniqr, key_theme, key_week, rep_orders, rep_dolg)
       values(gen_id(gen_uniqr, 1), :var_theme, :var_uniqw, :var_ord_itog, :var_rep_dolg);

       end
   --execute procedure report_itog(var_uniqw);
   suspend;
end
