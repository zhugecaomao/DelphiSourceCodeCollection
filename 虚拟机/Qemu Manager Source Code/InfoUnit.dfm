object Info: TInfo
  Left = 299
  Top = 279
  BorderStyle = bsDialog
  Caption = 'Information'
  ClientHeight = 152
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object TntLabel1: TTntLabel
    Left = 4
    Top = 21
    Width = 390
    Height = 13
    Caption = 
      'The file transfer server is based on FTP.  When the guest machin' +
      'e connects to the'
  end
  object TntLabel2: TTntLabel
    Left = 4
    Top = 37
    Width = 464
    Height = 13
    Caption = 
      'Qemu Manager File Transfer server via an ftp client, you will be' +
      ' prompted to enter a user name and'
  end
  object TntLabel3: TTntLabel
    Left = 4
    Top = 53
    Width = 126
    Height = 13
    Caption = 'password this is as follows:'
  end
  object TntLabel4: TTntLabel
    Left = 4
    Top = 4
    Width = 249
    Height = 13
    Caption = 'Welcome to the Qemu Manager File Transfer Server.'
  end
  object TntLabel5: TTntLabel
    Left = 3
    Top = 75
    Width = 94
    Height = 13
    Caption = 'User Name:  QEMU'
  end
  object TntLabel6: TTntLabel
    Left = 3
    Top = 91
    Width = 87
    Height = 13
    Caption = 'Password:  QEMU'
  end
  object TntLabel7: TTntLabel
    Left = 3
    Top = 107
    Width = 101
    Height = 13
    Caption = '(both are uppercase).'
  end
  object Button1: TTntButton
    Left = 597
    Top = 124
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Disable: TTntCheckBox
    Left = 2
    Top = 129
    Width = 201
    Height = 17
    Caption = 'Do NOT show this message again'
    TabOrder = 1
  end
end
