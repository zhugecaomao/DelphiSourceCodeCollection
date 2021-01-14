inherited frmKhEdit: TfrmKhEdit
  Left = 224
  Top = 20
  Width = 468
  Height = 509
  Caption = 'frmKhEdit'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 436
    Height = 413
  end
  object Label3: TLabel [1]
    Left = 220
    Top = 28
    Width = 30
    Height = 15
    Caption = '简称'
    FocusControl = DBEdit3
  end
  object Label2: TLabel [2]
    Left = 18
    Top = 396
    Width = 75
    Height = 15
    Caption = '期初应收款'
    FocusControl = DBEdit2
  end
  object Bevel2: TBevel [3]
    Left = 24
    Top = 54
    Width = 415
    Height = 6
    Shape = bsTopLine
  end
  object Label4: TLabel [5]
    Left = 64
    Top = 70
    Width = 30
    Height = 15
    Caption = '全称'
    FocusControl = DBEdit4
  end
  object Label5: TLabel [6]
    Left = 34
    Top = 100
    Width = 60
    Height = 15
    Caption = '所属地区'
  end
  object Label6: TLabel [7]
    Left = 249
    Top = 100
    Width = 45
    Height = 15
    Caption = '联系人'
    FocusControl = DBEdit6
  end
  object Label7: TLabel [8]
    Left = 64
    Top = 130
    Width = 30
    Height = 15
    Caption = '电话'
    FocusControl = DBEdit7
  end
  object Label8: TLabel [9]
    Left = 264
    Top = 130
    Width = 30
    Height = 15
    Caption = '传真'
    FocusControl = DBEdit8
  end
  object Label9: TLabel [10]
    Left = 64
    Top = 160
    Width = 30
    Height = 15
    Caption = '地址'
    FocusControl = DBEdit9
  end
  object Label10: TLabel [11]
    Left = 332
    Top = 262
    Width = 30
    Height = 15
    Caption = '邮编'
    FocusControl = DBEdit10
  end
  object Label11: TLabel [12]
    Left = 64
    Top = 190
    Width = 30
    Height = 15
    Caption = '网址'
    FocusControl = DBEdit11
  end
  object Label12: TLabel [13]
    Left = 34
    Top = 220
    Width = 60
    Height = 15
    Caption = '电子邮箱'
    FocusControl = DBEdit12
  end
  object Label13: TLabel [14]
    Left = 34
    Top = 262
    Width = 60
    Height = 15
    Caption = '开户银行'
    FocusControl = DBEdit13
  end
  object Label14: TLabel [15]
    Left = 34
    Top = 292
    Width = 60
    Height = 15
    Caption = '银行帐号'
    FocusControl = DBEdit14
  end
  object Label15: TLabel [16]
    Left = 249
    Top = 292
    Width = 45
    Height = 15
    Caption = '纳税号'
    FocusControl = DBEdit15
  end
  object Label16: TLabel [17]
    Left = 34
    Top = 322
    Width = 60
    Height = 15
    Caption = '信用额度'
    FocusControl = DBEdit16
  end
  object Label17: TLabel [18]
    Left = 64
    Top = 352
    Width = 30
    Height = 15
    Caption = '备注'
    FocusControl = DBEdit17
  end
  object Bevel3: TBevel [19]
    Left = 24
    Top = 246
    Width = 415
    Height = 6
    Shape = bsTopLine
  end
  object Bevel4: TBevel [20]
    Left = 24
    Top = 378
    Width = 415
    Height = 6
    Shape = bsTopLine
  end
  inherited btnInsert: TBitBtn
    Top = 438
    TabOrder = 18
  end
  inherited btnOk: TBitBtn
    Left = 256
    Top = 438
    TabOrder = 19
  end
  inherited btnCancel: TBitBtn
    Left = 358
    Top = 438
    TabOrder = 20
  end
  inherited DBEdit1: TDBEdit
    Width = 86
    DataField = 'BH'
    DataSource = Data.sKh
  end
  object DBEdit3: TDBEdit [25]
    Left = 256
    Top = 24
    Width = 170
    Height = 23
    DataField = 'MC'
    DataSource = Data.sKh
    TabOrder = 1
  end
  object DBEdit2: TDBEdit [26]
    Left = 102
    Top = 390
    Width = 100
    Height = 23
    DataField = 'QCJE'
    DataSource = Data.sKh
    TabOrder = 16
  end
  inherited DBNavigator1: TDBNavigator
    Top = 446
    TabOrder = 21
  end
  object DBEdit4: TDBEdit
    Left = 102
    Top = 66
    Width = 324
    Height = 23
    DataField = 'QC'
    DataSource = Data.sKh
    TabOrder = 2
  end
  object DBEdit6: TDBEdit
    Left = 300
    Top = 96
    Width = 127
    Height = 23
    DataField = 'LXR'
    DataSource = Data.sKh
    TabOrder = 4
  end
  object DBEdit7: TDBEdit
    Left = 102
    Top = 126
    Width = 127
    Height = 23
    DataField = 'DH'
    DataSource = Data.sKh
    TabOrder = 5
  end
  object DBEdit8: TDBEdit
    Left = 300
    Top = 126
    Width = 127
    Height = 23
    DataField = 'CZ'
    DataSource = Data.sKh
    TabOrder = 6
  end
  object DBEdit9: TDBEdit
    Left = 102
    Top = 156
    Width = 324
    Height = 23
    DataField = 'DZ'
    DataSource = Data.sKh
    TabOrder = 7
  end
  object DBEdit10: TDBEdit
    Left = 368
    Top = 258
    Width = 58
    Height = 23
    DataField = 'YB'
    DataSource = Data.sKh
    TabOrder = 11
  end
  object DBEdit11: TDBEdit
    Left = 102
    Top = 186
    Width = 324
    Height = 23
    DataField = 'WZ'
    DataSource = Data.sKh
    TabOrder = 8
  end
  object DBEdit12: TDBEdit
    Left = 102
    Top = 216
    Width = 324
    Height = 23
    DataField = 'DY'
    DataSource = Data.sKh
    TabOrder = 9
  end
  object DBEdit13: TDBEdit
    Left = 102
    Top = 258
    Width = 211
    Height = 23
    DataField = 'KHYH'
    DataSource = Data.sKh
    TabOrder = 10
  end
  object DBEdit14: TDBEdit
    Left = 102
    Top = 288
    Width = 127
    Height = 23
    DataField = 'YHZH'
    DataSource = Data.sKh
    TabOrder = 12
  end
  object DBEdit15: TDBEdit
    Left = 300
    Top = 288
    Width = 127
    Height = 23
    DataField = 'NSH'
    DataSource = Data.sKh
    TabOrder = 13
  end
  object DBEdit16: TDBEdit
    Left = 102
    Top = 318
    Width = 100
    Height = 23
    DataField = 'XYED'
    DataSource = Data.sKh
    TabOrder = 14
  end
  object DBEdit17: TDBEdit
    Left = 102
    Top = 348
    Width = 324
    Height = 23
    DataField = 'BZ'
    DataSource = Data.sKh
    TabOrder = 15
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 102
    Top = 96
    Width = 127
    Height = 23
    DataField = 'DQID'
    DataSource = Data.sKh
    DropDownAlign = daCenter
    DropDownRows = 10
    KeyField = 'ID'
    ListField = 'MC'
    ListSource = Data.sDq
    TabOrder = 3
  end
  object DBCheckBox1: TDBCheckBox
    Left = 249
    Top = 393
    Width = 97
    Height = 17
    Caption = '非使用中'
    DataField = 'ZT'
    DataSource = Data.sKh
    TabOrder = 17
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
end
