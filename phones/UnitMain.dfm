object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'FormMain'
  ClientHeight = 541
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 792
    Height = 500
    Align = alClient
    BorderStyle = bsNone
    DataSource = DM.DataSourceMain
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleBtnClick = DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'PHONE'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'lu_street_type'
        Footers = <>
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'lu_street'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'HOUSE'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'FLAT'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'TOS'
        Footers = <>
        Title.TitleButton = True
        Width = 23
      end>
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 12
      Top = 8
      Width = 240
      Height = 25
      DataSource = DM.DataSourceMain
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object VersionInfo: TVersionInfo
    Left = 44
    Top = 86
  end
  object TcpClient: TTcpClient
    Left = 113
    Top = 89
  end
end
