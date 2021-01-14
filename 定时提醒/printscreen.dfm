object Form2: TForm2
  Left = 121
  Top = 305
  AlphaBlend = True
  AlphaBlendValue = 235
  BorderStyle = bsNone
  Caption = #20889#23631
  ClientHeight = 78
  ClientWidth = 817
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = -10
    Width = 817
    Height = 90
    AutoSize = False
    Caption = #20320#24212#35813#20241#24687#19968#20250#20102'!'
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -96
    Font.Name = #38582#20070
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 128
    Top = 24
  end
end
