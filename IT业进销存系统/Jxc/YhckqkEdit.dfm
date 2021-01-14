inherited frmYhckqkEdit: TfrmYhckqkEdit
  Left = 306
  Top = 19
  Width = 405
  Height = 361
  Caption = 'frmYhckqkEdit'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 373
    Height = 265
  end
  inherited Label1: TLabel
    Left = 60
    Caption = '日期'
  end
  object Label2: TLabel [2]
    Left = 60
    Top = 172
    Width = 30
    Height = 15
    Caption = '票号'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [3]
    Left = 60
    Top = 208
    Width = 30
    Height = 15
    Caption = '金额'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [4]
    Left = 60
    Top = 244
    Width = 30
    Height = 15
    Caption = '备注'
    FocusControl = DBEdit4
  end
  object Label5: TLabel [5]
    Left = 45
    Top = 64
    Width = 45
    Height = 15
    Caption = '经办人'
  end
  object Label6: TLabel [6]
    Left = 30
    Top = 100
    Width = 60
    Height = 15
    Caption = '转出帐户'
  end
  object Label7: TLabel [7]
    Left = 30
    Top = 136
    Width = 60
    Height = 15
    Caption = '转入帐户'
  end
  inherited btnInsert: TBitBtn
    Top = 290
    TabOrder = 7
  end
  inherited btnOk: TBitBtn
    Left = 194
    Top = 290
    TabOrder = 8
  end
  inherited btnCancel: TBitBtn
    Left = 296
    Top = 290
    TabOrder = 9
  end
  inherited DBEdit1: TDBEdit
    Left = 96
    Width = 90
    DataField = 'RQ'
    DataSource = Data.sYhckqk
  end
  inherited DBNavigator1: TDBNavigator
    Top = 298
    TabOrder = 10
  end
  object DBEdit2: TDBEdit
    Left = 96
    Top = 168
    Width = 164
    Height = 23
    DataField = 'PH'
    DataSource = Data.sYhckqk
    TabOrder = 4
  end
  object DBEdit3: TDBEdit
    Left = 96
    Top = 204
    Width = 90
    Height = 23
    DataField = 'JE'
    DataSource = Data.sYhckqk
    TabOrder = 5
  end
  object DBEdit4: TDBEdit
    Left = 96
    Top = 240
    Width = 271
    Height = 23
    DataField = 'BZ'
    DataSource = Data.sYhckqk
    TabOrder = 6
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 96
    Top = 132
    Width = 164
    Height = 23
    DataField = 'ZRZHID'
    DataSource = Data.sYhckqk
    KeyField = 'ID'
    ListField = 'MC'
    ListSource = Data.sZh
    TabOrder = 3
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 96
    Top = 96
    Width = 164
    Height = 23
    DataField = 'ZCZHID'
    DataSource = Data.sYhckqk
    KeyField = 'ID'
    ListField = 'MC'
    ListSource = Data.sZh
    TabOrder = 2
  end
  object DBComboBox1: TDBComboBox
    Left = 96
    Top = 60
    Width = 90
    Height = 23
    Color = clWhite
    DataField = 'JSR'
    DataSource = Data.sYhckqk
    ItemHeight = 15
    TabOrder = 1
  end
end
