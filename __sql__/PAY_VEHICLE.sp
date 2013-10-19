CREATE PROCEDURE PAY_VEHICLE (
    VI_MONEY NUMERIC(8,2),
    VI_THEME SMALLINT,
    VI_SMN_START INTEGER,
    VI_UNIQV INTEGER,
    VI_ARN_DATE date
    )
AS
DECLARE VARIABLE VAR_BALANCE NUMERIC(8,2);
DECLARE VARIABLE VAR_MONEY NUMERIC(8,2);
DECLARE VARIABLE VAR_RATE DOUBLE PRECISION;
DECLARE VARIABLE VAR_UNIQA INTEGER;
DECLARE VARIABLE VAR_UNIQRT INTEGER;
DECLARE VARIABLE VAR_ARN_DATE date;
begin
    if (vi_arn_date is null) then var_arn_date = (select current_date from RDB$DATABASE);
    else var_arn_date = vi_arn_date; --всякая фигня с датой...

    select uniqa, balance -- предыдущая оплата за машину, надо знать остаток в у.е.
    from arenda
    where arn_state = 0 and key_vehicles = vi_uniqv
    into :var_uniqa, :var_balance;
    if (var_balance is null) then -- если остатка нет ваще
        select cost from vehicles where uniqv = :vi_uniqv into :var_balance; -- возмем стоимость машины
    if (var_balance is null) then  var_balance = 0;-- если остатка до сих пор не получено пусть будет нуль

    select UNIQRT, rate.rate from rate -- берем текущий курс валюты
    where state = 0
    into :VAR_UNIQRT, :var_rate;
    if (var_rate is null or VAR_UNIQRT is null ) then begin -- коль еще не успели ввести тариф
        var_rate = 1; -- хороший курс ;)
        VAR_UNIQRT = 0;
        end

    if (var_uniqa > 0) then begin -- если предыдущая оплата таки была - закрываем ее
        update arenda
        set
            state = 1,
            key_smn_stop = :vi_smn_start,
            time_stop = (select current_timestamp from RDB$DATABASE)
        where uniqa = :var_uniqa;
        end
    else begin
        var_uniqa = 0; -- считаем, машина только появилась
        end

    insert into arenda (uniqa, prev_uniqa, state, key_vehicles, key_theme, key_smn_start, time_start,
        arn_date, --дата аренды
        money, -- деньги в национальной валюте
        currency, -- в условных ебеницах
        key_rate, -- код курсa обмена
        balance -- остаток
        )
    values (
        gen_id(gen_uniqa, 1), :var_uniqa, 0, :vi_uniqv, :vi_theme, :vi_smn_start,(select current_timestamp from RDB$DATABASE),
        :var_arn_date,
        :vi_money,
        :vi_money * :var_rate,
        :var_uniqrt, 
        :var_balance - vi_money * :var_rate
        );

    suspend;
end
