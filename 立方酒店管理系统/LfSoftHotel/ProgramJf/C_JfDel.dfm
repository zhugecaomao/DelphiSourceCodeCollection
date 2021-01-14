object JfDelForm: TJfDelForm
  Left = 278
  Top = 105
  Width = 350
  Height = 271
  Caption = #35805#21333#21024#38500
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    342
    244)
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 32
    Top = 77
    Width = 72
    Height = 12
    Caption = #24320#22987#26085#26399#26102#38388
  end
  object Label2: TLabel
    Left = 174
    Top = 77
    Width = 72
    Height = 12
    Caption = #32467#26463#26085#26399#26102#38388
  end
  object lblTitle: TLabel
    Left = 112
    Top = 9
    Width = 101
    Height = 24
    Caption = #35805#21333#21024#38500
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object dtpBd: TDateTimePicker
    Left = 32
    Top = 93
    Width = 119
    Height = 20
    CalAlignment = dtaLeft
    Date = 37421.3497881944
    Time = 37421.3497881944
    DateFormat = dfLong
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object dtpEd: TDateTimePicker
    Left = 174
    Top = 93
    Width = 120
    Height = 20
    CalAlignment = dtaLeft
    Date = 37421.3500603009
    Time = 37421.3500603009
    DateFormat = dfLong
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object btnOk: TBitBtn
    Left = 67
    Top = 193
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #30830#23450'(&O)'
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCanc: TBitBtn
    Left = 203
    Top = 193
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 3
  end
  object qryWork: TQuery
    DatabaseName = 'LFHOTELUSER'
    Left = 280
    Top = 16
  end
end
