object fStatistic: TfStatistic
  Left = 188
  Top = 57
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1079#1072#1082#1072#1079#1086#1074
  ClientHeight = 651
  ClientWidth = 1012
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 57
    Width = 1012
    Height = 0
    Align = alTop
    ExplicitTop = 36
    ExplicitWidth = 948
  end
  object Bevel2: TBevel
    Left = 0
    Top = 649
    Width = 1012
    Height = 2
    Align = alBottom
    ExplicitTop = 650
    ExplicitWidth = 948
  end
  object Bevel4: TBevel
    Left = 0
    Top = 57
    Width = 1012
    Height = 0
    Align = alTop
    ExplicitTop = 36
    ExplicitWidth = 948
  end
  object pClient: TPanel
    Left = 0
    Top = 57
    Width = 1012
    Height = 508
    Align = alClient
    TabOrder = 0
    object Chart: TDBChart
      Left = 1
      Top = 1
      Width = 1010
      Height = 506
      BackWall.Brush.Color = clWhite
      Gradient.EndColor = 14540032
      Gradient.StartColor = 12615680
      MarginBottom = 2
      MarginLeft = 2
      MarginRight = 2
      MarginTop = 2
      Title.Text.Strings = (
        'TDBChart')
      Title.Visible = False
      BottomAxis.DateTimeFormat = 'dd.mm'
      BottomAxis.Increment = 1.000000000000000000
      BottomAxis.LabelsAngle = 90
      BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
      BottomAxis.Title.Font.Color = clBlack
      BottomAxis.Title.Font.Height = -13
      BottomAxis.Title.Font.Name = 'Arial'
      BottomAxis.Title.Font.Style = [fsBold, fsItalic]
      DepthAxis.Automatic = False
      DepthAxis.AutomaticMaximum = False
      DepthAxis.AutomaticMinimum = False
      DepthAxis.Maximum = 0.830000000000000300
      DepthAxis.Minimum = -0.169999999999999800
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
      LeftAxis.Title.Font.Color = clBlack
      LeftAxis.Title.Font.Height = -13
      LeftAxis.Title.Font.Name = 'Arial'
      LeftAxis.Title.Font.Style = [fsBold, fsItalic]
      Legend.Alignment = laLeft
      Legend.Frame.Visible = False
      Legend.LegendStyle = lsLastValues
      RightAxis.Automatic = False
      RightAxis.AutomaticMaximum = False
      RightAxis.AutomaticMinimum = False
      TopAxis.LabelStyle = talText
      View3D = False
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      Align = alClient
      BevelWidth = 0
      TabOrder = 0
      object Series1: TFastLineSeries
        Marks.ArrowLength = 8
        Marks.Style = smsXValue
        Marks.Visible = False
        DataSource = IBQuery
        SeriesColor = clBlue
        ShowInLegend = False
        LinePen.Color = clBlue
        LinePen.Width = 2
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        XValues.ValueSource = 'SMN_DATE'
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'CNT'
      end
      object Series2: TPointSeries
        Cursor = crHandPoint
        Marks.ArrowLength = 0
        Marks.Visible = False
        DataSource = IBQuery
        SeriesColor = clGreen
        ShowInLegend = False
        OnClick = Series2Click
        Pointer.Brush.Color = clBlue
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.Visible = True
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        XValues.ValueSource = 'SMN_DATE'
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'CNT'
      end
      object Series3: TFastLineSeries
        Marks.ArrowLength = 8
        Marks.Visible = False
        DataSource = IBQuery1
        SeriesColor = 33023
        ShowInLegend = False
        LinePen.Color = 33023
        LinePen.Width = 2
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        XValues.ValueSource = 'SMN_DATE'
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'CNT'
      end
      object Series4: TPointSeries
        Cursor = crHandPoint
        Marks.ArrowLength = 0
        Marks.BackColor = clPurple
        Marks.Visible = False
        DataSource = IBQuery1
        SeriesColor = clRed
        ShowInLegend = False
        OnClick = Series4Click
        Pointer.Brush.Color = 33023
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.Visible = True
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        XValues.ValueSource = 'SMN_DATE'
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'CNT'
      end
      object Series5: TFastLineSeries
        Marks.ArrowLength = 8
        Marks.Visible = False
        DataSource = IBQuery2
        SeriesColor = clMaroon
        ShowInLegend = False
        LinePen.Color = clMaroon
        LinePen.Width = 2
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        XValues.ValueSource = 'SMN_DATE'
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'CNT'
      end
      object Series6: TPointSeries
        Cursor = crHandPoint
        Marks.ArrowLength = 0
        Marks.BackColor = 196736
        Marks.Visible = False
        DataSource = IBQuery2
        SeriesColor = clWhite
        ShowInLegend = False
        OnClick = Series6Click
        Pointer.Brush.Color = clMaroon
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.Visible = True
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        XValues.ValueSource = 'SMN_DATE'
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'CNT'
      end
      object Series7: TLineSeries
        Marks.ArrowLength = 8
        Marks.Visible = False
        DataSource = Series1
        SeriesColor = clBlue
        ShowInLegend = False
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.Visible = False
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        object TeeFunction1: TAverageTeeFunction
        end
      end
      object Series8: TLineSeries
        Marks.ArrowLength = 8
        Marks.Visible = False
        DataSource = IBQueryAVG
        SeriesColor = clRed
        ShowInLegend = False
        LinePen.Width = 3
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.Visible = False
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        XValues.ValueSource = 'SMN_DATE'
        YValues.DateTime = False
        YValues.Name = 'Y'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'CNT'
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 565
    Width = 1012
    Height = 84
    Align = alBottom
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 1010
      Height = 82
      Align = alClient
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099':'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object LabelTo: TLabel
        Left = 12
        Top = 55
        Width = 26
        Height = 13
        Caption = #1044#1054'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LabelFrom: TLabel
        Left = 12
        Top = 25
        Width = 24
        Height = 13
        Caption = #1054#1058'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LabelTheme: TLabel
        Left = 297
        Top = 30
        Width = 63
        Height = 13
        Caption = #1055#1086#1079#1099#1074#1085#1099#1077
      end
      object dtpEnd: TDateTimePicker
        Left = 42
        Top = 50
        Width = 151
        Height = 20
        Date = 38928.714592060190000000
        Time = 38928.714592060190000000
        DateFormat = dfLong
        TabOrder = 0
      end
      object dtpStart: TDateTimePicker
        Left = 42
        Top = 24
        Width = 151
        Height = 20
        Date = 38869.713750405090000000
        Time = 38869.713750405090000000
        DateFormat = dfLong
        TabOrder = 1
      end
      object bbChart: TBitBtn
        Left = 474
        Top = 28
        Width = 77
        Height = 26
        Caption = #1043#1088#1072#1092#1080#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbChartClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000230B0000230B00000001000000010000BD7B4200735A
          4A00C6844A00CE8C4A00CE945200DEA56300634AAD00FFDEAD0073ADB500F7E7
          B50073A5BD008CB5BD007363C6009C84E7009C8CEF0073F7F700FF00FF006BDE
          FF0073EFFF007BF7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00101010101010
          1010101010101010101010000000000000000000000000000010100410101010
          10101010101010101010100410020201100A0A0A100606061010100410030301
          1011110A100C0C0610101004100303011011110A100C0C061010100410050500
          1012120A100D0D06101010041005050010121208100D0D0C1010100410070700
          100F0F0B100D0D0C10101004100707001013130B100E0E0C1010100410090902
          10110B0B100E0E0C101010041009090210101010100E0E0C1010100410050505
          10101010100C0C0C101010041010101010101010101010101010100410101010
          1010101010101010101010101010101010101010101010101010}
      end
      object chbD1: TCheckBox
        Left = 612
        Top = 15
        Width = 186
        Height = 17
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1075#1088#1072#1092#1080#1082' 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 33023
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object chbD2: TCheckBox
        Left = 810
        Top = 15
        Width = 186
        Height = 17
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1075#1088#1072#1092#1080#1082' 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object cbD1: TComboBox
        Left = 612
        Top = 45
        Width = 186
        Height = 21
        ItemHeight = 13
        TabOrder = 5
      end
      object cbD2: TComboBox
        Left = 810
        Top = 45
        Width = 186
        Height = 21
        ItemHeight = 13
        TabOrder = 6
      end
      object rbSmenaD: TRadioButton
        Left = 198
        Top = 44
        Width = 47
        Height = 17
        Hint = #1076#1085#1077#1074#1085#1099#1077' '#1089#1084#1077#1085#1099
        Caption = #1076#1077#1085#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object rbSmenaN: TRadioButton
        Left = 198
        Top = 61
        Width = 51
        Height = 17
        Hint = #1085#1086#1095#1085#1099#1077' '#1089#1084#1077#1085#1099
        Caption = #1085#1086#1095#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object rbSmenaDN: TRadioButton
        Left = 198
        Top = 27
        Width = 46
        Height = 17
        Hint = #1086#1073#1077' '#1089#1084#1077#1085#1099
        Caption = #1074#1089#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object EditTheme: TEdit
        Left = 297
        Top = 49
        Width = 138
        Height = 21
        TabOrder = 10
      end
      object RadioButtonAVG: TRadioButton
        Left = 198
        Top = 10
        Width = 103
        Height = 17
        Hint = #1086#1073#1077' '#1089#1084#1077#1085#1099
        Caption = #1058#1086#1083#1100#1082#1086' '#1089#1088#1077#1076#1085#1077#1077
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        TabStop = True
      end
      object RadioButtonSMN: TRadioButton
        Left = 308
        Top = 11
        Width = 103
        Height = 17
        Hint = #1086#1073#1077' '#1089#1084#1077#1085#1099
        Caption = #1058#1086#1083#1100#1082#1086' '#1089#1084#1077#1085#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
    end
  end
  object gbMark: TGroupBox
    Left = 0
    Top = 0
    Width = 1012
    Height = 57
    Align = alTop
    Caption = #1057#1084#1077#1085#1072':'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object lUser: TLabel
      Left = 650
      Top = 15
      Width = 32
      Height = 16
      Caption = 'lUser'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lDN: TLabel
      Left = 303
      Top = 15
      Width = 23
      Height = 16
      Caption = 'lDN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lCount: TLabel
      Left = 393
      Top = 15
      Width = 37
      Height = 16
      Caption = 'lCount'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lDate: TLabel
      Left = 45
      Top = 15
      Width = 32
      Height = 16
      Caption = 'lDate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 809
      Top = 35
      Width = 44
      Height = 16
      Caption = 'lCount'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 874
      Top = 36
      Width = 44
      Height = 16
      Caption = 'lCount'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 33023
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 936
      Top = 35
      Width = 44
      Height = 16
      Caption = 'lCount'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'C:\taxi\TAXI.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    Left = 77
    Top = 30
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 77
    Top = 78
  end
  object IBQuery: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction
    SQL.Strings = (
      'select'
      
        '  count( ORDERS.uniqo)  cnt, SMENA.SMN_DATE,       SMENA.USR_LIS' +
        'T,  SMENA.SMN_DAY_NIGHT'
      'from '
      '  SMENA, ORDERS'
      'where'
      '  (ORDERS.KEY_ORD_TYPE = 1) and'
      '  (SMENA.uniqs>=430) and (SMENA.uniqs<=434)'
      '  and  SMENA.UNIQS=ORDERS.KEY_SMN_START'
      'group by'
      
        '  SMENA.UNIQS, SMENA.SMN_DATE, SMENA.USR_LIST,        SMENA.SMN_' +
        'DAY_NIGHT')
    Filtered = True
    Left = 77
    Top = 208
    object IBQueryCNT: TIntegerField
      FieldName = 'CNT'
      ProviderFlags = []
    end
    object IBQuerySMN_DATE: TDateField
      FieldName = 'SMN_DATE'
      ProviderFlags = []
    end
    object IBQueryUSR_LIST: TIBStringField
      FieldName = 'USR_LIST'
      ProviderFlags = []
      Size = 250
    end
    object IBQuerySMN_DAY_NIGHT: TSmallintField
      FieldName = 'SMN_DAY_NIGHT'
      ProviderFlags = []
    end
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction
    SQL.Strings = (
      'select'
      
        '  count( ORDERS.uniqo)  cnt, SMENA.SMN_DATE,       SMENA.USR_LIS' +
        'T,  SMENA.SMN_DAY_NIGHT'
      'from '
      '  SMENA, ORDERS'
      'where'
      '  (ORDERS.KEY_ORD_TYPE = :ORD) and'
      '  (SMENA.SMN_DATE>=:D1) and (SMENA.SMN_DATE<=:D2)'
      '  and  SMENA.UNIQS=ORDERS.KEY_SMN_START'
      'group by'
      
        '  SMENA.UNIQS, SMENA.SMN_DATE, SMENA.USR_LIST,        SMENA.SMN_' +
        'DAY_NIGHT')
    Left = 77
    Top = 261
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ORD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'D1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'D2'
        ParamType = ptUnknown
      end>
    object IBQuery1CNT: TIntegerField
      FieldName = 'CNT'
      ProviderFlags = []
    end
    object IBQuery1SMN_DATE: TDateField
      FieldName = 'SMN_DATE'
      ProviderFlags = []
    end
    object IBQuery1USR_LIST: TIBStringField
      FieldName = 'USR_LIST'
      ProviderFlags = []
      Size = 250
    end
    object IBQuery1SMN_DAY_NIGHT: TSmallintField
      FieldName = 'SMN_DAY_NIGHT'
      ProviderFlags = []
    end
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction
    SQL.Strings = (
      'select'
      
        '  count( ORDERS.uniqo)  cnt, SMENA.SMN_DATE,       SMENA.USR_LIS' +
        'T,  SMENA.SMN_DAY_NIGHT'
      'from '
      '  SMENA, ORDERS'
      'where'
      '  (ORDERS.KEY_ORD_TYPE = :ORD) and'
      '  (SMENA.SMN_DATE>=:D1) and (SMENA.SMN_DATE<=:D2)'
      '  and  SMENA.UNIQS=ORDERS.KEY_SMN_START'
      'group by'
      
        '  SMENA.UNIQS, SMENA.SMN_DATE, SMENA.USR_LIST,    SMENA.SMN_DAY_' +
        'NIGHT')
    Left = 77
    Top = 317
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ORD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'D1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'D2'
        ParamType = ptUnknown
      end>
    object IBQuery2CNT: TIntegerField
      FieldName = 'CNT'
      ProviderFlags = []
    end
    object IBQuery2SMN_DATE: TDateField
      FieldName = 'SMN_DATE'
      ProviderFlags = []
    end
    object IBQuery2USR_LIST: TIBStringField
      FieldName = 'USR_LIST'
      ProviderFlags = []
      Size = 250
    end
    object IBQuery2SMN_DAY_NIGHT: TSmallintField
      FieldName = 'SMN_DAY_NIGHT'
      ProviderFlags = []
    end
  end
  object IBQuery_D: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction
    SQL.Strings = (
      'Select '
      '  COD_ORD_TYPE, NAME_ORD_TYPE'
      'From '
      '  S_ORD_TYPE'
      'Order By'
      '  COD_ORD_TYPE')
    Left = 77
    Top = 141
    object IBQuery_DCOD_ORD_TYPE: TSmallintField
      FieldName = 'COD_ORD_TYPE'
      Origin = '"S_ORD_TYPE"."COD_ORD_TYPE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQuery_DNAME_ORD_TYPE: TIBStringField
      FieldName = 'NAME_ORD_TYPE'
      Origin = '"S_ORD_TYPE"."NAME_ORD_TYPE"'
      Size = 32
    end
  end
  object IBQueryS: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction
    SQL.Strings = (
      'select'
      
        '  count( ORDERS.uniqo)  cnt, SMENA.SMN_DATE,       SMENA.USR_LIS' +
        'T,  SMENA.SMN_DAY_NIGHT'
      'from '
      '  SMENA, ORDERS'
      'where'
      '  (ORDERS.KEY_ORD_TYPE = 1) and'
      '  (SMENA.uniqs>=430) and (SMENA.uniqs<=434)'
      '  and  SMENA.UNIQS=ORDERS.KEY_SMN_START'
      'group by'
      
        '  SMENA.UNIQS, SMENA.SMN_DATE, SMENA.USR_LIST,        SMENA.SMN_' +
        'DAY_NIGHT')
    Filtered = True
    Left = 189
    Top = 208
    object IntegerField1: TIntegerField
      FieldName = 'CNT'
      ProviderFlags = []
    end
  end
  object IBQueryS1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction
    SQL.Strings = (
      'select'
      
        '  count( ORDERS.uniqo)  cnt, SMENA.SMN_DATE,       SMENA.USR_LIS' +
        'T,  SMENA.SMN_DAY_NIGHT'
      'from '
      '  SMENA, ORDERS'
      'where'
      '  (ORDERS.KEY_ORD_TYPE = :ORD) and'
      '  (SMENA.SMN_DATE>=:D1) and (SMENA.SMN_DATE<=:D2)'
      '  and  SMENA.UNIQS=ORDERS.KEY_SMN_START'
      'group by'
      
        '  SMENA.UNIQS, SMENA.SMN_DATE, SMENA.USR_LIST,        SMENA.SMN_' +
        'DAY_NIGHT')
    Left = 189
    Top = 261
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ORD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'D1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'D2'
        ParamType = ptUnknown
      end>
    object IntegerField2: TIntegerField
      FieldName = 'CNT'
      ProviderFlags = []
    end
  end
  object IBQueryS2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction
    SQL.Strings = (
      'select'
      
        '  count( ORDERS.uniqo)  cnt, SMENA.SMN_DATE,       SMENA.USR_LIS' +
        'T,  SMENA.SMN_DAY_NIGHT'
      'from '
      '  SMENA, ORDERS'
      'where'
      '  (ORDERS.KEY_ORD_TYPE = :ORD) and'
      '  (SMENA.SMN_DATE>=:D1) and (SMENA.SMN_DATE<=:D2)'
      '  and  SMENA.UNIQS=ORDERS.KEY_SMN_START'
      'group by'
      
        '  SMENA.UNIQS, SMENA.SMN_DATE, SMENA.USR_LIST,    SMENA.SMN_DAY_' +
        'NIGHT')
    Left = 189
    Top = 317
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ORD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'D1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'D2'
        ParamType = ptUnknown
      end>
    object IntegerField3: TIntegerField
      FieldName = 'CNT'
      ProviderFlags = []
    end
  end
  object IBQueryAVG: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction
    SQL.Strings = (
      'select'
      '    S1.SMN_DATE,'
      '    s1.SMN_DAY_NIGHT,'
      '    cast((select avg(s2.ord_count)'
      '    from smena s2'
      '    where  s2.uniqs > s1.uniqs - 10'
      '        and s2.uniqs <= s1.uniqs'
      '        )as integer) cnt'
      ''
      'from '
      '    SMENA s1'
      ''
      'where'
      '        S1.SMN_DATE >= '#39'12.12.06'#39
      '    and S1.SMN_DATE <= '#39'29.12.06'#39)
    Filtered = True
    Left = 280
    Top = 206
    object IntegerField5: TIntegerField
      FieldName = 'CNT'
      ProviderFlags = []
    end
    object DateField1: TDateField
      FieldName = 'SMN_DATE'
      ProviderFlags = []
    end
    object SmallintField1: TSmallintField
      FieldName = 'SMN_DAY_NIGHT'
      ProviderFlags = []
    end
  end
end
