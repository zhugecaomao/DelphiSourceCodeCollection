object ftpfm: Tftpfm
  Left = 214
  Top = 194
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'ftp'#25991#20214#19978#20256
  ClientHeight = 281
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 224
    Align = alLeft
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 194
      Top = 179
      Width = 23
      Height = 22
      OnClick = SpeedButton1Click
    end
    object Label2: TLabel
      Left = 8
      Top = 60
      Width = 65
      Height = 17
      AutoSize = False
      Caption = #29992#25143#24080#21495#65306
    end
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 73
      Height = 17
      AutoSize = False
      Caption = #20027#26426#22320#22336#65306
    end
    object Label4: TLabel
      Left = 8
      Top = 104
      Width = 81
      Height = 17
      AutoSize = False
      Caption = #30331#24405#23494#30721#65306
    end
    object wjm: TLabeledEdit
      Left = 80
      Top = 180
      Width = 113
      Height = 21
      EditLabel.Width = 72
      EditLabel.Height = 13
      EditLabel.Caption = #19978#20256#25991#20214#21517#65306
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object yhm: TComboBox
      Left = 80
      Top = 56
      Width = 113
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ItemHeight = 13
      TabOrder = 1
    end
    object zjdz: TComboBox
      Left = 80
      Top = 16
      Width = 113
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ItemHeight = 13
      TabOrder = 2
      OnChange = zjdzChange
    end
    object fwqwjj: TLabeledEdit
      Left = 80
      Top = 136
      Width = 113
      Height = 21
      EditLabel.Width = 72
      EditLabel.Height = 13
      EditLabel.Caption = #36828#31243#25991#20214#22841#65306
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      LabelPosition = lpLeft
      TabOrder = 3
    end
    object dlmm: TEdit
      Left = 80
      Top = 96
      Width = 113
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      PasswordChar = '*'
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 224
    Width = 470
    Height = 57
    Align = alBottom
    TabOrder = 1
    object lj: TBitBtn
      Left = 88
      Top = 16
      Width = 75
      Height = 25
      Caption = #36830#25509
      TabOrder = 0
    end
    object bcbt: TBitBtn
      Left = 8
      Top = 16
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 1
      OnClick = bcbtClick
    end
    object scbt: TBitBtn
      Left = 168
      Top = 16
      Width = 75
      Height = 25
      Caption = #19978#20256
      TabOrder = 2
      OnClick = scbtClick
    end
    object zzbt: TBitBtn
      Left = 248
      Top = 16
      Width = 75
      Height = 25
      Caption = #32456#27490
      TabOrder = 3
    end
    object sxbt: TBitBtn
      Left = 328
      Top = 16
      Width = 75
      Height = 25
      Caption = #21047#26032
      TabOrder = 4
    end
    object BitBtn1: TBitBtn
      Left = 408
      Top = 16
      Width = 59
      Height = 25
      Caption = #26029#24320
      TabOrder = 5
    end
  end
  object Panel3: TPanel
    Left = 225
    Top = 0
    Width = 245
    Height = 224
    Align = alClient
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      AutoSize = False
      Caption = #36828#31243#25991#20214#21517#65306
    end
    object memo1: TListBox
      Left = 8
      Top = 32
      Width = 209
      Height = 177
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnDblClick = memo1DblClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 200
    Top = 96
  end
  object ftpado: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    Left = 217
    Top = 104
  end
  object Timer1: TTimer
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 201
    Top = 64
  end
end
