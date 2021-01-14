object Form1: TForm1
  Left = 342
  Top = 101
  Width = 578
  Height = 500
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 561
    Height = 49
    TabOrder = 0
    object btnConnect: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 25
      Caption = #36830#25509
      TabOrder = 0
      OnClick = btnConnectClick
    end
    object btnSnap: TButton
      Left = 145
      Top = 1
      Width = 75
      Height = 25
      Caption = #25235#23631
      TabOrder = 1
      OnClick = btnSnapClick
    end
    object btnDisconnect: TButton
      Left = 289
      Top = 1
      Width = 75
      Height = 25
      Caption = #26029#24320#36830#25509
      TabOrder = 2
      OnClick = btnDisconnectClick
    end
    object btnClose: TButton
      Left = 425
      Top = 1
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 3
      OnClick = btnCloseClick
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 48
    Width = 561
    Height = 409
    TabOrder = 1
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 561
      Height = 409
      AutoSize = True
    end
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnecting = ClientSocket1Connecting
    OnRead = ClientSocket1Read
    OnError = ClientSocket1Error
    Left = 480
    Top = 64
  end
end
