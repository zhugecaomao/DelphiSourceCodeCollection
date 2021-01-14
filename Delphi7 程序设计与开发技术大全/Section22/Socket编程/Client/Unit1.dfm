object Form1: TForm1
  Left = 233
  Top = 187
  Width = 338
  Height = 230
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
    Left = 16
    Top = 40
    Width = 89
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = #25509#21463#26041'IP'#22320#22336
  end
  object Label2: TLabel
    Left = 16
    Top = 80
    Width = 81
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Caption = #25509#21463#26041#31471#21475
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 0
    Width = 313
    Height = 17
    TabOrder = 0
  end
  object edtIP: TEdit
    Left = 120
    Top = 40
    Width = 145
    Height = 21
    TabOrder = 1
    Text = 'edtIP'
  end
  object edtport: TEdit
    Left = 120
    Top = 80
    Width = 145
    Height = 21
    TabOrder = 2
    Text = 'edtport'
  end
  object BtnConnect: TBitBtn
    Left = 8
    Top = 136
    Width = 65
    Height = 25
    Caption = #36830#25509
    TabOrder = 3
    OnClick = BtnConnectClick
  end
  object BtnSend: TBitBtn
    Left = 88
    Top = 136
    Width = 65
    Height = 25
    Caption = #21457#36865
    TabOrder = 4
    OnClick = BtnSendClick
  end
  object BtnStop: TBitBtn
    Left = 168
    Top = 136
    Width = 65
    Height = 25
    Caption = #20572#27490
    TabOrder = 5
    OnClick = BtnStopClick
  end
  object BtnExit: TBitBtn
    Left = 248
    Top = 136
    Width = 65
    Height = 25
    Caption = #36864#20986
    TabOrder = 6
    OnClick = BtnExitClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 177
    Width = 330
    Height = 19
    Panels = <>
  end
  object OpenDialog1: TOpenDialog
    Left = 280
    Top = 32
  end
end
