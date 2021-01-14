object frmSetDate: TfrmSetDate
  Left = 277
  Top = 154
  Width = 340
  Height = 245
  BorderStyle = bsSizeToolWin
  Caption = #26085#26399#36873#25321
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 19
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 421
    Height = 223
  end
  object Shape2: TShape
    Left = 0
    Top = 222
    Width = 421
    Height = 48
  end
  object Edit1: TEdit
    Left = 175
    Top = 144
    Width = 153
    Height = 23
    TabOrder = 2
    Text = 'Edit1'
  end
  object MonthCalendar1: TMonthCalendar
    Left = 1
    Top = 1
    Width = 414
    Height = 213
    AutoSize = True
    Date = 36715.791366782410000000
    TabOrder = 0
    OnDblClick = btnOkClick
  end
  object Panel1: TPanel
    Left = 1
    Top = 223
    Width = 418
    Height = 46
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 76
      Height = 19
      Caption = #40664#35748#20540#65306
    end
    object btnOk: TButton
      Left = 336
      Top = 6
      Width = 74
      Height = 35
      Caption = #30830#35748
      Default = True
      TabOrder = 0
      OnClick = btnOkClick
    end
    object RadioButton1: TRadioButton
      Left = 86
      Top = 15
      Width = 62
      Height = 22
      Caption = #24403#22825
      TabOrder = 1
    end
    object RadioButton2: TRadioButton
      Left = 155
      Top = 15
      Width = 122
      Height = 22
      Caption = #19978#27425#30340#36755#20837
      TabOrder = 2
    end
    object RadioButton3: TRadioButton
      Left = 280
      Top = 15
      Width = 47
      Height = 22
      Caption = #26080
      TabOrder = 3
    end
  end
end
