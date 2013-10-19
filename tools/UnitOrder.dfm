object FormOrder: TFormOrder
  Left = 425
  Top = 298
  BorderStyle = bsToolWindow
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1088#1076#1077#1088
  ClientHeight = 270
  ClientWidth = 205
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 208
    Width = 34
    Height = 13
    Caption = #1057#1091#1084#1084#1072
  end
  object LabelRepNo: TLabel
    Left = 8
    Top = 8
    Width = 91
    Height = 13
    Caption = #1055#1077#1088#1080#1086#1076' '#1086#1090#1095#1077#1090#1072' '#8470' '
  end
  object LabelField: TLabel
    Left = 136
    Top = 8
    Width = 48
    Height = 13
    Caption = 'LabelField'
    Visible = False
  end
  object BitBtnOK: TBitBtn
    Left = 8
    Top = 240
    Width = 75
    Height = 25
    TabOrder = 0
    OnClick = BitBtnOKClick
    Kind = bkOK
  end
  object EditCost: TEdit
    Left = 96
    Top = 204
    Width = 65
    Height = 21
    TabOrder = 1
  end
  object BitBtnCancel: TBitBtn
    Left = 120
    Top = 240
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object Calendar: TMonthCalendar
    Left = 8
    Top = 32
    Width = 191
    Height = 154
    Date = 38671.647674560180000000
    MaxSelectRange = 7
    TabOrder = 3
    WeekNumbers = True
  end
  object FIBQuerySetRep: TpFIBQuery
    Transaction = FormMain.FIBTransactionUpdate
    Database = FormMain.FIBDatabase
    Left = 128
    Top = 96
  end
end
