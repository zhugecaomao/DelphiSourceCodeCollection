object FrmClient: TFrmClient
  Left = 233
  Top = 117
  BorderStyle = bsDialog
  Caption = ' '#23458#25143#31471#20449#24687' '
  ClientHeight = 452
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object gb1: TGroupBox
    Left = 0
    Top = 0
    Width = 388
    Height = 369
    Align = alTop
    TabOrder = 0
    object gb2: TGroupBox
      Left = 2
      Top = 14
      Width = 384
      Height = 251
      Align = alTop
      Caption = ' '#26381#21153#31471#21457#36865#28040#24687' '
      TabOrder = 0
      object MemReadMsg: TMemo
        Left = 2
        Top = 14
        Width = 380
        Height = 235
        Align = alClient
        BorderStyle = bsNone
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object gb3: TGroupBox
      Left = 2
      Top = 265
      Width = 384
      Height = 102
      Align = alClient
      Caption = ' '#23458#25143#31471#21457#36865#28040#24687' '
      TabOrder = 1
      object MemSendMsg: TMemo
        Left = 2
        Top = 14
        Width = 380
        Height = 86
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object btnSend: TButton
    Left = 286
    Top = 379
    Width = 96
    Height = 25
    Caption = 'Sent to Server'
    TabOrder = 1
    OnClick = btnSendClick
  end
  object Connet: TButton
    Left = 287
    Top = 416
    Width = 96
    Height = 25
    Caption = 'Connetion'
    TabOrder = 2
    OnClick = ConnetClick
  end
  object GroupBox1: TGroupBox
    Left = 3
    Top = 368
    Width = 278
    Height = 81
    Caption = ' '#26381#21153#22120#20449#24687' '
    TabOrder = 3
    object LeSrvName: TLabeledEdit
      Left = 72
      Top = 21
      Width = 185
      Height = 20
      EditLabel.Width = 48
      EditLabel.Height = 12
      EditLabel.Caption = #21517'  '#31216#65306
      LabelPosition = lpLeft
      TabOrder = 0
      OnKeyPress = LeSrvNameKeyPress
    end
    object LeSrvPort: TLabeledEdit
      Left = 72
      Top = 46
      Width = 185
      Height = 20
      EditLabel.Width = 48
      EditLabel.Height = 12
      EditLabel.Caption = #31471#21475#21495#65306
      LabelPosition = lpLeft
      TabOrder = 1
      Text = '8000'
      OnKeyPress = LeSrvPortKeyPress
    end
  end
  object ClientSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Host = '127.0.0.1'
    Port = 8000
    OnRead = ClientSocketRead
    Left = 56
    Top = 64
  end
end
