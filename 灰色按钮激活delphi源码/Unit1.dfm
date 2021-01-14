object Form1: TForm1
  Left = 576
  Top = 165
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #28784#33394#25353#38062#28608#27963
  ClientHeight = 131
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 48
    Height = 16
    Caption = #26631#39064#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 48
    Width = 48
    Height = 16
    Caption = #21477#26564#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 16
    Top = 8
    Width = 89
    Height = 25
    Caption = #28608#27963'&'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 64
    Top = 48
    Width = 169
    Height = 21
    TabOrder = 1
  end
  object Button2: TButton
    Left = 144
    Top = 8
    Width = 89
    Height = 25
    Caption = #28608#27515
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 64
    Top = 80
    Width = 169
    Height = 21
    TabOrder = 3
  end
  object Button3: TButton
    Left = 88
    Top = 104
    Width = 75
    Height = 25
    Caption = #20851#20110
    TabOrder = 4
    OnClick = Button3Click
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 112
    Top = 8
  end
end
