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
    Left = 48
    Top = 176
    oFetchAll = True
  end
  object DataSourceOrders: TDataSource
    DataSet = FIBDataSetOrders
    Left = 48
    Top = 261
  end
  object FIBDataSetOrders: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusModified]
    SelectSQL.Strings = (
      'select'
      '    o.key_theme,o.time_start,o.time_stop,'
      '    o.ord_departure,o.ord_destination,o.ord_cost,'
      '    o.key_smn_start,'
      '    o.uniqo,'
      '    s.name_ord_type,'
      '    c.clt_info,'
      '    c.clt_type,'
      '    c.clt_name,'
      '    c.uniqc'
      ''
      'from  s_ord_type s, orders o left join clients c'
      ''
      'on o.key_client = c.uniqc'
      ''
      'where o.ord_state in (1,3)'
      'and extract(YEAR from time_start) = 2010'
      'and extract(MONTH from time_start) = 05'
      'and o.key_ord_type = s.cod_ord_type'
      'and s.ord_type =3'
      'order by c.clt_info, uniqo')
    AutoCalcFields = False
    Transaction = FIBTransaction
    Database = FIBDatabase
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'd mmm  hh:mm:ss'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 47
    Top = 289
    oFetchAll = True
  end
end
