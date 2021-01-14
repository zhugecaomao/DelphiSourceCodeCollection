inherited frmHplbEdit: TfrmHplbEdit
  Left = 261
  Top = 70
  Width = 387
  Height = 181
  Caption = 'frmHplbEdit'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 355
    Height = 85
  end
  inherited Label1: TLabel
    Left = 60
    Caption = 'Ãû³Æ'
  end
  object Label3: TLabel [2]
    Left = 60
    Top = 64
    Width = 30
    Height = 15
    Caption = 'ËµÃ÷'
    FocusControl = DBEdit3
  end
  inherited btnInsert: TBitBtn
    Top = 110
    TabOrder = 2
  end
  inherited btnOk: TBitBtn
    Left = 176
    Top = 110
    TabOrder = 3
  end
  inherited btnCancel: TBitBtn
    Left = 278
    Top = 110
    TabOrder = 4
  end
  inherited DBEdit1: TDBEdit
    Left = 96
    Width = 132
    DataField = 'MC'
    DataSource = Data.sHplb
  end
  inherited DBNavigator1: TDBNavigator
    Top = 118
    TabOrder = 5
  end
  object DBEdit3: TDBEdit
    Left = 96
    Top = 60
    Width = 244
    Height = 23
    DataField = 'BZ'
    DataSource = Data.sHplb
    TabOrder = 1
  end
end
