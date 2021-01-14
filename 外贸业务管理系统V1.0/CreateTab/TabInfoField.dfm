object TabInfoField_frm: TTabInfoField_frm
  Left = 392
  Top = 189
  Width = 371
  Height = 371
  Caption = 'TabInfoField_frm'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 42
    Height = 14
    Caption = #23383#27573#21517
  end
  object Label2: TLabel
    Left = 18
    Top = 55
    Width = 56
    Height = 14
    Caption = #23383#27573#25551#36848
  end
  object Label4: TLabel
    Left = 46
    Top = 86
    Width = 28
    Height = 14
    Caption = #31867#22411
  end
  object Label3: TLabel
    Left = 46
    Top = 118
    Width = 28
    Height = 14
    Caption = #38271#24230
  end
  object Label5: TLabel
    Left = 32
    Top = 177
    Width = 42
    Height = 14
    Caption = #40664#35748#20540
  end
  object Label6: TLabel
    Left = 18
    Top = 206
    Width = 56
    Height = 14
    Caption = #23383#20856#34920#21517
  end
  object Label7: TLabel
    Left = 18
    Top = 235
    Width = 56
    Height = 14
    Caption = #23383#20856#20027#38190
  end
  object Label8: TLabel
    Left = 18
    Top = 264
    Width = 56
    Height = 14
    Caption = #23383#20856#20027#38190
  end
  object bbsave: TBitBtn
    Left = 64
    Top = 296
    Width = 57
    Height = 25
    Caption = #20445#23384
    TabOrder = 7
    OnClick = bbsaveClick
  end
  object bbclose: TBitBtn
    Left = 224
    Top = 296
    Width = 57
    Height = 25
    Caption = #20851#38381
    TabOrder = 14
    OnClick = bbcloseClick
  end
  object FieldID: TEdit
    Left = 80
    Top = 24
    Width = 161
    Height = 22
    ImeMode = imClose
    ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
    TabOrder = 0
    Text = 'FieldID'
  end
  object FieldName: TEdit
    Left = 80
    Top = 54
    Width = 225
    Height = 22
    ImeMode = imChinese
    ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
    TabOrder = 2
    Text = 'FieldName'
  end
  object DefaultValue: TEdit
    Left = 80
    Top = 174
    Width = 225
    Height = 22
    ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
    TabOrder = 6
    Text = 'DefaultValue'
  end
  object bbclear: TBitBtn
    Left = 144
    Top = 296
    Width = 57
    Height = 25
    Caption = #28165#31354
    TabOrder = 13
    OnClick = bbclearClick
  end
  object FieldLength: TEdit
    Left = 80
    Top = 114
    Width = 225
    Height = 22
    ImeMode = imClose
    ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
    TabOrder = 4
    Text = 'Fieldtype'
    OnExit = FieldLengthExit
  end
  object Fieldtype: TComboBox
    Left = 80
    Top = 84
    Width = 225
    Height = 22
    ImeMode = imClose
    ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
    ItemHeight = 14
    TabOrder = 3
    Text = 'Fieldtype'
    OnChange = FieldtypeChange
  end
  object IfNull: TCheckBox
    Left = 80
    Top = 144
    Width = 49
    Height = 17
    Caption = #21487#31354
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object boxPrimaryKEY: TCheckBox
    Left = 248
    Top = 24
    Width = 54
    Height = 17
    Caption = #20027#38190
    TabOrder = 1
  end
  object boxFlag: TCheckBox
    Left = 144
    Top = 144
    Width = 65
    Height = 17
    Caption = #21487#32534#36753
    Checked = True
    State = cbChecked
    TabOrder = 11
  end
  object DicFieldID: TEdit
    Left = 80
    Top = 234
    Width = 227
    Height = 22
    ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
    TabOrder = 9
  end
  object DicTab: TComboBox
    Left = 80
    Top = 204
    Width = 225
    Height = 22
    ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
    ItemHeight = 14
    TabOrder = 8
    OnChange = DicTabChange
  end
  object DicFieldName: TEdit
    Left = 80
    Top = 264
    Width = 227
    Height = 22
    ImeName = #20013#25991' ('#31616#20307') - '#20116#31508#21152#21152
    TabOrder = 10
  end
  object boxlistflag: TCheckBox
    Left = 216
    Top = 144
    Width = 65
    Height = 17
    Caption = #21487#21015#34920
    Checked = True
    State = cbChecked
    TabOrder = 12
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule_frm.ADOConnection1
    Parameters = <>
    Left = 8
    Top = 24
  end
end
