object frmMain: TfrmMain
  Left = 193
  Top = 135
  BorderStyle = bsSingle
  Caption = #31383#21475#24555#36895#36890#36947
  ClientHeight = 75
  ClientWidth = 239
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 88
    Top = 8
    Width = 75
    Height = 25
    Caption = 'HOOK'
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 8
    Top = 40
    Width = 75
    Height = 25
    Caption = 'UNHOOK'
    TabOrder = 1
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Bar'
    TabOrder = 2
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 88
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Hide'
    TabOrder = 3
  end
  object XPManifest1: TXPManifest
    Left = 168
    Top = 8
  end
end
