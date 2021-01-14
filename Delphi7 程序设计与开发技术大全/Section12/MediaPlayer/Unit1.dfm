object Form1: TForm1
  Left = 189
  Top = 103
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #38899#39057#19982#35270#39057
  ClientHeight = 276
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 192
    Width = 49
    Height = 13
    AutoSize = False
    Caption = #25991#20214#21517
  end
  object Label2: TLabel
    Left = 112
    Top = 192
    Width = 41
    Height = 13
    AutoSize = False
    Caption = #28040#24687#36890#30693
  end
  object Label3: TLabel
    Left = 216
    Top = 192
    Width = 57
    Height = 13
    AutoSize = False
    Caption = #29366#24577
  end
  object MediaPlayer1: TMediaPlayer
    Left = 88
    Top = 240
    Width = 141
    Height = 30
    VisibleButtons = [btPlay, btPause, btStop, btNext, btPrev]
    Display = Panel1
    TabOrder = 0
    OnClick = MediaPlayer1Click
    OnNotify = MediaPlayer1Notify
  end
  object Button1: TButton
    Left = 8
    Top = 240
    Width = 75
    Height = 25
    Caption = #25171#24320'(&O)'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 208
    Width = 97
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 112
    Top = 208
    Width = 97
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 216
    Top = 208
    Width = 97
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 24
    Top = 8
    Width = 265
    Height = 177
    TabOrder = 5
  end
  object OpenDialog1: TOpenDialog
    Left = 248
    Top = 240
  end
end
