object DM: TDM
  OldCreateOrder = False
  Height = 718
  Width = 1033
  object FIBTransaction: TpFIBTransaction
    DefaultDatabase = FIBDatabase
    TimeoutAction = TARollback
    Left = 48
    Top = 52
  end
  object FIBTransactionUpdate: TpFIBTransaction
    DefaultDatabase = FIBDatabase
    Timeout = 5000
    TimeoutAction = TARollback
    Left = 48
    Top = 96
  end
  object FIBDatabase: TpFIBDatabase
    DBName = 'd:\elit\elit.FDB'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA'
      'sql_role_name=')
    DefaultTransaction = FIBTransaction
    DefaultUpdateTransaction = FIBTransactionUpdate
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    UseRepositories = []
    CacheSchemaOptions.ValidateAfterLoad = False
    WaitForRestoreConnect = 0
    Left = 48
    Top = 8
  end
  object FIBDataSet_V_LOCATIONS: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified]
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQL,'
      '    PREV_LOCATIONS,'
      '    KEY_THEME,'
      '    THEME_LABEL,'
      '    THEME_INFO,'
      '    KEY_LOCATION,'
      '    KEY_LOC_TYPE,'
      '    LOC_STATE,'
      '    THM_RESSORT,'
      '    TIME_START'
      'FROM'
      '    V_LOCATIONS'
      '')
    AutoUpdateOptions.AutoParamsToFields = True
    AutoCalcFields = False
    AllowedUpdateKinds = []
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    Left = 80
    Top = 312
    oFetchAll = True
  end
  object FIBDataSet_S_LOCATION: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    COD_LOCATION,'
      '    NAME_LOCATION,'
      '    POS_TOP,'
      '    POS_LEFT,'
      '    HEIGHT,'
      '    WIDTH'
      'FROM'
      '    S_LOCATION '
      'order by'
      '    cod_location')
    AutoCalcFields = False
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    Left = 80
    Top = 360
    oFetchAll = True
  end
  object FIBDataSet_S_THEME: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    COD_THEME,'
      '    THM_MODEL,'
      '    THM_COLOR,'
      '    THM_NUMBER,'
      '    THM_INFO,'
      '    THM_FREQ,'
      '    THM_PREFIX,'
      '    THM_SUFFIX,'
      '    rep_dolg'
      'FROM S_THEME,reports,weeks'
      'where weeks.wks_state = 0'
      'and reports.key_theme = s_theme.cod_theme'
      'and reports.key_week = weeks.uniqw')
    AutoCalcFields = False
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    Left = 80
    Top = 408
    oFetchAll = True
  end
  object FIBDataSetCliensOrders: TpFIBDataSet
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    Left = 80
    Top = 456
    oFetchAll = True
  end
  object FIBDataSetClientDiscont: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT first 1'
      '    UNIQC,'
      '    CLT_NAME,'
      '    CLT_INFO,'
      '    CLT_ADRESS,'
      '    CLT_PHONE,'
      '    CLT_TYPE,'
      '    CLT_COUNTER,'
      '    CLT_DISCOUNT'
      'FROM'
      '    CLIENTS '
      'where '
      '    upper(CLT_NAME) like upper(:NAME||'#39'%'#39')'
      ''
      'union'
      ''
      'SELECT'
      '    UNIQC,'
      '    CLT_NAME,'
      '    CLT_INFO,'
      '    CLT_ADRESS,'
      '    CLT_PHONE,'
      '    CLT_TYPE,'
      '    CLT_COUNTER,'
      '    CLT_DISCOUNT'
      'FROM'
      '    CLIENTS '
      'where '
      '    CLT_NAME = :NAME'
      ''
      'order by 2'
      '')
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    Left = 80
    Top = 504
    oFetchAll = True
  end
  object FIBDataSetClients: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQC,'
      '    CLT_NAME,'
      '    CLT_ADRESS,'
      '    CLT_PHONE'
      'FROM'
      '    CLIENTS '
      'where '
      '    clt_type = 1'
      'order by clt_name')
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    Left = 80
    Top = 552
    oFetchAll = True
  end
  object FIBDataSetSOrdType: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    COD_ORD_TYPE,'
      '    NAME_ORD_TYPE || '#39' ['#39' || COD_ORD_TYPE || '#39']'#39' NAME_ORD_TYPE '
      'FROM'
      '    S_ORD_TYPE '
      'where '
      '    ord_type > 0'
      ''
      'order by ord_type, cod_ord_type')
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    Left = 240
    Top = 616
    oFetchAll = True
  end
  object SIBfibEventAlerterLocRefresh: TSIBfibEventAlerter
    Events.Strings = (
      'LOC_REFRESH')
    OnEventAlert = SIBfibEventAlerterLocRefreshEventAlert
    Database = FIBDatabase
    AutoRegister = True
    Left = 192
    Top = 9
  end
  object SIBfibEventAlerterOrdRefresh: TSIBfibEventAlerter
    Events.Strings = (
      'ORD_REFRESH_DELAY'
      'ORD_REFRESH_ONLINE'
      'ORD_REFRESH_REZERV')
    OnEventAlert = SIBfibEventAlerterOrdRefreshEventAlert
    Database = FIBDatabase
    AutoRegister = True
    Left = 191
    Top = 55
  end
  object FIBStoredProcSmenaCheck: TpFIBStoredProc
    Transaction = FIBTransaction
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE SMENA_CHECK (:VI_UNIQS)')
    StoredProcName = 'SMENA_CHECK'
    Left = 816
    Top = 268
  end
  object FIBStoredProcRessortNight: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE RESSORT_NIGHT ')
    StoredProcName = 'RESSORT_NIGHT'
    Left = 816
    Top = 316
  end
  object FIBStoredProcRessortDay: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE RESSORT_DAY ')
    StoredProcName = 'RESSORT_DAY'
    Left = 816
    Top = 364
  end
  object FIBStoredProcLocationCheck: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE LOCATION_CHECK'
      '(:VI_TIMEOUT_11,'
      '    :VI_TIMEOUT_9,'
      '    :VI_TIMEOUT_7)')
    StoredProcName = 'LOCATION_CHECK'
    Left = 816
    Top = 412
  end
  object FIBStoredProcSmenaRepNo: TpFIBStoredProc
    Transaction = FIBTransaction
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE SMENA_REPNO (?VI_UNIQS)')
    StoredProcName = 'SMENA_REPNO'
    Left = 816
    Top = 460
  end
  object FIBStoredProc_LOCATION_ROLLBACK: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE LOCATION_ROLLBACK'
      '(:VI_SMENA,'
      '    :VI_UNIQL)')
    StoredProcName = 'LOCATION_ROLLBACK'
    Left = 424
    Top = 252
  end
  object FIBStoredProc_LOCATION_UPDATE: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE LOCATION_UPDATE'
      '(:VI_UNIQL,'
      '    :VI_THM_RESSORT,'
      '    :VI_LOC_TYPE)')
    StoredProcName = 'LOCATION_UPDATE'
    Left = 424
    Top = 208
  end
  object FIBStoredProc_LOCATION_STOP: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE LOCATION_STOP'
      '(:VI_UNIQL,'
      '    :VI_SMN_STOP)')
    StoredProcName = 'LOCATION_STOP'
    Left = 424
    Top = 160
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
    Left = 424
    Top = 112
  end
  object FIBDataSet_ORD_RESERV: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQO,'
      '    KEY_THEME,'
      '    KEY_ORD_TYPE,'
      '    KEY_CLIENT,'
      '    KEY_SMN_START,'
      '    TIME_START,'
      '    ORD_DESTINATION,'
      '    ORD_DEPARTURE,'
      '    ORD_PHONE'
      'FROM'
      '    V_ORDERS_REZERV '
      'order by TIME_START ')
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    DefaultFormats.DateTimeDisplayFormat = 'dd mmm hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 240
    Top = 312
    oFetchAll = True
    object FIBDataSet_ORD_RESERVUNIQO: TFIBIntegerField
      FieldName = 'UNIQO'
      Origin = 'V_ORDERS_REZERV.UNIQO'
    end
    object FIBDataSet_ORD_RESERVKEY_THEME: TFIBSmallIntField
      FieldName = 'KEY_THEME'
      Origin = 'V_ORDERS_REZERV.KEY_THEME'
    end
    object FIBDataSet_ORD_RESERVKEY_ORD_TYPE: TFIBSmallIntField
      FieldName = 'KEY_ORD_TYPE'
      Origin = 'V_ORDERS_REZERV.KEY_ORD_TYPE'
    end
    object FIBDataSet_ORD_RESERVKEY_CLIENT: TFIBIntegerField
      FieldName = 'KEY_CLIENT'
      Origin = 'V_ORDERS_REZERV.KEY_CLIENT'
    end
    object FIBDataSet_ORD_RESERVKEY_SMN_START: TFIBIntegerField
      FieldName = 'KEY_SMN_START'
      Origin = 'V_ORDERS_REZERV.KEY_SMN_START'
    end
    object FIBDataSet_ORD_RESERVTIME_START: TFIBDateTimeField
      FieldName = 'TIME_START'
      Origin = 'V_ORDERS_REZERV.TIME_START'
    end
    object FIBDataSet_ORD_RESERVORD_DESTINATION: TFIBStringField
      FieldName = 'ORD_DESTINATION'
      Origin = 'V_ORDERS_REZERV.ORD_DESTINATION'
      Size = 250
      EmptyStrToNull = True
    end
    object FIBDataSet_ORD_RESERVORD_DEPARTURE: TFIBStringField
      FieldName = 'ORD_DEPARTURE'
      Origin = 'V_ORDERS_REZERV.ORD_DEPARTURE'
      Size = 250
      EmptyStrToNull = True
    end
    object FIBDataSet_ORD_RESERVORD_PHONE: TFIBStringField
      FieldName = 'ORD_PHONE'
      Origin = 'V_ORDERS_REZERV.ORD_PHONE'
      Size = 16
      EmptyStrToNull = True
    end
  end
  object DataSource_ORD_RESERV: TDataSource
    DataSet = FIBDataSet_ORD_RESERV
    Left = 241
    Top = 337
  end
  object FIBDataSet_ORD_DELAY: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQO,'
      '    KEY_THEME,'
      '    KEY_ORD_TYPE,'
      '    KEY_CLIENT,'
      '    KEY_SMN_START,'
      '    TIME_START,'
      '    ORD_DESTINATION,'
      '    ORD_DEPARTURE,'
      '    ORD_PHONE'
      'FROM'
      '    V_ORDERS_DELAY '
      'order by uniqo')
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    DefaultFormats.DateTimeDisplayFormat = 'dd mmm hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 241
    Top = 427
    oFetchAll = True
    object FIBDataSet_ORD_DELAYUNIQO: TFIBIntegerField
      FieldName = 'UNIQO'
    end
    object FIBDataSet_ORD_DELAYKEY_THEME: TFIBSmallIntField
      FieldName = 'KEY_THEME'
    end
    object FIBDataSet_ORD_DELAYKEY_ORD_TYPE: TFIBSmallIntField
      FieldName = 'KEY_ORD_TYPE'
    end
    object FIBDataSet_ORD_DELAYKEY_CLIENT: TFIBIntegerField
      FieldName = 'KEY_CLIENT'
    end
    object FIBDataSet_ORD_DELAYKEY_SMN_START: TFIBIntegerField
      FieldName = 'KEY_SMN_START'
    end
    object FIBDataSet_ORD_DELAYTIME_START: TFIBDateTimeField
      FieldName = 'TIME_START'
    end
    object FIBDataSet_ORD_DELAYORD_DESTINATION: TFIBStringField
      FieldName = 'ORD_DESTINATION'
      Size = 250
      EmptyStrToNull = True
    end
    object FIBDataSet_ORD_DELAYORD_DEPARTURE: TFIBStringField
      FieldName = 'ORD_DEPARTURE'
      Size = 250
      EmptyStrToNull = True
    end
    object FIBDataSet_ORD_DELAYORD_PHONE: TFIBStringField
      FieldName = 'ORD_PHONE'
      Size = 10
      EmptyStrToNull = True
    end
  end
  object DataSource_ORD_DELAY: TDataSource
    DataSet = FIBDataSet_ORD_DELAY
    Left = 241
    Top = 451
  end
  object FIBDataSet_ORD_ONLINE: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQO,'
      '    KEY_THEME,'
      '    KEY_LOCATIONS,'
      '    KEY_ORD_TYPE,'
      '    KEY_CLIENT,'
      '    ORD_STATE,'
      '    ORD_DURATION,'
      '    ORD_DISTANCE,'
      '    ORD_COST,'
      '    ORD_HOURS,'
      '    ORD_ITOG,'
      '    KEY_SMN_START,'
      '    KEY_SMN_STOP,'
      '    TIME_START,'
      '    TIME_STOP,'
      '    ORD_DESTINATION,'
      '    ORD_DEPARTURE,'
      '    ORD_PHONE'
      'FROM'
      '    V_ORDERS_ONLINE '
      'order by uniqo')
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    DefaultFormats.DateTimeDisplayFormat = 'dd mmm hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 240
    Top = 528
    oFetchAll = True
    object FIBDataSet_ORD_ONLINEUNIQO: TFIBIntegerField
      FieldName = 'UNIQO'
    end
    object FIBDataSet_ORD_ONLINEKEY_THEME: TFIBSmallIntField
      FieldName = 'KEY_THEME'
    end
    object FIBDataSet_ORD_ONLINEKEY_LOCATIONS: TFIBIntegerField
      FieldName = 'KEY_LOCATIONS'
    end
    object FIBDataSet_ORD_ONLINEKEY_ORD_TYPE: TFIBSmallIntField
      FieldName = 'KEY_ORD_TYPE'
    end
    object FIBDataSet_ORD_ONLINEKEY_CLIENT: TFIBIntegerField
      FieldName = 'KEY_CLIENT'
    end
    object FIBDataSet_ORD_ONLINEORD_STATE: TFIBSmallIntField
      FieldName = 'ORD_STATE'
    end
    object FIBDataSet_ORD_ONLINEORD_DURATION: TFIBTimeField
      FieldName = 'ORD_DURATION'
    end
    object FIBDataSet_ORD_ONLINEORD_DISTANCE: TFIBIntegerField
      FieldName = 'ORD_DISTANCE'
    end
    object FIBDataSet_ORD_ONLINEORD_COST: TFIBFloatField
      FieldName = 'ORD_COST'
    end
    object FIBDataSet_ORD_ONLINEORD_HOURS: TFIBIntegerField
      FieldName = 'ORD_HOURS'
    end
    object FIBDataSet_ORD_ONLINEORD_ITOG: TFIBFloatField
      FieldName = 'ORD_ITOG'
    end
    object FIBDataSet_ORD_ONLINEKEY_SMN_START: TFIBIntegerField
      FieldName = 'KEY_SMN_START'
    end
    object FIBDataSet_ORD_ONLINEKEY_SMN_STOP: TFIBIntegerField
      FieldName = 'KEY_SMN_STOP'
    end
    object FIBDataSet_ORD_ONLINETIME_START: TFIBDateTimeField
      FieldName = 'TIME_START'
    end
    object FIBDataSet_ORD_ONLINETIME_STOP: TFIBDateTimeField
      FieldName = 'TIME_STOP'
    end
    object FIBDataSet_ORD_ONLINEORD_DESTINATION: TFIBStringField
      FieldName = 'ORD_DESTINATION'
      Size = 250
      EmptyStrToNull = True
    end
    object FIBDataSet_ORD_ONLINEORD_DEPARTURE: TFIBStringField
      FieldName = 'ORD_DEPARTURE'
      Size = 250
      EmptyStrToNull = True
    end
    object FIBDataSet_ORD_ONLINEORD_PHONE: TFIBStringField
      FieldName = 'ORD_PHONE'
      Size = 10
      EmptyStrToNull = True
    end
  end
  object DataSource_ORD_ONLINE: TDataSource
    DataSet = FIBDataSet_ORD_ONLINE
    Left = 242
    Top = 555
  end
  object FIBQueryOrderDelete: TpFIBQuery
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    Left = 425
    Top = 17
  end
  object FIBStoredProc_ORDER_STOP: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE ORDER_STOP'
      '(:VI_SMN_STOP,'
      '    :VI_TIME_STOP,'
      '    :VI_KEY_LOCATIONS)')
    StoredProcName = 'ORDER_STOP'
    Left = 817
    Top = 563
  end
  object FIBStoredProc_ORDER_START: TpFIBStoredProc
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
      '    :VI_PHONE,'
      '    :VI_CLIENT)')
    StoredProcName = 'ORDER_START'
    Left = 817
    Top = 515
  end
  object FIBDataSet_ORD_REZERV_CHECK: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQO,'
      '    TIME_START'
      'FROM'
      '    V_ORDERS_REZERV '
      'order by TIME_START ')
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    DefaultFormats.DateTimeDisplayFormat = 'dd mmm hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 240
    Top = 248
    oFetchAll = True
    object FIBIntegerField1: TFIBIntegerField
      FieldName = 'UNIQO'
      Origin = 'V_ORDERS_REZERV.UNIQO'
    end
    object FIBDateTimeField1: TFIBDateTimeField
      FieldName = 'TIME_START'
      Origin = 'V_ORDERS_REZERV.TIME_START'
    end
  end
  object FIBStoredProcSmenaWeekEnd: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE SMENA_WEEKEND (?VI_UNIQS, ?VI_SMN_WEEKEND)')
    StoredProcName = 'SMENA_WEEKEND'
    Left = 617
    Top = 600
  end
  object FIBStoredProcSmenaAction: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE SMENA_ACTION (?VI_UNIQS, ?VI_SMN_ACTION)')
    StoredProcName = 'SMENA_ACTION'
    Left = 615
    Top = 557
  end
  object FIBDataSetSmena: TpFIBDataSet
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
      'where '
      '   smn_state = 0')
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    Left = 624
    Top = 408
    object FIBDataSetSmenaUNIQS: TFIBIntegerField
      FieldName = 'UNIQS'
    end
    object FIBDataSetSmenaSMN_TIME_START: TFIBDateTimeField
      FieldName = 'SMN_TIME_START'
    end
    object FIBDataSetSmenaSMN_TIME_STOP: TFIBDateTimeField
      FieldName = 'SMN_TIME_STOP'
    end
    object FIBDataSetSmenaSMN_STATE: TFIBSmallIntField
      FieldName = 'SMN_STATE'
    end
    object FIBDataSetSmenaSMN_WEEKEND: TFIBSmallIntField
      FieldName = 'SMN_WEEKEND'
    end
    object FIBDataSetSmenaSMN_DATE: TFIBDateField
      FieldName = 'SMN_DATE'
    end
    object FIBDataSetSmenaSMN_DAY_NIGHT: TFIBSmallIntField
      FieldName = 'SMN_DAY_NIGHT'
    end
    object FIBDataSetSmenaUSR_LIST: TFIBStringField
      FieldName = 'USR_LIST'
      Size = 250
      EmptyStrToNull = True
    end
  end
  object FIBDataSetCOLORS: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    FREQ,'
      '    STATE,'
      '    CAPTION,'
      '    HINT,'
      '    LABEL_R,'
      '    LABEL_G,'
      '    LABEL_B,'
      '    FONT_R,'
      '    FONT_G,'
      '    FONT_B'
      ''
      'FROM'
      '    COLORS '
      'order by freq desc')
    Transaction = FIBTransaction
    Database = FIBDatabase
    DefaultFormats.DateTimeDisplayFormat = 'dd mmm hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 200
    Top = 136
    oFetchAll = True
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
    Left = 200
    Top = 184
    oFetchAll = True
  end
  object DataSourceSOrdType: TDataSource
    DataSet = FIBDataSetSOrdType
    Left = 242
    Top = 643
  end
  object FIBStoredProc_LOCATION_UNMARK: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE LOCATION_UNMARK'
      '(:VI_THEME)')
    StoredProcName = 'LOCATION_UNMARK'
    Left = 608
    Top = 160
  end
  object FIBStoredProc_LOCATION_MARK: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE LOCATION_MARK'
      '(:VI_PREV_LOCATIONS,'
      '    :VI_THM_RESSORT,'
      '    :VI_SMN_START)')
    StoredProcName = 'LOCATION_MARK'
    Left = 608
    Top = 112
  end
  object FIBStoredProc_THEME_MARKER: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE THEME_MARKER'
      '(:VI_THEME,'
      '    :VI_MARKER)')
    StoredProcName = 'THEME_MARKER'
    Left = 608
    Top = 304
  end
  object FIBStoredProc_LOCATION_ROLL: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE LOCATION_ROLL'
      '(:VI_UNIQL_START,'
      '    :VI_UNIQL_STOP,'
      '    :VI_KEY_LOCATION)')
    StoredProcName = 'LOCATION_ROLL'
    Left = 424
    Top = 308
  end
end
