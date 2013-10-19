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
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 251
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
  object GroupBoxOrders: TGroupBox
    Left = 0
    Top = 256
    Width = 995
    Height = 406
    Align = alClient
    Caption = 'GroupBoxOrders'
    TabOrder = 0
    object DBGridEhOrders: TDBGridEh
      Left = 2
      Top = 15
      Width = 991
      Height = 389
      Align = alClient
      ColumnDefValues.AlwaysShowEditButton = True
      ColumnDefValues.AutoDropDown = True
      DataSource = DataSourceOrders
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDialogFind]
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = DBGridEhOrdersKeyPress
      Columns = <
        item
          EditButtons = <>
          FieldName = 'KEY_THEME'
          Footers = <>
          Title.Caption = #1055#1086#1079'.'
          Width = 34
        end
        item
          EditButtons = <>
          FieldName = 'LU_ORD_TYPE'
          Footer.FieldName = 'LU_ORD_TYPE'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1058#1080#1087' '#1079#1072#1082#1072#1079#1072
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'ORD_COST'
          Footer.FieldName = 'ORD_COST'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072
          Width = 44
        end
        item
          EditButtons = <>
          FieldName = 'ORD_HOURS'
          Footer.FieldName = 'ORD_HOURS'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1063#1072#1089
          Width = 35
        end
        item
          EditButtons = <>
          FieldName = 'ORD_ITOG'
          Footer.FieldName = 'ORD_ITOG'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1048#1090#1086#1075
          Width = 42
        end
        item
          AlwaysShowEditButton = False
          AutoDropDown = False
          DropDownBox.AutoFitColWidths = False
          DropDownBox.ColumnDefValues.Title.EndEllipsis = True
          DropDownBox.ColumnDefValues.Title.Orientation = tohVertical
          EditButtons = <>
          FieldName = 'TIME_START'
          Footers = <>
          Title.Caption = #1053#1072#1095#1072#1083#1086
        end
        item
          AlwaysShowEditButton = False
          AutoDropDown = False
          EditButtons = <>
          FieldName = 'TIME_STOP'
          Footers = <>
          Title.Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077
          Width = 137
        end
        item
          AlwaysShowEditButton = False
          AutoDropDown = False
          EditButtons = <>
          FieldName = 'ORD_DEPARTURE'
          Footers = <>
          Title.Caption = #1054#1090#1082#1091#1076#1072
          Width = 132
        end
        item
          EditButtons = <>
          FieldName = 'ORD_DESTINATION'
          Footers = <>
          Title.Caption = #1050#1091#1076#1072
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'ORD_PHONE'
          Footers = <>
          Title.Caption = #1058#1077#1083#1077#1092#1086#1085
        end
        item
          DropDownRows = 15
          DropDownSizing = True
          EditButtons = <>
          FieldName = 'LU_CLIENTS'
          Footers = <>
          Title.Caption = #1050#1083#1080#1077#1085#1090#1099
          Width = 141
        end
        item
          EditButtons = <>
          FieldName = 'UNIQO'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.Value = #1048#1090#1086#1075':'
          Footers = <>
          ReadOnly = True
          Width = 42
        end
        item
          EditButtons = <>
          FieldName = 'ORD_STATE'
          Footers = <>
          ReadOnly = True
          Title.Caption = 'ST'
          Width = 24
        end
        item
          EditButtons = <>
          FieldName = 'KEY_CLIENT'
          Footers = <>
          ReadOnly = True
          Title.Caption = 'CLT'
          Width = 30
        end>
    end
  end
  object GroupBoxZakazEdit: TGroupBox
    Left = 0
    Top = 0
    Width = 995
    Height = 251
    Align = alTop
    Caption = 'GroupBoxZakazEdit'
    TabOrder = 1
    object Panel2: TPanel
      Left = 2
      Top = 15
      Width = 614
      Height = 234
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object DBGridEhSmena: TDBGridEh
        Left = 0
        Top = 0
        Width = 614
        Height = 101
        Align = alClient
        DataSource = DataSourceSmena
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        OnDblClick = DBGridEhSmenaDblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'UNIQS'
            Footers = <>
            Title.Caption = #1050#1086#1076' '#1089#1084#1077#1085#1099
            Width = 39
          end
          item
            EditButtons = <>
            FieldName = 'SMN_DAY_NIGHT'
            Footers = <>
            Title.Caption = #1044#1077#1085#1100' - '#1053#1086#1095#1100
            Width = 35
          end
          item
            EditButtons = <>
            FieldName = 'SMN_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
          end
          item
            EditButtons = <>
            FieldName = 'USR_LIST'
            Footers = <>
            Title.Caption = #1057#1087#1080#1089#1086#1082' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1086#1074
            Width = 109
          end
          item
            EditButtons = <>
            FieldName = 'SMN_TIME_START'
            Footers = <>
            Title.Caption = #1053#1072#1095#1072#1083#1086' '#1089#1084#1077#1085#1099
            Width = 95
          end
          item
            EditButtons = <>
            FieldName = 'SMN_TIME_STOP'
            Footers = <>
            Title.Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077
            Width = 102
          end
          item
            EditButtons = <>
            FieldName = 'SMN_WEEKEND'
            Footers = <>
            Title.Caption = #1041#1091#1076#1085#1080' - '#1055#1088#1072#1079#1076#1085#1080#1082
            Width = 59
          end
          item
            EditButtons = <>
            FieldName = 'SMN_STATE'
            Footers = <>
            Title.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
            Width = 60
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 101
        Width = 614
        Height = 133
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object LabelCost: TLabel
          Left = 232
          Top = 43
          Width = 40
          Height = 13
          Caption = #1057#1091#1084#1084#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 298
          Top = 42
          Width = 37
          Height = 13
          Hint = #1059#1082#1072#1079#1072#1090#1100' '#1074' '#1082#1080#1083#1086#1084#1077#1090#1088#1072#1093'!'
          Caption = #1055#1088#1086#1073#1077#1075
          ParentShowHint = False
          ShowHint = True
        end
        object Label7: TLabel
          Left = 359
          Top = 42
          Width = 77
          Height = 13
          Caption = #1042#1088#1077#1084#1103' '#1087#1088#1086#1089#1090#1086#1103
        end
        object Label8: TLabel
          Left = 393
          Top = 67
          Width = 8
          Height = 13
          Caption = #1095'.'
        end
        object Label9: TLabel
          Left = 429
          Top = 67
          Width = 11
          Height = 13
          Caption = #1084'.'
        end
        object Label5: TLabel
          Left = 240
          Top = 4
          Width = 44
          Height = 13
          Caption = #1050#1083#1080#1077#1085#1090#1099
        end
        object LabelDestination: TLabel
          Left = 8
          Top = 82
          Width = 27
          Height = 13
          Caption = #1050#1091#1076#1072':'
        end
        object LabelDeparture: TLabel
          Left = 6
          Top = 44
          Width = 36
          Height = 13
          Caption = #1054#1090#1082#1091#1076#1072
        end
        object Label4: TLabel
          Left = 133
          Top = 82
          Width = 45
          Height = 13
          Caption = 'Te'#1083#1077#1092#1086#1085
        end
        object Label6: TLabel
          Left = 7
          Top = 5
          Width = 52
          Height = 13
          Caption = #1055#1086#1079#1099#1074#1085#1086#1081
        end
        object BitBtnOrder: TSpeedButton
          Left = 414
          Top = 102
          Width = 97
          Height = 28
          BiDiMode = bdLeftToRight
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            08000000000040020000120B0000120B0000000100000000000000000000FFFF
            FF00FF00FF00A4AECC009CA5C20098A1BD000233EA000333E5000333E3000432
            DD000432DA000532D8000532D7000532D2000532D1000632CD000630C300062E
            B300062DB000062DAD0005279700052695000732C6000732C3000731BF00072F
            B700062CAA00062AA4000629A100062AA10006299F0006289B00133FE100163F
            CF00234DE800254CD4003458D7003151C2002A45A1002D49AA0029439C002942
            9A004266EB004365E1004465DF004364DA004E73FC004465DC005679FB00597C
            FB005B7DFB005B7EFB005372E3005D7FFB005472DD006182FB006585FB006280
            EF00627FEB00627FE8006B8AFA00637FE6006E8CFA00637FE200708EFC004C61
            A6007592FD004E63A9007693FB007894FA00809BFC008199EF008DA5FC008399
            E5007487C8006677B0007487C700A0B3F900A5B8FC00A2B2EC00A2B2EB00B0BF
            F600B1BFEF00BDCBFC00C7D3FF00C1CCF300BBC6EA00BFCAEE00B3BDDE00A7B0
            CF00A3ACCA00A1AAC800D0DAFE000033FF000032FE00002FF7000134FE000133
            FD000134FD000133FA000133F6000133F5000133F300012EED000233F2000233
            F0000233EE000233EC00022EE3000335FF000333E9000333E700032CDA000436
            FF000432E0000432DF00052CCA00052CC3000529C0000525A8000523A1000525
            A1000628B40005249C00093BFF000A39FA000B3CFF000C3DFF000D3EFF000E3F
            FE001140FD001140F7001443FE001543FD001746FE001B49FE001C49FE001C4A
            FE002451FD002551FB002B57FD002C57FD002D58FD002F59FD00305AFD003059
            FA003159F000365FFD003B63FD003458DF003D65FC003E65FC004067FC00436A
            FC004166F300466CFC004A6FFC004B70FC004D71FC005275FE005678FF005578
            FB005E7EFE005E7FFB006080FE005F80FD006382FE006180F400627FEC006C8A
            FD00819AFF008099FD00829BFF008099F900849DFF00839CFE008199F500879F
            FF008199F3008AA1FF0090A6FB009AAFFE009DB1FE00A0B3FE00A1B4FD00A4B6
            FE00A1B2F200B0BFFD00B0BFF900BAC8FE00BFCCFF00C0CCFF00C1CEFF00C3CF
            FF00C0CCFC00C0CCFB00C5D0FF00C0CCF900CBD5FF00CDD7FE00D3DCFE00D6DE
            FD00D8E0FE00EFF2FE00F5F7FF00002AEE000128E700022BE100042EED00052D
            EC000733F3000022DC00001ED500001ED3000227E4000019CC00011ED0000219
            BD000219BA000219B9000319B60004169C000115BB000213AC000313A9000312
            9E000011BC00010FB200010DAB00010DA80003119900000CB200000BB100020D
            A600020DA400020DA300020DA100020C9E00020C9800020C950000009A000000
            99000000960000009500FEFEFE00FDFDFD00F9F9F900F6F6F600F4F4F400F3F3
            F300EFEFEF00ECECEC00EBEBEB00E6E6E600E0E0E000D8D8D800020202020202
            0202F0F1ECEDEDEDF3F10202020202020202020202020202F0E07A111A1B1C1E
            1D78E6F302020202020202020202F0E97510254A59035B044B28157BEFF20202
            0202020202F0DC0E2D56F9F8F7F7F8FAFDFF05291FDDF20202020202F0DB0B3D
            F4F4CBBA342C2F3650F6FBFF4114DDF102020202E4093A0101512009090A0C0D
            0E2152F7FE431FEE020202F0702A0101B06F07070872090A0C0D0F50F6FE2679
            F30202DE6EC301BC696A6A6BB0010147090C0D0F52F85A1EE102E8CF9A01CB83
            64646566AD0101B208090B0D23F4FC2777F1E266B401B76162616163AB0101B0
            6F08090C0E4FF64C13F2D563BE01A07F80AFACAABE0101C3B0B2A8090C3FF558
            12ECD36DC0019F8889010101010101010101C5720A2CF45619ECD681C401A28C
            8E010101010101010101C507092B015718EBD1875401429496B7B6B5C60101BF
            ABADA76F723B015517EACD8AB901BD9D2E9E9B97B50101AE6064690608BA0149
            16F05F8BA501CC38A333A19CB70101B17163666B2201012476F0028599C8015C
            3E3C37A1B90101B37C61656ABC01550EDF02025D9846010153453C329D948C87
            7E61654D01019574F00202028431B80101C944359E968D897F82BB01013A0BE5
            020202025D8E384E0101CCC0AFA9A4A6B90101013973DAF002020202025D8F38
            48CA0101010101010101C29207D9F0020202020202025D862E3040B8C7C654C1
            AA91686CE3F0020202020202020202025D899394908A867C6167D8E702020202
            020202020202020202025D5E7DD2D0CED4D70202020202020202}
          Layout = blGlyphRight
          ParentFont = False
          ParentBiDiMode = False
          OnClick = ButtonOnceOrderClick
        end
        object BitBtnRefresh: TSpeedButton
          Left = 516
          Top = 102
          Width = 90
          Height = 28
          Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
          BiDiMode = bdLeftToRight
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
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
        object Label2: TLabel
          Left = 474
          Top = 5
          Width = 39
          Height = 13
          Caption = #1042#1088#1077#1084#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
          WordWrap = True
        end
        object EditMinute: TEdit
          Left = 403
          Top = 59
          Width = 25
          Height = 18
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          TabOrder = 10
          OnKeyUp = EditDepartureKeyUp
        end
        object EditHour: TEdit
          Left = 367
          Top = 59
          Width = 25
          Height = 18
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          TabOrder = 9
          OnKeyUp = EditDepartureKeyUp
        end
        object EditCost: TEdit
          Left = 240
          Top = 59
          Width = 41
          Height = 18
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          TabOrder = 6
          OnKeyUp = EditDepartureKeyUp
        end
        object EditDistance: TEdit
          Left = 306
          Top = 59
          Width = 44
          Height = 18
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          TabOrder = 8
          OnKeyUp = EditDepartureKeyUp
        end
        object ComboBoxOrdType: TComboBox
          Left = 86
          Top = 21
          Width = 135
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          Style = csDropDownList
          DropDownCount = 9
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 7
          Text = 'babene@mail.ru'
          OnKeyUp = EditDepartureKeyUp
          Items.Strings = (
            'babene@mail.ru')
        end
        object CheckBoxOrdType: TCheckBox
          Left = 77
          Top = 4
          Width = 142
          Height = 17
          Hint = #1091#1089#1090#1072#1085#1086#1074#1080' '#1087#1090#1080#1095#1082#1091', '#1095#1090#1086#1073#1099' '#1092#1080#1082#1089#1080#1088#1086#1074#1072#1090#1100' '#1085#1072' '#1086#1076#1085#1086#1084' '#1090#1080#1087#1077' '#1079#1072#1082#1072#1079#1072
          Alignment = taLeftJustify
          Caption = #1058#1080#1087' '#1079#1072#1082#1072#1079#1072
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          OnKeyUp = EditDepartureKeyUp
        end
        object EditDestination: TEdit
          Left = 16
          Top = 98
          Width = 108
          Height = 18
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          TabOrder = 2
          OnKeyUp = EditDepartureKeyUp
        end
        object EditDeparture: TEdit
          Left = 16
          Top = 59
          Width = 203
          Height = 18
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 1
          OnKeyUp = EditDepartureKeyUp
        end
        object EditPhone: TEdit
          Left = 133
          Top = 98
          Width = 87
          Height = 18
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          TabOrder = 3
          OnKeyUp = EditPhoneKeyUp
        end
        object EditTheme: TEdit
          Left = 16
          Top = 22
          Width = 46
          Height = 18
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          TabOrder = 0
          OnKeyUp = EditDepartureKeyUp
        end
        object DateTimePickerDate: TDateTimePicker
          Left = 481
          Top = 20
          Width = 127
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkSoft
          Date = 39051.000000000000000000
          Time = 39051.000000000000000000
          DateFormat = dfLong
          TabOrder = 4
        end
        object DateTimePickerTime: TDateTimePicker
          Left = 539
          Top = 45
          Width = 68
          Height = 21
          Date = 0.809614432873786400
          Time = 0.809614432873786400
          Kind = dtkTime
          TabOrder = 5
        end
        object DBLookupComboboxEhDiscount: TDBLookupComboboxEh
          Left = 241
          Top = 20
          Width = 193
          Height = 21
          EditButtons = <>
          KeyField = 'UNIQC'
          ListField = 'CLT_NAME'
          ListSource = DataSourceClients
          TabOrder = 12
          Visible = True
        end
      end
    end
    object Panel3: TPanel
      Left = 616
      Top = 15
      Width = 377
      Height = 234
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Calendar: TMonthCalendar
        Left = 0
        Top = 25
        Width = 377
        Height = 160
        Align = alClient
        Date = 38809.419349490740000000
        TabOrder = 0
        WeekNumbers = True
        OnClick = CheckBoxCalendarClick
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 377
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvNone
        TabOrder = 1
        object CheckBoxProtect: TCheckBox
          Left = 310
          Top = 1
          Width = 66
          Height = 23
          Align = alRight
          BiDiMode = bdRightToLeft
          Caption = #1047#1072#1097#1080#1090#1072
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 0
          OnClick = CheckBoxProtectClick
        end
        object CheckBoxCalendar: TCheckBox
          Left = 1
          Top = 1
          Width = 119
          Height = 23
          Align = alLeft
          Alignment = taLeftJustify
          BiDiMode = bdRightToLeft
          Caption = #1059#1082#1072#1079#1072#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
          ParentBiDiMode = False
          TabOrder = 1
          OnClick = CheckBoxCalendarClick
        end
        object BitBtnDeleteOrder: TBitBtn
          Left = 225
          Top = 1
          Width = 89
          Height = 24
          Caption = #1059#1076#1072#1083#1080#1090#1100
          Enabled = False
          TabOrder = 2
          Visible = False
          OnClick = BitBtnDeleteOrderClick
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
        object CheckBoxGarbage: TCheckBox
          Left = 162
          Top = 3
          Width = 50
          Height = 20
          BiDiMode = bdRightToLeft
          Caption = #1052#1091#1089#1086#1088
          ParentBiDiMode = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = BitBtnRefreshClick
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 185
        Width = 377
        Height = 49
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvNone
        TabOrder = 2
        object Label1: TLabel
          Left = 8
          Top = 7
          Width = 54
          Height = 13
          Caption = #1055#1086#1079#1099#1074#1085#1099#1077
        end
        object CheckBoxKeyOrdType: TCheckBox
          Left = 250
          Top = 6
          Width = 79
          Height = 17
          BiDiMode = bdRightToLeftNoAlign
          Caption = #1058#1080#1087' '#1079#1072#1082#1072#1079#1072
          ParentBiDiMode = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BitBtnRefreshClick
        end
        object CheckBoxClients: TCheckBox
          Left = 81
          Top = 6
          Width = 73
          Height = 17
          Hint = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1082#1083#1080#1077#1085#1090#1072
          Alignment = taLeftJustify
          BiDiMode = bdRightToLeft
          Caption = #1050#1083#1080#1077#1085#1090#1099
          ParentBiDiMode = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BitBtnRefreshClick
        end
        object EditThemeFilter: TEdit
          Left = 8
          Top = 23
          Width = 58
          Height = 21
          Hint = #1095#1077#1088#1077#1079' '#1079#1072#1087#1103#1090#1091#1102'-'#1085#1077#1089#1082#1086#1083#1100#1082#1086' '#1087#1086#1079#1099#1074#1085#1099#1093
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnKeyPress = EditThemeFilterKeyPress
        end
        object DBLookupComboboxEhClients: TDBLookupComboboxEh
          Left = 81
          Top = 24
          Width = 155
          Height = 21
          DropDownBox.Rows = 15
          EditButtons = <>
          KeyField = 'UNIQC'
          ListField = 'CLT_NAME'
          ListSource = DataSourceClients
          TabOrder = 3
          Visible = True
          OnChange = BitBtnRefreshClick
        end
        object DBLookupComboboxEhOrdType: TDBLookupComboboxEh
          Left = 250
          Top = 24
          Width = 121
          Height = 21
          EditButtons = <>
          KeyField = 'COD_ORD_TYPE'
          ListField = 'NAME_ORD_TYPE'
          ListSource = DataSourcepSOrdType
          TabOrder = 4
          Visible = True
          OnChange = BitBtnRefreshClick
        end
        object CheckBoxClientsOnly: TCheckBox
          Left = 221
          Top = 6
          Width = 15
          Height = 17
          Hint = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1079#1072#1082#1072#1079#1099' '#1089' '#1076#1080#1089#1082#1086#1085#1090#1085#1099#1084#1080' '#1085#1086#1084#1077#1088#1072#1084#1080
          BiDiMode = bdRightToLeft
          ParentBiDiMode = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = BitBtnRefreshClick
        end
        object CheckBoxOrdFirmaOnly: TCheckBox
          Left = 353
          Top = 6
          Width = 15
          Height = 17
          Hint = #1042#1089#1077' '#1090#1086#1083#1100#1082#1086' '#1079#1072' '#1073#1077#1079#1085#1072#1083#1080#1095#1085#1099#1081' '#1088#1072#1089#1095#1077#1090
          BiDiMode = bdRightToLeft
          ParentBiDiMode = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = BitBtnRefreshClick
        end
      end
    end
  end
  object VersionInfoOrders: TVersionInfo
    Enabled = True
    Left = 416
    Top = 496
  end
  object DataSourceOrders: TDataSource
    DataSet = FIBDataSetOrders
    Left = 64
    Top = 565
  end
  object FIBDataSetOrders: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusModified]
    UpdateSQL.Strings = (
      'UPDATE ORDERS'
      'SET '
      '    KEY_THEME = :KEY_THEME,'
      '    KEY_ORD_TYPE = :KEY_ORD_TYPE,'
      '    ORD_COST = :ORD_COST,'
      '    ORD_HOURS = :ORD_HOURS,'
      '    TIME_START = :TIME_START,'
      '    TIME_STOP = :TIME_STOP,'
      '    ORD_DESTINATION = :ORD_DESTINATION,'
      '    ORD_DEPARTURE = :ORD_DEPARTURE,'
      '    ORD_PHONE = :ORD_PHONE,'
      '    KEY_CLIENT = :KEY_CLIENT'
      'WHERE'
      '    UNIQO = :OLD_UNIQO'
      '    ')
    RefreshSQL.Strings = (
      'SELECT'
      '    UNIQO,'
      '    ORD_STATE,'
      '    KEY_THEME,'
      '    KEY_ORD_TYPE,'
      '    ORD_COST,'
      '    ORD_HOURS,'
      '    ORD_ITOG,'
      '    KEY_SMN_START,'
      '    KEY_SMN_STOP,'
      '    TIME_START,'
      '    TIME_STOP,'
      '    ORD_DESTINATION,'
      '    ORD_DEPARTURE,'
      '    ORD_PHONE,'
      '    KEY_CLIENT'
      'FROM'
      '    ORDERS '
      'where     UNIQO = :OLD_UNIQO')
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQO,'
      '    ORD_STATE,'
      '    KEY_THEME,'
      '    KEY_ORD_TYPE,'
      '    ORD_COST,'
      '    ORD_HOURS,'
      '    ORD_ITOG,'
      '    KEY_SMN_START,'
      '    KEY_SMN_STOP,'
      '    TIME_START,'
      '    TIME_STOP,'
      '    ORD_DESTINATION,'
      '    ORD_DEPARTURE,'
      '    ORD_PHONE,'
      '    KEY_CLIENT'
      'FROM'
      '    ORDERS '
      'where key_smn_start = ?smena '
      'and ord_state in (1,3)'
      'and key_theme = ?theme'
      'order by uniqo, key_smn_start')
    AutoCalcFields = False
    Transaction = DM.FIBTransaction
    Database = DM.FIBDatabase
    UpdateTransaction = DM.FIBTransactionUpdate
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'd mmm  hh:mm:ss'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 63
    Top = 593
    oFetchAll = True
    object FIBDataSetOrdersLU_ORD_TYPE: TStringField
      FieldKind = fkLookup
      FieldName = 'LU_ORD_TYPE'
      LookupDataSet = FIBDataSet_S_ORD_TYPE
      LookupKeyFields = 'COD_ORD_TYPE'
      LookupResultField = 'NAME_ORD_TYPE'
      KeyFields = 'KEY_ORD_TYPE'
      Origin = 'S_ORD_TYPE.NAME_ORD_TYPE'
      Size = 32
      Lookup = True
    end
    object FIBDataSetOrdersUNIQO: TFIBIntegerField
      FieldName = 'UNIQO'
      Origin = 'ORDERS.UNIQO'
    end
    object FIBDataSetOrdersKEY_THEME: TFIBSmallIntField
      FieldName = 'KEY_THEME'
      Origin = 'ORDERS.KEY_THEME'
    end
    object FIBDataSetOrdersKEY_ORD_TYPE: TFIBSmallIntField
      FieldName = 'KEY_ORD_TYPE'
      Origin = 'ORDERS.KEY_ORD_TYPE'
    end
    object FIBDataSetOrdersORD_COST: TFIBFloatField
      FieldName = 'ORD_COST'
      Origin = 'ORDERS.ORD_COST'
    end
    object FIBDataSetOrdersORD_HOURS: TFIBIntegerField
      FieldName = 'ORD_HOURS'
      Origin = 'ORDERS.ORD_HOURS'
    end
    object FIBDataSetOrdersORD_ITOG: TFIBFloatField
      FieldName = 'ORD_ITOG'
      Origin = 'ORDERS.ORD_ITOG'
    end
    object FIBDataSetOrdersKEY_SMN_START: TFIBIntegerField
      FieldName = 'KEY_SMN_START'
      Origin = 'ORDERS.KEY_SMN_START'
    end
    object FIBDataSetOrdersKEY_SMN_STOP: TFIBIntegerField
      FieldName = 'KEY_SMN_STOP'
      Origin = 'ORDERS.KEY_SMN_STOP'
    end
    object FIBDataSetOrdersTIME_START: TFIBDateTimeField
      FieldName = 'TIME_START'
      Origin = 'ORDERS.TIME_START'
      DisplayFormat = 'd mmm  hh:mm:ss'
    end
    object FIBDataSetOrdersTIME_STOP: TFIBDateTimeField
      FieldName = 'TIME_STOP'
      Origin = 'ORDERS.TIME_STOP'
      DisplayFormat = 'd mmm  hh:mm:ss'
    end
    object FIBDataSetOrdersORD_DESTINATION: TFIBStringField
      FieldName = 'ORD_DESTINATION'
      Origin = 'ORDERS.ORD_DESTINATION'
      Size = 250
      EmptyStrToNull = True
    end
    object FIBDataSetOrdersORD_DEPARTURE: TFIBStringField
      FieldName = 'ORD_DEPARTURE'
      Origin = 'ORDERS.ORD_DEPARTURE'
      Size = 250
      EmptyStrToNull = True
    end
    object FIBDataSetOrdersORD_PHONE: TFIBStringField
      FieldName = 'ORD_PHONE'
      Origin = 'ORDERS.ORD_PHONE'
      Size = 16
      EmptyStrToNull = True
    end
    object FIBDataSetOrdersORD_STATE: TFIBSmallIntField
      FieldName = 'ORD_STATE'
    end
    object FIBDataSetOrdersKEY_CLIENT: TFIBIntegerField
      FieldName = 'KEY_CLIENT'
    end
    object FIBDataSetOrdersLU_CLIENTS: TStringField
      FieldKind = fkLookup
      FieldName = 'LU_CLIENTS'
      LookupDataSet = FIBDataSet_CLIENTS
      LookupKeyFields = 'UNIQC'
      LookupResultField = 'CLT_NAME'
      KeyFields = 'KEY_CLIENT'
      Size = 32
      Lookup = True
    end
  end
  object FIBDataSetSmena: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQS,'
      '    SMN_TIME_START,'
      '    SMN_TIME_STOP,'
      '    SMN_STATE,'
      '    SMN_WEEKEND,'
      '    SMN_DATE,'
      '    SMN_DAY_NIGHT,'
      '    USR_LIST'
      'FROM'
      '    SMENA '
      'where smn_state=0'
      'order by uniqs')
    Transaction = DM.FIBTransaction
    Database = DM.FIBDatabase
    UpdateTransaction = DM.FIBTransactionUpdate
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 592
    Top = 464
    oFetchAll = True
    object FIBDataSetSmenaUNIQS: TFIBIntegerField
      FieldName = 'UNIQS'
    end
    object FIBDataSetSmenaSMN_TIME_START: TFIBDateTimeField
      FieldName = 'SMN_TIME_START'
    end
    object FIBDataSetSmenaSMN_TIME_STOP: TFIBDateTimeField
      FieldName = 'SMN_TIME_STOP'
    end
    object FIBDataSetSmenaSMN_STATE: TFIBSmallIntField
      FieldName = 'SMN_STATE'
      OnGetText = FIBDataSetSmenaSMN_STATEGetText
    end
    object FIBDataSetSmenaSMN_WEEKEND: TFIBSmallIntField
      FieldName = 'SMN_WEEKEND'
      OnGetText = FIBDataSetSmenaSMN_WEEKENDGetText
    end
    object FIBDataSetSmenaSMN_DATE: TFIBDateField
      FieldName = 'SMN_DATE'
    end
    object FIBDataSetSmenaSMN_DAY_NIGHT: TFIBSmallIntField
      FieldName = 'SMN_DAY_NIGHT'
      OnGetText = FIBDataSetSmenaSMN_DAY_NIGHTGetText
    end
    object FIBDataSetSmenaUSR_LIST: TFIBStringField
      FieldName = 'USR_LIST'
      Size = 250
      EmptyStrToNull = True
    end
  end
  object DataSourceSmena: TDataSource
    DataSet = FIBDataSetSmena
    Left = 592
    Top = 504
  end
  object FIBStoredProcSmenaItog: TpFIBStoredProc
    Transaction = DM.FIBTransaction
    Database = DM.FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE SMENA_ITOG'
      '(:VI_UNIQS)')
    StoredProcName = 'ITOG'
    Left = 680
    Top = 542
  end
  object FIBDataSetClientDiscont: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    CLT_NAME,'
      '    CLT_TYPE,'
      '    ADRESS,'
      '    PHONE'
      'FROM'
      '    CLIENTS '
      'where '
      '    uniqc = :uniqc')
    Transaction = DM.FIBTransaction
    Database = DM.FIBDatabase
    UpdateTransaction = DM.FIBTransactionUpdate
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 859
    Top = 552
    oFetchAll = True
  end
  object FIBDataSetClientPhone: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQC,'
      '    CLT_NAME,'
      '    CLT_TYPE,'
      '    ADRESS'
      'FROM'
      '    CLIENTS '
      'where '
      '    phone = :phone')
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 859
    Top = 600
    oFetchAll = True
  end
  object FIBStoredProc_ORDER_START: TpFIBStoredProc
    Transaction = DM.FIBTransaction
    Database = DM.FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE ORDER_START'
      '(:VI_THEME,'
      '    :VI_LOCATIONS,'
      '    :VI_TYPE,'
      '    :VI_SMN_START,'
      '    :VI_DEPARTURE,'
      '    :VI_DESTINATION,'
      '    :VI_STATE,'
      '    :VI_TIME_START,'
      '    :VI_COST,'
      '    :VI_PHONE,'
      '    :VI_CLIENT)')
    StoredProcName = 'ORDER_START'
    Left = 505
    Top = 547
  end
  object FIBStoredProc_ORDER_DELETE: TpFIBStoredProc
    Transaction = DM.FIBTransaction
    Database = DM.FIBDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE ORDER_DELETE (?VI_UNIQO, ?VI_SMN_STOP)')
    StoredProcName = 'ORDER_DELETE'
    Left = 505
    Top = 603
  end
  object FIBDataSet_S_ORD_TYPE: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    COD_ORD_TYPE,'
      '    NAME_ORD_TYPE'
      'FROM'
      '    S_ORD_TYPE '
      'order by cod_ord_type')
    Transaction = DM.FIBTransaction
    Database = DM.FIBDatabase
    UpdateTransaction = DM.FIBTransactionUpdate
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 190
    Top = 588
    oFetchAll = True
  end
  object pFIBDataSet_SMENA: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQS,'
      '    USR_LIST'
      'FROM'
      '    SMENA '
      'order by uniqs')
    Transaction = DM.FIBTransaction
    Database = DM.FIBDatabase
    UpdateTransaction = DM.FIBTransactionUpdate
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 339
    Top = 353
    oFetchAll = True
  end
  object DataSource_SMENA: TDataSource
    DataSet = pFIBDataSet_SMENA
    Left = 339
    Top = 325
  end
  object DataSourcepSOrdType: TDataSource
    DataSet = pFIBDataSetSOrdType
    Left = 896
    Top = 304
  end
  object pFIBDataSetClients: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQC,'
      '    CLT_NAME || '#39' ['#39' || UNIQC || '#39'] '#39' || CLT_INFO   CLT_NAME   '
      'FROM'
      '    CLIENTS '
      'order by clt_name')
    Transaction = DM.FIBTransaction
    Database = DM.FIBDatabase
    UpdateTransaction = DM.FIBTransactionUpdate
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 776
    Top = 318
    oFetchAll = True
  end
  object DataSourceClients: TDataSource
    DataSet = pFIBDataSetClients
    Left = 775
    Top = 303
  end
  object pFIBDataSetSOrdType: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    COD_ORD_TYPE,'
      '    NAME_ORD_TYPE'
      'FROM'
      '    S_ORD_TYPE '
      'order by 1')
    Transaction = DM.FIBTransaction
    Database = DM.FIBDatabase
    UpdateTransaction = DM.FIBTransactionUpdate
    Left = 896
    Top = 320
    oFetchAll = True
  end
  object FIBDataSet_CLIENTS: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    UNIQC                         '
      
        '    ,CLT_NAME || '#39' ['#39' || UNIQC || '#39'] '#39' || CLT_INFO   CLT_NAME   ' +
        '                            '
      'FROM'
      '    CLIENTS                        '
      'order by CLT_NAME')
    Transaction = DM.FIBTransaction
    Database = DM.FIBDatabase
    UpdateTransaction = DM.FIBTransactionUpdate
    SQLScreenCursor = crSQLWait
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 309
    Top = 587
    oFetchAll = True
  end
  object TcpClient1: TTcpClient
    Left = 487
    Top = 331
  end
end
