object FormMain: TFormMain
  Left = 213
  Top = 136
  Caption = 'FormMain'
  ClientHeight = 691
  ClientWidth = 1016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlMain: TPageControl
    Left = 0
    Top = 0
    Width = 1016
    Height = 691
    ActivePage = TabSheetTools
    Align = alClient
    TabOrder = 0
    object TabSheetTools: TTabSheet
      Caption = 'Tools'
      ImageIndex = 7
      OnHide = TabSheetToolsHide
      OnShow = TabSheetToolsShow
      object DBGridEhSmnTools: TDBGridEh
        Left = 289
        Top = 0
        Width = 719
        Height = 663
        Align = alRight
        DataSource = DM.DataSourceSmnDetail
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'UNIQS'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088' '#1089#1084#1077#1085#1099
            Width = 46
          end
          item
            EditButtons = <>
            FieldName = 'SMN_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'SMN_DAY_NIGHT'
            Footers = <>
            Title.Caption = #1055#1077#1088#1080#1086#1076' '#1089#1091#1090#1086#1082
            Width = 46
          end
          item
            EditButtons = <>
            FieldName = 'USR_LIST'
            Footers = <>
            Title.Caption = #1057#1087#1080#1089#1086#1082' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1086#1074
            Width = 202
          end
          item
            EditButtons = <>
            FieldName = 'SMN_TIME_START'
            Footers = <>
            Title.Caption = #1053#1072#1095#1072#1083#1086' '#1089#1084#1077#1085#1099
            Width = 97
          end
          item
            EditButtons = <>
            FieldName = 'SMN_TIME_STOP'
            Footers = <>
            Title.Caption = #1047#1072#1082#1088#1099#1090#1080#1077' '#1089#1084#1077#1085#1099
            Width = 102
          end
          item
            EditButtons = <>
            FieldName = 'SMN_STATE'
            Footers = <>
            Title.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
          end
          item
            EditButtons = <>
            FieldName = 'SMN_WEEKEND'
            Footers = <>
            Title.Caption = #1055#1088#1072#1079#1076#1085#1080#1082
          end>
      end
      object GroupBox8: TGroupBox
        Left = 7
        Top = 365
        Width = 249
        Height = 289
        Caption = #1054#1095#1080#1089#1090#1082#1072' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
        TabOrder = 1
        object ButtonCleanOrderTrash: TSpeedButton
          Left = 16
          Top = 48
          Width = 217
          Height = 22
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1072#1082#1072#1079#1099' '#1086#1090' "'#1084#1091#1089#1086#1088#1072'"'
          OnClick = ButtonCleanOrderTrashClick
        end
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 123
          Height = 13
          Caption = #1059#1076#1072#1083#1103#1102#1090#1089#1103' '#1089#1084#1077#1085#1099' '#1076#1086' '#8470
        end
        object ButtonOrdersClear: TSpeedButton
          Left = 16
          Top = 88
          Width = 217
          Height = 22
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1047#1040#1050#1040#1047#1067
          OnClick = ButtonOrdersClearClick
        end
        object ButtonLocationsCear: TSpeedButton
          Left = 16
          Top = 120
          Width = 217
          Height = 22
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1089#1090#1086#1088#1080#1102' '#1076#1074#1080#1078#1077#1085#1080#1103
          OnClick = ButtonLocationsCearClick
        end
        object ButtonReCalc: TSpeedButton
          Left = 16
          Top = 176
          Width = 217
          Height = 22
          Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1089#1084#1077#1085#1099' '#1087#1086' '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1084' '#1090#1072#1088#1080#1092#1072#1084
          OnClick = ButtonReCalcClick
        end
        object EditClean: TEdit
          Left = 152
          Top = 16
          Width = 81
          Height = 21
          TabOrder = 0
        end
      end
      object GroupBox1: TGroupBox
        Left = 18
        Top = 12
        Width = 176
        Height = 223
        Caption = 'GroupBox1'
        TabOrder = 2
        object CalendarReport: TMonthCalendar
          Left = 2
          Top = 15
          Width = 172
          Height = 206
          Align = alClient
          Date = 38648.949253321760000000
          MaxSelectRange = 7
          TabOrder = 0
          WeekNumbers = True
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1056#1072#1081#1086#1085#1099
      ImageIndex = 1
      OnHide = TabSheet1Hide
      OnShow = TabSheet1Show
      object DBGridEh1: TDBGridEh
        Left = 3
        Top = 50
        Width = 589
        Height = 610
        DataSource = DM.DataSourceLocation
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'COD_LOCATION'
            Footers = <>
            Title.Caption = #1050#1086#1076
          end
          item
            EditButtons = <>
            FieldName = 'NAME_LOCATION'
            Footers = <>
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 114
          end
          item
            EditButtons = <>
            FieldName = 'POS_TOP'
            Footers = <>
            Title.Caption = #1051#1077#1074#1099#1081' '#1082#1088#1072#1081
          end
          item
            EditButtons = <>
            FieldName = 'POS_LEFT'
            Footers = <>
            Title.Caption = #1055#1088#1072#1074#1099#1081' '#1082#1088#1072#1081
          end
          item
            EditButtons = <>
            FieldName = 'WIDTH'
            Footers = <>
            Title.Caption = #1064#1080#1088#1080#1085#1072
          end
          item
            EditButtons = <>
            FieldName = 'HEIGHT'
            Footers = <>
            Title.Caption = #1042#1099#1089#1086#1090#1072
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 9
        Top = 9
        Width = 240
        Height = 25
        DataSource = DM.DataSourceLocation
        TabOrder = 1
      end
    end
  end
  object VersionInfo: TVersionInfo
    Enabled = True
    Left = 872
    Top = 281
  end
  object PrintDBGridEhReport: TPrintDBGridEh
    Options = []
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 0.500000000000000000
    Page.RightMargin = 0.500000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 43
    Top = 265
  end
  object PrintDBGridEhWeekRep: TPrintDBGridEh
    Options = []
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 43
    Top = 329
  end
  object TcpClient: TTcpClient
    Left = 232
    Top = 72
  end
end
