object DM: TDM
  OldCreateOrder = False
  Height = 762
  Width = 1063
  object tmpFIBStoredProc_ORDER_START: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE ORDER_START'
      '(:VI_THEME,'
      '    :VI_LOCATIONS,'
      '    :VI_TYPE,'
      '    :VI_SMN_START,'
      '    :VI_DEPARTURE,'
      '    :VI_DESTINATION,'
      '    :VI_STATE,'
      '    :VI_TIME_START,'
      '    :VI_COST,'
      '    :VI_PHONE)')
    StoredProcName = 'ORDER_START'
    Left = 497
    Top = 283
  end
  object FIBStoredProcItog: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE SMENA_ITOG'
      '(:VI_UNIQS)')
    StoredProcName = 'ITOG'
    Left = 497
    Top = 332
  end
  object FIBStoredProc_LOCATION_STOP: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE LOCATION_STOP (?VI_UNIQL, ?VI_SMN_STOP)')
    StoredProcName = 'LOCATION_STOP'
    Left = 500
    Top = 392
  end
  object FIBStoredProc_LOCATION_START: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE LOCATION_START'
      '(:VI_THEME,'
      '    :VI_LOCATION,'
      '    :VI_LOC_TYPE,'
      '    :VI_THM_RESSORT,'
      '    :VI_SMN_START,'
      '    :VI_PREV_LOCATIONS)')
    StoredProcName = 'LOCATION_START'
    Left = 500
    Top = 448
  end
  object FIBStoredProc_ORDER_STOP: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      
        'EXECUTE PROCEDURE ORDER_STOP (?VI_SMN_STOP, ?VI_TIME_STOP, ?VI_K' +
        'EY_LOCATIONS)')
    StoredProcName = 'ORDER_STOP'
    Left = 500
    Top = 504
  end
  object FIBStoredProcReportCreate: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE REPORT_CREATE (?VI_DATE_START, ?VI_DATE_STOP)')
    StoredProcName = 'REPORT_CREATE'
    Left = 500
    Top = 16
  end
  object FIBStoredProcReportUpdate: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE REPORT_UPDATE (?VI_WEEK)')
    StoredProcName = 'REPORT_UPDATE'
    Left = 500
    Top = 64
  end
  object FIBStoredProcReportRecalc: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE REPORT_RECALC (?VI_WEEK)')
    StoredProcName = 'REPORT_RECALC'
    Left = 500
    Top = 112
  end
  object FIBStoredProcReportThmInfo: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE REPORT_THM_INFO'
      '(:VI_WEEK)')
    StoredProcName = 'REPORT_THM_INFO'
    Left = 500
    Top = 160
  end
  object FIBQueryWeeksDelete: TpFIBQuery
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    Left = 494
    Top = 615
  end
  object FIBQueryTools: TpFIBQuery
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'delete from orders;'
      'delete from locations;')
    Left = 494
    Top = 663
  end
  object FIBDataSetSmnWeek: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQS,'
      '    SMN_TIME_START,'
      '    SMN_TIME_STOP,'
      '    SMN_STATE,'
      '    SMN_WEEKEND,'
      '    SMN_DATE,'
      '    SMN_DAY_NIGHT,'
      '    USR_LIST'
      'FROM'
      '    SMENA '
      'where smn_date >= :date_start'
      'and smn_date <= :date_stop'
      'order by uniqs')
    Transaction = FIBTransaction
    Database = FIBDatabase
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yy hh:mm'
    DefaultFormats.DisplayFormatDate = 'dd.mm.yy'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 168
    Top = 632
    oFetchAll = True
    object FIBDataSetSmnWeekUNIQS: TFIBIntegerField
      FieldName = 'UNIQS'
    end
    object FIBDataSetSmnWeekSMN_TIME_START: TFIBDateTimeField
      FieldName = 'SMN_TIME_START'
      DisplayFormat = 'dd.mm.yy hh:mm'
    end
    object FIBDataSetSmnWeekSMN_TIME_STOP: TFIBDateTimeField
      FieldName = 'SMN_TIME_STOP'
      DisplayFormat = 'dd.mm.yy hh:mm'
    end
    object FIBDataSetSmnWeekSMN_STATE: TFIBSmallIntField
      FieldName = 'SMN_STATE'
      OnGetText = FIBDataSetSMN_STATEGetText
    end
    object FIBDataSetSmnWeekSMN_WEEKEND: TFIBSmallIntField
      FieldName = 'SMN_WEEKEND'
      OnGetText = FIBDataSetSMN_WEEKENDGetText
    end
    object FIBDataSetSmnWeekSMN_DATE: TFIBDateField
      FieldName = 'SMN_DATE'
      DisplayFormat = 'dd.mm.yy'
    end
    object FIBDataSetSmnWeekSMN_DAY_NIGHT: TFIBSmallIntField
      FieldName = 'SMN_DAY_NIGHT'
      OnGetText = FIBDataSetSMN_DAY_NIGHTGetText
    end
    object FIBDataSetSmnWeekUSR_LIST: TFIBStringField
      FieldName = 'USR_LIST'
      Size = 250
      EmptyStrToNull = True
    end
  end
  object DataSourceSmnWeek: TDataSource
    DataSet = FIBDataSetSmnWeek
    Left = 168
    Top = 616
  end
  object FIBDataSetSmnDetail: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQS,'
      '    SMN_TIME_START,'
      '    SMN_TIME_STOP,'
      '    SMN_STATE,'
      '    SMN_WEEKEND,'
      '    SMN_DATE,'
      '    SMN_DAY_NIGHT,'
      '    USR_LIST'
      'FROM'
      '    SMENA '
      'order by uniqs')
    Transaction = FIBTransaction
    Database = FIBDatabase
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yy hh:mm'
    DefaultFormats.DisplayFormatDate = 'dd.mm.yy'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 168
    Top = 528
    oFetchAll = True
    object FIBDataSetSmnDetailUNIQS: TFIBIntegerField
      FieldName = 'UNIQS'
    end
    object FIBDataSetSmnDetailSMN_TIME_START: TFIBDateTimeField
      FieldName = 'SMN_TIME_START'
    end
    object FIBDataSetSmnDetailSMN_TIME_STOP: TFIBDateTimeField
      FieldName = 'SMN_TIME_STOP'
    end
    object FIBDataSetSmnDetailSMN_STATE: TFIBSmallIntField
      FieldName = 'SMN_STATE'
      OnGetText = FIBDataSetSMN_STATEGetText
    end
    object FIBDataSetSmnDetailSMN_WEEKEND: TFIBSmallIntField
      FieldName = 'SMN_WEEKEND'
      OnGetText = FIBDataSetSMN_WEEKENDGetText
    end
    object FIBDataSetSmnDetailSMN_DATE: TFIBDateField
      FieldName = 'SMN_DATE'
    end
    object FIBDataSetSmnDetailSMN_DAY_NIGHT: TFIBSmallIntField
      FieldName = 'SMN_DAY_NIGHT'
      OnGetText = FIBDataSetSMN_DAY_NIGHTGetText
    end
    object FIBDataSetSmnDetailUSR_LIST: TFIBStringField
      FieldName = 'USR_LIST'
      Size = 250
      EmptyStrToNull = True
    end
  end
  object DataSourceSmnDetail: TDataSource
    DataSet = FIBDataSetSmnDetail
    Left = 168
    Top = 512
  end
  object FIBDataSetSmnReport: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQS,'
      '    SMN_TIME_START,'
      '    SMN_TIME_STOP,'
      '    SMN_STATE,'
      '    SMN_WEEKEND,'
      '    SMN_DATE,'
      '    SMN_DAY_NIGHT,'
      '    USR_LIST'
      'FROM'
      '    SMENA '
      'order by uniqs')
    Transaction = FIBTransaction
    Database = FIBDatabase
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yy hh:mm'
    DefaultFormats.DisplayFormatDate = 'dd.mm.yy'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 168
    Top = 368
    oFetchAll = True
    object FIBDataSetSmnReportUNIQS: TFIBIntegerField
      FieldName = 'UNIQS'
    end
    object FIBDataSetSmnReportSMN_TIME_START: TFIBDateTimeField
      FieldName = 'SMN_TIME_START'
    end
    object FIBDataSetSmnReportSMN_TIME_STOP: TFIBDateTimeField
      FieldName = 'SMN_TIME_STOP'
    end
    object FIBDataSetSmnReportSMN_STATE: TFIBSmallIntField
      FieldName = 'SMN_STATE'
      OnGetText = FIBDataSetSMN_STATEGetText
    end
    object FIBDataSetSmnReportSMN_WEEKEND: TFIBSmallIntField
      FieldName = 'SMN_WEEKEND'
      OnGetText = FIBDataSetSMN_WEEKENDGetText
    end
    object FIBDataSetSmnReportSMN_DATE: TFIBDateField
      FieldName = 'SMN_DATE'
    end
    object FIBDataSetSmnReportSMN_DAY_NIGHT: TFIBSmallIntField
      FieldName = 'SMN_DAY_NIGHT'
      OnGetText = FIBDataSetSMN_DAY_NIGHTGetText
    end
    object FIBDataSetSmnReportUSR_LIST: TFIBStringField
      FieldName = 'USR_LIST'
      Size = 250
      EmptyStrToNull = True
    end
  end
  object DataSourceSmnReport: TDataSource
    DataSet = FIBDataSetSmnReport
    Left = 168
    Top = 352
  end
  object FIBDataSetReport: TpFIBDataSet
    SelectSQL.Strings = (
      'select '
      '   orders.key_ord_type'
      '   ,s_ord_type.name_ord_type'
      '   ,count(orders.uniqo)'
      '   ,sum(orders.ord_hours)'
      '   ,sum(orders.ord_cost)'
      'from '
      '   orders left join s_ord_type '
      'on  '
      '   key_ord_type = cod_ord_type'
      ''
      'group by '
      '   orders.key_ord_type'
      '   ,s_ord_type.name_ord_type'
      '')
    Transaction = FIBTransaction
    Database = FIBDatabase
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.NumericDisplayFormat = '0.##'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 40
    Top = 448
    oFetchAll = True
  end
  object DataSourceReport: TDataSource
    DataSet = FIBDataSetReport
    Left = 40
    Top = 432
  end
  object FIBDataSetDetail: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE ORDERS'
      'SET '
      '    ORD_COST = :ORD_COST,'
      '    ORD_DURATION = :ORD_DURATION,'
      '    ORD_DISTANCE = :ORD_DISTANCE,'
      '    ORD_DEPARTURE = :ORD_DEPARTURE,'
      '    ORD_DESTINATION = :ORD_DESTINATION,'
      '    ORD_PHONE = :ORD_PHONE,'
      '    key_client = :key_client'
      'WHERE'
      '    UNIQO = :OLD_UNIQO'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    o.key_theme,'
      '    o.uniqo,'
      '    o.TIME_START,'
      '    o.TIME_STOP,'
      '    sot.name_ORD_TYPE,'
      '    o.ORD_STATE,'
      '    o.ORD_COST,'
      '    o.ord_hours,'
      '    o.ord_itog,'
      '    o.ORD_DURATION,'
      '    o.ORD_DISTANCE,'
      '    o.ORD_DEPARTURE,'
      '    o.ORD_DESTINATION,'
      '    o.key_smn_start,'
      '    o.key_client,'
      '    cl.clt_name'
      'from orders o, s_ord_type sot, clients cl'
      'where o.ord_state in (1,3)'
      'and o.key_ord_type = sot.cod_ord_type'
      'and o.key_client = cl.uniqc'
      ''
      'union all'
      ''
      'SELECT'
      '    l.key_theme,'
      '    l.uniql,'
      '    l.TIME_START,'
      '    l.TIME_STOP,'
      '    cast(l.TIME_STOP - l.TIME_START as varchar(32)),'
      '    l.LOC_STATE,'
      '    cast(null as double precision),'
      '    cast(null as integer),'
      '    cast(null as double precision),'
      '    cast(null as time),'
      '    cast(null as integer),'
      '    cast(sl.name_location as varchar(252)),'
      '    cast(slt.name_LOC_TYPE as varchar(252)),'
      '    l.key_smn_start,'
      '    cast(null as integer),'
      '    cast(null as varchar(32))'
      'from locations l,  s_loc_type slt, s_location sl'
      'where'
      'l.key_location = sl.cod_location'
      'and l.key_loc_type = slt.cod_loc_type'
      'and l.key_theme > 0                               '
      ''
      'order by 3')
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 40
    Top = 544
    oFetchAll = True
  end
  object DataSourceDetail: TDataSource
    DataSet = FIBDataSetDetail
    Left = 40
    Top = 528
  end
  object FIBDataSetClients: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CLIENTS'
      'SET '
      '    UNIQC = :UNIQC,'
      '    CLT_NAME = :CLT_NAME,'
      '    CLT_TYPE = :CLT_TYPE,'
      '    CLT_COUNTER = :CLT_COUNTER,'
      '    CLT_ADRESS = :CLT_ADRESS,'
      '    CLT_PHONE = :CLT_PHONE,'
      '    CLT_INFO = :CLT_INFO,'
      '    CLT_DISCOUNT = :CLT_DISCOUNT'
      'WHERE'
      '    UNIQC = :OLD_UNIQC'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CLIENTS'
      'WHERE'
      '        UNIQC = :OLD_UNIQC'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CLIENTS('
      '    UNIQC,'
      '    CLT_NAME,'
      '    CLT_TYPE,'
      '    CLT_COUNTER,'
      '    CLT_ADRESS,'
      '    CLT_PHONE,'
      '    CLT_INFO,'
      '    CLT_DISCOUNT'
      ')'
      'VALUES('
      '    GEN_ID(GEN_UNIQC,1),'
      '    :CLT_NAME,'
      '    :CLT_TYPE,'
      '    :CLT_COUNTER,'
      '    :CLT_ADRESS,'
      '    :CLT_PHONE,'
      '    :CLT_INFO,'
      '    :CLT_DISCOUNT'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    UNIQC,'
      '    CLT_NAME,'
      '    CLT_TYPE,'
      '    CLT_COUNTER,'
      '    CLT_ADRESS,'
      '    CLT_PHONE,'
      '    CLT_INFO,'
      '    CLT_DISCOUNT'
      'FROM'
      '    CLIENTS '
      'where(  uniqc <> 0'
      '     ) and (     CLIENTS.UNIQC = :OLD_UNIQC'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQC,'
      '    CLT_NAME,'
      '    CLT_TYPE,'
      '    CLT_COUNTER,'
      '    CLT_ADRESS,'
      '    CLT_PHONE,'
      '    CLT_INFO,'
      '    CLT_DISCOUNT'
      'FROM'
      '    CLIENTS '
      'where uniqc <> 0'
      'order by upper(clt_name)')
    BeforeOpen = FIBDataSetClientsBeforeOpen
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    Left = 40
    Top = 352
    oFetchAll = True
  end
  object DataSourceClients: TDataSource
    DataSet = FIBDataSetClients
    Left = 40
    Top = 336
  end
  object FIBDataSetWeekReport: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE REPORTS'
      'SET '
      '    REP_REKLAMA = :REP_REKLAMA,'
      '    REP_MEDIK = :REP_MEDIK,'
      '    REP_KWART = :REP_KWART,'
      '    REP_CORRECT = :REP_CORRECT,'
      '    REP_OT4ET = :REP_OT4ET'
      'WHERE'
      '    UNIQR = :OLD_UNIQR'
      '    ')
    RefreshSQL.Strings = (
      'SELECT'
      '    UNIQR,'
      '    KEY_THEME,'
      '    KEY_WEEK,'
      '    REP_ORDERS,'
      '    REP_REKLAMA,'
      '    REP_MEDIK,'
      '    REP_DOLG,'
      '    REP_KWART,'
      '    REP_ITOG,'
      '    REP_OT4ET,'
      '    REP_OSTATOK'
      'FROM'
      '    REPORTS '
      'where(  '
      '    key_week = :VI_week'
      '     ) and (     REPORTS.UNIQR = :OLD_UNIQR'
      '     )'
      '    '
      '')
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQR,'
      '    thm_model,'
      '    thm_brigade,'
      '    KEY_THEME,'
      '    REP_ORDERS,'
      '    REP_REKLAMA,'
      '    REP_MEDIK,'
      '    REP_DOLG,'
      '    REP_KWART,'
      '    REP_CORRECT,'
      '    REP_ITOG,'
      '    REP_OT4ET,'
      '    REP_OSTATOK'
      'FROM'
      '    REPORTS, s_theme '
      'where '
      '    key_week = :VI_week'
      'and key_theme = cod_theme'
      'order by key_theme')
    AllowedUpdateKinds = [ukModify]
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.NumericDisplayFormat = '0.'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 44
    Top = 640
    oFetchAll = True
    object FIBDataSetWeekReportUNIQR: TFIBIntegerField
      FieldName = 'UNIQR'
      Origin = 'REPORTS.UNIQR'
    end
    object FIBDataSetWeekReportKEY_THEME: TFIBSmallIntField
      FieldName = 'KEY_THEME'
      Origin = 'REPORTS.KEY_THEME'
    end
    object FIBDataSetWeekReportREP_ORDERS: TFIBFloatField
      FieldName = 'REP_ORDERS'
      Origin = 'REPORTS.REP_ORDERS'
    end
    object FIBDataSetWeekReportREP_REKLAMA: TFIBFloatField
      FieldName = 'REP_REKLAMA'
      Origin = 'REPORTS.REP_REKLAMA'
    end
    object FIBDataSetWeekReportREP_MEDIK: TFIBFloatField
      FieldName = 'REP_MEDIK'
      Origin = 'REPORTS.REP_MEDIK'
    end
    object FIBDataSetWeekReportREP_DOLG: TFIBFloatField
      FieldName = 'REP_DOLG'
      Origin = 'REPORTS.REP_DOLG'
    end
    object FIBDataSetWeekReportREP_KWART: TFIBFloatField
      FieldName = 'REP_KWART'
      Origin = 'REPORTS.REP_KWART'
    end
    object FIBDataSetWeekReportREP_CORRECT: TFIBFloatField
      FieldName = 'REP_CORRECT'
      Origin = 'REPORTS.REP_CORRECT'
    end
    object FIBDataSetWeekReportREP_ITOG: TFIBFloatField
      FieldName = 'REP_ITOG'
      Origin = 'REPORTS.REP_ITOG'
    end
    object FIBDataSetWeekReportREP_OT4ET: TFIBFloatField
      FieldName = 'REP_OT4ET'
      Origin = 'REPORTS.REP_OT4ET'
    end
    object FIBDataSetWeekReportREP_OSTATOK: TFIBFloatField
      FieldName = 'REP_OSTATOK'
      Origin = 'REPORTS.REP_OSTATOK'
    end
    object FIBDataSetWeekReportTHM_MODEL: TFIBStringField
      FieldName = 'THM_MODEL'
      Origin = 'S_THEME.THM_MODEL'
      Size = 32
      EmptyStrToNull = True
    end
    object FIBDataSetWeekReportTHM_BRIGADE: TFIBStringField
      FieldName = 'THM_BRIGADE'
      Size = 1
      EmptyStrToNull = True
    end
  end
  object DataSourceWeekReport: TDataSource
    DataSet = FIBDataSetWeekReport
    Left = 44
    Top = 624
  end
  object FIBDataSetOrdCost: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE S_ORD_TYPE'
      'SET '
      '    NAME_ORD_TYPE = :NAME_ORD_TYPE,'
      '    ORD_TYPE = :ORD_TYPE,'
      '    COST_ORDER = :COST_ORDER,'
      '    COST_HNEXT = :COST_HNEXT,'
      '    COST_DURATION = :COST_DURATION,'
      '    COST_DISTANCE = :COST_DISTANCE,'
      '    COST_MUX = :COST_MUX'
      'WHERE'
      '    COD_ORD_TYPE = :OLD_COD_ORD_TYPE'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    S_ORD_TYPE'
      'WHERE'
      '        COD_ORD_TYPE = :OLD_COD_ORD_TYPE'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO S_ORD_TYPE('
      '    COD_ORD_TYPE,'
      '    NAME_ORD_TYPE,'
      '    ORD_TYPE,'
      '    COST_ORDER,'
      '    COST_HNEXT,'
      '    COST_DURATION,'
      '    COST_DISTANCE,'
      '    COST_MUX'
      ')'
      'VALUES('
      '    :COD_ORD_TYPE,'
      '    :NAME_ORD_TYPE,'
      '    :ORD_TYPE,'
      '    :COST_ORDER,'
      '    :COST_HNEXT,'
      '    :COST_DURATION,'
      '    :COST_DISTANCE,'
      '    :COST_MUX'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    COD_ORD_TYPE,'
      '    NAME_ORD_TYPE,'
      '    ORD_TYPE,'
      '    COST_ORDER,'
      '    COST_HNEXT,'
      '    COST_DURATION,'
      '    COST_DISTANCE,'
      '    COST_MUX'
      'FROM'
      '    S_ORD_TYPE '
      ''
      ' WHERE '
      '        S_ORD_TYPE.COD_ORD_TYPE = :OLD_COD_ORD_TYPE'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    COD_ORD_TYPE,'
      '    NAME_ORD_TYPE,'
      '    ORD_TYPE,'
      '    COST_ORDER,'
      '    COST_HNEXT,'
      '    COST_DURATION,'
      '    COST_DISTANCE,'
      '    COST_MUX'
      'FROM'
      '    S_ORD_TYPE '
      'order by ORD_TYPE, COD_ORD_TYPE')
    AfterScroll = FIBDataSetOrdCostAfterScroll
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    Left = 40
    Top = 240
    oFetchAll = True
  end
  object DataSourceOrdCost: TDataSource
    DataSet = FIBDataSetOrdCost
    Left = 40
    Top = 256
  end
  object DataSourceUser: TDataSource
    DataSet = FIBDataSetUser
    Left = 40
    Top = 144
  end
  object FIBDataSetUser: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE S_USER'
      'SET '
      '    COD_USER = :COD_USER,'
      '    NAME_USER = :NAME_USER'
      'WHERE'
      '    COD_USER = :OLD_COD_USER'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    S_USER'
      'WHERE'
      '        COD_USER = :OLD_COD_USER'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO S_USER('
      '    COD_USER,'
      '    NAME_USER'
      ')'
      'VALUES('
      '    :COD_USER,'
      '    :NAME_USER'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    COD_USER,'
      '    NAME_USER'
      'FROM'
      '    S_USER '
      ''
      ' WHERE '
      '        S_USER.COD_USER = :OLD_COD_USER'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    COD_USER,'
      '    NAME_USER'
      'FROM'
      '    S_USER '
      'order by cod_user')
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    Left = 40
    Top = 157
    oFetchAll = True
  end
  object FIBDataSetSTheme: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE S_THEME'
      'SET '
      '    THM_MODEL = :THM_MODEL,'
      '    THM_COLOR = :THM_COLOR,'
      '    THM_NUMBER = :THM_NUMBER,'
      '    THM_INFO = :THM_INFO,'
      '    THM_FREQ = :THM_FREQ,'
      '    THM_BRIGADE = :THM_BRIGADE,'
      '    THM_PREFIX = :THM_PREFIX,'
      '    THM_SUFFIX = :THM_SUFFIX,'
      '    THM_TYPE = :THM_TYPE,'
      '    THM_MARKER = :THM_MARKER'
      'WHERE'
      '    COD_THEME = :OLD_COD_THEME'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    S_THEME'
      'WHERE'
      '        COD_THEME = :OLD_COD_THEME'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO S_THEME('
      '    COD_THEME,'
      '    THM_MODEL,'
      '    THM_COLOR,'
      '    THM_NUMBER,'
      '    THM_INFO,'
      '    THM_FREQ,'
      '    THM_BRIGADE,'
      '    THM_PREFIX,'
      '    THM_SUFFIX,'
      '    THM_TYPE,'
      '    THM_MARKER'
      ')'
      'VALUES('
      '    :COD_THEME,'
      '    :THM_MODEL,'
      '    :THM_COLOR,'
      '    :THM_NUMBER,'
      '    :THM_INFO,'
      '    :THM_FREQ,'
      '    :THM_BRIGADE,'
      '    :THM_PREFIX,'
      '    :THM_SUFFIX,'
      '    :THM_TYPE,'
      '    :THM_MARKER'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '   st.COD_THEME,'
      '   st.THM_MODEL,'
      '   st.THM_COLOR,'
      '   st.THM_NUMBER,'
      '   st.THM_INFO,'
      '   st.THM_FREQ,'
      '   st.THM_BRIGADE,'
      '   st.THM_PREFIX,'
      '   st.THM_SUFFIX,'
      '   st.THM_TYPE,'
      '   st.THM_MARKER,'
      '   sl.name_loc_type,'
      '   l.uniql,'
      '   rep_dolg'
      'FROM'
      '   S_THEME st, locations l, s_loc_type sl, reports, weeks'
      'where(  l.key_theme=st.cod_theme'
      'and l.key_loc_type = sl.cod_loc_type'
      'and reports.key_week = weeks.uniqw'
      'and reports.key_theme = st.cod_theme'
      'and weeks.wks_state = 0'
      'and l.loc_state=0'
      'and st.cod_theme > 0'
      '     ) and (     ST.COD_THEME = :OLD_COD_THEME'
      '     )'
      '    '
      ''
      'union all'
      ''
      'SELECT'
      '   st.COD_THEME,'
      '   st.THM_MODEL,'
      '   st.THM_COLOR,'
      '   st.THM_NUMBER,'
      '   st.THM_INFO,'
      '   st.THM_FREQ,'
      '   st.THM_BRIGADE,'
      '   st.THM_PREFIX,'
      '   st.THM_SUFFIX,'
      '   st.THM_TYPE,'
      '   st.THM_MARKER,'
      '   cast('#39#1054#1058#1050#1051#1070#1063#1045#1053#39' as varchar(32)),'
      '   cast(0 as integer),'
      '   cast(0 as numeric(8,2))'
      'FROM'
      '   S_THEME st'
      
        'where st.cod_theme not in ( select key_theme from locations wher' +
        'e loc_state = 0)'
      'and st.cod_theme > 0'
      'and (     ST.COD_THEME = :OLD_COD_THEME'
      '     )'
      '')
    SelectSQL.Strings = (
      'SELECT'
      '   st.COD_THEME,'
      '   st.THM_MODEL,'
      '   st.THM_COLOR,'
      '   st.THM_NUMBER,'
      '   st.THM_INFO,'
      '   st.THM_FREQ,'
      '   st.THM_BRIGADE,'
      '   st.THM_PREFIX,'
      '   st.THM_SUFFIX,'
      '   st.THM_TYPE,'
      '   st.THM_MARKER,'
      '   sl.name_loc_type,'
      '   l.uniql,'
      '   rep_dolg'
      'FROM'
      '   S_THEME st, locations l, s_loc_type sl, reports, weeks'
      'where l.key_theme=st.cod_theme'
      'and l.key_loc_type = sl.cod_loc_type'
      'and reports.key_week = weeks.uniqw'
      'and reports.key_theme = st.cod_theme'
      'and weeks.wks_state = 0'
      'and l.loc_state=0'
      'and st.cod_theme > 0'
      ''
      'union all'
      ''
      'SELECT'
      '   st.COD_THEME,'
      '   st.THM_MODEL,'
      '   st.THM_COLOR,'
      '   st.THM_NUMBER,'
      '   st.THM_INFO,'
      '   st.THM_FREQ,'
      '   st.THM_BRIGADE,'
      '   st.THM_PREFIX,'
      '   st.THM_SUFFIX,'
      '   st.THM_TYPE,'
      '   st.THM_MARKER,'
      '   cast('#39#1054#1058#1050#1051#1070#1063#1045#1053#39' as varchar(32)),'
      '   cast(0 as integer),'
      '   cast(0 as numeric(8,2))'
      'FROM'
      '   S_THEME st'
      
        'where st.cod_theme not in ( select key_theme from locations wher' +
        'e loc_state = 0)'
      'and st.cod_theme > 0'
      ''
      ''
      'order by 1')
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    Left = 308
    Top = 543
    oFetchAll = True
  end
  object DataSourceSTheme: TDataSource
    DataSet = FIBDataSetSTheme
    Left = 310
    Top = 519
  end
  object FIBDataSetSOrdType: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    COD_ORD_TYPE,'
      '    NAME_ORD_TYPE'
      'FROM'
      '    S_ORD_TYPE '
      'order by cod_ord_type')
    Transaction = FIBTransaction
    Database = FIBDatabase
    Left = 252
    Top = 16
    oFetchAll = True
  end
  object FIBDataSetSClients: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQC,'
      '    CLT_NAME,'
      '    CLT_INFO'
      'FROM'
      '    CLIENTS'
      'order by clt_name')
    Transaction = FIBTransaction
    Database = FIBDatabase
    Left = 252
    Top = 64
    oFetchAll = True
  end
  object FIBDataSetCountUniqw: TpFIBDataSet
    SelectSQL.Strings = (
      'select count(uniqw) count_uniqw from weeks '
      'where date_start = :date_start'
      'and date_stop = :date_stop'
      'and wks_state <> 2 and wks_state is not null')
    Transaction = FIBTransaction
    Database = FIBDatabase
    SQLScreenCursor = crSQLWait
    Left = 252
    Top = 112
  end
  object FIBDataSetWeeks: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQW,'
      '    DATE_START,'
      '    DATE_STOP,'
      '    KEY_PREV_WEEK,'
      '    DATE_CREATE,'
      '    DATE_UPDATE,'
      '    DATE_CLOSE,'
      '    WKS_STATE'
      'FROM'
      '    WEEKS '
      'where wks_state <>2 and wks_state is not null'
      'order by date_start')
    Transaction = FIBTransaction
    Database = FIBDatabase
    SQLScreenCursor = crSQLWait
    Left = 308
    Top = 456
    oFetchAll = True
  end
  object DataSourceWeeks: TDataSource
    DataSet = FIBDataSetWeeks
    Left = 308
    Top = 440
  end
  object FIBDatabase: TpFIBDatabase
    DBName = 'd:\taxi\taxi.FDB'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'sql_role_name='
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = FIBTransaction
    DefaultUpdateTransaction = FIBTransactionUpdate
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 719
    Top = 32
  end
  object FIBTransaction: TpFIBTransaction
    DefaultDatabase = FIBDatabase
    TimeoutAction = TARollback
    Left = 664
    Top = 80
  end
  object FIBTransactionUpdate: TpFIBTransaction
    DefaultDatabase = FIBDatabase
    TimeoutAction = TARollback
    Left = 776
    Top = 80
  end
  object DataSourceSUser: TDataSource
    DataSet = FIBDataSetSUser
    Left = 248
    Top = 168
  end
  object FIBDataSetSUser: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    COD_USER,'
      '    NAME_USER'
      'FROM'
      '    S_USER '
      'order by cod_user')
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    Left = 248
    Top = 184
    oFetchAll = True
  end
  object DataSourceSmenaReport: TDataSource
    DataSet = FIBDataSetSmenaReport
    Left = 360
    Top = 168
  end
  object FIBDataSetSmenaReport: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT VO_UNIQS,VO_USR_LIST,VO_SMN_DATE,VO_DAY_NIGHT,VO_ORDERS,V' +
        'O_ORD_COST'
      'FROM SMENA_REPORT(:START_DATE,:STOP_DATE) ')
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    Left = 360
    Top = 184
    oFetchAll = True
    object FIBDataSetSmenaReportVO_UNIQS: TFIBIntegerField
      FieldName = 'VO_UNIQS'
    end
    object FIBDataSetSmenaReportVO_USR_LIST: TFIBStringField
      FieldName = 'VO_USR_LIST'
      Size = 250
      EmptyStrToNull = True
    end
    object FIBDataSetSmenaReportVO_SMN_DATE: TFIBDateField
      FieldName = 'VO_SMN_DATE'
    end
    object FIBDataSetSmenaReportVO_DAY_NIGHT: TFIBStringField
      FieldName = 'VO_DAY_NIGHT'
      OnGetText = FIBDataSetSMN_DAY_NIGHTGetText
      Size = 5
      EmptyStrToNull = True
    end
    object FIBDataSetSmenaReportVO_ORDERS: TFIBIntegerField
      FieldName = 'VO_ORDERS'
    end
    object FIBDataSetSmenaReportVO_ORD_COST: TFIBFloatField
      FieldName = 'VO_ORD_COST'
    end
  end
  object FIBDataSetThemes: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE THEMES'
      'SET '
      '    KEY_THEME = :KEY_THEME,'
      '    THM_MODEL = :THM_MODEL,'
      '    THM_COLOR = :THM_COLOR,'
      '    THM_NUMBER = :THM_NUMBER,'
      '    THM_INFO = :THM_INFO,'
      '    REP_DOLG = :REP_DOLG,'
      '    TIME_START = :TIME_START'
      'WHERE'
      '    UNIQT = :OLD_UNIQT'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    THEMES'
      'WHERE'
      '        UNIQT = :OLD_UNIQT'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO THEMES('
      '    UNIQT,'
      '    KEY_THEME,'
      '    THM_MODEL,'
      '    THM_COLOR,'
      '    THM_NUMBER,'
      '    THM_INFO,'
      '    REP_DOLG,'
      '    TIME_START'
      ')'
      'VALUES('
      '    :UNIQT,'
      '    :KEY_THEME,'
      '    :THM_MODEL,'
      '    :THM_COLOR,'
      '    :THM_NUMBER,'
      '    :THM_INFO,'
      '    :REP_DOLG,'
      '    :TIME_START'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    UNIQT,'
      '    KEY_THEME,'
      '    THM_MODEL,'
      '    THM_COLOR,'
      '    THM_NUMBER,'
      '    THM_INFO,'
      '    REP_DOLG,'
      '    TIME_START'
      'FROM'
      '    THEMES '
      ''
      ' WHERE '
      '        THEMES.UNIQT = :OLD_UNIQT'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQT,'
      '    KEY_THEME,'
      '    THM_MODEL,'
      '    THM_COLOR,'
      '    THM_NUMBER,'
      '    THM_INFO,'
      '    REP_DOLG,'
      '    TIME_START'
      'FROM'
      '    THEMES ')
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    Left = 308
    Top = 631
    oFetchAll = True
  end
  object DataSourceThemes: TDataSource
    DataSet = FIBDataSetThemes
    Left = 308
    Top = 605
  end
  object FIBStoredProcThemeArc: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE THEME_ARCHIVE (?VI_THEME)')
    StoredProcName = 'THEME_ARCHIVE'
    Left = 499
    Top = 553
  end
  object FIBDataSetCFG: TpFIBDataSet
    SelectSQL.Strings = (
      'DM->FIBDataSetCFG->SQLs->SelectSQL->Clear();'
      
        'DM->FIBDataSetCFG->SQLs->SelectSQL->Add("select val from cfg whe' +
        're mod=\'#39'TAXI\'#39' and par=\'#39'NAME\'#39'");'
      'if(!DM->FIBDataSetCFG->Active) DM->FIBDataSetCFG->Open();'
      'tmpstr=DM->FIBDataSetCFG->FieldValues["VAL"];'
      'DM->FIBDataSetCFG->Close();')
    Transaction = FIBTransaction
    Database = FIBDatabase
    DefaultFormats.DateTimeDisplayFormat = 'dd mmm hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 368
    Top = 64
    oFetchAll = True
  end
  object FIBDataSetOrdMod: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE S_ORD_MOD'
      'SET '
      '    --KEY_ORD_TYPE = :KEY_ORD_TYPE,'
      '    THM_FREQ = :THM_FREQ,'
      '    COST_ORDER = :COST_ORDER,'
      '    COST_HNEXT = :COST_HNEXT,'
      '    COST_DURATION = :COST_DURATION,'
      '    COST_DISTANCE = :COST_DISTANCE,'
      '    COST_MUX = :COST_MUX'
      'WHERE'
      '    ID = :OLD_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    S_ORD_MOD'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO S_ORD_MOD('
      '    ID,'
      '    KEY_ORD_TYPE,'
      '    THM_FREQ,'
      '    COST_ORDER,'
      '    COST_HNEXT,'
      '    COST_DURATION,'
      '    COST_DISTANCE,'
      '    COST_MUX'
      ')'
      'VALUES('
      '    :ID,'
      '    :KEY_ORD_TYPE,'
      '    :THM_FREQ,'
      '    :COST_ORDER,'
      '    :COST_HNEXT,'
      '    :COST_DURATION,'
      '    :COST_DISTANCE,'
      '    :COST_MUX'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ID,'
      '    KEY_ORD_TYPE,'
      '    THM_FREQ,'
      '    COST_ORDER,'
      '    COST_HNEXT,'
      '    COST_DURATION,'
      '    COST_DISTANCE,'
      '    COST_MUX'
      'FROM'
      '    S_ORD_MOD '
      ''
      ' WHERE '
      '        S_ORD_MOD.ID = :OLD_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID,'
      'KEY_ORD_TYPE,'
      '    THM_FREQ,'
      '    COST_ORDER,'
      '    COST_HNEXT,'
      '    COST_DURATION,'
      '    COST_DISTANCE,'
      '    COST_MUX'
      'FROM'
      '    S_ORD_MOD '
      'where '
      '    KEY_ORD_TYPE = :KEY_ORD_TYPE')
    AutoUpdateOptions.UpdateTableName = 'S_ORD_MOD'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GENERATOR_ID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    BeforeOpen = FIBDataSetOrdModBeforeOpen
    OnNewRecord = FIBDataSetOrdModNewRecord
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    Left = 136
    Top = 240
    oFetchAll = True
  end
  object DataSourceOrdMod: TDataSource
    DataSet = FIBDataSetOrdMod
    Left = 136
    Top = 256
  end
end
