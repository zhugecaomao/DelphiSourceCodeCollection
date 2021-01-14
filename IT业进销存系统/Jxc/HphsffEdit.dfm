inherited frmHphsffEdit: TfrmHphsffEdit
  Left = 306
  Top = 19
  Width = 352
  Height = 181
  Caption = 'frmHphsffEdit'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 320
    Height = 85
  end
  inherited Label1: TLabel
    Left = 60
    Caption = '名称'
  end
  object Label3: TLabel [2]
    Left = 30
    Top = 64
    Width = 60
    Height = 15
    Caption = '货品属性'
  end
  inherited btnInsert: TBitBtn
    Top = 110
    TabOrder = 2
  end
  inherited btnOk: TBitBtn
    Left = 141
    Top = 110
    TabOrder = 3
  end
  inherited btnCancel: TBitBtn
    Left = 243
    Top = 110
    TabOrder = 4
  end
  inherited DBEdit1: TDBEdit
    Left = 96
    Width = 164
    DataField = 'MC'
    DataSource = Data.sHphsff
  end
  inherited DBNavigator1: TDBNavigator
    Top = 118
    TabOrder = 5
  end
  object ComboBox1: TComboBox
    Left = 96
    Top = 60
    Width = 164
    Height = 23
    Style = csDropDownList
    ItemHeight = 15
    TabOrder = 1
    OnChange = ComboBox1Change
  end
end
