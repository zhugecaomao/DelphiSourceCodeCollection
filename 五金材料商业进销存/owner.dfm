object frmOwner: TfrmOwner
  Left = 219
  Top = 217
  Width = 684
  Height = 393
  Caption = #20844#21496#22522#26412#36164#26009
  Color = 13612943
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TKvLabel
    Left = 40
    Top = 14
    Width = 68
    Height = 13
    AutoSize = False
    Caption = #20844#21496#21517#31216
    FocusControl = DBEdit1
  end
  object Label2: TKvLabel
    Left = 40
    Top = 59
    Width = 24
    Height = 13
    AutoSize = False
    Caption = #22320#22336
    FocusControl = DBEdit2
  end
  object Label3: TKvLabel
    Left = 40
    Top = 104
    Width = 24
    Height = 13
    AutoSize = False
    Caption = #30005#35805
    FocusControl = DBEdit3
  end
  object Label4: TKvLabel
    Left = 40
    Top = 152
    Width = 24
    Height = 13
    AutoSize = False
    Caption = #20256#30495
    FocusControl = DBEdit4
  end
  object Label5: TKvLabel
    Left = 433
    Top = 109
    Width = 48
    Height = 13
    AutoSize = False
    Caption = #37038#25919#32534#30721
    FocusControl = DBEdit5
  end
  object Label6: TKvLabel
    Left = 38
    Top = 196
    Width = 48
    Height = 13
    AutoSize = False
    Caption = #30005#23376#37038#20214
    FocusControl = DBEdit6
  end
  object Label7: TKvLabel
    Left = 433
    Top = 162
    Width = 80
    Height = 13
    AutoSize = False
    Caption = ' '#31246#29575' '
    FocusControl = DBEdit7
  end
  object Label8: TKvLabel
    Left = 40
    Top = 240
    Width = 48
    Height = 13
    AutoSize = False
    Caption = #24320#25143#38134#34892
    FocusControl = DBEdit8
  end
  object Label9: TKvLabel
    Left = 40
    Top = 287
    Width = 48
    Height = 13
    AutoSize = False
    Caption = #38134#34892#24080#21495
    FocusControl = DBEdit9
  end
  object Label10: TKvLabel
    Left = 433
    Top = 205
    Width = 24
    Height = 13
    AutoSize = False
    Caption = #22791#27880
    FocusControl = DBMemo1
  end
  object Bevel1: TBevel
    Left = 24
    Top = 8
    Width = 625
    Height = 337
  end
  object DBEdit1: TDBEdit
    Left = 40
    Top = 31
    Width = 593
    Height = 21
    DataField = 'Name'
    ImeName = #19975#33021#20116#31508'2000a+'
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 40
    Top = 75
    Width = 585
    Height = 21
    DataField = 'Address'
    ImeName = #19975#33021#20116#31508'2000a+'
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 40
    Top = 120
    Width = 304
    Height = 21
    DataField = 'Tel'
    ImeName = #19975#33021#20116#31508'2000a+'
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 40
    Top = 168
    Width = 304
    Height = 21
    DataField = 'Fax'
    ImeName = #19975#33021#20116#31508'2000a+'
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 433
    Top = 125
    Width = 160
    Height = 21
    DataField = 'PostCode'
    ImeName = #19975#33021#20116#31508'2000a+'
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 38
    Top = 212
    Width = 304
    Height = 21
    DataField = 'Email'
    ImeName = #19975#33021#20116#31508'2000a+'
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 433
    Top = 178
    Width = 160
    Height = 21
    DataField = 'TaxRate'
    ImeName = #19975#33021#20116#31508'2000a+'
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 40
    Top = 256
    Width = 305
    Height = 21
    DataField = 'Bank'
    ImeName = #19975#33021#20116#31508'2000a+'
    TabOrder = 7
  end
  object DBEdit9: TDBEdit
    Left = 40
    Top = 303
    Width = 184
    Height = 21
    DataField = 'BankNo'
    ImeName = #19975#33021#20116#31508'2000a+'
    TabOrder = 8
  end
  object DBMemo1: TDBMemo
    Left = 433
    Top = 221
    Width = 160
    Height = 89
    DataField = 'Notes'
    ImeName = #19975#33021#20116#31508'2000a+'
    TabOrder = 9
  end
  object DosMove1: TDosMove
    Active = True
    Left = 608
    Top = 112
  end
  object RegForm1: TRegForm
    RegEnabled = True
    RegShowWarning = False
    RegLocation = CurrentUser
    RegKey = '\Software\ww\'#36827#38144#23384'\owner'
    Left = 611
    Top = 169
  end
end
