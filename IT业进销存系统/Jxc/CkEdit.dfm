inherited frmCkEdit: TfrmCkEdit
  Left = 306
  Top = 19
  Width = 465
  Height = 253
  Caption = 'frmCkEdit'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 433
    Height = 157
  end
  inherited Label1: TLabel
    Left = 60
    Top = 64
    Caption = '名称'
  end
  object Label3: TLabel [2]
    Left = 60
    Top = 100
    Width = 30
    Height = 15
    Caption = '位置'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [3]
    Left = 60
    Top = 136
    Width = 30
    Height = 15
    Caption = '说明'
    FocusControl = DBEdit4
  end
  object Label2: TLabel [4]
    Left = 60
    Top = 28
    Width = 30
    Height = 15
    Caption = '序号'
    FocusControl = DBEdit2
  end
  inherited btnInsert: TBitBtn
    Top = 182
    TabOrder = 4
  end
  inherited btnOk: TBitBtn
    Left = 254
    Top = 182
    TabOrder = 5
  end
  inherited btnCancel: TBitBtn
    Left = 356
    Top = 182
    TabOrder = 6
  end
  inherited DBEdit1: TDBEdit
    Left = 96
    Top = 60
    Width = 132
    DataField = 'MC'
    DataSource = Data.sCk
    TabOrder = 1
  end
  inherited DBNavigator1: TDBNavigator
    Top = 190
    TabOrder = 7
  end
  object DBEdit3: TDBEdit
    Left = 96
    Top = 96
    Width = 324
    Height = 23
    DataField = 'WZ'
    DataSource = Data.sCk
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 96
    Top = 132
    Width = 324
    Height = 23
    DataField = 'BZ'
    DataSource = Data.sCk
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 96
    Top = 24
    Width = 36
    Height = 23
    DataField = 'XH'
    DataSource = Data.sCk
    TabOrder = 0
  end
end
