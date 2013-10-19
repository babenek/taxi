object FormOrders: TFormOrders
  Left = 255
  Top = 165
  Caption = 'FormOrders'
  ClientHeight = 662
  ClientWidth = 995
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 65
    Width = 995
    Height = 5
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    Color = clBtnHighlight
    ParentColor = False
    ExplicitLeft = -56
    ExplicitTop = 307
    ExplicitWidth = 1016
  end
  object GroupBoxTop: TGroupBox
    Left = 0
    Top = 0
    Width = 995
    Height = 65
    Align = alTop
    TabOrder = 0
    object BitBtnRefresh: TSpeedButton
      Left = 148
      Top = 25
      Width = 90
      Height = 28
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      BiDiMode = bdLeftToRight
      Caption = #1042#1099#1073#1086#1088#1082#1072
      Flat = True
      Glyph.Data = {
        62060000424D6206000000000000220400002800000018000000180000000100
        08000000000040020000120B0000120B0000FB000000FB00000000000000FFFF
        FF00FF00FF0004500700044F0700044D0700055909000556080005690C000567
        0C0005650C00078210000781100006750E0006730E0005610B00077D1000066D
        0D0006650C0007680D00097D1200086F0F000976100009B21A0009B2190008A8
        180008A6170008A5170008A11700089E1600079415000793150007911400078E
        1400078D1400078B1400056A0D0009B1190009AF190009AC1800089C1600089A
        150008971500078913000AB21A000BB31C000A8514000B8B15000EA31B000C91
        17000EA01A000D97180018B7270019B7280028BC360032B03E002B9735002991
        330037C044002EA039002A92340046C3520047C5530056CA610065CF6F004FA2
        57004D9E550067A96D00A3E2A900A2E0A800B2E7B700B1E6B600BBE4BF00C2EC
        C600C0E9C400BCE5C000A5C9A800A4C7A700A2C5A5009DBFA00099BA9C00B4DA
        B700F1FBF200EFF9F0000BB31E000CB320000DA51F000C871A000E8D1D000F92
        1F0029BC38002FB43E0039C148004AC7590067D0730068D0740084D98D0074BF
        7C00A7CCAB000EB423000FB526000FB5250010B5280011B6290011AD28001092
        2100129C26001298250026B1380037BA4A004CC75D00A4E3AC00B3E7BA00D1F1
        D50012B62B0013B72E0014B72F0014A02A0017A52D001BAA31003FC4540049C3
        5D004EC963004FC66100A7E4B100B4E8BC00D3F1D80015B7310016B8330016B7
        330024BC3F0025BC410022AD3C0099E0A600D3F8DA00E7FCEB0018B9380019B9
        3A001AB93C001AB93B0019B0380053CB6D009EEDAF00A7F1B600BBF4C700C9F7
        D200C5EDCD00F9FEFA001BBA3E001CBB41001CBA3F0080DF950097EBAB00AAE5
        B700BCF2C900B8EAC300B8E9C300C6EECF001FBB450020BC480020BC47002FC1
        550048C8670058CD76005CD17B0067D183008DE7A40090E8A60092E9A800D3F5
        DC0022BD4D0023BD4E0024BE500085E49F008AE6A30093E7AB0098E8AF00C7EE
        D200DAF6E20025BE520026BF550057CF7B0078DF97007ADF99007EE19B007DDF
        9B0092DFA90099E6B0009DE7B40027BF570028C0590029C05A002EBC5D0060D5
        87005DCF810071DC930075DC96008BE1A700AEE7C000B6EDC800CAEFD600D6F4
        E000EBFAF000F3FCF6002BC15F0054D1800056D2810059D383005DD4860061D6
        890061D1890082DEA2002DC263002EC265002FC3660030C3670032C4690035C5
        6C003CC8710040C9740042CA740045CB770047CC780048CC79004FCF7D0062D1
        8B0069D591006CD793006BD5930070D796006FD595007BDB9E007DD99F00A6E5
        BE00BFEED000CCF0D900D1F2DD00F5FDF800FEFEFE00FDFDFD00F9F9F900F6F6
        F600F4F4F400F3F3F300EFEFEF00ECECEC00EBEBEB00E6E6E600E0E0E000D9D9
        D900D7D7D7000202020202020202030409090A0A050402020202020202020202
        02020202030D291B282A1F201E2B24050202020202020202020203081B273761
        624C4E4F433C2B2B0F0402020202020202030C183D4BF3F2F1F1F2F4F7F95039
        220E040202020202030C1840EEEE53443F3E3E3F45F0F5FA42230E0402020202
        081840010146341818181818183447F1F841210F020202071A3E0101602C1718
        1818183434181844F0F83822050202102D49017D6465635D7135181818181818
        46F24D20110213566E01528280817F7A01525C2C1818181836EEF63B20041573
        850199969596948D0101015F2D1818181844F0611D0457899D01A5AAABABAAA3
        010101016F2D18181840EF511C09589EB101C2BFBFBFBEC20101010101712C18
        183EEE48190969ACC801E1D7D8D8D6D201010101017E6317183E014A26086BBF
        C801E7DDDFDEDCE4010101019B83675418400149250831D4E901EAD0D1C1CFE7
        010101BAA08A746317440160180333C0E201EDB9B7B6C3C501CBE8BEAA958066
        5A01013A1C030284CEB201B2A8A7ADBBCAE3D9CCB39E8872700149180D020232
        B5BB0101868F98AFC4CDDAD4B49F8B7C01013A1A030202026CB89A0101878FAE
        C3CFDBD5BDA19C01014018080202020230799891010193A9BCD3E5E6C6010101
        5E180B030202020202307B8E908701010101010101019278552B060202020202
        0202305B97A6B0C7C9ECEBC8BAA28868141202020202020202020202306DA4C1
        E0DAD5BEAA8C5916020202020202020202020202020230307776756A2F2E0202
        020202020202}
      Layout = blGlyphRight
      ParentShowHint = False
      ParentBiDiMode = False
      ShowHint = True
      OnClick = BitBtnRefreshClick
    end
    object Label10: TLabel
      Left = 82
      Top = 16
      Width = 33
      Height = 13
      Hint = #1059#1082#1072#1079#1072#1090#1100' '#1074' '#1082#1080#1083#1086#1084#1077#1090#1088#1072#1093'!'
      Caption = #1052#1077#1089#1103#1094
      ParentShowHint = False
      ShowHint = True
    end
    object LabelCost: TLabel
      Left = 16
      Top = 16
      Width = 22
      Height = 13
      Caption = #1043#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EditMONTH: TEdit
      Left = 82
      Top = 35
      Width = 44
      Height = 18
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      TabOrder = 0
      Text = '12'
    end
    object EditYEAR: TEdit
      Left = 16
      Top = 35
      Width = 41
      Height = 18
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      TabOrder = 1
      Text = '2010'
    end
    object Memo1: TMemo
      Left = 626
      Top = 3
      Width = 369
      Height = 59
      Lines.Strings = (
        '1. '#1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1075#1086#1076' '#1080' '#1084#1077#1089#1103#1094
        '2. '#1053#1072#1078#1072#1090#1100' "'#1074#1099#1073#1086#1088#1082#1072'", '#1074#1099#1073#1088#1072#1090#1100' beznal.sql'
        '3. '#1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077':  Ctrl + A'
        '4. '#1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1091#1092#1077#1088':  Ctrl + C'
        '5. '#1042#1089#1090#1072#1074#1080#1090#1100' '#1074' '#1101#1082#1089#1077#1083#1100)
      TabOrder = 2
    end
  end
  object DBGridEhOrders: TDBGridEh
    Left = 0
    Top = 70
    Width = 995
    Height = 592
    Align = alClient
    ColumnDefValues.AlwaysShowEditButton = True
    ColumnDefValues.AutoDropDown = True
    DataSource = DM.DataSourceOrders
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDialogFind]
    ReadOnly = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'KEY_THEME'
        Footer.FieldName = 'KEY_THEME'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1055#1086#1079'.'
        Title.Hint = #1055#1086#1079#1099#1074#1085#1086#1081
        Title.ToolTips = True
        Width = 28
      end
      item
        DisplayFormat = 'yyyy.mm.dd hh:mm'
        EditButtons = <>
        FieldName = 'TIME_START'
        Footers = <>
        Title.Caption = #1053#1072#1095#1072#1083#1086
        Title.Hint = #1042#1088#1077#1084#1103' '#1086#1090#1076#1072#1095#1080' '#1079#1072#1082#1072#1079#1072' '#1087#1086#1079#1099#1074#1085#1086#1084#1091
        Title.ToolTips = True
        Width = 91
      end
      item
        DisplayFormat = 'yyyy.mm.dd hh:mm'
        EditButtons = <>
        FieldName = 'TIME_STOP'
        Footers = <>
        Title.Caption = #1050#1086#1085#1077#1094
        Title.Hint = #1042#1088#1077#1084#1103' '#1079#1072#1074#1077#1088#1096#1077#1085#1080#1103' '#1079#1072#1082#1072#1079#1072
        Title.ToolTips = True
        Width = 91
      end
      item
        EditButtons = <>
        FieldName = 'ORD_DEPARTURE'
        Footers = <>
        Title.Caption = #1054#1090#1082#1091#1076#1072
        Title.Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1084#1077#1089#1090#1077' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
        Title.ToolTips = True
        Width = 168
      end
      item
        EditButtons = <>
        FieldName = 'ORD_DESTINATION'
        Footers = <>
        Title.Caption = #1050#1091#1076#1072
        Title.Hint = #1055#1091#1085#1082#1090' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
        Title.ToolTips = True
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'ORD_COST'
        Footer.FieldName = 'ORD_COST'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
        Title.Hint = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1086#1077#1079#1076#1082#1080
        Title.ToolTips = True
      end
      item
        EditButtons = <>
        FieldName = 'KEY_SMN_START'
        Footers = <>
        Title.Caption = #1057#1084#1077#1085#1072
        Title.Hint = #1050#1086#1076' '#1089#1084#1077#1085#1099', '#1089#1086#1079#1076#1072#1074#1096#1077#1081' '#1079#1072#1082#1072#1079
        Title.ToolTips = True
        Width = 39
      end
      item
        EditButtons = <>
        FieldName = 'UNIQO'
        Footers = <>
        Title.Hint = #1050#1086#1076' '#1079#1072#1082#1072#1079#1072
        Title.ToolTips = True
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'NAME_ORD_TYPE'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1079#1072#1082#1072#1079#1072
        Title.Hint = #1058#1080#1087' '#1079#1072#1082#1072#1079#1072
        Title.ToolTips = True
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'CLT_INFO'
        Footers = <>
        Title.Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
        Title.Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1082#1083#1080#1077#1085#1090#1077
        Title.ToolTips = True
        Width = 106
      end
      item
        EditButtons = <>
        FieldName = 'CLT_TYPE'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.Hint = #1058#1080#1087' '#1082#1083#1080#1077#1085#1090#1072
        Title.ToolTips = True
        Width = 25
      end
      item
        EditButtons = <>
        FieldName = 'CLT_NAME'
        Footers = <>
        Title.Caption = #1048#1084#1103
        Title.Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1083#1080#1077#1085#1090#1072
        Title.ToolTips = True
        Width = 108
      end
      item
        EditButtons = <>
        FieldName = 'UNIQC'
        Footers = <>
        Title.Caption = #1050#1086#1076' '#1082#1083#1080#1077#1085#1090#1072
        Title.Hint = #1050#1086#1076' '#1082#1083#1080#1077#1085#1090#1072
        Title.ToolTips = True
        Width = 33
      end>
  end
  object VersionInfoOrders: TVersionInfo
    Enabled = True
    Left = 416
    Top = 16
  end
  object TcpClient1: TTcpClient
    Left = 343
    Top = 11
  end
  object OpenDialogSQL: TOpenDialog
    Filter = 'SQL|*.sql'
    Left = 272
    Top = 16
  end
end
