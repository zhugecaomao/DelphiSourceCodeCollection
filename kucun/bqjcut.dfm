object bqjcfm: Tbqjcfm
  Left = 334
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #25968#25454#23548#20837#19979#26399
  ClientHeight = 137
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 137
    Align = alClient
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 64
      Top = 48
      Width = 217
      Height = 41
      Caption = #25968#25454#23548#20837#19979#26399
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
  object adoquery: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    Left = 88
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    Left = 152
    Top = 16
  end
end
