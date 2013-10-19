object DM: TDM
  OldCreateOrder = False
  Height = 701
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
    DBName = 'C:\taxi\TAXI.FDB'
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
  object FIBDataSetClients: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CLIENTS'
      'SET     '
      '    CLT_NAME = :CLT_NAME,'
      '    CLT_TYPE = :CLT_TYPE,'
      '    CLT_COUNTER = :CLT_COUNTER,'
      '    CLT_ADRESS = :CLT_ADRESS,'
      '    CLT_PHONE = :CLT_PHONE,'
      '    CLT_INFO = :CLT_INFO,'
      '    CLT_DISCOUNT = :CLT_DISCOUNT'
      'WHERE'
      '    UNIQC = :OLD_UNIQC'
      ''
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CLIENTS'
      'WHERE'
      '        UNIQC = :OLD_UNIQC'
      ''
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
      '    gen_id(gen_uniqc,1),'
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
      'where  uniqc <> 0'
      '      and   CLIENTS.UNIQC = :OLD_UNIQC'
      '   '
      'order by clt_name'
      '    '
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
      'order by clt_name')
    Transaction = FIBTransaction
    Database = FIBDatabase
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy HH:mm'
    DefaultFormats.DisplayFormatTime = 'HH:mm'
    Left = 63
    Top = 281
    oFetchAll = True
  end
  object DataSourceClients: TDataSource
    DataSet = FIBDataSetClients
    Left = 63
    Top = 313
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
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.NumericDisplayFormat = '0.'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 195
    Top = 233
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
      Size = 25
      EmptyStrToNull = True
    end
  end
  object DataSourceWeekReport: TDataSource
    DataSet = FIBDataSetWeekReport
    Left = 195
    Top = 281
  end
  object FIBDataSetLocation: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE S_LOCATION'
      'SET '
      '    NAME_LOCATION = :NAME_LOCATION,'
      '    POS_TOP = :POS_TOP,'
      '    POS_LEFT = :POS_LEFT,'
      '    HEIGHT = :HEIGHT,'
      '    WIDTH = :WIDTH'
      'WHERE'
      '    COD_LOCATION = :OLD_COD_LOCATION'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    S_LOCATION'
      'WHERE'
      '        COD_LOCATION = :OLD_COD_LOCATION'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO S_LOCATION('
      '    COD_LOCATION,'
      '    NAME_LOCATION,'
      '    POS_TOP,'
      '    POS_LEFT,'
      '    HEIGHT,'
      '    WIDTH'
      ')'
      'VALUES('
      '    :COD_LOCATION,'
      '    :NAME_LOCATION,'
      '    :POS_TOP,'
      '    :POS_LEFT,'
      '    :HEIGHT,'
      '    :WIDTH'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    COD_LOCATION                  ,'
      '    NAME_LOCATION                 ,'
      '    POS_TOP                       ,'
      '    POS_LEFT                      ,'
      '    HEIGHT                        ,'
      '    WIDTH                         '
      'FROM'
      '    S_LOCATION                     '
      ''
      ' WHERE '
      '        S_LOCATION.COD_LOCATION = :OLD_COD_LOCATION'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    COD_LOCATION                  ,'
      '    NAME_LOCATION                 ,'
      '    POS_TOP                       ,'
      '    POS_LEFT                      ,'
      '    HEIGHT                        ,'
      '    WIDTH                         '
      'FROM'
      '    S_LOCATION                     ')
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 213
    Top = 414
    oFetchAll = True
  end
  object DataSourceLocation: TDataSource
    DataSet = FIBDataSetLocation
    Left = 213
    Top = 462
  end
  object DataSourceSmnReport: TDataSource
    DataSet = FIBDataSetSmnReport
    Left = 800
    Top = 640
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
    Left = 800
    Top = 592
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
    end
    object FIBDataSetSmnReportSMN_WEEKEND: TFIBSmallIntField
      FieldName = 'SMN_WEEKEND'
    end
    object FIBDataSetSmnReportSMN_DATE: TFIBDateField
      FieldName = 'SMN_DATE'
    end
    object FIBDataSetSmnReportSMN_DAY_NIGHT: TFIBSmallIntField
      FieldName = 'SMN_DAY_NIGHT'
    end
    object FIBDataSetSmnReportUSR_LIST: TFIBStringField
      FieldName = 'USR_LIST'
      Size = 250
      EmptyStrToNull = True
    end
  end
  object DataSourceSmnDetail: TDataSource
    DataSet = FIBDataSetSmnDetail
    Left = 800
    Top = 552
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
    Left = 800
    Top = 504
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
    end
    object FIBDataSetSmnDetailSMN_WEEKEND: TFIBSmallIntField
      FieldName = 'SMN_WEEKEND'
    end
    object FIBDataSetSmnDetailSMN_DATE: TFIBDateField
      FieldName = 'SMN_DATE'
    end
    object FIBDataSetSmnDetailSMN_DAY_NIGHT: TFIBSmallIntField
      FieldName = 'SMN_DAY_NIGHT'
    end
    object FIBDataSetSmnDetailUSR_LIST: TFIBStringField
      FieldName = 'USR_LIST'
      Size = 250
      EmptyStrToNull = True
    end
  end
  object DataSourceSmnWeek: TDataSource
    DataSet = FIBDataSetSmnWeek
    Left = 800
    Top = 464
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
    Left = 800
    Top = 416
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
    end
    object FIBDataSetSmnWeekSMN_WEEKEND: TFIBSmallIntField
      FieldName = 'SMN_WEEKEND'
    end
    object FIBDataSetSmnWeekSMN_DATE: TFIBDateField
      FieldName = 'SMN_DATE'
      DisplayFormat = 'dd.mm.yy'
    end
    object FIBDataSetSmnWeekSMN_DAY_NIGHT: TFIBSmallIntField
      FieldName = 'SMN_DAY_NIGHT'
    end
    object FIBDataSetSmnWeekUSR_LIST: TFIBStringField
      FieldName = 'USR_LIST'
      Size = 250
      EmptyStrToNull = True
    end
  end
  object DataSourceSmnTools: TDataSource
    DataSet = FIBDataSetSmnTools
    Left = 800
    Top = 368
  end
  object FIBDataSetSmnTools: TpFIBDataSet
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
    Left = 800
    Top = 320
    oFetchAll = True
    object FIBIntegerField2: TFIBIntegerField
      FieldName = 'UNIQS'
    end
    object FIBDateTimeField3: TFIBDateTimeField
      FieldName = 'SMN_TIME_START'
      DisplayFormat = 'dd.mm.yy hh:mm'
    end
    object FIBDateTimeField4: TFIBDateTimeField
      FieldName = 'SMN_TIME_STOP'
      DisplayFormat = 'dd.mm.yy hh:mm'
    end
    object FIBSmallIntField4: TFIBSmallIntField
      FieldName = 'SMN_STATE'
    end
    object FIBSmallIntField5: TFIBSmallIntField
      FieldName = 'SMN_WEEKEND'
    end
    object FIBDateField2: TFIBDateField
      FieldName = 'SMN_DATE'
      DisplayFormat = 'dd.mm.yy'
    end
    object FIBSmallIntField6: TFIBSmallIntField
      FieldName = 'SMN_DAY_NIGHT'
    end
    object FIBStringField2: TFIBStringField
      FieldName = 'USR_LIST'
      Size = 250
      EmptyStrToNull = True
    end
  end
  object DataSourceWeeks: TDataSource
    DataSet = FIBDataSetWeeks
    Left = 612
    Top = 408
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
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy HH:mm'
    DefaultFormats.DisplayFormatTime = 'HH:mm'
    Left = 612
    Top = 360
    oFetchAll = True
  end
  object FIBQueryWeeksDelete: TpFIBQuery
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    Left = 270
    Top = 55
  end
  object FIBQueryTools: TpFIBQuery
    Transaction = FIBTransactionUpdate
    Database = FIBDatabase
    SQL.Strings = (
      'delete from orders;'
      'delete from locations;')
    Left = 270
    Top = 103
  end
end
