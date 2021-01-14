inherited frmDqEdit: TfrmDqEdit
  Left = 306
  Top = 19
  Width = 352
  Height = 145
  Caption = 'frmDqEdit'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 320
    Height = 49
  end
  inherited Label1: TLabel
    Left = 60
    Caption = 'Ãû³Æ'
  end
  inherited btnInsert: TBitBtn
    Top = 74
  end
  inherited btnOk: TBitBtn
    Left = 141
    Top = 74
  end
  inherited btnCancel: TBitBtn
    Left = 243
    Top = 74
  end
  inherited DBEdit1: TDBEdit
    Left = 96
    Width = 106
    DataField = 'MC'
    DataSource = Data.sDq
  end
  inherited DBNavigator1: TDBNavigator
    Top = 82
  end
end
