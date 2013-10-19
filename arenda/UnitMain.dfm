object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'FormMain'
  ClientHeight = 703
  ClientWidth = 1012
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TSplitter
    Left = 410
    Top = 0
    Height = 703
    ExplicitLeft = 509
    ExplicitTop = 316
    ExplicitHeight = 100
  end
  object Panel4: TPanel
    Left = 413
    Top = 0
    Width = 599
    Height = 703
    Align = alClient
    Caption = 'Panel4'
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 1
      Top = 137
      Width = 597
      Height = 8
      Cursor = crVSplit
      Align = alTop
      Beveled = True
      ExplicitTop = 177
      ExplicitWidth = 621
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 145
      Width = 597
      Height = 557
      Align = alClient
      Caption = #1054#1090#1095#1077#1090' '#1086' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1103#1093
      TabOrder = 0
      object DBGridEh2: TDBGridEh
        Left = 2
        Top = 15
        Width = 593
        Height = 540
        Align = alClient
        DataSource = DM.DataSourceArenda
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        TitleLines = 2
        Columns = <
          item
            EditButtons = <>
            FieldName = 'KEY_UNIQV'
            Footer.Value = #1048#1090#1086#1075#1086':'
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1050#1086#1076' '#1084#1072#1096#1080#1085#1099
            Width = 48
          end
          item
            EditButtons = <>
            FieldName = 'KEY_THEME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1055#1086#1079'.'
            Width = 30
          end
          item
            EditButtons = <>
            FieldName = 'LU_ARN_ACTIONS'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1057#1086#1073#1099#1090#1080#1103
            Width = 98
          end
          item
            EditButtons = <>
            FieldName = 'ARN_DATE'
            Footer.FieldName = 'UNIQA'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072
            Width = 61
          end
          item
            EditButtons = <>
            FieldName = 'MONEY'
            Footer.FieldName = 'MONEY'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1044#1101#1085#1075#1080
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'CURRENCY'
            Footer.FieldName = 'CURRENCY'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1044#1101#1085#1075#1080' ('#1091'.'#1077'.)'
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = 'KEY_EXCHANGE'
            Footers = <>
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'BALANCE'
            Footer.FieldName = 'BALANCE'
            Footer.ValueType = fvtFieldValue
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1054#1089#1090#1072#1090#1086#1082' ('#1091'.'#1077'.)'
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'PREV_UNIQA'
            Footers = <>
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'KEY_ARN_ACTION'
            Footers = <>
            Visible = False
            Width = 25
          end
          item
            EditButtons = <>
            FieldName = 'UNIQA'
            Footers = <>
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'KEY_SMN_START'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #8470' '#1089#1084#1077#1085#1099
            Width = 42
          end
          item
            EditButtons = <>
            FieldName = 'KEY_SMN_STOP'
            Footers = <>
            Title.Alignment = taCenter
            Visible = False
          end
          item
            DisplayFormat = 'dd.mm.yy hh:nn'
            EditButtons = <>
            FieldName = 'TIME_START'
            Footers = <>
            Title.Alignment = taCenter
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'TIME_STOP'
            Footers = <>
            Title.Alignment = taCenter
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'INFO'
            Footers = <>
            Width = 225
          end>
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 597
      Height = 136
      Align = alTop
      Caption = 'C'#1084#1077#1085#1099
      TabOrder = 1
      object DBGridEhSmena: TDBGridEh
        Left = 2
        Top = 43
        Width = 593
        Height = 91
        Align = alClient
        DataSource = DM.DataSourceSmena
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        TitleLines = 2
        Columns = <
          item
            EditButtons = <>
            FieldName = 'UNIQS'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1050#1086#1076' '#1089#1084#1077#1085#1099
            Width = 39
          end
          item
            EditButtons = <>
            FieldName = 'SMN_DATE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072
          end
          item
            EditButtons = <>
            FieldName = 'SMN_DAY_NIGHT'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1044#1077#1085#1100' - '#1053#1086#1095#1100
            Width = 43
          end
          item
            EditButtons = <>
            FieldName = 'USR_LIST'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1057#1087#1080#1089#1086#1082' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1086#1074
            Width = 118
          end
          item
            DisplayFormat = 'dd.mm.yy hh:nn'
            EditButtons = <>
            FieldName = 'SMN_TIME_START'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1095#1072#1083#1086' '#1089#1084#1077#1085#1099
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'SMN_TIME_STOP'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'SMN_WEEKEND'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1041#1091#1076#1085#1080' - '#1055#1088#1072#1079#1076#1085#1080#1082
            Width = 63
          end
          item
            EditButtons = <>
            FieldName = 'SMN_STATE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
            Width = 60
          end>
      end
      object Panel1: TPanel
        Left = 2
        Top = 15
        Width = 593
        Height = 28
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object SpeedButton2: TSpeedButton
          Left = 433
          Top = 0
          Width = 82
          Height = 28
          BiDiMode = bdRightToLeft
          Caption = #1052#1072#1096#1080#1085#1082#1080
          Flat = True
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF2F2F2F1F1
            F1FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFCFCFCF5F5F5F9F9F9FDFDFD
            E1E3E18DB38D87AF87DBDFDBFEFEFEFAFAFAF6F6F6FBFBFBFEFEFEFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAE4E4E4BC
            BCBCCCCCCCEBEBEB69BA691AA41A1CA51C5BB45BEEEEEED2D2D2BBBBBBDEDEDE
            F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFF4F4F4A3C1A32C962C629C62C1C1C13EA83E36B13934B03734A535C3C3C369
            9E6929972990B590EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FEFEFEFCFCFCF9F9F9B9DCB90EA0102BAE2E28AC2B259B2622A42316A61B0EA3
            1320A72227992823AA252EAF3116A41883C783F8F8F8FCFCFCFEFEFEFFFFFFFF
            FFFFFFFFFFFFFFFFF9F9F9E3E3E3C7C7C776B6761AA61C25AF2C2CB2323DB843
            39B63F0DA6140DA61434B53A3CB84236B53C21AD2728AE2C44A844C7C7C7E0E0
            E0F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFEEEEEEB5BDB54C964C7D957D059C052A
            B33111AA1912AA1A12AB1A11AA1911AA1911AA1914AB1C11AA1929B2300C9F0D
            7095704E964EA8B7A8EBEBEBFFFFFFFFFFFFFFFFFFFFFFFF8AC98A19A61C34B6
            3C29B02F2EB3342AB63517B02218B12321B32B2BB7352CB73622B42C19B12317
            B02227B53132B53828B02D34B63B1DA92171BF71FFFFFFFFFFFFFFFFFFFFFFFF
            2EAA2E3DBD462BBB381DB62B1DB62B1DB62B24B8323CC04881D789BCEAC0BEEA
            C288D98F40C14C27B9341DB62B1DB62B1FB72D26B93440BF49009900FEFEFEFF
            FFFFFFFFFFFDFDFD8FCC8F24AB277CD68636C04522BA3325BB3546C6558BDB94
            AAE1AD61C1625EC05FA6DFAA94DE9C4CC75925BC3621BA3232BF4279D58433B2
            3783C783FCFCFCFFFFFFFFFFFFE7E9E78DB18D389A3835B93D31C34428C13C39
            C74B81DB8C63C6687ECB7EC8E9C8CAE8CA7FCB7F5AC25E86DC913DC74E28C13C
            2FC3433ABC43349A3483AE83DFE4DFFFFFFFFFFFFF78C6782BB53444C55352D0
            652EC7462EC74648CE5E56CB63009901FEFEFEFFFFFFFFFFFFFFFFFF51B55147
            C2524FD0632EC7462EC74650D06345C55432B93C74C475FFFFFFFFFFFF61C364
            5CD67146D15E36CD4F33CC4D33CC4D48D15F33BB3E62B662FDFDFDFFFFFFFFFF
            FFFEFEFE83C38327B33049D16133CC4D33CC4D35CC4F46D15E5CD67157C05CFF
            FFFFFFFFFF71C87373D47E98E4A381E29246D6613BD35745D66045C95529A029
            E0E0E0F4F4F4F4F4F4E4E4E450A65038C0454AD6643AD35644D5607DE18F98E3
            A380D98B6BC66EFFFFFFFFFFFFF3F9F379C57928A2284CC7594DDC6C41D96240
            D96166E18126B431749D74B3B3B3B3B3B3779F771CAD2466E18041D96140D961
            4BDB6A53CB6125A0255FBA5FE6F5E6FFFFFFFFFFFFFFFFFFEAEAEA59A6593DC5
            4D48DF6945DE6745DE6755E17466E28016A91C3092303091301DA32263E07D5C
            E27A45DE6745DE6746DE6842C85351A351E8E8E8FFFFFFFFFFFFFFFFFFFFFFFF
            5DBA5D3DC54E62E6835DE7805CE77F50E5754BE47152E5765CE47C56DB7157DA
            715BE37B55E5784BE4714FE4755BE77E5DE78061E78344CA5655B755FFFFFFFF
            FFFFFFFFFFFFFFFF5BBC5B63D372CAF9D6D3FADEC0F7CF79EF9852EA7B51EA7A
            51EA7A51EA7A51EA7A51EA7A51EA7A51EA7A73EE94BBF7CBD2F9DCCAF8D670DB
            8245B345FFFFFFFFFFFFFFFFFFFFFFFFC3E6C30D9F0E77CD7A2DAD2F40B9467E
            F19D56EE8055EE8055EE8055EE8055EE8055EE8055EE8055EE807BF29C51C359
            2AAC2B79CD7C19A51BAEDDAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F9F3BDE3
            BDA7D7A721B12A74F5988BF6ABA1F8BA95F7B268F49266F49091F7AFA2F8BA8F
            F7AD74F69932BE408BCA8BBBE3BBEEF8EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF8CCF8C40C44FBBFCCFD3FDE03CB43F65D07181F9A77EF9
            A470D77F2DAD2FCAF8D6C0FDD361D97558BB58FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDF6ED0DA00E9EE0A555C05969C369
            59CA64A0FCBE9EFCBC54C86175C67540B743A4E3AB17A519C1E5C1FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2F2E2A5
            D9A5CEEACEFFFFFF70CA749BE3A5A2E5AC6BC76EFFFFFFD2EDD2A3D9A3DCF1DC
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFDFA8BCF8B7FCA7FF3F9F3FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentBiDiMode = False
          OnClick = SpeedButton2Click
        end
        object CheckBoxProtect: TCheckBox
          Left = 532
          Top = 0
          Width = 61
          Height = 28
          Hint = #1054#1090#1086#1073#1088#1072#1078#1072#1077#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1072#1082#1090#1080#1074#1085#1072#1103' '#1089#1084#1077#1085#1072
          Align = alRight
          Alignment = taLeftJustify
          Caption = #1047#1072#1097#1080#1090#1072
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = CheckBoxProtectClick
        end
        object CheckBoxOneSmenaOnly: TCheckBox
          Left = 0
          Top = 0
          Width = 150
          Height = 28
          Hint = '!'
          Align = alLeft
          Caption = #1057#1086#1073#1099#1090#1080#1103' '#1079#1072' '#1086#1076#1085#1091' '#1089#1084#1077#1085#1091
          TabOrder = 1
          OnClick = CheckBoxOneOnlyClick
        end
        object CheckBoxOneVehiclesOnly: TCheckBox
          Left = 150
          Top = 0
          Width = 160
          Height = 28
          Hint = '!'
          Align = alLeft
          Caption = #1057#1086#1073#1099#1090#1080#1103' '#1087#1086' '#1086#1076#1085#1086#1081' '#1084#1072#1096#1080#1085#1077
          TabOrder = 2
          OnClick = CheckBoxOneOnlyClick
        end
        object CheckBoxArenda: TCheckBox
          Left = 310
          Top = 0
          Width = 114
          Height = 28
          Hint = '!'
          Align = alLeft
          Caption = #1058#1086#1083#1100#1082#1086' '#1089' '#1086#1087#1083#1072#1090#1086#1081
          TabOrder = 3
          OnClick = CheckBoxOneOnlyClick
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 410
    Height = 703
    Align = alLeft
    Caption = 'Panel3'
    TabOrder = 1
    object GroupBoxZakazEdit: TGroupBox
      Left = 1
      Top = 1
      Width = 408
      Height = 157
      Align = alTop
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 0
      object Label6: TLabel
        Left = 16
        Top = 14
        Width = 54
        Height = 13
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        Caption = #1055#1086#1079#1099#1074#1085#1086#1081':'
        ParentBiDiMode = False
      end
      object Label1: TLabel
        Left = 122
        Top = 14
        Width = 43
        Height = 13
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        Caption = #1052#1086#1076#1077#1083#1100':'
        ParentBiDiMode = False
      end
      object Label4: TLabel
        Left = 7
        Top = 134
        Width = 67
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103':'
        ParentBiDiMode = False
      end
      object Label5: TLabel
        Left = 130
        Top = 33
        Width = 35
        Height = 13
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        Caption = #1053#1086#1084#1077#1088':'
        ParentBiDiMode = False
      end
      object DBText2: TDBText
        Left = 167
        Top = 14
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'MODEL'
        DataSource = DM.DataSourceVehicles
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 19
        Top = 32
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'KEY_THEME'
        DataSource = DM.DataSourceVehicles
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 78
        Top = 135
        Width = 320
        Height = 17
        DataField = 'INFO'
        DataSource = DM.DataSourceVehicles
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 168
        Top = 33
        Width = 41
        Height = 17
        DataField = 'NUMBER'
        DataSource = DM.DataSourceVehicles
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 299
        Top = 33
        Width = 29
        Height = 13
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        Caption = #1057#1095#1077#1090':'
        ParentBiDiMode = False
      end
      object DBText6: TDBText
        Left = 333
        Top = 33
        Width = 41
        Height = 17
        DataField = 'ACCOUNT'
        DataSource = DM.DataSourceVehicles
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 227
        Top = 14
        Width = 100
        Height = 13
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        Caption = #1045#1078#1077#1076#1085#1077#1074#1085#1099#1081' '#1074#1079#1085#1086#1089':'
        ParentBiDiMode = False
      end
      object DBText7: TDBText
        Left = 333
        Top = 14
        Width = 41
        Height = 17
        DataField = 'RENTAL'
        DataSource = DM.DataSourceVehicles
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 55
        Width = 387
        Height = 75
        Caption = #1055#1086#1087#1086#1083#1085#1077#1085#1080#1077' '#1089#1095#1077#1090#1072
        TabOrder = 0
        object ButtonAccountCharge: TSpeedButton
          Left = 86
          Top = 17
          Width = 91
          Height = 26
          BiDiMode = bdLeftToRight
          Caption = #1055#1086#1087#1086#1083#1085#1080#1090#1100
          Flat = True
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFF7F7F7E3E3E3DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
            DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFE3E3E3F7F7F7FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFCBCBCB9D9D9D979797979797979797979797979797
            9797979797979797979797979797979797979797979797979797979D9D9DCBCB
            CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FC6C6C6C6C6C6C6C6C6C6
            C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
            C6C6C6C6C6C68F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FC1C1
            C1BABABABABABABABABABABABABABABABABABABABABABABABABABABABABABABA
            BABABABABABABABABABABAC1C1C18F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF8F8F8FC1C1C1B3B3B3B0B0B0B0B0B0B3B3B3B9B9B9BCBCBCBCBCBCBCBC
            BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCC2C2C28F8F8FFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF8F8F8FBCBCBC888888767676767676888888ACACAC
            BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEC4C4C48F8F
            8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F8AB78A00990000990000
            990000990046A046C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1
            C1C1C1C7C7C78F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F68B4
            683EB24627A92F27A92F3EB246009900C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4
            C4C4C4C4C4C4C4C4C4C4C4CACACA8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF
            DFDFDF7D7D7D5CA85C45B94F17A82416A82445B94F009900AEAEAEAEAEAEB4B4
            B4C4C4C4C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7CDCDCD8F8F8FFFFFFFFFFFFFFF
            FFFFFFFFFFCFCFCF9F9F9F595959438F4349BF571DAF2E1CAF2E49BF57009900
            7E7E7E7E7E7E919191C1C1C1CACACACACACACACACACACACACACACACFCFCF8F8F
            8FFFFFFFFFFFFFFFFFFFFFFFFF2BAC302BB2342BB2342BB23452C86328BB3D28
            BB3C52C8632BB2342BB2342BB2342BB23479B679CECECECECECECECECECECECE
            CECECED3D3D38F8F8FFFFFFFFFFFFFFFFFFFFFFFFF2EB63834C74F34C74F34C7
            4F33C74E33C74E33C74E33C74E34C74F34C74F34C74F5CD27168B568D1D1D1D1
            D1D1D1D1D1D1D1D1D1D1D1D6D6D68F8F8FFFFFFFFFFFFFFFFFFFFFFFFF30B93D
            3BD05A3AD0593AD0593AD0593AD0593AD0593AD0593AD0593AD0593BD05A61D9
            7A6AB76AD4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D8D8D88F8F8FFFFFFFFFFFFFFF
            FFFFFFFFFF4AC255B1EFC0BAF1C8ABEEBB7FE69852DE754CDD6F7FE698A0ECB2
            B8F0C6B1EFC095EBAA6CB96CD8D8D8D8D8D8D8D8D8D8D8D8D8D8D8DCDCDC8F8F
            8FFFFFFFFFFFFFFFFFFFFFFFFF35AD3500990000990000990097F2B062EA875A
            E98097F2B00099000099000099000099009AC79ADBDBDBDBDBDBDBDBDBDBDBDB
            DBDBDBDFDFDF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F73BF
            7379F29D59EF8558EF8479F29D009900DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
            DEDEDEDEDEDEDEDEDEDEDEE1E1E18F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF8F8F8F74C07482FAA87AF9A27CF9A482FAA8009900E1E1E1E1E1E1E1E1
            E1D9D9D9D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D9D9D98F8F8FFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF8F8F8F75C175C5FFD8E6FFEEE9FFF0C5FFD8009900
            E5E5E5E5E5E5E5E5E5D5BC98D78307D78307D78307D78307D78307DBA556D783
            07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FA5D2A500990000990000
            99000099005FB95FE7E7E7E7E7E7E7E7E7D3A96BE2A144E2A144E2A144E2A144
            E2A144DC9124C8C0B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FECEC
            ECEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAD4AA6CE9AF5EE4
            9C39E7A64EEAB66CE09B38DDB67DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF8F8F8FEFEFEFEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
            EDD6AC6EF1BD7CF0B76FF2C790DA8A15CDA872FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF8F8F8FF0F0F0EEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
            EEEEEEEEEEEEEEEEEED6AC6EF7C993F9D5ABE7AA55CDA872FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FF7F7F7F9F9F9F9F9F9F9
            F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9DDB67DFAD7ADE9AE5EDDB77FFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBD8F8F
            8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F9D8B70CD851DCD
            A872FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentBiDiMode = False
          OnClick = ButtonAccountChargeClick
        end
        object ButtonPay: TSpeedButton
          Left = 188
          Top = 17
          Width = 89
          Height = 26
          BiDiMode = bdLeftToRight
          Caption = #1054#1087#1083#1072#1090#1080#1090#1100
          Flat = True
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFDFDFDF1F1F1EBEBEBF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF7F7F7EBEBEBF1F1F1FCFCFCFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F1F298AABA708CA5B0B5BAECECECFDFDFD
            FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF0F0F0B9BDC0728DA58CA3B5E6E8E9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9CC1DE44A8FF4EAEFF41
            96E17E9BB2DBDBDBFAFAFAFFFFFFFFFFFFFCFCFCE0E0E094A5B35191CA4EAFFF
            47ACFF94BDDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89C5
            F551AEFE45A8FF56B2FF43A8FD6491B7C7C8C9F5F5F5F8F8F8CECFCF6D94B63F
            A3F954B1FF47A9FF53AEFE7BBFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFA9D4F74CABF949ADFF37A5FF51B2FF4CADFE4E94CE96A5B2A9B0
            B65D8DB84AAEFF53B3FF36A5FF41AAFF50ADFA9CCDF5FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFE9F3FC5BB0F465BEFF33A8FF2EA6FF44B0FF
            53B9FF429FEA3F98E44FB4FF49B2FF31A7FF2EA6FF61BBFF56AFF7D5EBFDFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6BB5F75CBBFC49
            B7FF29AAFF27A9FF3BB2FF4DB9FF4EB9FF3DB3FF28A9FF29AAFF3FB3FF5FBFFF
            5BA9E9FDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFB5D5F051B6FE55C1FF2CB0FF27AFFF27AEFF2BB0FF2BB0FF27AEFF27AFFF2A
            AFFF53C0FF59BFFF7FAED6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE0E6EB45A7F350C5FF30BAFF24B5FF25B5FF24B5FF24B5
            FF25B5FF24B5FF2CB8FF50C5FF48AEF8D3DEE7FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFEFEFEF2F2F2B9BCC04D99D648C3FF2CBFFF20BBFF
            22BBFF22BBFF22BBFF22BBFF21BBFF27BEFF43C4FF469DE0B0B5BAEFEFEFFEFE
            FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAE0E0E09CA7B24C96CE47C1FF38
            C6FF1EC0FF1FC0FF1FC0FF1FC0FF1FC0FF1FC0FF1FC0FF1DC0FF35C6FF48C1FE
            459CDD829AB0DCDCDCF9F9F9FFFFFFFFFFFFFEFEFEFAFAFAD0D0D06C92B63DA9
            F246CCFF31CEFF1EC7FF1BC6FF1CC6FF1CC6FF1CC6FF1CC6FF1CC6FF1CC6FF1B
            C6FF1EC7FF2CCDFF47D1FF3EB2F86490B6C9C9C9F7F7F7FEFEFEE7E9EAC1C8CE
            5994C540BDFE42D7FF20D0FF14CBFF16CCFF17CCFF18CCFF18CCFF18CCFF18CC
            FF18CCFF18CCFF17CCFF16CCFF13CBFF1FCFFF3FD6FF41C0FE5495CAB2BEC8DD
            E0E2A1CBEE65B4EE3ECDFF28D9FF14D2FF16D2FF19D3FF19D3FF17D3FF15D3FF
            15D2FF15D2FF15D2FF15D2FF15D2FF17D3FF19D3FF19D3FF16D3FF12D2FF24D8
            FF3DD0FF57B3F38CC3F160B5F53CB7F763EAFF79EBFF83ECFF8AEEFF8BEEFF89
            EEFF76EBFF40E0FF19D8FF11D7FF11D7FF17D8FF39DEFF71E9FF88EDFF8BEEFF
            8AEEFF83ECFF79EBFF67EEFF3DBDF955B3F6ACD6F87EC2F57DCAF89ED5F99ED4
            F99DD3F99DD3F99CD2F993D2F981EAFE2DE1FF0CDDFF0DDDFF25E0FF7CECFF91
            D4FA9BD2F99DD3F99DD4F99FD4F9A0D4F985CEF975BAEF9FCCF1FFFFFFF5FAFE
            BCDDF9ABD5F8AED6F8AED6F8AED6F8B2D8F986C0F45ED1FA41ECFF0CE3FF0AE3
            FF3AEAFF60D8FB6CB4F3B4D9F9AFD6F8ADD5F8ADD5F8ABD5F8B8DCFBEDF4FAFD
            FDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0EFFC42B7F4
            42F1FF14E8FF0EE8FF3DF1FF42BEF6CFE6FAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFCFDFE67B9F346E7FD21F1FF1CF0FF43EFFF47AFF3F4F8FDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFA8D2F943D4FA2BF9FF2CF7FF48DDFB90C8F5FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3DFE93EC1FC51FCFF52FE
            FF41C8F8C0DEF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FAFB
            6EBEF796F3FE9FFAFF64BDF4EDF6FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFB8DAF869BBF569BBF5B0D8F8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCECFB80BFF576BAF5D7EBFBFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentBiDiMode = False
          OnClick = ButtonPayClick
        end
        object ButtonRollback: TSpeedButton
          Left = 287
          Top = 18
          Width = 89
          Height = 26
          BiDiMode = bdLeftToRight
          Caption = #1042#1077#1088#1085#1091#1090#1100
          Flat = True
          Glyph.Data = {
            D2050000424DD205000000000000920300002800000018000000180000000100
            08000000000040020000120B0000120B0000D7000000D700000000000000FFFF
            FF00FF00FF009DDDFE005DC4FD0061C7FE0081CFFC0099DAFE00F3FAFE0055BE
            FB007BCAFB00A6DBFC00C7E8FD00D1ECFD0042ADF70043ADF70047B0F90048B1
            F80049B3F9004AB4F9004DB5FB004DB1F70051B5F80066BDF900C6E7FD00D3ED
            FE0035A1F40037A3F40039A5F5003CA6F8003BA6F5003CA7F5003DA8F6003FAA
            F6003FA5F40041A6F40043A8F50043A9F50049AFFE0060B7F70074BFF7009DD2
            FA00B6DFFC00B5DDFB00F3FAFF00F2F9FE002392F0002795F1002896F1002C99
            F2002F9CF300309CF300309DF30036A0F50047ADFE0056AFF5005DB0F5005FB1
            F50061B3F50071BBF70092C9F800A6D5FA00C8E4FB00CAE5FC00CCE7FC00D8EC
            FD00D9EDFD001283EC001383EC001585ED001686ED001787ED001888ED001989
            EE001A8AEE001B8AEE001E8EEF001F8EEF00208FEF002190F00057AAF3005BAD
            F4005FACF30062AFF30071B7F50087C0F5008BC3F60090C7F700A7D1F800C5E1
            FB00C4E0FA00C6E2FB00C8E3FB00DFEEFC000073E8000073E7000071E300006F
            E000006CDA00006AD6000068D2000066CF000065CC000061C5000060C100005F
            C000005EBE00005EBD00005CBA00005BB800005AB5000058B2000174E8000275
            E8000272E4000272E3000261C2000375E9000376E9000373E5000371E100036D
            D9000365CA000361C1000573E3000678E900087AEA00076ED6000662BF000A7C
            EA000B7DEA000B7AE7000C7EEB000D7EEB000E7FEB000F80EB001081EC00107C
            E9000C5BAB000B55A0000B549E000E68C4000E67C2000C5AAA000C59A8000C5A
            A8000C59A7000C58A6000C57A4000B539C000B529B00147FEA001983EB002085
            EB001F84E600246AB200308DEC002875C400266FB9003693EE004096EE003F95
            EC004197EE00459BEF00509FEF0060A8F1004980B8004B83BC006BB1F30070B0
            F20084BDF40088C0F5008FC2F50093C5F6009FCBF6009EC9F400A5CFF800AFD3
            F800AED2F700B0D4F800BFDCF900B9D5F100B8D4F000A5BED700A0B8D0009AB2
            C900B1CCE600F0F7FE00025EBD002C81D900256BB40080B9F40071A3D7006490
            BE00BDD9F600A3BBD400A1B9D20097ADC400EFF6FE00EEF5FD00FEFEFE00FDFD
            FD00F9F9F900F8F8F800F6F6F600F5F5F500F4F4F400F3F3F300EFEFEF00ECEC
            EC00EBEBEB00E6E6E600E0E0E000D9D9D900D7D7D70002020202020202028A8F
            90939494939102020202020202020202020202028D8E79636667696A687B9694
            020202020202020202028D8D7361BDC0B7C3B8B9C1BE6FBC9592020202020202
            028D7F5EA1B5CFCECDCCCED0D3D5C59B6D809202020202028D7F5EA5C8C8C7AE
            A4A0A0A4AFCAD1D6A66E8091020202028D5EA50101B1895E5E5E5E5E5E89B2CC
            D4A76C8C0202028D72A00101BF5E5E5E5E5E5E5E5E5E5EAECAD49E749302028D
            5EB401B15E5E5E5E9CA95E5E5E5E5E5EB1CEC46B8B029A7CA201BB977671709C
            C6BF5E5E5E5E5E5E99C8D29D7A8F9A7EAD01B0858481A3C601BF5E5E5E5E5E5E
            5EAECBC065909A885A01524645A80101015DB4B4B4B4B4AC5EA5C9BA64909A48
            5B01504C5401010101010101010101B45EA0C8B662919A4E3E01382F2D010101
            01010101010101B45EA001C2608F9A303F013B343741010101010101010101B4
            5EA501B45F8A9A323D012B1C1B234201015B5655AABFBFA55EAE01BF5E8A9A35
            27010815211F254201574B4482755E5E9901019C788A029A0F0D0118110F2024
            423C4D46867D5E5EB101B45E8D02029A100A01010B120E1E22394F49887E70AE
            01019C728D0202029A090701010C16201A312E4A4398B30101A55E8D02020202
            9A36050301012C2A283A515358010101A55E7F8D02020202029A260406190101
            010101010101B49C5E7F8D020202020202029A9A14131729403F5C59AB9F7077
            8D8D020202020202020202029A9A1D1B332F4D4787838D8D0202020202020202
            0202020202029A9A9A9A9A9A9A9A0202020202020202}
          ParentBiDiMode = False
          OnClick = ButtonRollbackClick
        end
        object EditMoney: TEdit
          Left = 9
          Top = 22
          Width = 60
          Height = 21
          BevelKind = bkFlat
          BiDiMode = bdLeftToRight
          BorderStyle = bsNone
          ParentBiDiMode = False
          TabOrder = 0
          OnKeyPress = EditMoneyKeyPress
        end
        object EditArnInfo: TEdit
          Left = 8
          Top = 50
          Width = 368
          Height = 19
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 1
        end
      end
    end
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 158
      Width = 408
      Height = 544
      Align = alClient
      DataSource = DM.DataSourceVehicles
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      TitleLines = 2
      Columns = <
        item
          EditButtons = <>
          FieldName = 'KEY_THEME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1087#1086#1079'.'
          Width = 27
        end
        item
          EditButtons = <>
          FieldName = 'MODEL'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1084#1086#1076#1077#1083#1100
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'NUMBER'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1085#1086#1084#1077#1088
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'ACCOUNT'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1057#1095#1077#1090
          Width = 47
        end
        item
          EditButtons = <>
          FieldName = 'RENTAL'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1042#1079#1085#1086#1089
          Width = 47
        end
        item
          EditButtons = <>
          FieldName = 'BALANCE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1054#1089#1090#1072#1090#1086#1082' ('#1075#1088#1085'.)'
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'PAYOUT'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1057#1088#1086#1082' ('#1076#1085#1077#1081')'
          Width = 57
        end>
    end
  end
  object TcpClient1: TTcpClient
    Left = 27
    Top = 419
  end
end
