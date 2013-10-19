object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = #1058#1072#1082#1089#1080
  ClientHeight = 720
  ClientWidth = 1016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PrintScale = poNone
  ScreenSnap = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter6: TSplitter
    Left = 0
    Top = 411
    Width = 1016
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    MinSize = 1
    ResizeStyle = rsNone
    ExplicitTop = 394
  end
  object Splitter7: TSplitter
    Left = 0
    Top = 100
    Width = 1016
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    MinSize = 1
    ResizeStyle = rsNone
    ExplicitTop = 73
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 414
    Width = 1016
    Height = 306
    Align = alBottom
    TabOrder = 0
    object GroupBoxZakazOnline: TGroupBox
      Left = 1
      Top = 1
      Width = 1014
      Height = 304
      Align = alClient
      Caption = #1055#1086#1076' '#1079#1072#1082#1072#1079#1086#1084':'
      TabOrder = 0
      object Splitter3: TSplitter
        Left = 2
        Top = 50
        Width = 1010
        Height = 3
        Cursor = crVSplit
        Align = alTop
        Beveled = True
        MinSize = 1
        ResizeStyle = rsNone
        ExplicitTop = 59
      end
      object Splitter5: TSplitter
        Left = 392
        Top = 53
        Height = 249
        Beveled = True
        ExplicitLeft = 391
        ExplicitTop = 71
        ExplicitHeight = 256
      end
      object Splitter10: TSplitter
        Left = 603
        Top = 53
        Height = 249
        Beveled = True
        ExplicitLeft = 631
        ExplicitTop = 65
        ExplicitHeight = 256
      end
      object GroupBoxZakazEdit: TGroupBox
        Left = 395
        Top = 53
        Width = 208
        Height = 249
        Align = alLeft
        Caption = #1054#1092#1086#1088#1084#1083#1077#1085#1080#1077' '#1079#1072#1082#1072#1079#1072
        TabOrder = 0
        object ShapeLighting: TShape
          Left = 137
          Top = 20
          Width = 63
          Height = 36
          Brush.Color = clGreen
          Pen.Style = psClear
          Pen.Width = 3
          Shape = stRoundRect
        end
        object ButtonStartOrder: TSpeedButton
          Tag = 3
          Left = 137
          Top = 19
          Width = 64
          Height = 37
          Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1087#1086' '#1079#1072#1082#1072#1079#1091
          Caption = '~T~'
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = StartOrder
        end
        object ButtonReserv: TSpeedButton
          Tag = 6
          Left = 5
          Top = 227
          Width = 124
          Height = 21
          Hint = #1047#1072#1085#1077#1089#1090#1080' '#1074' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1077
          Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081
          Flat = True
          Glyph.Data = {
            CA030000424DCA03000000000000CA0200002800000010000000100000000100
            08000000000000010000120B0000120B0000A5000000A500000000000000FFFF
            FF003736ED003D3CED004442EB004F4EEA005250E0005E5DC9006462CF00433F
            C000534DD800514CC1005E59D8005F5CD7009691DC004035C6009D97DC00A09D
            C1003F3089009893B1009289B8009D97B6009288B700A09AB600ABA3B400AA9F
            B400583C5C00FF00FF00955D5F00A4676900A366680088555700A06567009D63
            6500E9E7E700D3BDBB00D0BDBB00A0675B00A56B5F00A46A5F00A47369009367
            5E00CEB6AF00C1836C00B56D4D00BF7A5C0074564800DDD9D700CA8C6900D091
            6C00BA8260008E725D00E1CEBF00D5C7BA00F6E7D900C7BFB700E68F3100E19E
            5500F3B87900F6E3CE00BCB1A500E6D9CB00B89F8000F2D9BB00E2CBB000E3CE
            B500F4DEC500DCCBB600E9D8C400EFDECA00CCC1B400F8B55C00EEC08400F2C5
            89006A5C4900E6CBA700E3C9A700B29E8300E2CAAC00B7A48C00E5D1B800C2B2
            9E00D5C5B100FFF4E500C9C1B700E9E1D700FEEFDA00E7BF8100FFD99E00E1C6
            9D00DDCCB200FCEACE00FAE9CC00B5A99200B8B7B500FFE09E00FCF8EE00C4C2
            BD00F7EBB800AFA782005C5B4D00FEFCCB00FCFBE600F0EFC400FFFFD100F2F2
            C700D3D3BB00FFFFF000FFFFF600EAEAE700B2B2B100B5B69A00E9EAD1005354
            4F00A6A7A400393A3800848F8800838E8700838F880083FFFF0087FFFF0089FF
            FF008AFFFF0097FFFF007DFAFE0084FBFF0081FAFF0096F7FB0087F4FC0069EB
            F80074F3FF0076F2FF0079F2FF0074EDFF0074EFFF007BEFFE007BE7F70080E7
            F6005DDCF3007DE9FC007DEAFC007EE0F2005CD7EF0060DAF40065E1FA00E1EF
            F200B0B4B50062C9E60049C5EA006592A100418AA60053879C000C8CC700D4E2
            ED00D8D9E600E1E2F0001A1AFB004545C5004747C0005959EE005C5DEA007575
            DA007576D000C9C9D400CCCCCC001B1B1B1B1B1B1B1B1B1B9C9C9C1B1B1B1B1B
            1D1D1E211F1A09071815119D121B1B1B1D5B3F4C3E0BA2675F3A58709E1B1B1B
            255642404D06A36865624849179C1B1B25533B504FA0996B6971734A139C1B1B
            28603644519F9A01666F6457199C1B1B296D553D520D106C01016A63081B9898
            2E925E374614050E22919BA10F1B9880989898969572160C0304020A1C1B987F
            787D7E8A98983C43414E4B59201B98937782868485949835455C5A5D1D1B9898
            8D888783908F9854342726261D1B987C989898898C8B98612A2739382C1B987A
            777A8198989898A42427472D1B1B987B798E989898976E2F23272B1B1B1B1B98
            989875767433323031261B1B1B1B}
          ParentShowHint = False
          ShowHint = True
          OnClick = ButtonDelayClick
        end
        object ButtonDelay: TSpeedButton
          Tag = 4
          Left = 129
          Top = 203
          Width = 21
          Height = 21
          Hint = #1047#1072#1085#1077#1089#1090#1080' '#1074' '#1089#1087#1080#1089#1086#1082
          Flat = True
          Glyph.Data = {
            22030000424D2203000000000000220200002800000010000000100000000100
            08000000000000010000120B0000120B00007B0000007B00000000000000FFFF
            FF00FF00FF0005710A0009881200087E10000C8414000B941600097513000C97
            17000B8B15000FA71D0017AF2900148D23001A8E2B0023B33B0028B741002DB0
            47003ACB5B003DC45E003BBB5D00339C510051D67D0058E687005EE8900057BC
            8E0075B799006ED7B600A2E4D6004ABBAE008FEAE00055C4C20098F6F7009FFF
            FF00A6FFFF009AFBFE009DFCFF009EFCFF009FFCFF00A3FDFF0095F7FD0094F6
            FC0098F7FD0098F8FD009AF9FE009AF9FD009CFAFE00A3F8FC00BFFBFE008EF2
            FA0090F3FB0091F3FC0094F5FD0093F4FC0095F6FD0094F4FC0074DFEA0085EC
            F80089EEF90089EEF8008BEFFA008DF1FB008CF0FA008DF0FA00D2F8FC0065D3
            E10073E4F2007CE5F5007DE6F6007FE8F60081E8F70080E8F50082E9F70083EA
            F80082E7F60085EAF80085EBF8008AE7F4009CF2FD0074E0F30077E2F50078E2
            F4007BE3F50066D6EE0068D8F00067D7EF006BD9F1006CDBF1006FDBF10072DE
            F20073DFF30075E0F40085E1F300A4E6F4005DD0ED0060D2EE0060D3EE0060D2
            ED0063D4EF0064D4EF0065D5EF0065D6EF0069D8F1006DD9F10049C1E40051C7
            E70054C9EA0059CDEC0059CDEB009EDEF0002FB1DB003DB9E10041BCE30045BD
            E2000F9CD00018A1D4001BA5D50023A6D50028A9D60030B1DC0030B0DB00B9E4
            F300B3E0F1000276767602020202020202020202020202764655687178737202
            020202020202027636323B45506769706E747702020202762E283139444F5765
            60626C6F760202762623293F4C435A41645F5F6A7602027626252D373E495203
            1F635F6B760202762625252C353C48380366625E76020276252525242B333A47
            0A0354617602027627252519052A3333070358537602027640301C0606203305
            09035B5676020276787803140808050B0305445976020276421D0E1813100C04
            033D4B517602027621031617120303034E343E4A76020276221B03110F031A79
            7A6D5D5C760202764D2F1E150D03037576767676760202027676767676020202
            020202020202}
          ParentShowHint = False
          ShowHint = True
          OnClick = ButtonDelayClick
        end
        object ButtonClear: TSpeedButton
          Left = 129
          Top = 227
          Width = 72
          Height = 21
          Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1079#1072#1082#1072#1079
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100
          Flat = True
          Glyph.Data = {
            8A030000424D8A030000000000008A0100002800000020000000100000000100
            08000000000000020000C30E0000C30E0000550000005500000000000000FFFF
            FF00FF00FF004071FA004274FF00497AFC00275AFF002C5FFF003664FA00386B
            FF00174AFD001A4CFF001B4DFF001D50FF002355FF002558FF002655FA002E5B
            F9002D59F400325DF1003B66F3000030FC000132FF000134FF000C3CFF00103D
            FB00103BF4001342FF001743F6001847FF001A48F9001A47F8001B46F6001D4B
            FF001C47F6001D48F6001D49F600214EFC00204BF800204CF800224DF800224C
            F400224DF1002550F400002CF800002DF800002CF600002AF300012DF600032B
            F2000431FE000733F600123BF100143EF40000009A00C0C0C000BEBEBE00BBBB
            BB00B9B9B900B6B6B600B5B5B500B3B3B300B1B1B100B0B0B000AFAFAF00AEAE
            AE00ACACAC00ABABAB00AAAAAA00A9A9A900A8A8A800A7A7A700A6A6A600A4A4
            A400A3A3A300A2A2A200A0A0A0009F9F9F009E9E9E009C9C9C009A9A9A009999
            990098989800979797006B6B6B00020202020202020202020202020202020202
            0202020202020202020202020202020202020202020202020202020202020202
            0202020202020202020202020202020202363602020202020236360202020202
            02545402020202020254540202020202360A1A3602020202362C153602020202
            54464C540202020254504F5402020202361F0B343602023630162F3602020202
            5447444D54020254514E5354020202020236220C3536362D1731360202020202
            025447434B5454504E52540202020202020236230D1932162E36020202020202
            02025447424A4D4E5154020202020202020202361E1B18333602020202020202
            0202025447474A4F54020202020202020202023625211D1C3602020202020202
            02020254424245495402020202020202020236110728260E2036020202020202
            0202543E3D434440485402020202020202360809123636290F24360202020202
            02543B3A415454453F4754020202020236030413360202362A06273602020202
            5439384054020254473E4454020202023605143602020202362B103602020202
            54373C5402020202544441540202020202363602020202020236360202020202
            0254540202020202025454020202020202020202020202020202020202020202
            0202020202020202020202020202020202020202020202020202020202020202
            0202020202020202020202020202}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = ButtonClearClick
        end
        object ButtonClients: TSpeedButton
          Left = 132
          Top = 106
          Width = 21
          Height = 21
          Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1083#1080#1077#1085#1090#1086#1074
          Flat = True
          Glyph.Data = {
            92030000424D9203000000000000920200002800000010000000100000000100
            08000000000000010000120B0000120B0000970000009700000000000000FFFF
            FF00FF00FF00ABA2A5008C676D00F15B4600F7634F00F6654F00F76C5800FAA4
            9700E9543B00F0614800F86F5600EC614500F6745800F9816A00FDD3CA00EE66
            4700FE785600F97A5B00C6705B00FFC9BC00FE896800FFAC9400ECA18C00DF61
            3900FC876400FC886500D4562B00FF875F00FF8B6400CD542200C54F1A00C752
            1C00BD4C1100B44A0800B64B0B00A25C27009C59220097561B00A76528002620
            1A00221E1A002A2826005C5A58006A66610060605F00A8C4A5005AC5580082C9
            800001940000008F00000082010000800000AEF5AE00B2F3B300078D120013A9
            220006380C0011A4250014AE2B0044A153001AB537004ECB650027BF49000631
            110033D05E0020C0500026C1560023A74B0032D46E0052535300030B0E001644
            57003282A300C3CACD002080B70046A2D300020C12003F9AD30045A4E00048AA
            E80048A6DD0049B0F6004CB6FF004DB6FF004EB7FF004EB6FE002687D100226A
            9F003FACFE003A96DA0045AEFF0045AEFD0046AFFF0047ADF90047ADF8004AB1
            FD004BB4FF004AB1FC004AAFFA001A83DC00358CD00044ACFF001E69AF00309F
            FF00277ECD00339DFF002D85D400050C1200060D1300020C16002B93F6002370
            BD003197FF002E81D0002569A900243E5700206ABA003091F9002F8DF5002029
            33001A4D8A0007132100336AAC002879DE00205EAF00030F2000226DD7002269
            D3002166CE002572E0002269CC0012418F001D5CC400184DA8001F61D1001E5D
            C7001C50B4001531670005070B001950C1000F3FAE001342B0000F35A0000206
            1100030817001A3380000727A100081448005C617F0002020202020202020202
            02020202020223210D06070202020202020202020202241F0B0C130F08052502
            020202020202221C0E1B1A10090A26333C433F3032352019161D17011511273B
            46423637393402191E14034B1812283E443D2F3140380202967C71740402023A
            418B93494502024C65696B7073026F00958F8E9085024A4F675C5D5E5A584E91
            878886898D944A506261605F545B487F84838280818A4A4A4D51636455666D8C
            767278777D7E4A4A4A52575653596E2975686A6C7A7E024A4A4A4A4A4A02022B
            2D2E797B920202024A4A4A4A02020202472C2A00020202020202020202020202
            02020202020202020202020202020202020202020202}
          Layout = blGlyphRight
          ParentShowHint = False
          ShowHint = True
          OnClick = ButtonClientsClick
        end
        object ButtonPhone: TSpeedButton
          Left = 5
          Top = 143
          Width = 21
          Height = 21
          Hint = #1050#1085#1086#1087#1082#1072
          Flat = True
          Glyph.Data = {
            52020000424D5202000000000000520100002800000010000000100000000100
            08000000000000010000120B0000120B0000470000004700000000000000FFFF
            FF00FF00FF004D484600F6FFFF005ECED60076E9F1007EDAE50003BCE2002CDE
            FF0044CEEC004DD6F2005EDAF30069DDF40076E0F50084E3F60094E6F7006997
            A000B1EDFA00C0F5FF00DCF9FF0000AFD70009A6CB003ED4F6004FD0EE0089DF
            F200ADEFFF00BEF0FB00CBF3FC0001A3CD000298C300193E480050BFDE0076DA
            F40091E6FC00099AC50047C2E8000283B2000281B0001296C2001997C100379F
            C500C8ECF800D7EBF2000078A9000178A9000177A8000177A700419CC0000076
            A8000074A600006EA0000173A5000976A7002B88B3001F4E62007AB3CD004051
            5900F0F9FD00006DA100006A9E0000669A000770A3000B6D9F001175A5002680
            AD00B1D7E900CDE6F2000B699B000F6B9D004A4A4A0002020202020202020202
            020202020202020202023D3D2F020202020202020202460339371F2015262E02
            0202020202020202023D100E0C0B1E2C0202020202020202023D1B110F0D4128
            3202020202020202023D381C1241414230310202020202020202023D3D271A04
            2B293B02020202020202020202023D3A1421232E02020202020202020202023D
            13183608250202020202020202020244363619361D3402020202020202020244
            22220507362D0202020202020202023D432A16060A3302020202020202020202
            45240917353C02020202020202020202023F403E020202020202020202020202
            02020202020202020202020202020202020202020202}
          Layout = blGlyphRight
          ParentShowHint = False
          ShowHint = True
          OnClick = ButtonPhoneClick
        end
        object Label1: TLabel
          Left = 5
          Top = 92
          Width = 24
          Height = 13
          Caption = #1050#1091#1076#1072
        end
        object Label2: TLabel
          Left = 5
          Top = 56
          Width = 36
          Height = 13
          Caption = #1054#1090#1082#1091#1076#1072
        end
        object Label3: TLabel
          Left = 5
          Top = 129
          Width = 45
          Height = 13
          Caption = #1058#1077#1083#1077#1092#1086#1085
        end
        object Label4: TLabel
          Left = 143
          Top = 92
          Width = 44
          Height = 13
          Caption = #1050#1083#1080#1077#1085#1090#1099
        end
        object Label5: TLabel
          Left = 143
          Top = 129
          Width = 54
          Height = 13
          Caption = #1055#1086#1079#1099#1074#1085#1099#1077
        end
        object ButtonTheme: TSpeedButton
          Left = 143
          Top = 143
          Width = 21
          Height = 21
          Hint = #1053#1072#1081#1090#1080' '#1087#1086#1079#1099#1074#1085#1086#1081
          Flat = True
          Glyph.Data = {
            DA020000424DDA02000000000000DA0100002800000010000000100000000100
            08000000000000010000120B0000120B0000690000006900000000000000FFFF
            FF00FF00FF00623C230062442D005339240072503300CB925E00DAA97600836E
            5800695A4600FFCF8900C2AC8600D4D0C9000A0A0900004B00000C97180017A7
            2B0025BA430034CB5B0034CB5C003ED76D00EDFFFF00F8FFFF0064A5AD003692
            AD0051D4FF00EEFBFF000089BC0039CAFF005CD3FF00091114000493C9000C96
            CF000FA1DC001CBFFF001EC1FF0021BCFB0021BAFA002BC2FE0031C2FF002882
            A50057D0FF005DBAE0008CDDFF00C1EDFF00D0F2FF000075AA00027FB600129D
            DD0017A1E0001CB1F2001BADEB001AA5E0001FB7F8001FB4F4001EAFED003FC5
            FE0045ABD7004AADD7004093B8007ACEF40072BBDD008AC5DE009DCCE200D0EB
            F700006FA5000173AA000774AC00087AB5000B84C0001498D700148AC5001697
            D50018445B0044ABDE0041A0D00099D3EF00AAD0E300BFE5F7000474AF00056B
            A5000B5B88000C4B6D001680B8002182B60000578A00035A910004649E000460
            99000454860000518800002A470000243D0002558E0002416A0003518800033E
            640006609A000E6096000D24330000447600013B650000386C00161D23000202
            020202020202020202020F0202020202020202020202020202020F0F02020202
            02020202020202020F0F14110F02020202020202020202020F151512100F0202
            02020202020202020F0F15130F020202020202020202020202020F0F02020202
            0202020202575F5A02020F0202020202020202025E29051F5202020202020202
            0202025E23190B046402676702020202025E3449392B08076863676761020202
            5E271A4C4D160D094A4B3B0A0E6659541E2C2D413C403E552128350C035D605E
            4F171B2E3A302F4220362418065C5E4E5E3F3D2A1D3846431C2225315365025E
            5E5E4847332637324456620202020202020202515845505B020202020202}
          Layout = blGlyphRight
          ParentShowHint = False
          ShowHint = True
          OnClick = ButtonThemeClick
        end
        object SpeedButtonGarbage: TSpeedButton
          Tag = 8
          Left = 151
          Top = 203
          Width = 21
          Height = 21
          Hint = #1042' "'#1050#1086#1088#1079#1080#1085#1091'"'
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC40CC87858587858587858587
            8585878585878585878585878585CC40CCFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF878585F7F6F6F7F6F6F7F6F6F7F6F6F7F6F6F7F6F6F7F6F6F7F6F68988
            88FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF878585F7F6F6CECBC8D9D5D4D1
            CECCCECBC8D9D5D4CFCCC9F7F6F6898787FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF878585F7F6F6C4C0BCD7D3D2CBC7C4C4C0BCD7D3D2C7C3BFF7F6F68886
            86FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF878585F7F6F6BBB4AFD6D1D0C4
            BEBBBBB4AFD6D1D0C0B9B6F7F6F6888686FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF878585F7F6F6B2A8A3D4CFCDBEB6B2B2A8A3D4CFCDB9B0ACF7F6F68886
            86FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF878585F7F6F6AEA29DD5CFCDBC
            B2AEAEA29DD5CFCDB6ABA7F7F6F6888686FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF878585F7F6F6AEA29DD6D1CFBDB3AFAEA29DD6D1CFB6ACA8F7F6F68886
            86FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF878585F7F6F6AEA29DD8D3D1BD
            B4B0AEA29DD8D3D1B7ACA8F7F6F6888686FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF878585F7F6F6A89D98D0CBCAB6AEAAA89D98D0CBCAB0A7A3F7F6F68785
            85FF00FFFF00FFFF00FFFF00FFFF00FF847F8285838385838384838384828284
            8282848282848181838181838181838181817A7FFF00FFFF00FFFF00FFFF00FF
            968894F3F2F2F0EEEEEDEBEBEAE7E7E7E4E4E4E0E0E0DDDDDDD9D9DAD5D5D7D2
            D2827F7FFF00FFFF00FFFF00FFFF00FF958894F7F6F6F4F2F2F1EFEFEDEBEBEA
            E7E7E7E4E4E4E0E0E1DDDDDED9D9DAD6D6817F7FFF00FFFF00FFFF00FFFF00FF
            EE2CEE9587939688949688949588949588949588949587939587939587939487
            93CC40CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentShowHint = False
          ShowHint = True
          OnClick = ButtonDelayClick
        end
        object CheckBoxMultiOrder: TCheckBox
          Left = 149
          Top = 175
          Width = 51
          Height = 16
          Hint = 
            #1055#1088#1080' '#1086#1090#1087#1088#1072#1074#1082#1077' '#1087#1086' '#1084#1085#1086#1078#1077#1089#1090#1074#1077#1085#1085#1086#1084#1091' '#1079#1072#1082#1072#1079#1091' '#1086#1076#1085#1086#1081' '#1084#1072#1096#1080#1085#1099' - '#1076#1072#1085#1085#1099#1077' '#1086#1090#1082#1091 +
            #1076#1072'/'#1082#1091#1076#1072' '#1085'e '#1089#1090#1080#1088#1072#1102#1090#1089#1103
          Alignment = taLeftJustify
          Caption = #1052#1091#1083#1100#1090'.'
          TabOrder = 5
          OnKeyUp = EditDepartureKeyUp
        end
        object EditDeparture: TEdit
          Left = 5
          Top = 70
          Width = 196
          Height = 21
          PopupMenu = PopupMenuClient
          TabOrder = 0
          OnKeyUp = EditDepartureKeyUp
        end
        object EditPHONE: TEdit
          Left = 26
          Top = 143
          Width = 113
          Height = 21
          PopupMenu = PopupMenuClient
          TabOrder = 2
          OnKeyUp = EditDepartureKeyUp
        end
        object EditDiskont: TEdit
          Left = 152
          Top = 106
          Width = 48
          Height = 21
          Hint = #1055#1086#1080#1089#1082' ('#1085#1077' '#1084#1077#1085#1077#1077' 4'#1093' '#1089#1080#1084#1074#1086#1083#1086#1074')'
          ParentShowHint = False
          PopupMenu = PopupMenuClient
          ShowHint = True
          TabOrder = 3
          OnKeyUp = EditDepartureKeyUp
        end
        object DateTimePicker: TDateTimePicker
          Left = 5
          Top = 203
          Width = 82
          Height = 21
          Date = 38608.869728506900000000
          Time = 38608.869728506900000000
          TabOrder = 6
          OnChange = DateTimePickerChange
          OnKeyUp = DateTimePickerKeyUp
        end
        object MaskEditTime: TMaskEdit
          Left = 90
          Top = 203
          Width = 39
          Height = 21
          EditMask = '!09:99;1;_'
          MaxLength = 5
          TabOrder = 7
          Text = '00:00'
          OnKeyUp = MaskEditTimeKeyUp
        end
        object EditTheme: TEdit
          Left = 167
          Top = 143
          Width = 34
          Height = 21
          PopupMenu = PopupMenuOnLine
          TabOrder = 4
          OnKeyUp = EditThemeKeyUp
        end
        object EditDestination: TEdit
          Left = 6
          Top = 106
          Width = 125
          Height = 21
          PopupMenu = PopupMenuClient
          TabOrder = 1
          OnKeyUp = EditDepartureKeyUp
        end
        object ListBoxInfo: TListBox
          Left = 11
          Top = 13
          Width = 120
          Height = 40
          BorderStyle = bsNone
          Color = clBtnFace
          ItemHeight = 13
          TabOrder = 8
        end
        object DBLookupComboboxEhOrdType: TDBLookupComboboxEh
          Left = 5
          Top = 172
          Width = 134
          Height = 21
          DropDownBox.Rows = 20
          EditButtons = <>
          KeyField = 'COD_ORD_TYPE'
          ListField = 'NAME_ORD_TYPE'
          ListFieldIndex = 1
          ListSource = DM.DataSourceSOrdType
          TabOrder = 9
          Visible = True
        end
      end
      object ScrollBoxZakazOnLine: TScrollBox
        Tag = 3
        Left = 2
        Top = 15
        Width = 1010
        Height = 35
        HorzScrollBar.Tracking = True
        Align = alTop
        BiDiMode = bdLeftToRight
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
      object GroupBox_ORD_ONLINE: TGroupBox
        Left = 606
        Top = 53
        Width = 406
        Height = 249
        Align = alClient
        Caption = #1048#1089#1087#1086#1083#1085#1103#1077#1084#1099#1077' '#1079#1072#1082#1072#1079#1099
        TabOrder = 2
        object DBGridEh_ORD_ONLINE: TDBGridEh
          Left = 2
          Top = 15
          Width = 402
          Height = 232
          Align = alClient
          DataSource = DM.DataSource_ORD_ONLINE
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghHighlightFocus, dghClearSelection, dghDialogFind]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          VertScrollBar.Tracking = True
          VertScrollBar.VisibleMode = sbAlwaysShowEh
          OnDblClick = OrderEdit
          OnEnter = DBGridEh_ORD_ONLINEEnter
          OnExit = DBGridEh_ORD_ONLINEExit
          OnKeyUp = DBGridEh_ORD_ONLINEKeyUp
          Columns = <
            item
              EditButtons = <>
              FieldName = 'KEY_THEME'
              Footers = <>
              Title.Caption = #1087#1086#1079'.'
              Width = 22
            end
            item
              EditButtons = <>
              FieldName = 'KEY_ORD_TYPE'
              Footers = <>
              Title.Caption = #1090#1080#1087
              Width = 20
            end
            item
              EditButtons = <>
              FieldName = 'ORD_DEPARTURE'
              Footers = <>
              Title.Caption = #1054#1090#1082#1091#1076#1072
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'ORD_DESTINATION'
              Footers = <>
              Title.Caption = #1050#1091#1076#1072
              Width = 48
            end
            item
              EditButtons = <>
              FieldName = 'ORD_PHONE'
              Footers = <>
              Title.Caption = 'PHONE'
              Width = 74
            end
            item
              EditButtons = <>
              FieldName = 'TIME_START'
              Footers = <>
              Width = 72
            end>
        end
      end
      object GroupBox_ORD_DELAY: TGroupBox
        Left = 2
        Top = 53
        Width = 390
        Height = 249
        Align = alLeft
        Caption = #1057#1087#1080#1089#1086#1082' '#1079#1072#1082#1072#1079#1086#1074
        TabOrder = 3
        object Splitter2: TSplitter
          Left = 2
          Top = 124
          Width = 386
          Height = 3
          Cursor = crVSplit
          Align = alTop
          Beveled = True
          MinSize = 1
          ResizeStyle = rsNone
          ExplicitWidth = 385
        end
        object DBGridEh_ORD_DELAY: TDBGridEh
          Left = 2
          Top = 15
          Width = 386
          Height = 109
          Align = alTop
          DataSource = DM.DataSource_ORD_DELAY
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghHighlightFocus, dghClearSelection, dghDialogFind]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          VertScrollBar.VisibleMode = sbAlwaysShowEh
          OnDblClick = DBGridEh_ORD_DELAYDblClick
          OnEnter = DBGridEh_ORD_DELAYEnter
          OnExit = DBGridEh_ORD_DELAYExit
          OnKeyUp = DBGridEh_ORD_DELAYKeyUp
          Columns = <
            item
              EditButtons = <>
              FieldName = 'ORD_DEPARTURE'
              Footers = <>
              Title.Caption = #1054#1090#1082#1091#1076#1072
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'ORD_DESTINATION'
              Footers = <>
              Title.Caption = #1050#1091#1076#1072
              Width = 48
            end
            item
              EditButtons = <>
              FieldName = 'ORD_PHONE'
              Footers = <>
              Title.Caption = 'PHONE'
              Width = 66
            end
            item
              EditButtons = <>
              FieldName = 'TIME_START'
              Footers = <>
              Width = 72
            end
            item
              EditButtons = <>
              FieldName = 'KEY_THEME'
              Footers = <>
              Title.Caption = #1087#1086#1079'.'
              Width = 22
            end
            item
              EditButtons = <>
              FieldName = 'KEY_ORD_TYPE'
              Footers = <>
              Title.Caption = #1090#1080#1087
              Width = 20
            end>
        end
        object DBGridEh_ORD_RESERV: TDBGridEh
          Left = 2
          Top = 127
          Width = 386
          Height = 120
          Align = alClient
          DataSource = DM.DataSource_ORD_RESERV
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghHighlightFocus, dghClearSelection, dghDialogFind]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          VertScrollBar.VisibleMode = sbAlwaysShowEh
          OnDblClick = DBGridEh_ORD_RESERVDblClick
          OnEnter = DBGridEh_ORD_RESERVEnter
          OnExit = DBGridEh_ORD_RESERVExit
          OnKeyUp = DBGridEh_ORD_RESERVKeyUp
          Columns = <
            item
              EditButtons = <>
              FieldName = 'ORD_DEPARTURE'
              Footers = <>
              Title.Caption = #1054#1090#1082#1091#1076#1072
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'ORD_DESTINATION'
              Footers = <>
              Title.Caption = #1050#1091#1076#1072
              Width = 48
            end
            item
              EditButtons = <>
              FieldName = 'ORD_PHONE'
              Footers = <>
              Title.Caption = 'PHONE'
              Width = 66
            end
            item
              EditButtons = <>
              FieldName = 'TIME_START'
              Footers = <>
              Width = 72
            end
            item
              EditButtons = <>
              FieldName = 'KEY_THEME'
              Footers = <>
              Title.Caption = #1087#1086#1079'.'
              Width = 22
            end
            item
              EditButtons = <>
              FieldName = 'KEY_ORD_TYPE'
              Footers = <>
              Title.Caption = #1090#1080#1087
              Width = 20
            end>
        end
      end
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 1016
    Height = 100
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 731
      Top = 0
      Height = 100
      Align = alRight
      Beveled = True
      MinSize = 1
      ResizeStyle = rsNone
      ExplicitLeft = 740
      ExplicitHeight = 73
    end
    object Splitter4: TSplitter
      Left = 826
      Top = 0
      Height = 100
      Align = alRight
      Beveled = True
      MinSize = 1
      ResizeStyle = rsNone
      ExplicitLeft = 824
      ExplicitTop = -3
      ExplicitHeight = 73
    end
    object Splitter9: TSplitter
      Left = 636
      Top = 0
      Height = 100
      Align = alRight
      Beveled = True
      MinSize = 1
      ResizeStyle = rsNone
      ExplicitLeft = 721
      ExplicitTop = -3
      ExplicitHeight = 73
    end
    object Splitter8: TSplitter
      Left = 921
      Top = 0
      Height = 100
      Align = alRight
      Beveled = True
      MinSize = 1
      ResizeStyle = rsNone
      ExplicitLeft = 643
      ExplicitTop = -3
      ExplicitHeight = 73
    end
    object Splitter11: TSplitter
      Left = 541
      Top = 0
      Height = 100
      Align = alRight
      Beveled = True
      MinSize = 1
      ResizeStyle = rsNone
      ExplicitLeft = 751
      ExplicitTop = -3
      ExplicitHeight = 73
    end
    object GroupBoxRemont: TGroupBox
      Left = 639
      Top = 0
      Width = 92
      Height = 100
      Align = alRight
      Caption = #1056#1077#1084#1086#1085#1090
      TabOrder = 0
      object ScrollBoxRemont: TScrollBox
        Tag = 2
        Left = 2
        Top = 15
        Width = 88
        Height = 83
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        OnDragDrop = ScrollBoxStaticDragDrop
        OnDragOver = ScrollBoxDragOver
      end
    end
    object GroupBoxShtraf: TGroupBox
      Left = 924
      Top = 0
      Width = 92
      Height = 100
      Align = alRight
      Caption = #1064#1090#1088#1072#1092#1087#1083#1086#1097#1072#1076#1082#1072
      TabOrder = 1
      object ScrollBoxShtraf: TScrollBox
        Tag = 6
        Left = 2
        Top = 15
        Width = 88
        Height = 83
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        OnDragDrop = ScrollBoxStaticDragDrop
        OnDragOver = ScrollBoxDragOver
      end
    end
    object GroupBoxDolg: TGroupBox
      Left = 544
      Top = 0
      Width = 92
      Height = 100
      Align = alRight
      Caption = #1044#1086#1083#1078#1085#1080#1082#1080
      TabOrder = 2
      object ScrollBoxDolg: TScrollBox
        Tag = 4
        Left = 2
        Top = 15
        Width = 88
        Height = 83
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        OnDragDrop = ScrollBoxStaticDragDrop
        OnDragOver = ScrollBoxDragOver
      end
    end
    object GroupBoxPark: TGroupBox
      Left = 0
      Top = 0
      Width = 541
      Height = 100
      Align = alClient
      Caption = #1055#1040#1056#1050
      TabOrder = 3
      object ScrollBoxPark: TScrollBox
        Left = 2
        Top = 15
        Width = 537
        Height = 83
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        OnDragDrop = ScrollBoxStaticDragDrop
        OnDragOver = ScrollBoxDragOver
        OnMouseDown = ScrollBoxParkMouseDown
        OnMouseMove = ScrollBoxParkMouseMove
        OnMouseUp = ScrollBoxParkMouseUp
      end
    end
    object GroupBoxArenda: TGroupBox
      Left = 734
      Top = 0
      Width = 92
      Height = 100
      Align = alRight
      Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1081
      TabOrder = 4
      object ScrollBoxArenda: TScrollBox
        Tag = 8
        Left = 2
        Top = 15
        Width = 88
        Height = 83
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        OnDragDrop = ScrollBoxStaticDragDrop
        OnDragOver = ScrollBoxDragOver
      end
    end
    object GroupBoxOtpusk: TGroupBox
      Left = 829
      Top = 0
      Width = 92
      Height = 100
      Align = alRight
      Caption = #1054#1090#1087#1091#1089#1082
      TabOrder = 5
      object ScrollBoxOtpusk: TScrollBox
        Tag = 10
        Left = 2
        Top = 15
        Width = 88
        Height = 83
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        OnDragDrop = ScrollBoxStaticDragDrop
        OnDragOver = ScrollBoxDragOver
      end
    end
  end
  object PanelRight: TPanel
    Left = 935
    Top = 103
    Width = 81
    Height = 308
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    object StaticTextWeekEnd: TStaticText
      Left = 0
      Top = 147
      Width = 81
      Height = 17
      Align = alBottom
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = #1055#1088#1072#1079#1076#1085#1080#1082'!!!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = StaticTextWeekEndClick
    end
    object PanelDayNight: TPanel
      Left = 0
      Top = 257
      Width = 81
      Height = 51
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object BitBtnRessortNight: TBitBtn
        Left = 3
        Top = 0
        Width = 69
        Height = 25
        Hint = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1074#1089#1077#1093' '#1086#1089#1090#1072#1074#1096#1080#1093#1089#1103' '#1074' '#1088#1077#1079#1077#1088#1074
        Caption = #1056#1077#1079#1077#1088#1074
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtnRessortNightClick
        Glyph.Data = {
          DA020000424DDA02000000000000DA0100002800000010000000100000000100
          08000000000000010000120B0000120B00006900000069000000FF00FF00BC2D
          0600A729000092301100AE2E0000A42B000096331000AA3B1300975D4900A931
          0000A6300000A02E0000992D0000B5481C00BD5E3900B44F2200AA512B00A337
          000099330000B96C4700654D4100D3510000BD460000CE6827008E390100CD5F
          1200CA570200C353020079401700D7660400D36606007B400C0083430600D470
          1100774708007548080073480D006A470C00694B070065480A006CA549001776
          11000F90190049AD4F0023A6330021A9350020A7330021A7340021A6320021A6
          330021A6340021A5320021A4320022A6340022A5340023A63400209A3400229E
          360033C05D0041D7730046DC780052E9840055EB870028C8600037D06C003AD0
          6D0041D9750044DB770046DE7A0049E17D004BE37F004BE27E004EE682004FE7
          830050E8850059F390005CF893003AD974003DE078003FE7820045ED88004AF2
          8D0056FD97002EED8500A7FFFF0050E0F50000D2FF004FCFE80000CCFC0000C7
          F70012CEF8002CBDDF003AC8E900319CB70000B7EB002CBBE2003B8BA10008AF
          E10000B0EF00008FC4000F97C5000391C90000A5EB00000D9300000000000000
          656565000000000000000000000065655A655965650000000000000000006554
          556558566500000000000000000065575C5F615E640300000000000000000063
          5D5B6266600F0C00000000121100000006140000080E026767090B0A6767000D
          1304150518242627252322201F1C00071038282B3A3F29292929292929290016
          1B38534E4D40382F3231312E2D2A001A1D384F3C4241383334343434362A0019
          1E385047443B383334343434362A0017213851494643383334343434352A0000
          0138523E4A45383334343434352A00000038384C4B48383334343434372A0000
          00000038383D3830333333332C2A00000000000000383938383838383800}
      end
      object BitBtnRessortDay: TBitBtn
        Left = 3
        Top = 25
        Width = 69
        Height = 25
        Hint = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1084#1072#1096#1080#1085#1099' '#1089' '#1088#1077#1079#1077#1088#1074#1072
        Caption = #1053#1086#1088#1084#1072
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtnRessortDayClick
        Glyph.Data = {
          86030000424D8603000000000000860200002800000010000000100000000100
          08000000000000010000120B0000120B000094000000940000000B0AA2002322
          AB003D3AB1002F25B500514AB200908DCA004038A8004138A300584A9E008477
          B500958BBE00B5A7DE006049990037196F00391971007C67A10036126C007C66
          9A007F699A00461D71007F689800FF00FF00D1B7CE00772A2C00E0B3AE007D41
          3500DCA89E009E200000942C1300A12E0D009A351400B4482700A72D0000AF50
          2E00A83C13007B5B4B00AA4200008F674600FFD2A000FEDFB700FDEDD300FFDC
          9700FDDC9B00FFE19E00FFEDB400FFE99A00FFFFD400FFFFF3003E872D003987
          2E00388B2F00209A34003AD16D003FD976003ED5710044DE7B0043DB780045DC
          79004AE3800049E17D004CE582004FEA850050E8840054EC8A0057F08C0058F2
          8D0058F18D005EF8950033DB740038E27B0037DE7A003DC375002C9D70004D93
          7E00448D79004C958400238B7D00176B62003C888900A5FFFF0050DEF30000D5
          FF00318DA10049CFEC0000CEFE0000CDFC0012C9F4001EBEE60036C7E9003B87
          980000BAEF0023B8E10002ABDE0000B1F300187FA4000391C9000097DE00717E
          88000289F500174D9400164CBD000049F9000036B7000E2FA500002BEC000C28
          A900001DC000415AE600001FDE000B25C8000B22B6000017E2000018D7001C2D
          CB007C87DC000013D0000010C500000FBA00000FB800000D93000111BE000C1E
          CE00757CD600000AD300000BB900000BB500000AB300121EBF001B25BB000005
          9C000208A8000307A400070D9B000D13AF001016AD002026BF002329BE006D70
          D0000004C5000000B5000004AE000000A7000000A200000191000A0CA600191B
          AC004040BF000000000015155F5F5F15151515151515151515155F5F565F555F
          5F1515151515151515155F4F505F54515F1515151515151515155F53585B5C5A
          521D15151515151E1C15155E59575D60610C786A767E900E0D84151521192325
          17136562686C70736266151F221B202410007C7D8C8591828115153031323333
          630380746B727A8986151533454446334A1A888A717F75018315153339363433
          491804090F111412771515333A3835334B160A2E2C2B292D771515333D3B3733
          4E0B052F2827262A77151533403E3C334C798792020607081515153343423F33
          486F7B8B8D8E8F15151515153333413347646D6E69674D151515151515153333
          33333333333333151515}
      end
    end
    object CheckBoxRezerv: TCheckBox
      Tag = 1
      Left = 0
      Top = 181
      Width = 81
      Height = 16
      Hint = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1084#1072#1096#1080#1085#1099' '#1074' '#1088#1077#1079#1077#1088#1074#1077
      Align = alBottom
      Alignment = taLeftJustify
      Caption = #1056#1077#1079#1077#1088#1074
      Checked = True
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 2
    end
    object ListBoxSmenaRepNo: TListBox
      Left = 0
      Top = 197
      Width = 81
      Height = 60
      Align = alBottom
      BevelEdges = [beTop]
      BevelInner = bvLowered
      BevelKind = bkFlat
      BorderStyle = bsNone
      Color = clBtnFace
      ItemHeight = 13
      TabOrder = 3
    end
    object StaticTextAction: TStaticText
      Left = 0
      Top = 164
      Width = 81
      Height = 17
      Align = alBottom
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = #1040#1082#1094#1080#1103' !!!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = StaticTextActionClick
    end
  end
  object PanelLocation: TPanel
    Left = 0
    Top = 103
    Width = 935
    Height = 308
    Hint = #1052#1072#1088#1080#1091#1087#1086#1083#1100
    Align = alClient
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
  end
  object PopupMenuLocTypeOnLine: TPopupMenu
    OnPopup = PopupMenuLocTypeOnLinePopup
    Left = 56
    Top = 144
    object miMark: TMenuItem
      Caption = #1054#1089#1090#1072#1074#1080#1090#1100' '#1093#1074#1086#1089#1090
      OnClick = miMarkClick
    end
    object miUnMark: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1093#1074#1086#1089#1090
      OnClick = miUnMarkClick
    end
    object TMenuItem
    end
    object miClients: TMenuItem
      Tag = 7
      Caption = #1057#1042#1054#1048
      OnClick = StartOrder
    end
    object TMenuItem
    end
    object miWithSave: TMenuItem
      Tag = 5
      AutoLineReduction = maAutomatic
      Caption = #1055#1086' '#1079#1072#1082#1072#1079#1091' c '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077#1084' '#1086#1095#1077#1088#1077#1076#1080
      OnClick = StartOrder
    end
    object miOutAuto: TMenuItem
      Tag = 9
      Caption = #1041#1054#1063#1045#1050
      Visible = False
      OnClick = ReLocType
    end
    object miPause: TMenuItem
      Tag = 11
      Caption = #1054#1073#1077#1076#1077#1085#1085#1099#1081' '#1087#1077#1088#1077#1088#1099#1074
      OnClick = ReLocType
    end
    object miPromove: TMenuItem
      Tag = 13
      Caption = #1055#1088#1086#1076#1074#1080#1075#1072#1077#1090#1089#1103
      OnClick = ReLocType
    end
    object TMenuItem
    end
    object miOrderEdit: TMenuItem
      AutoLineReduction = maAutomatic
      Caption = #1059#1090#1086#1095#1085#1080#1090#1100' '#1079#1072#1082#1072#1079
      Visible = False
      OnClick = miOrderEditClick
    end
    object miMarker: TMenuItem
      Caption = #1052#1072#1088#1082#1077#1088
      object N6: TMenuItem
        Caption = '<'#1087#1091#1089#1090#1086'>'
        OnClick = miMarkerClick
      end
      object N7: TMenuItem
        Caption = '&'#1051#1077#1074#1099#1081
        Hint = #1083
        OnClick = miMarkerClick
      end
      object N8: TMenuItem
        Caption = '&'#1043#1086#1088#1086#1076
        Hint = #1075
        OnClick = miMarkerClick
      end
      object N1: TMenuItem
        Caption = #1086#1076#1080#1085'(1)'
        Hint = #1086
        OnClick = miMarkerClick
      end
      object N9: TMenuItem
        Caption = #1076#1074#1072'(2)'
        Hint = #1076
        OnClick = miMarkerClick
      end
      object N10: TMenuItem
        Caption = #1090#1088#1080'(3)'
        Hint = #1090
        OnClick = miMarkerClick
      end
    end
    object TMenuItem
    end
    object miPenalty: TMenuItem
      Caption = #1064#1090#1088#1072#1092#1099
      object miConflict: TMenuItem
        Tag = 12
        Caption = #1042#1089#1090#1088#1077#1095#1085#1099#1081
        OnClick = SendOrder
      end
      object miOtkaz: TMenuItem
        Tag = 13
        Caption = #1054#1090#1082#1072#1079' '#1086#1090' '#1079#1072#1082#1072#1079#1072
        OnClick = SendOrder
      end
      object miNoResponse: TMenuItem
        Tag = 11
        Caption = #1053#1077' '#1086#1090#1079#1099#1074#1072#1077#1090#1089#1103
        OnClick = SendOrder
      end
      object N11: TMenuItem
        Caption = #1064#1090#1088#1072#1092' '#1079#1072' '#1089#1074#1086#1080
      end
      object N3: TMenuItem
        Tag = 24
        Caption = #1053#1077#1074#1099#1093#1086#1076' '#1074' '#1053#1054#1063#1068
        OnClick = SendOrder
      end
      object miInfo: TMenuItem
        Tag = 17
        Caption = #1056#1072#1076#1080#1086#1086#1073#1084#1077#1085
        OnClick = SendOrder
      end
    end
    object TMenuItem
    end
    object miPrior: TMenuItem
      Tag = 123
      Caption = #1042#1085#1077#1086#1095#1077#1088#1077#1076#1085#1086#1081
      Visible = False
      OnClick = Ressort
    end
    object miSort: TMenuItem
      Caption = #1054#1095#1077#1088#1077#1076#1085#1086#1089#1090#1100
      object miFirst: TMenuItem
        Tag = 123
        Caption = #1055#1077#1088#1074#1086#1086#1095#1077#1088#1077#1076#1085#1086#1081' (123)'
        OnClick = Ressort
      end
      object miRestore: TMenuItem
        Tag = 456
        Caption = #1053#1086#1088#1084#1072#1083#1100#1085#1072#1103' '#1086#1095#1077#1088#1077#1076#1100' (456)'
        OnClick = Ressort
      end
      object miLast: TMenuItem
        Tag = 789
        Caption = #1042' '#1082#1086#1085#1077#1094' '#1089' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077#1084' (789)'
        OnClick = Ressort
      end
      object N1471: TMenuItem
        Tag = 147
        Break = mbBarBreak
        Caption = #1044#1077#1078#1091#1088#1085#1099#1081' (147)'
        OnClick = Ressort
      end
      object miResetReserv: TMenuItem
        Tag = 258
        Caption = #1054#1073#1099#1095#1085#1099#1081' (258)'
        OnClick = Ressort
      end
      object miSetReserv: TMenuItem
        Tag = 369
        Caption = #1056#1077#1079#1077#1088#1074#1085#1099#1081' (369)'
        OnClick = Ressort
      end
      object miNight: TMenuItem
        Tag = 147
        AutoLineReduction = maManual
        Caption = #1042' '#1085#1086#1095#1085#1086#1081' '#1076#1086#1079#1086#1088
        OnClick = Ressort
      end
    end
  end
  object VersionInfo: TVersionInfo
    Enabled = True
    Left = 32
    Top = 24
  end
  object PopupMenuOffLine: TPopupMenu
    Left = 56
    Top = 85
    object N4: TMenuItem
      Tag = 24
      Break = mbBreak
      Caption = #1053#1077#1074#1099#1093#1086#1076' '#1074' '#1085#1086#1095#1100
      OnClick = SendOrder
    end
    object N01: TMenuItem
    end
    object MenuItem8: TMenuItem
      Tag = 4
      Caption = #1044#1086#1083#1078#1085#1080#1082
      OnClick = ReLocType
    end
    object MenuItem14: TMenuItem
      Tag = 2
      Caption = #1056#1077#1084#1086#1085#1090
      OnClick = ReLocType
    end
    object N2: TMenuItem
      Tag = 8
      Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1081
      OnClick = ReLocType
    end
    object N5: TMenuItem
      Tag = 10
      Caption = #1054#1090#1087#1091#1089#1082
      OnClick = ReLocType
    end
    object MenuItem13: TMenuItem
      Tag = 6
      Caption = #1064#1090#1088#1072#1092#1087#1083#1086#1097#1072#1076#1082#1072
      OnClick = ReLocType
    end
    object N13: TMenuItem
      Caption = #1042' '#1075#1072#1088#1072#1078
      OnClick = ReLocType
    end
  end
  object TimerOrdRezervFlash: TTimer
    Enabled = False
    Interval = 777
    OnTimer = TimerOrdRezervFlashTimer
    Left = 317
    Top = 65
  end
  object PopupMenuClient: TPopupMenu
    Left = 56
    Top = 325
  end
  object TimerCheck: TTimer
    Enabled = False
    Interval = 11111
    OnTimer = TimerCheckTimer
    Left = 320
    Top = 14
  end
  object PopupMenuFalseOrder: TPopupMenu
    Left = 248
    Top = 280
    object miNoCar: TMenuItem
      Caption = #1054#1090#1082#1072#1079#1072#1085#1086' '#1074' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1080' ('#1085#1077#1090' '#1084#1072#1096#1080#1085')'
      OnClick = miFalseOrderClick
    end
  end
  object TcpClient: TTcpClient
    Left = 320
    Top = 144
  end
  object PopupMenuOnLine: TPopupMenu
    Left = 168
    Top = 293
  end
end
