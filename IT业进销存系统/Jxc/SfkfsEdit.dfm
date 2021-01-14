inherited frmSfkfsEdit: TfrmSfkfsEdit
  Left = 306
  Top = 19
  Width = 352
  Height = 184
  Caption = 'frmSfkfsEdit'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 320
    Height = 88
  end
  inherited Label1: TLabel
    Left = 60
    Caption = 'Ãû³Æ'
  end
  object Label5: TLabel [2]
    Left = 34
    Top = 64
    Width = 60
    Height = 15
    Caption = 'È±Ê¡ÕÊ»§'
  end
  inherited btnInsert: TBitBtn
    Top = 113
    TabOrder = 2
  end
  inherited btnOk: TBitBtn
    Left = 141
    Top = 113
    TabOrder = 3
  end
  inherited btnCancel: TBitBtn
    Left = 243
    Top = 113
    TabOrder = 4
  end
  inherited DBEdit1: TDBEdit
    Left = 96
    Width = 132
    DataField = 'MC'
    DataSource = Data.sSfkfs
  end
  inherited DBNavigator1: TDBNavigator
    Top = 121
    TabOrder = 5
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 96
    Top = 60
    Width = 184
    Height = 23
    DataField = 'ZHID'
    DataSource = Data.sSfkfs
    DropDownAlign = daCenter
    DropDownRows = 10
    KeyField = 'ID'
    ListField = 'MC'
    ListSource = Data.sZh
    TabOrder = 1
    OnKeyDown = DBLookupComboBox1KeyDown
  end
end
