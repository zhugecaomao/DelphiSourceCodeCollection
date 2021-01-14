inherited frmSjzlEdit: TfrmSjzlEdit
  Left = 306
  Top = 19
  Width = 387
  Height = 217
  Caption = 'frmSjzlEdit'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 355
    Height = 121
  end
  inherited Label1: TLabel
    Left = 60
    Top = 64
    Caption = 'Ãû³Æ'
  end
  object Label3: TLabel [2]
    Left = 60
    Top = 100
    Width = 30
    Height = 15
    Caption = 'ËµÃ÷'
    FocusControl = DBEdit3
  end
  object Label2: TLabel [3]
    Left = 60
    Top = 28
    Width = 30
    Height = 15
    Caption = 'ÐòºÅ'
    FocusControl = DBEdit2
  end
  inherited btnInsert: TBitBtn
    Top = 146
    TabOrder = 3
  end
  inherited btnOk: TBitBtn
    Left = 176
    Top = 146
    TabOrder = 4
  end
  inherited btnCancel: TBitBtn
    Left = 278
    Top = 146
    TabOrder = 5
  end
  inherited DBEdit1: TDBEdit
    Left = 96
    Top = 60
    Width = 132
    DataField = 'MC'
    DataSource = Data.sSjzl
    TabOrder = 1
  end
  inherited DBNavigator1: TDBNavigator
    Top = 154
    TabOrder = 6
  end
  object DBEdit3: TDBEdit
    Left = 96
    Top = 96
    Width = 244
    Height = 23
    DataField = 'BZ'
    DataSource = Data.sSjzl
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 96
    Top = 24
    Width = 36
    Height = 23
    DataField = 'XH'
    DataSource = Data.sSjzl
    TabOrder = 0
  end
end
