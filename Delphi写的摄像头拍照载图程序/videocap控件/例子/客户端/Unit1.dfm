object Form1: TForm1
  Left = 231
  Top = 93
  Width = 360
  Height = 408
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 340
    Width = 6
    Height = 13
    Caption = '..'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 300
    Width = 337
    Height = 14
    Shape = bsBottomLine
  end
  object Label2: TLabel
    Left = 12
    Top = 320
    Width = 37
    Height = 13
    Caption = 'IP'#22320#22336':'
  end
  object Edit1: TEdit
    Left = 56
    Top = 316
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '192.168.1.55'
  end
  object Button1: TButton
    Left = 196
    Top = 316
    Width = 53
    Height = 25
    Caption = #36830#25509
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 256
    Top = 316
    Width = 41
    Height = 25
    Caption = #25509#25910
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 304
    Top = 316
    Width = 41
    Height = 25
    Caption = #20572#27490
    TabOrder = 3
    OnClick = Button3Click
  end
  object Panel1: TPanel
    Left = 12
    Top = 8
    Width = 329
    Height = 277
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 'Panel1'
    Color = clBlack
    TabOrder = 4
    object AnimatedImage1: TAnimatedImage
      Left = 2
      Top = 2
      Width = 325
      Height = 273
      Align = alClient
      Center = True
      TransparentColor = -33554433
      Color = clSilver
      ParentColor = False
    end
  end
  object RadioButton1: TRadioButton
    Left = 28
    Top = 292
    Width = 85
    Height = 17
    Caption = #25668#20687#22836
    Checked = True
    TabOrder = 5
    TabStop = True
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 2021
    OnConnect = ClientSocket1Connect
    OnRead = ClientSocket1Read
    OnError = ClientSocket1Error
    Left = 200
    Top = 68
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 200
    Top = 8
  end
end
