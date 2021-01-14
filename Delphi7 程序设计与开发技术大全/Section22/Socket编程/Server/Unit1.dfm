object Form1: TForm1
  Left = 298
  Top = 199
  Width = 329
  Height = 194
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 89
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = #25509#25910#31471#21475
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edtPort: TEdit
    Left = 120
    Top = 24
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object btnListen: TBitBtn
    Left = 0
    Top = 88
    Width = 65
    Height = 25
    Caption = #30417#21548
    TabOrder = 1
    OnClick = btnListenClick
  end
  object btnRecv: TBitBtn
    Left = 80
    Top = 88
    Width = 65
    Height = 25
    Caption = #25509#25910
    TabOrder = 2
    OnClick = btnRecvClick
  end
  object btnstop: TBitBtn
    Left = 160
    Top = 88
    Width = 65
    Height = 25
    Caption = #20572#27490
    TabOrder = 3
    OnClick = btnstopClick
  end
  object btnExit: TBitBtn
    Left = 240
    Top = 88
    Width = 65
    Height = 25
    Caption = #36864#20986
    TabOrder = 4
    OnClick = btnExitClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 141
    Width = 321
    Height = 19
    Panels = <>
  end
  object SaveDialog1: TSaveDialog
    Left = 280
    Top = 48
  end
end
