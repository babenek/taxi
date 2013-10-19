CREATE PROCEDURE REPORT_RECALC (
    VI_WEEK INTEGER)
AS
DECLARE VARIABLE VAR_PREV_WEEK INTEGER;
DECLARE VARIABLE VAR_ORD_ITOG NUMERIC(8,2);
DECLARE VARIABLE VAR_REP_DOLG NUMERIC(8,2);
DECLARE VARIABLE VAR_THEME SMALLINT;
DECLARE VARIABLE VAR_UNIQR INTEGER;
DECLARE VARIABLE VAR_UNIQW INTEGER;
DECLARE VARIABLE VAR_DATE_START DATE;
DECLARE VARIABLE VAR_DATE_STOP DATE;
begin
    select date_start, date_stop from weeks where uniqw=:vi_week
    into :var_date_start, :var_date_stop;

    select uniqw from weeks where date_stop = :var_date_start - 1 and wks_state <>2 and wks_state is not null
    into :var_prev_week;
    if (var_prev_week is null) then var_prev_week = 0;

    if (var_prev_week is not null and var_prev_week <> 0) then
       update weeks set key_prev_week = :var_prev_week where uniqw = :vi_week;

/*$$IBEC$$    for select uniqs from smena where smn_date >= 
:var_date_start and smn_date <= :var_date_stop
    into :var_uniqs
    do execute procedure itog(var_uniqs); $$IBEC$$*/

    for select cod_theme from s_theme where cod_theme <> 0 order by cod_theme
    into :var_theme do begin

       var_ord_itog=null;
       var_rep_dolg=null;

       select sum(ord_itog) from orders, smena
       where smn_date >= :var_date_start and smn_date <= :var_date_stop
       and uniqs = key_smn_start
       and key_theme = :var_theme
       and ord_state in (1,3)
       into :var_ord_itog;

       if (var_prev_week is not null and var_prev_week <> 0) then
          select rep_ostatok from reports where key_week = :var_prev_week and key_theme = :var_theme
          into :var_rep_dolg;

       select uniqr from reports
       where key_theme = :var_theme and key_week = :vi_week
       into :var_uniqr;

       if (var_ord_itog = 0) then var_ord_itog = null;
       if (var_rep_dolg = 0) then var_rep_dolg = null;

       if (var_uniqr <> 0 and var_uniqr is not null) then
          update reports
          set rep_orders = :var_ord_itog, rep_dolg = :var_rep_dolg
          where uniqr = :var_uniqr;
       else
          insert into reports(uniqr, key_theme, key_week, rep_orders,rep_dolg)
          values(gen_id(gen_uniqr, 1), :var_theme, :var_uniqw, :var_ord_itog, :var_rep_dolg);
       end


--  execute procedure report_itog(var_uniqw);
   suspend;
end
