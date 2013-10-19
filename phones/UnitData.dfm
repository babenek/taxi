object DM: TDM
  OldCreateOrder = False
  Height = 528
  Width = 739
  object FIBDatabasePhones: TpFIBDatabase
    DBName = 'C:\SAMARA\MART.FDB'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = pFIBTransaction
    DefaultUpdateTransaction = pFIBTransactionUpdate
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 145
    Top = 34
  end
  object pFIBTransaction: TpFIBTransaction
    DefaultDatabase = FIBDatabasePhones
    TimeoutAction = TARollback
    Left = 89
    Top = 95
  end
  object pFIBTransactionUpdate: TpFIBTransaction
    DefaultDatabase = FIBDatabasePhones
    TimeoutAction = TARollback
    Left = 209
    Top = 93
  end
  object DataSetMain: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PHONES'
      'SET '
      '    UNIQP = :UNIQP,'
      '    PHONE = :PHONE,'
      '    NAME = :NAME,'
      '    STREET = :STREET,'
      '    STREET_TYPE = :STREET_TYPE,'
      '    HOUSE = :HOUSE,'
      '    FLAT = :FLAT,'
      '    TOS = :TOS'
      'WHERE'
      '    UNIQP = :OLD_UNIQP'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PHONES'
      'WHERE'
      '        UNIQP = :OLD_UNIQP'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PHONES('
      '    UNIQP,'
      '    PHONE,'
      '    NAME,'
      '    STREET,'
      '    STREET_TYPE,'
      '    HOUSE,'
      '    FLAT,'
      '    TOS'
      ')'
      'VALUES('
      '    gen_id(gen_uniqp,1),'
      '    :PHONE,'
      '    :NAME,'
      '    :STREET,'
      '    :STREET_TYPE,'
      '    :HOUSE,'
      '    :FLAT,'
      '    :TOS'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    UNIQP                         ,'
      '    PHONE                         ,'
      '    NAME                          ,'
      '    STREET                        ,'
      '    STREET_TYPE                   ,'
      '    HOUSE                         ,'
      '    FLAT                          ,'
      '    TOS                           '
      'FROM'
      '    PHONES                        '
      ''
      ' WHERE '
      '        PHONES.UNIQP = :OLD_UNIQP'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQP                         ,'
      '    PHONE                         ,'
      '    NAME                          ,'
      '    STREET                        ,'
      '    STREET_TYPE                   ,'
      '    HOUSE                         ,'
      '    FLAT                          ,'
      '    TOS                           '
      'FROM'
      '    PHONES                        '
      'where uniqp>0')
    Transaction = pFIBTransaction
    Database = FIBDatabasePhones
    UpdateTransaction = pFIBTransactionUpdate
    AutoCommit = True
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 150
    Top = 212
    oTrimCharFields = False
    oAutoFormatFields = False
    oFetchAll = True
    object DataSetMainPHONE: TFIBStringField
      FieldName = 'PHONE'
      Size = 16
      EmptyStrToNull = True
    end
    object DataSetMainNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 32
      EmptyStrToNull = True
    end
    object DataSetMainHOUSE: TFIBStringField
      FieldName = 'HOUSE'
      Size = 8
      EmptyStrToNull = True
    end
    object DataSetMainFLAT: TFIBStringField
      FieldName = 'FLAT'
      Size = 8
      EmptyStrToNull = True
    end
    object DataSetMainTOS: TFIBSmallIntField
      FieldName = 'TOS'
    end
    object DataSetMainUNIQP: TFIBIntegerField
      FieldName = 'UNIQP'
    end
    object DataSetMainSTREET: TFIBIntegerField
      FieldName = 'STREET'
    end
    object DataSetMainSTREET_TYPE: TFIBIntegerField
      FieldName = 'STREET_TYPE'
    end
    object DataSetMainlu_street: TStringField
      FieldKind = fkLookup
      FieldName = 'lu_street'
      LookupDataSet = pFIBDataSet1
      LookupKeyFields = 'COD_STREET'
      LookupResultField = 'NAME_STREET'
      KeyFields = 'STREET'
      Lookup = True
    end
    object DataSetMainlu_street_type: TStringField
      FieldKind = fkLookup
      FieldName = 'lu_street_type'
      LookupDataSet = pFIBDataSet2
      LookupKeyFields = 'COD_STR_TYPE'
      LookupResultField = 'NAME_STR_TYPE'
      KeyFields = 'STREET_TYPE'
      Lookup = True
    end
  end
  object DataSourceMain: TDataSource
    DataSet = DataSetMain
    Left = 151
    Top = 259
  end
  object pFIBDataSet2: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PHONES'
      'SET '
      '    UNIQP = :UNIQP,'
      '    PHONE = :PHONE,'
      '    NAME = :NAME,'
      '    STREET = :STREET,'
      '    STREET_TYPE = :STREET_TYPE,'
      '    HOUSE = :HOUSE,'
      '    FLAT = :FLAT,'
      '    TOS = :TOS'
      'WHERE'
      '    UNIQP = :OLD_UNIQP'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PHONES'
      'WHERE'
      '        UNIQP = :OLD_UNIQP'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PHONES('
      '    UNIQP,'
      '    PHONE,'
      '    NAME,'
      '    STREET,'
      '    STREET_TYPE,'
      '    HOUSE,'
      '    FLAT,'
      '    TOS'
      ')'
      'VALUES('
      '    gen_id(gen_uniqp,1),'
      '    :PHONE,'
      '    :NAME,'
      '    :STREET,'
      '    :STREET_TYPE,'
      '    :HOUSE,'
      '    :FLAT,'
      '    :TOS'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    UNIQP                         ,'
      '    PHONE                         ,'
      '    NAME                          ,'
      '    STREET                        ,'
      '    STREET_TYPE                   ,'
      '    HOUSE                         ,'
      '    FLAT                          ,'
      '    TOS                           '
      'FROM'
      '    PHONES                        '
      ''
      ' WHERE '
      '        PHONES.UNIQP = :OLD_UNIQP'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    "COD_STR_TYPE                  ",'
      '    "NAME_STR_TYPE                 ",'
      '    "NAME_STREET_TYPE              "'
      'FROM'
      '    "S_STR_TYPE                    " ')
    Transaction = pFIBTransaction
    Database = FIBDatabasePhones
    UpdateTransaction = pFIBTransactionUpdate
    AutoCommit = True
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 155
    Top = 398
    oTrimCharFields = False
    oAutoFormatFields = False
    oFetchAll = True
  end
  object pFIBDataSet1: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PHONES'
      'SET '
      '    UNIQP = :UNIQP,'
      '    PHONE = :PHONE,'
      '    NAME = :NAME,'
      '    STREET = :STREET,'
      '    STREET_TYPE = :STREET_TYPE,'
      '    HOUSE = :HOUSE,'
      '    FLAT = :FLAT,'
      '    TOS = :TOS'
      'WHERE'
      '    UNIQP = :OLD_UNIQP'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PHONES'
      'WHERE'
      '        UNIQP = :OLD_UNIQP'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PHONES('
      '    UNIQP,'
      '    PHONE,'
      '    NAME,'
      '    STREET,'
      '    STREET_TYPE,'
      '    HOUSE,'
      '    FLAT,'
      '    TOS'
      ')'
      'VALUES('
      '    gen_id(gen_uniqp,1),'
      '    :PHONE,'
      '    :NAME,'
      '    :STREET,'
      '    :STREET_TYPE,'
      '    :HOUSE,'
      '    :FLAT,'
      '    :TOS'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    UNIQP                         ,'
      '    PHONE                         ,'
      '    NAME                          ,'
      '    STREET                        ,'
      '    STREET_TYPE                   ,'
      '    HOUSE                         ,'
      '    FLAT                          ,'
      '    TOS                           '
      'FROM'
      '    PHONES                        '
      ''
      ' WHERE '
      '        PHONES.UNIQP = :OLD_UNIQP'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    "COD_STREET                    ",'
      '    "NAME_STREET                   "'
      'FROM'
      '    "S_STREET                      " ')
    Transaction = pFIBTransaction
    Database = FIBDatabasePhones
    UpdateTransaction = pFIBTransactionUpdate
    AutoCommit = True
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 154
    Top = 351
    oTrimCharFields = False
    oAutoFormatFields = False
    oFetchAll = True
  end
end
