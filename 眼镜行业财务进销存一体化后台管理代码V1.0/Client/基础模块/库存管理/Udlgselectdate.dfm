inherited dlgselectdate: Tdlgselectdate
  Left = 274
  Top = 169
  Caption = #26597#35810#26102#38388
  ClientHeight = 120
  ClientWidth = 300
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 89
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    object Label1: TLabel
      Left = 17
      Top = 8
      Width = 84
      Height = 19
      Caption = #21464#21160#26102#38388
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #38582#20070
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 47
      Width = 13
      Height = 13
      Caption = #20174
    end
    object Label3: TLabel
      Left = 150
      Top = 47
      Width = 13
      Height = 13
      Caption = #21040
    end
    object dtpbegin: TDateTimePicker
      Left = 39
      Top = 43
      Width = 102
      Height = 21
      CalAlignment = dtaLeft
      Date = 38146.4680073495
      Time = 38146.4680073495
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object dtpend: TDateTimePicker
      Left = 171
      Top = 43
      Width = 97
      Height = 21
      CalAlignment = dtaLeft
      Date = 38146.4683584375
      Time = 38146.4683584375
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      OnChange = FormShow
    end
  end
  object btnOk: TBitBtn
    Left = 41
    Top = 93
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 185
    Top = 93
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = btnCancelClick
    Kind = bkCancel
  end
end
