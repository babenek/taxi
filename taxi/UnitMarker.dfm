object FormMarker: TFormMarker
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1052#1072#1088#1082#1077#1088
  ClientHeight = 75
  ClientWidth = 141
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MaskEditMarker: TMaskEdit
    Left = 49
    Top = 8
    Width = 39
    Height = 33
    EditMask = 'a;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 1
    ParentFont = False
    TabOrder = 0
    Text = ' '
  end
  object BitBtn1: TBitBtn
    Left = 1
    Top = 47
    Width = 57
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 64
    Top = 47
    Width = 74
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end
