object FTPSetup: TFTPSetup
  Left = 432
  Top = 324
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'File Transfer Configuration'
  ClientHeight = 194
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox3: TTntGroupBox
    Left = 0
    Top = 3
    Width = 577
    Height = 158
    Caption = 'File Transfer Server:'
    TabOrder = 0
    object Label6: TTntLabel
      Left = 8
      Top = 56
      Width = 32
      Height = 13
      Caption = 'Folder:'
    end
    object SpeedButton2: TTntSpeedButton
      Left = 458
      Top = 51
      Width = 23
      Height = 22
      Caption = '..'
      OnClick = SpeedButton2Click
    end
    object Label7: TTntLabel
      Left = 8
      Top = 80
      Width = 59
      Height = 13
      Caption = 'Allowed List:'
    end
    object TntLabel1: TTntLabel
      Left = 6
      Top = 101
      Width = 310
      Height = 13
      Caption = 
        'A List of the IP Addresses that can access the file transfer ser' +
        'ver, '
    end
    object TntLabel2: TTntLabel
      Left = 6
      Top = 114
      Width = 329
      Height = 13
      Caption = 
        'each IP Address should be separated by a semi colon. this is req' +
        'uired '
    end
    object TntLabel3: TTntLabel
      Left = 6
      Top = 126
      Width = 181
      Height = 13
      Caption = 'if using TAP, otherwise leave BLANK! '
    end
    object TntLabel4: TTntLabel
      Left = 6
      Top = 139
      Width = 377
      Height = 13
      Caption = 
        '(Only use LOCAL IP Addresses to prevent unauthorized access via ' +
        'the internet).'
    end
    object Full: TTntCheckBox
      Left = 8
      Top = 16
      Width = 377
      Height = 17
      Caption = 'Enable Full System Sharing'
      TabOrder = 0
      OnClick = FullClick
    end
    object Justfol: TTntCheckBox
      Left = 8
      Top = 35
      Width = 377
      Height = 17
      Caption = 'Share The Following Folder Only'
      TabOrder = 1
      OnClick = JustfolClick
    end
    object SharePath: TTntEdit
      Left = 50
      Top = 51
      Width = 407
      Height = 21
      TabOrder = 2
    end
    object AList: TTntEdit
      Left = 79
      Top = 76
      Width = 407
      Height = 21
      TabOrder = 3
    end
  end
  object Button1: TTntButton
    Left = 421
    Top = 165
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TTntButton
    Left = 500
    Top = 165
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = Button2Click
  end
end
