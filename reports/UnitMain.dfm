object FormMain: TFormMain
  Left = 213
  Top = 136
  Caption = 'FormMain'
  ClientHeight = 725
  ClientWidth = 1016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlMain: TPageControl
    Left = 0
    Top = 0
    Width = 1016
    Height = 725
    ActivePage = TabSheetThemes
    Align = alClient
    TabOrder = 0
    object TabSheetThemes: TTabSheet
      Caption = #1055#1086#1079#1099#1074#1085#1099#1077
      OnHide = TabSheetThemesHide
      OnShow = TabSheetThemesShow
      object DBGridEhSTheme: TDBGridEh
        Left = 0
        Top = 49
        Width = 1008
        Height = 426
        Align = alClient
        AllowedSelections = [gstNon, gstRecordBookmarks, gstRectangle, gstColumns, gstAll]
        DataSource = DM.DataSourceSTheme
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'THM_MARKER'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'M'
            Width = 20
          end
          item
            Alignment = taRightJustify
            EditButtons = <>
            FieldName = 'THM_PREFIX'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = '->'
            Width = 20
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'COD_THEME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1087#1086#1079'.'
            Width = 32
          end
          item
            EditButtons = <>
            FieldName = 'THM_SUFFIX'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = '<-'
            Width = 20
          end
          item
            EditButtons = <>
            FieldName = 'THM_FREQ'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'FQ'
            Width = 20
          end
          item
            EditButtons = <>
            FieldName = 'THM_MODEL'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1052#1086#1076#1077#1083#1100
            Width = 139
          end
          item
            EditButtons = <>
            FieldName = 'THM_COLOR'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1062#1074#1077#1090
            Width = 83
          end
          item
            EditButtons = <>
            FieldName = 'THM_NUMBER'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1043#1086#1089'.'#1053#1086#1084#1077#1088
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'THM_INFO'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
            Width = 164
          end
          item
            EditButtons = <>
            FieldName = 'REP_DOLG'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1044#1054#1051#1043
            Width = 47
          end
          item
            EditButtons = <>
            FieldName = 'THM_BRIGADE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1041#1088'.'
            Title.Hint = #1041#1088#1080#1075#1072#1076#1072
            Title.TitleButton = True
            Title.ToolTips = True
            Width = 22
          end
          item
            EditButtons = <>
            FieldName = 'NAME_LOC_TYPE'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #1044#1080#1089#1083#1086#1082#1072#1094#1080#1103
            Width = 94
          end
          item
            EditButtons = <>
            FieldName = 'UNIQL'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Width = 46
          end>
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 1008
        Height = 49
        Align = alTop
        Caption = #1054#1088#1075#1072#1085#1099' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103
        TabOrder = 1
        object DBNavigator1: TDBNavigator
          Left = 16
          Top = 18
          Width = 240
          Height = 25
          DataSource = DM.DataSourceSTheme
          Hints.Strings = (
            #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1047#1072#1087#1080#1089#1100
            #1042#1089#1090#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102
            #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
            #1056#1077#1078#1080#1084' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
            #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103
            #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103
            #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077)
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object BitBtnToLocType0: TBitBtn
          Left = 365
          Top = 18
          Width = 80
          Height = 25
          Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1074' '#1075#1072#1088#1072#1078
          Caption = #1043#1040#1056#1040#1046
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BitBtnReLocTypeClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object BitBtnDisableTheme: TBitBtn
          Left = 907
          Top = 18
          Width = 100
          Height = 25
          Hint = #1059#1073#1088#1072#1090#1100' '#1089' '#1082#1072#1088#1090#1099
          Caption = #1042#1099#1082#1083#1102#1095#1080#1090#1100
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = BitBtnDisableThemeClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333000033338833333333333333333F333333333333
            0000333911833333983333333388F333333F3333000033391118333911833333
            38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
            911118111118333338F3338F833338F3000033333911111111833333338F3338
            3333F8330000333333911111183333333338F333333F83330000333333311111
            8333333333338F3333383333000033333339111183333333333338F333833333
            00003333339111118333333333333833338F3333000033333911181118333333
            33338333338F333300003333911183911183333333383338F338F33300003333
            9118333911183333338F33838F338F33000033333913333391113333338FF833
            38F338F300003333333333333919333333388333338FFF830000333333333333
            3333333333333333333888330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object BitBtn1: TBitBtn
          Tag = 4
          Left = 451
          Top = 18
          Width = 80
          Height = 25
          Hint = #1047#1072#1075#1085#1072#1090#1100' '#1074' '#1076#1086#1083#1075
          Caption = #1044#1054#1051#1043
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = BitBtnReLocTypeClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object BitBtn2: TBitBtn
          Tag = 6
          Left = 537
          Top = 18
          Width = 80
          Height = 25
          Hint = #1053#1072' '#1096#1090#1088#1072#1092#1087#1083#1086#1097#1072#1076#1082#1091
          Caption = #1064#1058#1056#1040#1060
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = BitBtnReLocTypeClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object BitBtn3: TBitBtn
          Tag = 2
          Left = 623
          Top = 18
          Width = 80
          Height = 25
          Hint = #1053#1072' '#1088#1077#1084#1086#1085#1090
          Caption = #1056#1045#1052#1054#1053#1058
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = BitBtnReLocTypeClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object BitBtn4: TBitBtn
          Tag = 8
          Left = 279
          Top = 18
          Width = 80
          Height = 25
          Hint = #1053#1072' '#1088#1077#1084#1086#1085#1090
          Caption = #1040#1056#1045#1053#1044#1040
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = BitBtnReLocTypeClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object BitBtnArchive: TBitBtn
          Left = 801
          Top = 18
          Width = 100
          Height = 25
          Hint = #1042' '#1040#1088#1093#1080#1074
          Caption = #1042' '#1040#1088#1093#1080#1074
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = BitBtnArchiveClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333000033338833333333333333333F333333333333
            0000333911833333983333333388F333333F3333000033391118333911833333
            38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
            911118111118333338F3338F833338F3000033333911111111833333338F3338
            3333F8330000333333911111183333333338F333333F83330000333333311111
            8333333333338F3333383333000033333339111183333333333338F333833333
            00003333339111118333333333333833338F3333000033333911181118333333
            33338333338F333300003333911183911183333333383338F338F33300003333
            9118333911183333338F33838F338F33000033333913333391113333338FF833
            38F338F300003333333333333919333333388333338FFF830000333333333333
            3333333333333333333888330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
      end
      object GroupBox11: TGroupBox
        Left = 0
        Top = 475
        Width = 1008
        Height = 222
        Align = alBottom
        Caption = #1040#1088#1093#1080#1074
        TabOrder = 2
        object DBGridEhThemes: TDBGridEh
          Left = 2
          Top = 15
          Width = 1004
          Height = 205
          Align = alClient
          DataSource = DM.DataSourceThemes
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnKeyDown = DBGridEhKeyDown
          Columns = <
            item
              EditButtons = <>
              FieldName = 'KEY_THEME'
              Footers = <>
              Title.Caption = #1055#1086#1079'.'
            end
            item
              EditButtons = <>
              FieldName = 'REP_DOLG'
              Footers = <>
              Title.Caption = #1044#1086#1083#1075
              Width = 48
            end
            item
              EditButtons = <>
              FieldName = 'THM_MODEL'
              Footers = <>
              Title.Caption = 'MODEL'
              Width = 87
            end
            item
              EditButtons = <>
              FieldName = 'THM_COLOR'
              Footers = <>
              Title.Caption = 'COLOR'
              Width = 92
            end
            item
              EditButtons = <>
              FieldName = 'THM_NUMBER'
              Footers = <>
              Title.Caption = 'NUMBER'
              Width = 84
            end
            item
              EditButtons = <>
              FieldName = 'THM_INFO'
              Footers = <>
              Title.Caption = 'INFO'
              Width = 219
            end
            item
              EditButtons = <>
              FieldName = 'TIME_START'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'UNIQT'
              Footers = <>
              Width = 50
            end>
        end
      end
    end
    object TabSheetUser: TTabSheet
      Caption = #1044#1080#1089#1087#1077#1090#1095#1077#1088#1099
      ImageIndex = 6
      OnHide = TabSheetUserHide
      OnShow = TabSheetUserShow
      object Splitter1: TSplitter
        Left = 301
        Top = 0
        Height = 697
        Align = alRight
        ExplicitLeft = 504
        ExplicitTop = 296
        ExplicitHeight = 100
      end
      object GroupBox7: TGroupBox
        Left = 0
        Top = 0
        Width = 301
        Height = 697
        Align = alClient
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 0
        object DBGridEhUser: TDBGridEh
          Left = 2
          Top = 56
          Width = 297
          Height = 639
          Align = alClient
          AllowedSelections = [gstRecordBookmarks]
          DataSource = DM.DataSourceUser
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnDblClick = DBGridEhUserDblClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'COD_USER'
              Footers = <>
              Title.Caption = #1050#1086#1076
              Width = 32
            end
            item
              EditButtons = <>
              FieldName = 'NAME_USER'
              Footers = <>
              Title.Caption = #1044#1080#1089#1087#1077#1090#1095#1077#1088
              Width = 200
            end>
        end
        object Panel3: TPanel
          Left = 2
          Top = 15
          Width = 297
          Height = 41
          Align = alTop
          TabOrder = 1
          object DBNavigatorUser: TDBNavigator
            Left = 8
            Top = 8
            Width = 240
            Height = 25
            DataSource = DM.DataSourceUser
            Hints.Strings = (
              #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1047#1072#1087#1080#1089#1100
              #1042#1089#1090#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102
              #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1056#1077#1078#1080#1084' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
              #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103
              #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103
              #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077)
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
        end
      end
      object GroupBox8: TGroupBox
        Left = 304
        Top = 0
        Width = 704
        Height = 697
        Align = alRight
        BiDiMode = bdRightToLeft
        Caption = #1054#1090#1095#1077#1090#1099
        ParentBiDiMode = False
        TabOrder = 1
        object DBGridEh1: TDBGridEh
          Left = 2
          Top = 196
          Width = 700
          Height = 499
          Align = alClient
          BiDiMode = bdRightToLeftNoAlign
          DataSource = DM.DataSourceSmenaReport
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          FooterRowCount = 1
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
          ParentBiDiMode = False
          ReadOnly = True
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnKeyPress = DBGridEhDetailKeyPress
          Columns = <
            item
              EditButtons = <>
              FieldName = 'VO_UNIQS'
              Footer.Value = #1048#1090#1086#1075#1086':'
              Footer.ValueType = fvtStaticText
              Footers = <>
              Title.Caption = #1050#1086#1076' '#1089#1084#1077#1085#1099
              Width = 56
            end
            item
              EditButtons = <>
              FieldName = 'VO_USR_LIST'
              Footers = <>
              Title.Caption = #1057#1087#1080#1089#1086#1082' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1086#1074
              Width = 228
            end
            item
              EditButtons = <>
              FieldName = 'VO_SMN_DATE'
              Footer.ValueType = fvtCount
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1089#1084#1077#1085#1099
              Width = 73
            end
            item
              EditButtons = <>
              FieldName = 'VO_DAY_NIGHT'
              Footers = <>
              Title.Caption = #1044#1077#1085#1100'/'#1085#1086#1095#1100
              Width = 68
            end
            item
              EditButtons = <>
              FieldName = 'VO_ORDERS'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1050#1086#1083'-'#1074#1086' '#1079#1072#1082#1072#1079#1086#1074
            end
            item
              EditButtons = <>
              FieldName = 'VO_ORD_COST'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1044#1101#1085#1075#1080
            end>
        end
        object Panel4: TPanel
          Left = 2
          Top = 15
          Width = 700
          Height = 181
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Splitter2: TSplitter
            Left = 346
            Top = 0
            Width = 5
            Height = 181
            Beveled = True
            ExplicitLeft = 162
          end
          object GroupBox9: TGroupBox
            Left = 0
            Top = 0
            Width = 346
            Height = 181
            Align = alLeft
            BiDiMode = bdRightToLeftNoAlign
            Caption = #1054#1058'..'
            ParentBiDiMode = False
            TabOrder = 0
            object DateTimePickerStartDate: TMonthCalendar
              Left = 2
              Top = 15
              Width = 342
              Height = 164
              Align = alClient
              Date = 38986.404961296300000000
              ParentShowHint = False
              ShowHint = True
              ShowToday = False
              ShowTodayCircle = False
              TabOrder = 0
            end
          end
          object GroupBox10: TGroupBox
            Left = 351
            Top = 0
            Width = 349
            Height = 181
            Align = alClient
            BiDiMode = bdRightToLeftNoAlign
            Caption = #1044#1054'..'
            ParentBiDiMode = False
            TabOrder = 1
            object DateTimePickerStopDate: TMonthCalendar
              Left = 2
              Top = 15
              Width = 345
              Height = 164
              Align = alClient
              Date = 38986.404961296300000000
              TabOrder = 0
            end
          end
        end
      end
    end
    object TabSheetOrdCost: TTabSheet
      Caption = #1058#1072#1088#1080#1092#1099
      ImageIndex = 1
      OnHide = TabSheetOrdCostHide
      OnShow = TabSheetOrdCostShow
      object Splitter3: TSplitter
        Left = 0
        Top = 421
        Width = 1008
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 0
        ExplicitWidth = 424
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 421
        Align = alClient
        Caption = 'Panel5'
        TabOrder = 0
        object GroupBox4: TGroupBox
          Left = 1
          Top = 1
          Width = 1006
          Height = 49
          Align = alTop
          Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1090#1072#1088#1080#1092
          TabOrder = 0
          object DBNavigator2: TDBNavigator
            Left = 16
            Top = 16
            Width = 240
            Height = 25
            DataSource = DM.DataSourceOrdCost
            Hints.Strings = (
              #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1047#1072#1087#1080#1089#1100
              #1042#1089#1090#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102
              #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1056#1077#1078#1080#1084' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
              #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103
              #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103
              #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077)
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object DateTimePicker1: TDateTimePicker
            Left = 680
            Top = 16
            Width = 145
            Height = 21
            Date = 40319.935852314810000000
            Time = 40319.935852314810000000
            DateFormat = dfLong
            TabOrder = 1
            Visible = False
          end
          object DateTimePicker2: TDateTimePicker
            Left = 831
            Top = 16
            Width = 82
            Height = 21
            Date = 40319.935852314810000000
            Time = 40319.935852314810000000
            DateFormat = dfLong
            Kind = dtkTime
            TabOrder = 2
            Visible = False
          end
          object BitBtn5: TBitBtn
            Left = 570
            Top = 14
            Width = 88
            Height = 24
            Hint = #1055#1077#1088#1077#1089#1095#1077#1090' '#1086#1090#1095#1077#1090#1072' '#1087#1086' '#1048#1058#1054#1043#1072#1084' '#1079#1072#1082#1072#1079#1086#1074
            Caption = #1055#1077#1088#1077#1089#1095#1077#1090
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            Visible = False
            OnClick = BitBtnRecalcClick
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FF00FFFF00FF
              8484840000000000000000000000000000000000000000000000000000000000
              00848484FF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF
              000000FFFFFF000000000000FFFFFF000000000000FFFFFF000000000000FFFF
              FF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFF000000000000FFFFFF00
              0000000000FFFFFF000000000000FFFFFF000000FF00FFFF00FFFF00FFFF00FF
              000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFF000000000000FFFFFF00
              0000000000FFFFFF000000000000FFFFFF000000FF00FFFF00FFFF00FFFF00FF
              000000FFFFFF000000000000FFFFFF000000000000FFFFFF000000000000FFFF
              FF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF
              000000FFFFFF000000000000FFFFFF000000000000FFFFFF000000000000FFFF
              FF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFF000000000000FFFFFF00
              0000000000FFFFFF000000000000FFFFFF000000FF00FFFF00FFFF00FFFF00FF
              000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFF840000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FFFFFF000000FF00FFFF00FFFF00FFFF00FF
              000000FFFFFF840000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF
              FF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFF84000084000084000084
              0000840000840000840000840000FFFFFF000000FF00FFFF00FFFF00FFFF00FF
              000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000FF00FFFF00FFFF00FFFF00FF84848400000000000000000000000000
              0000000000000000000000000000000000848484FF00FFFF00FF}
          end
        end
        object DBGridEhOrdCost: TDBGridEh
          Left = 1
          Top = 50
          Width = 1006
          Height = 370
          Align = alClient
          AllowedSelections = [gstRecordBookmarks]
          DataSource = DM.DataSourceOrdCost
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          Columns = <
            item
              EditButtons = <>
              FieldName = 'COD_ORD_TYPE'
              Footers = <>
              Title.Caption = #1050#1086#1076' '#1090#1072#1088#1080#1092#1072
              Width = 45
            end
            item
              EditButtons = <>
              FieldName = 'NAME_ORD_TYPE'
              Footers = <>
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Width = 108
            end
            item
              EditButtons = <>
              FieldName = 'ORD_TYPE'
              Footers = <>
              Title.Caption = 'TYPE'
              Width = 34
            end
            item
              EditButtons = <>
              FieldName = 'COST_ORDER'
              Footers = <>
              Title.Caption = #1056#1072#1079#1086#1074#1072#1103' '#1089#1090#1086#1080#1084#1086#1089#1090#1100
              Width = 61
            end
            item
              EditButtons = <>
              FieldName = 'COST_HNEXT'
              Footers = <>
              Title.Caption = 'C'#1083#1077#1076#1091#1102#1097#1080#1081' '#1095#1072#1089
              Width = 65
            end
            item
              EditButtons = <>
              FieldName = 'COST_DURATION'
              Footers = <>
              Title.Caption = #1055#1088#1086#1089#1090#1086#1081' '#1074' '#1084#1080#1085'.'
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'COST_DISTANCE'
              Footers = <>
              Title.Caption = #1055#1088#1086#1073#1077#1075' '#1079#1072' '#1082#1084
              Width = 48
            end
            item
              EditButtons = <>
              FieldName = 'COST_MUX'
              Footers = <>
              Title.Caption = #1050#1086#1101#1092'-'#1085#1090' '#1086#1090' '#1089#1090#1086#1080#1084#1086#1089#1090#1080
            end>
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 424
        Width = 1008
        Height = 273
        Align = alBottom
        Caption = 'Panel5'
        TabOrder = 1
        object GroupBox12: TGroupBox
          Left = 1
          Top = 1
          Width = 1006
          Height = 49
          Align = alTop
          Caption = #1052#1086#1076#1080#1092#1080#1082#1072#1090#1086#1088#1099' '#1076#1083#1103' '#1095#1072#1089#1090#1086#1090
          TabOrder = 0
          object DBNavigator3: TDBNavigator
            Left = 16
            Top = 16
            Width = 240
            Height = 25
            DataSource = DM.DataSourceOrdMod
            Hints.Strings = (
              #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1047#1072#1087#1080#1089#1100
              #1042#1089#1090#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102
              #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1056#1077#1078#1080#1084' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
              #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103
              #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103
              #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077)
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
        end
        object DBGridEhOrdMod: TDBGridEh
          Left = 1
          Top = 50
          Width = 1006
          Height = 222
          Align = alClient
          AllowedSelections = [gstRecordBookmarks]
          DataSource = DM.DataSourceOrdMod
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          Columns = <
            item
              EditButtons = <>
              FieldName = 'ID'
              Footers = <>
              ReadOnly = True
              Width = 49
            end
            item
              EditButtons = <>
              FieldName = 'KEY_ORD_TYPE'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1058#1072#1088#1080#1092
              Width = 48
            end
            item
              EditButtons = <>
              FieldName = 'THM_FREQ'
              Footers = <>
              Title.Caption = #1063#1072#1089#1090#1086#1090#1072
              Width = 53
            end
            item
              EditButtons = <>
              FieldName = 'COST_ORDER'
              Footers = <>
              Title.Caption = #1056#1072#1079#1086#1074#1072#1103' '#1089#1090#1086#1080#1084#1086#1089#1090#1100
              Width = 61
            end
            item
              EditButtons = <>
              FieldName = 'COST_HNEXT'
              Footers = <>
              Title.Caption = 'C'#1083#1077#1076#1091#1102#1097#1080#1081' '#1095#1072#1089
              Width = 65
            end
            item
              EditButtons = <>
              FieldName = 'COST_DURATION'
              Footers = <>
              Title.Caption = #1055#1088#1086#1089#1090#1086#1081' '#1074' '#1084#1080#1085'.'
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'COST_DISTANCE'
              Footers = <>
              Title.Caption = #1055#1088#1086#1073#1077#1075' '#1079#1072' '#1082#1084
              Width = 48
            end
            item
              EditButtons = <>
              FieldName = 'COST_MUX'
              Footers = <>
              Title.Caption = #1050#1086#1101#1092'-'#1085#1090' '#1086#1090' '#1089#1090#1086#1080#1084#1086#1089#1090#1080
            end>
        end
      end
    end
    object TabSheetClient: TTabSheet
      Caption = #1050#1083#1080#1077#1085#1090#1099
      ImageIndex = 4
      OnHide = TabSheetClientHide
      OnShow = TabSheetClientShow
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 1008
        Height = 49
        Align = alTop
        Caption = #1054#1088#1075#1072#1085#1099' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103
        TabOrder = 0
        object DBNavigatorClients: TDBNavigator
          Left = 16
          Top = 16
          Width = 240
          Height = 25
          DataSource = DM.DataSourceClients
          Hints.Strings = (
            #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1047#1072#1087#1080#1089#1100
            #1042#1089#1090#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102
            #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
            #1056#1077#1078#1080#1084' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
            #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103
            #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103
            #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077)
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
      end
      object DBGridEhClients: TDBGridEh
        Left = 0
        Top = 49
        Width = 1008
        Height = 648
        Align = alClient
        AllowedSelections = [gstRecordBookmarks]
        DataSource = DM.DataSourceClients
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnSortMarkingChanged = DBGridEhClientsSortMarkingChanged
        OnTitleBtnClick = DBGridEhClientsTitleBtnClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'UNIQC'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 45
          end
          item
            EditButtons = <>
            FieldName = 'CLT_NAME'
            Footers = <>
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 177
          end
          item
            EditButtons = <>
            FieldName = 'CLT_INFO'
            Footers = <>
            Title.Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
            Title.TitleButton = True
            Width = 165
          end
          item
            EditButtons = <>
            FieldName = 'CLT_ADRESS'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089
            Title.TitleButton = True
            Width = 153
          end
          item
            EditButtons = <>
            FieldName = 'CLT_PHONE'
            Footers = <>
            Title.Caption = #1058#1077#1083#1077#1092#1086#1085
            Title.TitleButton = True
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'CLT_TYPE'
            Footers = <>
            KeyList.Strings = (
              '1'
              '2'
              '3')
            PickList.Strings = (
              #1042' '#1089#1087#1080#1089#1082#1077
              #1061#1072#1083#1103#1074#1097#1080#1082
              #1041#1077#1079#1085#1072#1083#1100#1097#1080#1082)
            Title.Caption = #1058#1080#1087
            Title.TitleButton = True
            Width = 153
          end
          item
            EditButtons = <>
            FieldName = 'CLT_COUNTER'
            Footers = <>
            Title.Caption = #1057#1095#1077#1090#1095#1080#1082
            Title.TitleButton = True
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'CLT_DISCOUNT'
            Footers = <>
            Title.Caption = #1057#1082#1080#1076#1082#1072
            Title.TitleButton = True
            Width = 48
          end>
      end
    end
    object TabSheetReport: TTabSheet
      Caption = #1054#1090#1095#1077#1090#1099' '#1087#1086' '#1089#1084#1077#1085#1072#1084
      ImageIndex = 2
      OnHide = TabSheetReportHide
      OnShow = TabSheetReportShow
      object PanelReport: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 248
        Align = alTop
        TabOrder = 0
        object TabControlSmnReport: TTabControl
          Left = 1
          Top = 1
          Width = 1006
          Height = 208
          Align = alTop
          RaggedRight = True
          TabOrder = 0
          TabPosition = tpBottom
          Tabs.Strings = (
            #1042#1089#1077
            #1087#1085' '#1044
            #1087#1085' '#1053
            #1074#1090' '#1044
            #1074#1090' '#1053
            #1089#1088' '#1044
            #1089#1088' '#1053
            #1095#1090' '#1044
            #1095#1090' '#1053
            #1087#1090' '#1044
            #1087#1090' '#1053
            #1089#1073' '#1044' '
            #1089#1073' '#1053
            #1074#1089' '#1044
            #1074#1089' '#1053
            #1053#1077#1076#1077#1083#1103)
          TabIndex = 0
          TabWidth = 42
          OnChange = TabControlSmnReportChange
          object DBGridEhSmnReport: TDBGridEh
            Left = 184
            Top = 4
            Width = 818
            Height = 182
            Align = alClient
            DataSource = DM.DataSourceSmnReport
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghMultiSortMarking, dghDialogFind]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            UseMultiTitle = True
            OnDblClick = BitBtnSmnReportClick
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
          object GroupBox1: TGroupBox
            Left = 4
            Top = 4
            Width = 180
            Height = 182
            Align = alLeft
            Caption = 'GroupBox1'
            TabOrder = 1
            object CalendarReport: TMonthCalendar
              Left = 2
              Top = 15
              Width = 176
              Height = 165
              Align = alClient
              Date = 38648.404961840280000000
              MaxSelectRange = 7
              TabOrder = 0
              WeekNumbers = True
              OnClick = TabControlSmnReportChange
            end
          end
        end
        object BitBtnSmnReport: TBitBtn
          Left = 8
          Top = 216
          Width = 137
          Height = 29
          BiDiMode = bdLeftToRight
          Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1086#1090#1095#1077#1090
          ParentBiDiMode = False
          TabOrder = 1
          OnClick = BitBtnSmnReportClick
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF1F1F1F9F9F9FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95B295669066CDCECDFCFCFC
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF16AC1621
            B322499149D3D3D3FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF14A21539B43D22B023499249D3D4D3FDFDFDFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF1AA41B27AD2C26AE2A26B2294B924BD2D3D2FCFC
            FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1BA51D28B12F0BA5122EB434
            29B42C499149D3D3D3FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1CA61E2F
            B6370EAA1614AC1C33B93A2CB83049924AD3D4D3FDFDFDFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF1EA62034BB3F14B02017B0231AB22538BD422EB9344B924BD2D2D2FC
            FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF1EA82139C0481AB52A1EB62D1CB62C1FB72E3DC3
            4B30BC3849924AD3D3D3FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FA8223FC65021BC3224BD35
            24BD3522BC3425BD3742C85234BF3C4A924AD3D3D3FCFCFCFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF21AA2344
            CC5926C13B29C23F29C23F2AC23F29C23E2BC33F48CE5A36C2414D954DE5E5E5
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF21AB254BD2612DC84530C94830C94830C94830C9482FC94730CA484A
            D26037C44467AF67FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF22AC2650D86A33CE4E36CF5136CF5136CF5136CF
            5135CF5035CF504CD56667DD7D1FAF22FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF23AD2757DE733AD5593DD65B
            3DD65B3DD65B3BD55A40D65D6DE184A5EDB453C15A9FD89FFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF24AE2A5D
            E37C3FDA6242DB6442DB6441DB6244DC6571E58BACF0BC59C25E9ED79EFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF25AF2B62E98446E16A49E26C48E26C4AE26D76EA92AEF3BF5AC35EA0
            D7A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF25AF2D67EE8D4BE7744DE77551E7787AEF99B1F5
            C35DC461A1D8A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF27B12E6CF39550EC7B54EC80
            7EF2A0B4F8C85BC3619ED79EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF27B22F70
            F99A57F28383F7A5B5FBCA5BC562A0D7A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF28B33076FDA282FAA7B8FCCC5DC664A1D8A1FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF23B32D99FFBFBBFFD15DC6649ED79EFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF30B638D1FFE861C767A0D7A0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3BB33D53
            C158A1D9A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF60BF6048B748DCF0DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphRight
        end
      end
      object GroupBoxReport: TGroupBox
        Left = 0
        Top = 248
        Width = 1008
        Height = 449
        Align = alClient
        Caption = 'GroupBoxReport'
        TabOrder = 1
        object DBGridEhReport: TDBGridEh
          Left = 2
          Top = 15
          Width = 1004
          Height = 432
          Align = alClient
          DataSource = DM.DataSourceReport
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghRowHighlight]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
        end
      end
    end
    object TabSheetDetail: TTabSheet
      Caption = #1056#1072#1089#1082#1086#1087#1099#1090#1082#1072
      ImageIndex = 3
      OnHide = TabSheetDetailHide
      OnShow = TabSheetDetailShow
      object DBGridEhDetail: TDBGridEh
        Left = 0
        Top = 248
        Width = 1008
        Height = 449
        Align = alClient
        DataSource = DM.DataSourceDetail
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnKeyPress = DBGridEhDetailKeyPress
        Columns = <
          item
            EditButtons = <>
            FieldName = 'KEY_THEME'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindowText
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footer.Value = #1048#1090#1086#1075':'
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Caption = #1055#1086#1079'.'
            Width = 32
          end
          item
            EditButtons = <>
            FieldName = 'TIME_START'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindowText
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #1053#1072#1095#1072#1083#1086
            Width = 95
          end
          item
            EditButtons = <>
            FieldName = 'TIME_STOP'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindowText
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077
            Width = 93
          end
          item
            EditButtons = <>
            FieldName = 'NAME_ORD_TYPE'
            Footer.FieldName = 'NAME_ORD_TYPE'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindowText
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1058#1080#1087' '#1079#1072#1082#1072#1079#1072
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'ORD_DEPARTURE'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindowText
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #1054#1090#1082#1091#1076#1072
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'ORD_DESTINATION'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindowText
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #1050#1091#1076#1072
            Width = 95
          end
          item
            EditButtons = <>
            FieldName = 'ORD_COST'
            Footer.FieldName = 'ORD_COST'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindowText
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1057#1091#1084#1084#1072
            Width = 41
          end
          item
            EditButtons = <>
            FieldName = 'ORD_HOURS'
            Footer.FieldName = 'ORD_HOURS'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindowText
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1063#1072#1089
            Width = 27
          end
          item
            EditButtons = <>
            FieldName = 'ORD_DURATION'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindowText
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #1055#1088#1086#1089#1090#1086#1081
            Visible = False
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'ORD_DISTANCE'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindowText
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #1055#1088#1086#1073#1077#1075
            Visible = False
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'KEY_SMN_START'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindowText
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #1057#1084#1077#1085#1072' '#8470
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'ORD_PHONE'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindowText
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #1058#1077#1083#1077#1092#1086#1085
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'UNIQO'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'CLT_NAME'
            Footers = <>
            Title.Caption = #1050#1083#1080#1077#1085#1090#1099
            Width = 84
          end
          item
            EditButtons = <>
            FieldName = 'KEY_CLIENT'
            Footers = <>
            Title.Caption = #1050#1086#1076'. '#1050#1083#1080#1077#1085#1090
            Width = 43
          end
          item
            EditButtons = <>
            FieldName = 'ORD_STATE'
            Footer.FieldName = 'ORD_STATE'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindowText
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footers = <>
            Title.Caption = #1047#1072#1082'. '#1089#1086#1089#1090
            Visible = False
            Width = 32
          end
          item
            EditButtons = <>
            FieldName = 'ORD_ITOG'
            Footer.FieldName = 'ORD_ITOG'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindowText
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1048#1090#1086#1075' '#1079#1072' '#1079#1072#1082#1072#1079
            Width = 48
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 248
        Align = alTop
        TabOrder = 1
        object LabelTheme: TLabel
          Left = 172
          Top = 220
          Width = 55
          Height = 13
          Caption = #1055#1086#1079#1099#1074#1085#1086#1081':'
          ParentShowHint = False
          ShowHint = False
        end
        object TabControlSmnDetail: TTabControl
          Left = 1
          Top = 1
          Width = 1006
          Height = 208
          Align = alTop
          RaggedRight = True
          TabOrder = 0
          TabPosition = tpBottom
          Tabs.Strings = (
            #1042#1089#1077
            #1087#1085' '#1044
            #1087#1085' '#1053
            #1074#1090' '#1044
            #1074#1090' '#1053
            #1089#1088' '#1044
            #1089#1088' '#1053
            #1095#1090' '#1044
            #1095#1090' '#1053
            #1087#1090' '#1044
            #1087#1090' '#1053
            #1089#1073' '#1044' '
            #1089#1073' '#1053
            #1074#1089' '#1044
            #1074#1089' '#1053
            #1053#1077#1076#1077#1083#1103)
          TabIndex = 0
          TabWidth = 42
          OnChange = TabControlSmnDetailChange
          object GroupBox6: TGroupBox
            Left = 4
            Top = 4
            Width = 180
            Height = 182
            Align = alLeft
            Caption = 'GroupBox6'
            TabOrder = 0
            object CalendarDetail: TMonthCalendar
              Left = 2
              Top = 15
              Width = 176
              Height = 165
              Align = alClient
              MultiSelect = True
              Date = 38650.404962013890000000
              EndDate = 38650.000000000000000000
              TabOrder = 0
              WeekNumbers = True
              OnClick = TabControlSmnDetailChange
            end
          end
          object DBGridEhSmnDetail: TDBGridEh
            Left = 184
            Top = 4
            Width = 818
            Height = 182
            Align = alClient
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
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            UseMultiTitle = True
            OnDblClick = BitBtnDetailClick
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
        end
        object BitBtnDetail: TBitBtn
          Left = 8
          Top = 214
          Width = 137
          Height = 30
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
          TabOrder = 1
          OnClick = BitBtnDetailClick
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF1F1F1F9F9F9FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95B295669066CDCECDFCFCFC
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF16AC1621
            B322499149D3D3D3FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF14A21539B43D22B023499249D3D4D3FDFDFDFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF1AA41B27AD2C26AE2A26B2294B924BD2D3D2FCFC
            FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1BA51D28B12F0BA5122EB434
            29B42C499149D3D3D3FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1CA61E2F
            B6370EAA1614AC1C33B93A2CB83049924AD3D4D3FDFDFDFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF1EA62034BB3F14B02017B0231AB22538BD422EB9344B924BD2D2D2FC
            FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF1EA82139C0481AB52A1EB62D1CB62C1FB72E3DC3
            4B30BC3849924AD3D3D3FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FA8223FC65021BC3224BD35
            24BD3522BC3425BD3742C85234BF3C4A924AD3D3D3FCFCFCFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF21AA2344
            CC5926C13B29C23F29C23F2AC23F29C23E2BC33F48CE5A36C2414D954DE5E5E5
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF21AB254BD2612DC84530C94830C94830C94830C9482FC94730CA484A
            D26037C44467AF67FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF22AC2650D86A33CE4E36CF5136CF5136CF5136CF
            5135CF5035CF504CD56667DD7D1FAF22FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF23AD2757DE733AD5593DD65B
            3DD65B3DD65B3BD55A40D65D6DE184A5EDB453C15A9FD89FFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF24AE2A5D
            E37C3FDA6242DB6442DB6441DB6244DC6571E58BACF0BC59C25E9ED79EFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF25AF2B62E98446E16A49E26C48E26C4AE26D76EA92AEF3BF5AC35EA0
            D7A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF25AF2D67EE8D4BE7744DE77551E7787AEF99B1F5
            C35DC461A1D8A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF27B12E6CF39550EC7B54EC80
            7EF2A0B4F8C85BC3619ED79EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF27B22F70
            F99A57F28383F7A5B5FBCA5BC562A0D7A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF28B33076FDA282FAA7B8FCCC5DC664A1D8A1FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF23B32D99FFBFBBFFD15DC6649ED79EFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF30B638D1FFE861C767A0D7A0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3BB33D53
            C158A1D9A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF60BF6048B748DCF0DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphRight
        end
        object EditTheme: TEdit
          Left = 232
          Top = 216
          Width = 33
          Height = 21
          Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1076#1083#1103' '#1074#1089#1077#1093' '#1087#1086#1079#1099#1074#1085#1099#1093
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnKeyPress = EditThemeKeyPress
        end
        object CheckBoxOrdTypeFilter: TCheckBox
          Left = 280
          Top = 218
          Width = 105
          Height = 17
          Hint = #1060#1080#1083#1100#1090#1088#1091#1077#1090' '#1087#1086' '#1090#1080#1087#1091' '#1079#1072#1082#1072#1079#1086#1074
          Caption = #1055#1086' '#1090#1080#1087#1091' '#1079#1072#1082#1072#1079#1072
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = BitBtnDetailClick
        end
        object ComboBoxOrdType: TComboBox
          Left = 391
          Top = 215
          Width = 145
          Height = 21
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1090#1080#1087' '#1079#1072#1082#1072#1079#1086#1074' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072
          Style = csDropDownList
          ItemHeight = 13
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object ComboBoxClients: TComboBox
          Left = 610
          Top = 216
          Width = 282
          Height = 21
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1090#1080#1087' '#1079#1072#1082#1072#1079#1086#1074' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072
          Style = csDropDownList
          DropDownCount = 25
          ItemHeight = 13
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object CheckBoxClientsFilter: TCheckBox
          Left = 542
          Top = 218
          Width = 68
          Height = 17
          Hint = #1054#1090#1086#1073#1088#1072#1078#1072#1077#1090' '#1079#1072#1082#1072#1079#1099' '#1082#1086#1085#1082#1088#1077#1090#1085#1086#1075#1086' '#1082#1083#1080#1077#1085#1090#1072
          Caption = #1050#1083#1080#1077#1085#1090#1099
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = BitBtnDetailClick
        end
        object CheckBoxLocations: TCheckBox
          Left = 935
          Top = 228
          Width = 68
          Height = 17
          Hint = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1090#1072#1082#1078#1077' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' '#1072#1074#1090#1086
          Caption = #1044#1074#1080#1078#1085#1103#1082
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = BitBtnDetailClick
        end
        object CheckBoxGarbage: TCheckBox
          Left = 935
          Top = 209
          Width = 56
          Height = 17
          Caption = #1052#1091#1089#1086#1088
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          OnClick = BitBtnDetailClick
        end
      end
    end
    object TabSheetWeekReport: TTabSheet
      Caption = #1053#1077#1076#1077#1083#1100#1085#1099#1081' '#1086#1090#1095#1077#1090
      ImageIndex = 5
      object GroupBox5: TGroupBox
        Left = 0
        Top = 0
        Width = 1008
        Height = 321
        Align = alTop
        Caption = 'GroupBox5'
        TabOrder = 0
        object DBGridEhSmnWeek: TDBGridEh
          Left = 517
          Top = 15
          Width = 489
          Height = 304
          Align = alClient
          DataSource = DM.DataSourceSmnWeek
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghMultiSortMarking, dghDialogFind]
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
              Width = 124
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
        object Panel2: TPanel
          Left = 2
          Top = 15
          Width = 515
          Height = 304
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Panel2'
          TabOrder = 1
          object CheckBoxWeeks: TCheckBox
            Left = 344
            Top = 0
            Width = 161
            Height = 17
            Hint = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1086#1090#1095#1077#1090#1099' '#1090#1086#1083#1100#1082#1086' '#1074#1099#1073#1088#1072#1085#1085#1099#1093' '#1085#1077#1076#1077#1083#1100
            Caption = #1054#1090#1095#1077#1090#1099' '#1074#1099#1073#1088#1072#1085#1099#1093' '#1085#1077#1076#1077#1083#1100
            Enabled = False
            TabOrder = 0
          end
          object CalendarWeeks: TMonthCalendar
            Left = 336
            Top = 16
            Width = 175
            Height = 161
            MultiSelect = True
            Date = 38650.404962013890000000
            EndDate = 38650.000000000000000000
            MaxSelectRange = 256
            TabOrder = 1
            WeekNumbers = True
            OnClick = CalendarWeeksClick
          end
          object BitBtnReport: TBitBtn
            Left = 338
            Top = 178
            Width = 88
            Height = 24
            Hint = #1057#1086#1079#1076#1072#1090#1100' '#1054#1058#1063#1045#1058' '#1079#1072' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
            Caption = #1057#1086#1079#1076#1072#1090#1100
            ModalResult = 1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = BitBtnReportClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000120B0000120B00000001000000000000000000004000
              000080000000FF000000002000004020000080200000FF200000004000004040
              000080400000FF400000006000004060000080600000FF600000008000004080
              000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
              000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
              200080002000FF002000002020004020200080202000FF202000004020004040
              200080402000FF402000006020004060200080602000FF602000008020004080
              200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
              200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
              400080004000FF004000002040004020400080204000FF204000004040004040
              400080404000FF404000006040004060400080604000FF604000008040004080
              400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
              400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
              600080006000FF006000002060004020600080206000FF206000004060004040
              600080406000FF406000006060004060600080606000FF606000008060004080
              600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
              600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
              800080008000FF008000002080004020800080208000FF208000004080004040
              800080408000FF408000006080004060800080608000FF608000008080004080
              800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
              800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
              A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
              A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
              A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
              A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
              C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
              C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
              C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
              C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
              FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
              FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
              FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
              FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00919191919191
              9191919191919191919191919103919191919191919191919191919191039191
              9191919191919191919191919103919103030303030391919191919191039191
              0303919191039191919191910303039191030391919191919191919103910391
              9191030391919191919191910391039191919103039191919191910303910391
              9191910303919191919191030391039191910303919191919191919191910391
              9103039191919191919191919191039103039191910391919191919191910391
              0303030303039191039191919191039191919191919191910391919191910303
              0303030303030303039191919191919191919191919191919191}
          end
          object BitBtnRefresh: TBitBtn
            Left = 338
            Top = 202
            Width = 88
            Height = 24
            Hint = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100' '#1054#1057#1058#1040#1058#1054#1050' '#1089' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1086#1090#1095#1077#1090#1072
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = BitBtnRefreshClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
              00003830BBBBBBBBBBB03380B000000000B0333000FFFFFFF0B00000E0FFFFFF
              F0B0EEEEEE07777770B0EEEEEEE0FFFFF0B0EEEEEE0FFFFFF0B00000E0777777
              70B0333000FFFFFFF0B03330B0FFFFFFF0B03330B000000000B03330B007F777
              00B03330BBB07F70BBB033300000777000003333333000003333}
          end
          object BitBtnReklama: TBitBtn
            Tag = 18
            Left = 426
            Top = 178
            Width = 88
            Height = 24
            Hint = 'REP_REKLAMA'
            Caption = #1056#1077#1082#1083#1072#1084#1072
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = BitBtnSetRepClick
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFDADBDAB5B7B5B7B9B7B7B9B7B5B7B5DADBDAFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FAF634A334199A191B
              9B1B1B9B1B199A1934A334F6FAF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFF0F9F028AD2914A7170CA40F0CA40F14A71728AD29F0F9F0FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F6F028B02B13A7180A
              A40F0AA40F13A71828B02BF0F6F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA
              F5F5F5FAFAFAE7E7E72BA52F1BB22412AC1B12AC1B1BB2242BA52FE7E7E7FAFA
              FAF5F5F5FAFAFAFFFFFFA6BFA65788585386545687574E844E2AAB3023B9311A
              B4271AB42723B9312AAB304E844E568757538654578858A6BFA64EC2513BCC49
              35CB4435CB4435CA4436C34525BD3723BC3523BC3525BD3736C34535CA4435CB
              4435CB443BCC494EC25151BD543CC85028C5402AC5412AC5412AC5412CC5422C
              C5432CC5432CC5422AC5412AC5412AC54128C5403CC85051BD5452BE5644CF5A
              33CE4F34CE4F34CE4F35CE5035CE5035CE5035CE5035CE5035CE5034CE4F34CE
              4F33CE4F44CF5A52BE5654C0584CD86840DA6141D96141D9613ED85E3ED75D3E
              D75D3ED75D3ED75D3ED85E41D96141D96140DA614CD86854C05858C15C8EE59D
              ADEEBAAAECB7A7ECB488E99D4FE17145E06A45E06A4FE17188E99DA7ECB4AAEC
              B7ADEEBA8EE59D58C15CB7E2B785CE8589CE888BD08B7EC97C51C95F60EF884D
              E8764DE87660EF8851C95F7EC97C8BD08B89CE8885CE85B7E2B7FFFFFFFFFFFF
              FFFFFFFFFFFFF0F8F044C85561F78F56F08356F08361F78F44C855F0F8F0FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F8F048CB5A64FE9557
              F78757F78764FE9548CB5AF0F8F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFF0F8F055CF679FFFC997FFBD97FFBD9FFFC955CF67F0F8F0FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FBF758C15D7ED1837F
              CF807FCF807ED18358C15DF7FBF7FFFFFFFFFFFFFFFFFFFFFFFF}
          end
          object BitBtnMedik: TBitBtn
            Tag = 19
            Left = 426
            Top = 202
            Width = 88
            Height = 24
            Hint = 'REP_MEDIK'
            Caption = #1052#1077#1076#1080#1082
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = BitBtnSetRepClick
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFDFDFDEEEEEED9D9D9C6C6C6CBCBCBDEDEDEF3F3F3FEFEFEFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF1F1F1C3C3C39D9D9D9A9A9AA5
              A5A5A3A3A3999999A3A3A3D1D1D1F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              EDEDEDA9A9A9A9A9A9BEBEBEC0C0C0BCBCBCBEBEBEC1C1C1BBBBBBA1A1A1C0C0
              C0F8F8F8FFFFFFFFFFFFFFFFFFF7F7F7ADADADB9B9B9C1C1C1BFBFBFC5C5C5CB
              CBCBC9C9C9C1C1C1BEBEBEC4C4C4ABABABCBCBCBFDFDFDFFFFFFFFFFFFCDCDCD
              B6B6B6C4C4C4C2C2C2C5C5C5C5C5DA9797DFA2A2DBD2D2D2C2C2C2C2C2C2C6C6
              C6A8A8A8ECECECFFFFFFFAFAFAABABABCCCCCCC7C7C7C7C7C7C7C7C78585CD5D
              5DD44F4FCFCDCDCDC7C7C7C7C7C7C7C7C7C5C5C5C3C3C3FFFFFFEAEAEAB9B9B9
              CCCCCCD6D6D6E7E7E7EBEBEB8D8DD55F64D85456D2E6E6E6EBEBEBE0E0E0CECE
              CED1D1D1B4B4B4FFFFFFD3D3D3CCCCCCD1D1D1D9D9D95759CE5D61D75D61D76F
              78E16E74DE5D61D75D61D79898D2D2D2D2D2D2D2B4B4B4FFFFFFCACACAD6D6D6
              D7D7D7DBDBDB696EDC96A1ED939EED808DEB8D98ED96A1ED98A3EE8B8BD4D7D7
              D7D7D7D7B6B6B6FFFFFFDEDEDECFCFCFDDDDDDE0E0E09F9FD88E8ED66363CF97
              A7F56D74DF8E8ED68E8ED6CACADFDCDCDCDFDFDFBBBBBBFFFFFFF7F7F7BEBEBE
              E4E4E4E1E1E1E1E1E1E1E1E18F8FD7A0B4FB6F79E1E4E4E4E1E1E1E1E1E1E1E1
              E1E4E4E4C1C1C1FFFFFFFFFFFFC3C3C3EAEAEAE7E7E7E5E5E5E5E5E5A2A2DB7F
              86E46B6FD8E8E8E8E5E5E5E5E5E5EAEAEACDCDCDEAEAEAFFFFFFFFFFFFF3F3F3
              C6C6C6F2F2F2ECECECEAEAEAECECECECECECECECECEBEBEBEBEBEBEEEEEEE7E7
              E7D0D0D0FFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCACACAF1F1F1F1F1F1EEEEEEED
              EDEDEDEDEDEFEFEFF4F4F4E4E4E4C1C1C1FCFCFCFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF3F3F3C6C6C6D0D0D0E9E9E9F5F5F5F1F1F1DFDFDFC6C6C6D6D6D6FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0D7D7D7C9
              C9C9CECECEE2E2E2FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          end
          object BitBtnKwart: TBitBtn
            Tag = 21
            Left = 426
            Top = 226
            Width = 88
            Height = 24
            Hint = 'REP_KWART'
            Caption = #1050#1074#1072#1088#1090'-'#1085#1099#1077
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            OnClick = BitBtnSetRepClick
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFDADBDAB5B7B5B7B9B7B7B9B7B5B7B5DADBDAFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FAF634A334199A191B
              9B1B1B9B1B199A1934A334F6FAF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFF0F9F028AD2914A7170CA40F0CA40F14A71728AD29F0F9F0FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F6F028B02B13A7180A
              A40F0AA40F13A71828B02BF0F6F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA
              F5F5F5FAFAFAE7E7E72BA52F1BB22412AC1B12AC1B1BB2242BA52FE7E7E7FAFA
              FAF5F5F5FAFAFAFFFFFFA6BFA65788585386545687574E844E2AAB3023B9311A
              B4271AB42723B9312AAB304E844E568757538654578858A6BFA64EC2513BCC49
              35CB4435CB4435CA4436C34525BD3723BC3523BC3525BD3736C34535CA4435CB
              4435CB443BCC494EC25151BD543CC85028C5402AC5412AC5412AC5412CC5422C
              C5432CC5432CC5422AC5412AC5412AC54128C5403CC85051BD5452BE5644CF5A
              33CE4F34CE4F34CE4F35CE5035CE5035CE5035CE5035CE5035CE5034CE4F34CE
              4F33CE4F44CF5A52BE5654C0584CD86840DA6141D96141D9613ED85E3ED75D3E
              D75D3ED75D3ED75D3ED85E41D96141D96140DA614CD86854C05858C15C8EE59D
              ADEEBAAAECB7A7ECB488E99D4FE17145E06A45E06A4FE17188E99DA7ECB4AAEC
              B7ADEEBA8EE59D58C15CB7E2B785CE8589CE888BD08B7EC97C51C95F60EF884D
              E8764DE87660EF8851C95F7EC97C8BD08B89CE8885CE85B7E2B7FFFFFFFFFFFF
              FFFFFFFFFFFFF0F8F044C85561F78F56F08356F08361F78F44C855F0F8F0FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F8F048CB5A64FE9557
              F78757F78764FE9548CB5AF0F8F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFF0F8F055CF679FFFC997FFBD97FFBD9FFFC955CF67F0F8F0FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FBF758C15D7ED1837F
              CF807FCF807ED18358C15DF7FBF7FFFFFFFFFFFFFFFFFFFFFFFF}
          end
          object DBGridEhWeeks: TDBGridEh
            Left = 0
            Top = 0
            Width = 334
            Height = 304
            Align = alLeft
            DataSource = DM.DataSourceWeeks
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghMultiSortMarking, dghDialogFind]
            ReadOnly = True
            TabOrder = 7
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            UseMultiTitle = True
            OnCellClick = DBGridEhWeeksCellClick
            OnDblClick = DBGridEhWeeksDblClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'UNIQW'
                Footers = <>
                Title.Caption = #1050#1086#1076' '#1086#1090#1095#1077#1090#1072
                Width = 45
              end
              item
                EditButtons = <>
                FieldName = 'DATE_START'
                Footers = <>
                Title.Caption = #1053#1072#1095#1072#1083#1086' '#1086#1090#1095'. '#1087#1077#1088#1080#1086#1076#1072
                Width = 68
              end
              item
                EditButtons = <>
                FieldName = 'DATE_STOP'
                Footers = <>
                Title.Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1087#1077#1088#1080#1086#1076#1072
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'KEY_PREV_WEEK'
                Footers = <>
                Title.Caption = #1055#1088#1077#1076'. '#1086#1090#1095#1077#1090
                Width = 46
              end
              item
                EditButtons = <>
                FieldName = 'WKS_STATE'
                Footers = <>
                KeyList.Strings = (
                  '0'
                  '1')
                PickList.Strings = (
                  #1040#1050#1058#1048#1042#1045#1053
                  #1047#1072#1082#1088#1099#1090)
                Title.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
                Width = 60
              end>
          end
          object BitBtnDelete: TBitBtn
            Left = 338
            Top = 250
            Width = 88
            Height = 24
            Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1083#1080#1096#1085#1080#1093' '#1086#1090#1095#1077#1090#1086#1074
            Caption = #1059#1076#1072#1083#1080#1090#1100
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            OnClick = BitBtnDeleteClick
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333333333000033338833333333333333333F333333333333
              0000333911833333983333333388F333333F3333000033391118333911833333
              38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
              911118111118333338F3338F833338F3000033333911111111833333338F3338
              3333F8330000333333911111183333333338F333333F83330000333333311111
              8333333333338F3333383333000033333339111183333333333338F333833333
              00003333339111118333333333333833338F3333000033333911181118333333
              33338333338F333300003333911183911183333333383338F338F33300003333
              9118333911183333338F33838F338F33000033333913333391113333338FF833
              38F338F300003333333333333919333333388333338FFF830000333333333333
              3333333333333333333888330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
          end
          object BitBtnRecalc: TBitBtn
            Left = 338
            Top = 226
            Width = 88
            Height = 24
            Hint = #1055#1077#1088#1077#1089#1095#1077#1090' '#1086#1090#1095#1077#1090#1072' '#1087#1086' '#1048#1058#1054#1043#1072#1084' '#1079#1072#1082#1072#1079#1086#1074
            Caption = #1055#1077#1088#1077#1089#1095#1077#1090
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnClick = BitBtnRecalcClick
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FF00FFFF00FF
              8484840000000000000000000000000000000000000000000000000000000000
              00848484FF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF
              000000FFFFFF000000000000FFFFFF000000000000FFFFFF000000000000FFFF
              FF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFF000000000000FFFFFF00
              0000000000FFFFFF000000000000FFFFFF000000FF00FFFF00FFFF00FFFF00FF
              000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFF000000000000FFFFFF00
              0000000000FFFFFF000000000000FFFFFF000000FF00FFFF00FFFF00FFFF00FF
              000000FFFFFF000000000000FFFFFF000000000000FFFFFF000000000000FFFF
              FF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF
              000000FFFFFF000000000000FFFFFF000000000000FFFFFF000000000000FFFF
              FF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFF000000000000FFFFFF00
              0000000000FFFFFF000000000000FFFFFF000000FF00FFFF00FFFF00FFFF00FF
              000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFF840000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FFFFFF000000FF00FFFF00FFFF00FFFF00FF
              000000FFFFFF840000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF
              FF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFF84000084000084000084
              0000840000840000840000840000FFFFFF000000FF00FFFF00FFFF00FFFF00FF
              000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000FF00FFFF00FFFF00FFFF00FF84848400000000000000000000000000
              0000000000000000000000000000000000848484FF00FFFF00FF}
          end
          object BitBtnPrint: TBitBtn
            Left = 426
            Top = 250
            Width = 88
            Height = 24
            Hint = #1055#1077#1095#1072#1090#1100' '#1086#1090#1095#1077#1090#1072
            Caption = #1055#1077#1095#1072#1090#1072#1090#1100
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000CE0E0000D80E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
              22222200000000000222208888888880802200000000000008020888888BBB88
              0002088888877788080200000000000008800888888888808080200000000008
              0800220FFFFFFFF080802220F00000F000022220FFFFFFFF022222220F00000F
              022222220FFFFFFFF02222222000000000222222222222222222}
          end
          object BitBtnProtect: TBitBtn
            Left = 338
            Top = 274
            Width = 88
            Height = 24
            Hint = #1047#1072#1097#1080#1090#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1086#1090#1095#1077#1090#1072' '#1086#1090' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103
            Caption = #1047#1072#1082#1088#1099#1090#1100
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
            OnClick = BitBtnProtectClick
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFF8484
              84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFFFFFF848484848484FFFFFF848484848484FFFFFFFF00FFFF00FFFF00FF
              FF00FFFF00FF000000FF00FFFF00FFFF00FF848484FFFFFF848484FFFFFF8484
              84FFFFFF848484FF00FF848484000000000000000000000000000000FF00FF84
              8484848484848484FFFFFFFFFFFFFFFFFF848484848484848484000000000000
              000000000000000000000000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF000000FF00FFFF00FF84
              8484848484848484FFFFFFFFFFFFFFFFFF848484848484848484000000FF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFF848484FFFFFF8484
              84FFFFFF848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFFFFFF848484848484FFFFFF848484848484FFFFFFFF00FF848484000000
              000000000000000000000000000000000000848484FF00FF848484FFFFFF8484
              84FF00FFFF00FFFF00FF848484FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
              FFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848400FFFF
              FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF848484FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
              FFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848400FFFF
              FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF84848484848484848484848400FFFFFFFFFF00FFFFFF
              FFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848400FFFF
              FFFFFF00FFFF848484848484848484848484FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF848484848484848484FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          end
          object BitBtnDolg: TBitBtn
            Left = 426
            Top = 274
            Width = 88
            Height = 24
            Hint = #1055#1088#1086#1087#1080#1089#1072#1090#1100' '#1076#1086#1083#1075#1080
            Caption = #1044#1086#1083#1078#1085#1080#1082#1080
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 12
            OnClick = BitBtnDolgClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000120B0000120B00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
              003330BBBBBBBBBBB03330B000000000B03330B0FFFFFFF0B03330B0FFF00000
              0E0330B07770EEEEEEE030B0FFF0EEEEEEEE30B0FFF0EEEEEEE030B077700000
              0E0330B0FFFFFFF0B03330B0FFFFFFF0B03330B000000000B03330B007F77700
              B03330BBB07F70BBB03330000077700000333333300000333333}
          end
        end
      end
      object GroupBoxWeekReport: TGroupBox
        Left = 0
        Top = 321
        Width = 1008
        Height = 376
        Align = alClient
        Caption = 'GroupBoxWeekReport'
        TabOrder = 1
        object DBGridEhWeekReport: TDBGridEh
          Left = 2
          Top = 15
          Width = 1004
          Height = 359
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
          DataSource = DM.DataSourceWeekReport
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          FooterRowCount = 1
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
          ReadOnly = True
          SumList.Active = True
          SumList.VirtualRecords = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnKeyPress = DBGridEhWeekReportKeyPress
          Columns = <
            item
              EditButtons = <>
              FieldName = 'KEY_THEME'
              Footer.Value = #1057#1091#1084#1084#1072':'
              Footer.ValueType = fvtStaticText
              Footers = <>
              Title.Caption = #1055#1086#1079'.'
              Width = 31
            end
            item
              EditButtons = <>
              FieldName = 'THM_BRIGADE'
              Footers = <>
              Title.Caption = #1041#1088
              Width = 21
            end
            item
              EditButtons = <>
              FieldName = 'THM_MODEL'
              Footers = <>
              Title.Caption = #1052#1086#1076#1077#1083#1100
              Width = 65
            end
            item
              Checkboxes = False
              Color = clInfoBk
              EditButtons = <>
              FieldName = 'REP_DOLG'
              Footer.Color = clHighlightText
              Footer.FieldName = 'REP_DOLG'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1044#1086#1083#1075
              Width = 46
            end
            item
              EditButtons = <>
              FieldName = 'REP_ORDERS'
              Footer.FieldName = 'REP_ORDERS'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1053#1072#1088#1072#1073#1086#1090#1072#1085#1086' '#1087#1086' '#1079#1072#1082#1072#1079#1072#1084
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'REP_REKLAMA'
              Footer.FieldName = 'REP_REKLAMA'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1056#1077#1082#1083#1072#1084#1072
              Width = 52
            end
            item
              EditButtons = <>
              FieldName = 'REP_MEDIK'
              Footer.FieldName = 'REP_MEDIK'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1052#1077#1076#1080#1082
              Width = 52
            end
            item
              EditButtons = <>
              FieldName = 'REP_KWART'
              Footer.FieldName = 'REP_KWART'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1050#1074#1072#1088#1090#1072#1083
              Width = 52
            end
            item
              EditButtons = <>
              FieldName = 'REP_CORRECT'
              Footer.FieldName = 'REP_CORRECT'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
              Width = 84
            end
            item
              Color = clInfoBk
              EditButtons = <>
              FieldName = 'REP_ITOG'
              Footer.FieldName = 'REP_ITOG'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1048#1090#1086#1075#1086
              Width = 46
            end
            item
              EditButtons = <>
              FieldName = 'REP_OT4ET'
              Footer.FieldName = 'REP_OT4ET'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1054#1090#1095#1077#1090
              Width = 46
            end
            item
              Color = clInfoBk
              EditButtons = <>
              FieldName = 'REP_OSTATOK'
              Footer.FieldName = 'REP_OSTATOK'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1054#1089#1090#1072#1090#1086#1082
              Width = 46
            end
            item
              EditButtons = <>
              FieldName = 'UNIQR'
              Footers = <>
              Width = 44
            end>
        end
      end
    end
  end
  object VersionInfo: TVersionInfo
    Enabled = True
    Left = 65529
    Top = 65505
  end
  object TcpClient1: TTcpClient
    Left = 498
    Top = 363
  end
end
