object FrmSrv: TFrmSrv
  Left = 287
  Top = 222
  BorderStyle = bsDialog
  Caption = ' '#26381#21153#22120#31471'  '
  ClientHeight = 383
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object gp1: TGroupBox
    Left = 321
    Top = 0
    Width = 198
    Height = 383
    Align = alClient
    Caption = ' '#23458#25143#31471#36830#25509' '
    TabOrder = 0
    object MemClientLink: TMemo
      Left = 2
      Top = 14
      Width = 194
      Height = 367
      Align = alClient
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object gb2: TGroupBox
    Left = 0
    Top = 0
    Width = 321
    Height = 383
    Align = alLeft
    TabOrder = 1
    object gb3: TGroupBox
      Left = 6
      Top = 269
      Width = 313
      Height = 81
      Caption = ' '#21457#36865#28040#24687' '
      TabOrder = 0
      object MemSendMsg: TMemo
        Left = 2
        Top = 14
        Width = 309
        Height = 65
        Align = alClient
        TabOrder = 0
      end
    end
    object btnSend: TButton
      Left = 219
      Top = 354
      Width = 97
      Height = 25
      Caption = 'Sent to Client'
      TabOrder = 1
      OnClick = btnSendClick
    end
    object gp4: TGroupBox
      Left = 6
      Top = 10
      Width = 313
      Height = 253
      Caption = ' '#25509#25910#28040#24687' '
      TabOrder = 2
      object MemClientMsg: TMemo
        Left = 2
        Top = 14
        Width = 309
        Height = 237
        Align = alClient
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object SrvSocket: TServerSocket
    Active = True
    Port = 8000
    ServerType = stNonBlocking
    OnListen = SrvSocketListen
    OnClientConnect = SrvSocketClientConnect
    OnClientDisconnect = SrvSocketClientDisconnect
    OnClientRead = SrvSocketClientRead
    Left = 264
    Top = 32
  end
  object SrvSocket2: TServerSocket
    Active = True
    Port = 8002
    ServerType = stNonBlocking
    OnListen = SrvSocketListen
    OnClientConnect = SrvSocketClientConnect
    OnClientDisconnect = SrvSocketClientDisconnect
    OnClientRead = SrvSocketClientRead
    Left = 264
    Top = 112
  end
  object SrvSocket1: TServerSocket
    Active = True
    Port = 8001
    ServerType = stNonBlocking
    OnListen = SrvSocketListen
    OnClientConnect = SrvSocketClientConnect
    OnClientDisconnect = SrvSocketClientDisconnect
    OnClientRead = SrvSocketClientRead
    Left = 264
    Top = 72
  end
end
