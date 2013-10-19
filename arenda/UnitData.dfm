object DM: TDM
  OldCreateOrder = False
  Height = 819
  Width = 939
  object FIBStoredProc_VEHICLE_PAY: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabaseSamara
    GoToFirstRecordOnExecute = False
    SQL.Strings = (
      'EXECUTE PROCEDURE VEHICLE_PAY'
      '(:VI_UNIQV,'
      '    :VI_ARN_ACTION,'
      '    :VI_ARN_DATE,'
      '    :VI_SMN_START,'
      '    :VI_MONEY,'
      '    :VI_INFO)')
    StoredProcName = 'VEHICLE_PAY'
    Left = 510
    Top = 37
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
      'order by uniqs')
    AfterOpen = FIBDataSetLastRecordAfterOpen
    BeforeOpen = FIBDataSetSmenaBeforeOpen
    Transaction = FIBTransactionSamara
    Database = FIBDatabaseSamara
    OnEndScroll = FIBDataSetSmenaEndScroll
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yy hh:mm'
    DefaultFormats.DisplayFormatDate = 'dd.mm.yy'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 234
    Top = 36
    oFetchAll = True
    object FIBDataSetSmenaUNIQS: TFIBIntegerField
      FieldName = 'UNIQS'
    end
    object FIBDataSetSmenaSMN_TIME_START: TFIBDateTimeField
      FieldName = 'SMN_TIME_START'
      DisplayFormat = 'dd.mm.yy hh:mm'
    end
    object FIBDataSetSmenaSMN_TIME_STOP: TFIBDateTimeField
      FieldName = 'SMN_TIME_STOP'
      DisplayFormat = 'dd.mm.yy hh:mm'
    end
    object FIBDataSetSmenaSMN_STATE: TFIBSmallIntField
      FieldName = 'SMN_STATE'
      OnGetText = FIBDataSetSMN_STATEGetText
    end
    object FIBDataSetSmenaSMN_WEEKEND: TFIBSmallIntField
      FieldName = 'SMN_WEEKEND'
      OnGetText = FIBDataSetSMN_WEEKENDGetText
    end
    object FIBDataSetSmenaSMN_DATE: TFIBDateField
      FieldName = 'SMN_DATE'
      DisplayFormat = 'dd.mm.yy'
    end
    object FIBDataSetSmenaSMN_DAY_NIGHT: TFIBSmallIntField
      FieldName = 'SMN_DAY_NIGHT'
      OnGetText = FIBDataSetSMN_DAY_NIGHTGetText
    end
    object FIBDataSetSmenaUSR_LIST: TFIBStringField
      FieldName = 'USR_LIST'
      Size = 250
      EmptyStrToNull = True
    end
  end
  object DataSourceSmena: TDataSource
    DataSet = FIBDataSetSmena
    Left = 233
    Top = 17
  end
  object FIBDataSetArendaActions: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    COD_ARN_ACTION                ,'
      '    NAME_ARN_ACTION               '
      'FROM'
      '    S_ARN_ACTION                  ')
    Transaction = FIBTransactionSamara
    Database = FIBDatabaseSamara
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 237
    Top = 290
    oFetchAll = True
  end
  object DataSourceArendaActions: TDataSource
    DataSet = FIBDataSetArendaActions
    Left = 237
    Top = 272
  end
  object FIBDatabaseSamara: TpFIBDatabase
    DBName = 'C:\samara\samara.FDB'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'sql_role_name='
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = FIBTransactionSamara
    DefaultUpdateTransaction = FIBTransactionUpdate
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 58
    Top = 65535
  end
  object FIBTransactionSamara: TpFIBTransaction
    DefaultDatabase = FIBDatabaseSamara
    TimeoutAction = TARollback
    Left = 3
    Top = 47
  end
  object FIBTransactionUpdate: TpFIBTransaction
    DefaultDatabase = FIBDatabaseSamara
    TimeoutAction = TARollback
    Left = 115
    Top = 47
  end
  object DataSourceVehicles: TDataSource
    DataSet = FIBDataSetVehicles
    Left = 235
    Top = 100
  end
  object FIBDataSetVehicles: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE VEHICLES'
      'SET '
      '    UNIQV = :UNIQV,'
      '    KEY_THEME = :KEY_THEME,'
      '    MODEL = :MODEL,'
      '    NUMBER = :NUMBER,'
      '    INFO = :INFO,'
      '    COST = :COST,'
      '    CURRENCY = :CURRENCY,'
      '    ACCOUNT = :ACCOUNT,'
      '    DURATION = :DURATION,'
      '    RENTAL = :RENTAL,'
      '    VHC_STATE = :VHC_STATE,'
      '    TIME_START = :TIME_START,'
      '    TIME_STOP = :TIME_STOP'
      'WHERE'
      '    UNIQV = :OLD_UNIQV'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    VEHICLES'
      'WHERE'
      '        UNIQV = :OLD_UNIQV'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO VEHICLES('
      '    UNIQV,'
      '    KEY_THEME,'
      '    MODEL,'
      '    NUMBER,'
      '    INFO,'
      '    COST,'
      '    CURRENCY,'
      '    ACCOUNT,'
      '    DURATION,'
      '    RENTAL,'
      '    VHC_STATE,'
      '    TIME_START,'
      '    TIME_STOP'
      ')'
      'VALUES('
      '    :UNIQV,'
      '    :KEY_THEME,'
      '    :MODEL,'
      '    :NUMBER,'
      '    :INFO,'
      '    :COST,'
      '    :CURRENCY,'
      '    :ACCOUNT,'
      '    :DURATION,'
      '    :RENTAL,'
      '    :VHC_STATE,'
      '    :TIME_START,'
      '    :TIME_STOP'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    VEHICLES.UNIQV                         ,'
      '    VEHICLES.KEY_THEME                     ,'
      '    VEHICLES.MODEL                         ,'
      '    VEHICLES.NUMBER                        ,'
      '    VEHICLES.INFO                          ,'
      '    VEHICLES.COST                          ,'
      '    VEHICLES.CURRENCY                      ,'
      '    VEHICLES.ACCOUNT                       ,'
      '    VEHICLES.DURATION                      ,'
      '    VEHICLES.RENTAL                        ,'
      '    VEHICLES.VHC_STATE                         ,'
      '    VEHICLES.TIME_START                    ,'
      '    VEHICLES.TIME_STOP                     '
      
        ',cast((SELECT VO_RATE FROM EXCHANGE_get)*(select arenda.balance ' +
        'from arenda where arenda.key_uniqv = vehicles.uniqv and arn_stat' +
        'e=0) as numeric(8,2) ) balance'
      
        ',cast(((SELECT VO_RATE FROM EXCHANGE_get)*(select arenda.balance' +
        ' from arenda where arenda.key_uniqv = vehicles.uniqv and arn_sta' +
        'te=0))/(VEHICLES.RENTAL) as integer) payout'
      'FROM'
      '    VEHICLES'
      'where     VEHICLES.UNIQV = :OLD_UNIQV'
      '   '
      '    '
      '')
    SelectSQL.Strings = (
      'SELECT'
      '    VEHICLES.UNIQV                         ,'
      '    VEHICLES.KEY_THEME                     ,'
      '    VEHICLES.MODEL                         ,'
      '    VEHICLES.NUMBER                        ,'
      '    VEHICLES.INFO                          ,'
      '    VEHICLES.COST                          ,'
      '    VEHICLES.CURRENCY                      ,'
      '    VEHICLES.ACCOUNT                       ,'
      '    VEHICLES.DURATION                      ,'
      '    VEHICLES.RENTAL                        ,'
      '    VEHICLES.VHC_STATE                         ,'
      '    VEHICLES.TIME_START                    ,'
      '    VEHICLES.TIME_STOP                     '
      
        ',cast((SELECT VO_RATE FROM EXCHANGE_get)*(select arenda.balance ' +
        'from arenda where arenda.key_uniqv = vehicles.uniqv and arn_stat' +
        'e=0) as numeric(8,2) ) balance'
      
        ',cast(((SELECT VO_RATE FROM EXCHANGE_get)*(select arenda.balance' +
        ' from arenda where arenda.key_uniqv = vehicles.uniqv and arn_sta' +
        'te=0))/(VEHICLES.RENTAL) as integer) payout'
      'FROM'
      '    VEHICLES'
      'where uniqv>0'
      'and vhc_state = 0')
    Transaction = FIBTransactionSamara
    Database = FIBDatabaseSamara
    UpdateTransaction = FIBTransactionUpdate
    AutoCommit = True
    OnEndScroll = FIBDataSetVehiclesEndScroll
    SQLScreenCursor = crSQLWait
    RefreshTransactionKind = tkUpdateTransaction
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 236
    Top = 119
    oFetchAll = True
  end
  object DataSourceArenda: TDataSource
    DataSet = FIBDataSetArenda
    Left = 235
    Top = 193
  end
  object FIBDataSetArenda: TpFIBDataSet
    RefreshSQL.Strings = (
      'SELECT'
      '    UNIQA                         ,'
      '    PREV_UNIQA                    ,'
      '    ARN_STATE                     ,'
      '    KEY_UNIQV                     ,'
      '    KEY_THEME                     ,'
      '    ARN_DATE                      ,'
      '    KEY_SMN_START                 ,'
      '    KEY_SMN_STOP                  ,'
      '    KEY_ARN_ACTION                ,'
      '    TIME_START                    ,'
      '    TIME_STOP                     ,'
      '    MONEY                         ,'
      '    CURRENCY                      ,'
      '    BALANCE                       ,'
      '    KEY_EXCHANGE                  ,'
      '    INFO                          '
      'FROM'
      '    ARENDA                         '
      ''
      ' WHERE '
      '        ARENDA.UNIQA = :OLD_UNIQA'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQA                         ,'
      '    PREV_UNIQA                    ,'
      '    ARN_STATE                     ,'
      '    KEY_UNIQV                     ,'
      '    KEY_THEME                     ,'
      '    ARN_DATE                      ,'
      '    KEY_SMN_START                 ,'
      '    KEY_SMN_STOP                  ,'
      '    KEY_ARN_ACTION                ,'
      '    TIME_START                    ,'
      '    TIME_STOP                     ,'
      '    MONEY                         ,'
      '    CURRENCY                      ,'
      '    BALANCE                       ,'
      '    KEY_EXCHANGE                  ,'
      '    INFO                          '
      'FROM'
      '    ARENDA                         '
      'order by arn_date,KEY_ARN_ACTION                ')
    AfterOpen = FIBDataSetLastRecordAfterOpen
    BeforeOpen = FIBDataSetArendaBeforeOpen
    Transaction = FIBTransactionSamara
    Database = FIBDatabaseSamara
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd mmm hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 234
    Top = 212
    oFetchAll = True
    object FIBDataSetArendaUNIQA: TFIBIntegerField
      FieldName = 'UNIQA'
    end
    object FIBDataSetArendaPREV_UNIQA: TFIBSmallIntField
      FieldName = 'PREV_UNIQA'
    end
    object FIBDataSetArendaARN_STATE: TFIBSmallIntField
      FieldName = 'ARN_STATE'
    end
    object FIBDataSetArendaKEY_UNIQV: TFIBIntegerField
      FieldName = 'KEY_UNIQV'
    end
    object FIBDataSetArendaKEY_THEME: TFIBSmallIntField
      FieldName = 'KEY_THEME'
    end
    object FIBDataSetArendaARN_DATE: TFIBDateField
      FieldName = 'ARN_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object FIBDataSetArendaKEY_SMN_START: TFIBIntegerField
      FieldName = 'KEY_SMN_START'
    end
    object FIBDataSetArendaKEY_SMN_STOP: TFIBIntegerField
      FieldName = 'KEY_SMN_STOP'
    end
    object FIBDataSetArendaKEY_ARN_ACTION: TFIBSmallIntField
      FieldName = 'KEY_ARN_ACTION'
    end
    object FIBDataSetArendaTIME_START: TFIBDateTimeField
      FieldName = 'TIME_START'
      DisplayFormat = 'dd mmm hh:mm'
    end
    object FIBDataSetArendaTIME_STOP: TFIBDateTimeField
      FieldName = 'TIME_STOP'
      DisplayFormat = 'dd mmm hh:mm'
    end
    object FIBDataSetArendaMONEY: TFIBFloatField
      FieldName = 'MONEY'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object FIBDataSetArendaCURRENCY: TFIBFloatField
      FieldName = 'CURRENCY'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object FIBDataSetArendaBALANCE: TFIBFloatField
      FieldName = 'BALANCE'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object FIBDataSetArendaKEY_EXCHANGE: TFIBIntegerField
      FieldName = 'KEY_EXCHANGE'
    end
    object FIBDataSetArendaINFO: TFIBStringField
      FieldName = 'INFO'
      Size = 252
      EmptyStrToNull = True
    end
    object FIBDataSetArendaLU_ARN_ACTIONS: TStringField
      FieldKind = fkLookup
      FieldName = 'LU_ARN_ACTIONS'
      LookupDataSet = FIBDataSetArendaActions
      LookupKeyFields = 'COD_ARN_ACTION'
      LookupResultField = 'NAME_ARN_ACTION'
      KeyFields = 'KEY_ARN_ACTION'
      LookupCache = True
      ReadOnly = True
      Lookup = True
    end
  end
  object FIBStoredProcExchangeGet: TpFIBStoredProc
    Transaction = FIBTransactionSamara
    Database = FIBDatabaseSamara
    SQL.Strings = (
      'EXECUTE PROCEDURE EXCHANGE_GET ')
    StoredProcName = 'EXCHANGE_GET'
    Left = 368
    Top = 18
    qoStartTransaction = True
  end
  object FIBStoredProcExchangeSet: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabaseSamara
    SQL.Strings = (
      'EXECUTE PROCEDURE EXCHANGE_SET (?VI_RATE)')
    StoredProcName = 'EXCHANGE_SET'
    Left = 369
    Top = 61
  end
  object FIBDataSetExchange: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQE                         ,'
      '    TIME_START                    ,'
      '    TIME_STOP                     ,'
      '    RATE                          ,'
      '    1/RATE kurs                    ,'
      '    STATE                         '
      'FROM'
      '    EXCHANGE                       '
      'where state = 0')
    Transaction = FIBTransactionSamara
    Database = FIBDatabaseSamara
    UpdateTransaction = FIBTransactionUpdate
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd mmmm yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 371
    Top = 125
    oFetchAll = True
  end
  object DataSourceExchange: TDataSource
    DataSet = FIBDataSetExchange
    Left = 371
    Top = 107
  end
  object FIBStoredProc_VEHICLE_ADD: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabaseSamara
    GoToFirstRecordOnExecute = False
    SQL.Strings = (
      'EXECUTE PROCEDURE "VEHICLE_ADD                   "'
      '(:VI_THEME,'
      '    :VI_MODEL,'
      '    :VI_NUMBER,'
      '    :VI_COST,'
      '    :VI_DURATION,'
      '    :VI_RENTAL,'
      '    :VI_INFO)')
    StoredProcName = 'VEHICLE_ADD'
    Left = 511
    Top = 84
  end
  object FIBStoredProc_VEHICLE_ROLLBACK: TpFIBStoredProc
    Transaction = FIBTransactionUpdate
    Database = FIBDatabaseSamara
    GoToFirstRecordOnExecute = False
    SQL.Strings = (
      'EXECUTE PROCEDURE VEHICLE_ROLLBACK (?VI_UNIQA)')
    StoredProcName = 'VEHICLE_ROLLBACK'
    Left = 510
    Top = 145
  end
  object FIBQuery: TpFIBQuery
    Transaction = FIBTransactionUpdate
    Database = FIBDatabaseSamara
    Left = 369
    Top = 205
  end
end
