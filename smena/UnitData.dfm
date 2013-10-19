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
    DBName = 'C:\samara\SAMARA.FDB'
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
end
