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
    DBName = 'd:\taxi\TAXI.FDB'
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
  object FIBDataSet_Locations: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified]
    SelectSQL.Strings = (
      'SELECT'
      '    CASE'
      '    WHEN thm_prefix is null THEN '#39#39
      '    ELSE thm_prefix'
      '    END'
      '    ||KEY_THEME||'
      '    CASE'
      '    WHEN thm_suffix is null THEN '#39#39
      '    ELSE thm_suffix '
      '    END'
      '        name,'
      ''
      '    KEY_LOCATION,'
      ''
      '    label_r,label_g,label_b,'
      '    font_r,font_g,font_b'
      ''
      ''
      '    '
      'FROM'
      '    V_LOCATIONS, s_theme, colors'
      ''
      'where'
      '    v_locations.key_theme = s_theme.cod_theme'
      
        '    and (s_theme.thm_freq = colors.freq or s_theme.thm_freq is n' +
        'ull and colors.freq = 1)'
      '    and v_locations.key_loc_type = colors.state'
      '    and v_locations.key_loc_type in (1,5,7,9,11)'
      ''
      'order by THM_RESSORT,uniql')
    AutoUpdateOptions.AutoParamsToFields = True
    AutoCalcFields = False
    AllowedUpdateKinds = []
    Transaction = FIBTransaction
    Database = FIBDatabase
    UpdateTransaction = FIBTransactionUpdate
    Left = 368
    Top = 40
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
    Database = FIBDatabase
    AutoRegister = True
    Left = 191
    Top = 55
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
end
