inherited frmGroupDesktopClass: TfrmGroupDesktopClass
  Left = 307
  Top = 267
  Width = 361
  Height = 142
  Caption = '桌面分类'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 331
    Height = 47
  end
  inherited Label1: TLabel
    Left = 34
    Width = 60
    Caption = '桌面分类'
  end
  inherited btnInsert: TBitBtn
    Top = 70
  end
  inherited btnOk: TBitBtn
    Left = 151
  end
  inherited btnCancel: TBitBtn
    Left = 253
  end
  inherited DBEdit1: TDBEdit
    Width = 223
    DataField = 'cName'
    DataSource = Data.sAppGroupDesktopClass
  end
  inherited DBNavigator1: TDBNavigator
    Top = 77
  end
end
