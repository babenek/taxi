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
    DBName = 'd:\taxi\taxi.fdb'
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
    Left = 328
    Top = 88
    oFetchAll = True
  end
end
