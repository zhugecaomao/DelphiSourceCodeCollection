inherited frmHpEdit: TfrmHpEdit
  Left = 270
  Top = 1
  Width = 459
  Height = 499
  Caption = 'frmHpEdit'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 427
    Height = 403
  end
  inherited Label1: TLabel
    Left = 60
    Top = 64
  end
  object Label3: TLabel [2]
    Left = 60
    Top = 94
    Width = 30
    Height = 15
    Caption = '类别'
  end
  object Label4: TLabel [3]
    Left = 30
    Top = 124
    Width = 60
    Height = 15
    Caption = '品名规格'
    FocusControl = DBEdit4
  end
  object Label5: TLabel [4]
    Left = 60
    Top = 154
    Width = 30
    Height = 15
    Caption = '单位'
    FocusControl = DBEdit5
  end
  object Label6: TLabel [5]
    Left = 30
    Top = 28
    Width = 60
    Height = 15
    Alignment = taRightJustify
    Caption = '核算方法'
  end
  object Label7: TLabel [6]
    Left = 233
    Top = 28
    Width = 60
    Height = 15
    Caption = '货品属性'
  end
  object Label8: TLabel [7]
    Left = 30
    Top = 184
    Width = 60
    Height = 15
    Caption = '最近进价'
    FocusControl = DBEdit8
  end
  object Label9: TLabel [8]
    Left = 219
    Top = 184
    Width = 45
    Height = 15
    Caption = '旧进价'
    FocusControl = DBEdit9
  end
  object Label10: TLabel [9]
    Left = 219
    Top = 154
    Width = 45
    Height = 15
    Caption = '加权价'
    FocusControl = DBEdit10
  end
  object Label11: TLabel [10]
    Left = 30
    Top = 214
    Width = 60
    Height = 15
    Caption = '库存上限'
    FocusControl = DBEdit11
  end
  object Label12: TLabel [11]
    Left = 204
    Top = 216
    Width = 60
    Height = 15
    Caption = '库存下限'
    FocusControl = DBEdit12
  end
  object Bevel2: TBevel [12]
    Left = 24
    Top = 240
    Width = 403
    Height = 6
    Shape = bsTopLine
  end
  object Bevel3: TBevel [13]
    Left = 232
    Top = 378
    Width = 195
    Height = 6
    Shape = bsTopLine
  end
  object Label13: TLabel [14]
    Left = 30
    Top = 250
    Width = 60
    Height = 15
    Caption = '期初库存'
    FocusControl = DBEdit11
  end
  object Bevel4: TBevel [15]
    Left = 225
    Top = 246
    Width = 10
    Height = 163
    Shape = bsLeftLine
  end
  object Label14: TLabel [16]
    Left = 234
    Top = 250
    Width = 30
    Height = 15
    Caption = '售价'
    FocusControl = DBEdit11
  end
  object Bevel5: TBevel [17]
    Left = 24
    Top = 54
    Width = 403
    Height = 6
    Shape = bsTopLine
  end
  object Label2: TLabel [18]
    Left = 30
    Top = 382
    Width = 60
    Height = 15
    Caption = '期初金额'
    FocusControl = DBEdit3
  end
  inherited btnInsert: TBitBtn
    Top = 428
    TabOrder = 14
  end
  inherited btnOk: TBitBtn
    Left = 247
    Top = 428
    TabOrder = 15
  end
  inherited btnCancel: TBitBtn
    Left = 349
    Top = 428
    TabOrder = 16
  end
  inherited DBEdit1: TDBEdit
    Left = 96
    Top = 60
    Width = 121
    DataField = 'BH'
    DataSource = Data.sHp
    TabOrder = 1
  end
  inherited DBNavigator1: TDBNavigator
    Top = 436
    TabOrder = 17
  end
  object DBEdit4: TDBEdit
    Left = 96
    Top = 120
    Width = 324
    Height = 23
    DataField = 'PM'
    DataSource = Data.sHp
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 96
    Top = 150
    Width = 42
    Height = 23
    DataField = 'DW'
    DataSource = Data.sHp
    TabOrder = 4
  end
  object DBEdit8: TDBEdit
    Left = 96
    Top = 180
    Width = 90
    Height = 23
    DataField = 'JJ'
    DataSource = Data.sHp
    TabOrder = 6
  end
  object DBEdit9: TDBEdit
    Left = 270
    Top = 180
    Width = 90
    Height = 23
    DataField = 'JJJ'
    DataSource = Data.sHp
    TabOrder = 7
  end
  object DBEdit10: TDBEdit
    Left = 270
    Top = 150
    Width = 90
    Height = 23
    TabStop = False
    DataField = 'JQJ'
    DataSource = Data.sHp
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit11: TDBEdit
    Left = 96
    Top = 210
    Width = 90
    Height = 23
    DataField = 'SX'
    DataSource = Data.sHp
    TabOrder = 8
  end
  object DBEdit12: TDBEdit
    Left = 270
    Top = 210
    Width = 90
    Height = 23
    DataField = 'XX'
    DataSource = Data.sHp
    TabOrder = 9
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 96
    Top = 90
    Width = 121
    Height = 23
    DataField = 'HPLBID'
    DataSource = Data.sHp
    DropDownAlign = daCenter
    DropDownRows = 10
    KeyField = 'ID'
    ListField = 'MC'
    ListSource = Data.sHplb
    TabOrder = 2
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 96
    Top = 24
    Width = 121
    Height = 23
    DataField = 'HPHSFFID'
    DataSource = Data.sHp
    DropDownAlign = daCenter
    DropDownRows = 10
    KeyField = 'ID'
    ListField = 'MC'
    ListSource = Data.sHphsff
    TabOrder = 0
  end
  object sgKc: TStringGrid
    Left = 30
    Top = 270
    Width = 187
    Height = 97
    DefaultRowHeight = 22
    FixedCols = 4
    RowCount = 4
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goAlwaysShowEditor]
    TabOrder = 10
    RowHeights = (
      22
      22
      22
      22)
  end
  object sgSj: TStringGrid
    Left = 234
    Top = 270
    Width = 187
    Height = 97
    ColCount = 4
    DefaultRowHeight = 22
    FixedCols = 3
    RowCount = 4
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goAlwaysShowEditor]
    TabOrder = 12
    RowHeights = (
      22
      22
      23
      22)
  end
  object DBEdit2: TDBEdit
    Left = 299
    Top = 24
    Width = 121
    Height = 23
    Color = cl3DLight
    DataField = 'HPSXID'
    DataSource = Data.sHp
    ReadOnly = True
    TabOrder = 18
  end
  object DBCheckBox1: TDBCheckBox
    Left = 234
    Top = 390
    Width = 97
    Height = 17
    Caption = '非使用中'
    DataField = 'ZT'
    DataSource = Data.sHp
    TabOrder = 13
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBEdit3: TDBEdit
    Left = 96
    Top = 378
    Width = 90
    Height = 23
    DataField = 'QCJE'
    DataSource = Data.sHp
    TabOrder = 11
  end
end
