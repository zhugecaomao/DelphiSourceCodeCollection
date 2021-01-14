inherited dlgtotalselect: Tdlgtotalselect
  Left = 305
  Top = 180
  Caption = #38646#21806#32479#35745#26465#20214
  ClientHeight = 135
  ClientWidth = 248
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TBitBtn
    Left = 98
    Top = 108
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 172
    Top = 108
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 1
    OnClick = btnCancelClick
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 248
    Height = 105
    Align = alTop
    Caption = #35831#35774#32622#26597#35810#26465#20214
    TabOrder = 2
    object ckbCode: TCheckBox
      Left = 10
      Top = 24
      Width = 81
      Height = 17
      Caption = #26092
      TabOrder = 0
      OnClick = ckbCodeClick
    end
    object ckbMonth: TCheckBox
      Left = 10
      Top = 48
      Width = 72
      Height = 17
      Caption = #26376
      TabOrder = 1
      OnClick = ckbMonthClick
    end
    object ckbyear: TCheckBox
      Left = 10
      Top = 72
      Width = 82
      Height = 17
      Caption = #24180
      TabOrder = 2
      OnClick = ckbyearClick
    end
    object cmbsel: TComboBox
      Left = 91
      Top = 22
      Width = 120
      Height = 21
      Style = csDropDownList
      Color = cl3DLight
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        #19978#26092
        #20013#26092
        #19979#26092
        #20840#37096)
    end
    object edtyear: TComboBox
      Left = 91
      Top = 71
      Width = 120
      Height = 21
      Style = csDropDownList
      Color = cl3DLight
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        '2000'
        '2001'
        '2002'
        '2003'
        '2004'
        '2005'
        '2006'
        '2007'
        '2008'
        '2009'
        '2010'
        '2011')
    end
    object edtmonth: TComboBox
      Left = 91
      Top = 46
      Width = 120
      Height = 21
      Style = csDropDownList
      Color = cl3DLight
      ItemHeight = 13
      TabOrder = 5
      Items.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12')
    end
  end
end
