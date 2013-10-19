CREATE PROCEDURE UPDATE_DICOUNT 
as
declare variable addr varchar(64);
declare variable info varchar(64);
declare variable name varchar(64);
declare variable tmp_o integer;
declare variable tmp_2 integer;
declare variable tmp_1 integer;
declare variable discount integer;
declare variable m integer;
declare variable n integer;
declare variable tmp integer;
begin
    /* Procedure Text */
    for select uniqc,clt_name,clt_info,clt_adress,c.clt_discount
    from clients c
    where c.clt_counter=14 -- and uniqc =7
    into :tmp_o, :name, :info, :addr, :discount
    do begin
        select count(uniqo)   -- выбираем сколько поездок обычных
        from orders o, s_ord_type t
        where o.key_client = :tmp_o
        and o.key_ord_type = t.cod_ord_type
        and o.ord_state in (1,3)
        and t.ord_type = 1
        and o.key_smn_start < 1989
        into :tmp_1;

        select count(uniqo)   -- сколько поездок халявнох
        from orders o, s_ord_type t
        where o.key_client = :tmp_o
        and o.key_ord_type = t.cod_ord_type
        and o.ord_state in (1,3)
        and t.ord_type = 2
        --and o.key_smn_start < 1989
        into :tmp_2;

        update orders set ord_state = 0 where key_client = :tmp_o and key_smn_start < 1989;

        tmp = tmp_1 - tmp_2*13; -- вычисляем, сколько поездок незадействовано
        tmp_1 = tmp/13;
        tmp_2 = tmp - tmp_1 * 13;


        if (discount is null) then
            update clients set clt_discount = :tmp_1 where uniqc = :tmp_o;
        else
            update clients set clt_discount = :discount + :tmp_1 where uniqc = :tmp_o;


        tmp = tmp_2;

        while (tmp>0) do begin

            insert into orders (uniqo, KEY_THEME, KEY_LOCATIONS, KEY_ORD_TYPE, ORD_DEPARTURE, ORD_DESTINATION, KEY_smn_start, ORD_state, ORD_COST, TIME_START, ORD_PHONE,  key_client)
            values (gen_id(gen_uniqo,1), 0, 0, 1, 'дополнение', null, 1, 3, null, (select current_timestamp from RDB$DATABASE), null, :tmp_o );

            tmp=tmp-1;
            end

        update clients set clt_counter = 13 where uniqc = :tmp_o;
        --suspend;
        end
suspend;
end
