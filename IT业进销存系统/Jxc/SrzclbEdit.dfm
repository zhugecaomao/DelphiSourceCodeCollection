inherited frmSrzclbEdit: TfrmSrzclbEdit
  Left = 248
  Top = 118
  Width = 381
  Height = 253
  Caption = 'frmSrzclbEdit'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 349
    Height = 157
  end
  inherited Label1: TLabel
    Left = 42
  end
  object Label3: TLabel [2]
    Left = 42
    Top = 136
    Width = 30
    Height = 15
    Caption = '说明'
    FocusControl = DBEdit3
  end
  object Label2: TLabel [3]
    Left = 42
    Top = 100
    Width = 30
    Height = 15
    Alignment = taRightJustify
    Caption = '类别'
  end
  object Label4: TLabel [4]
    Left = 42
    Top = 64
    Width = 30
    Height = 15
    Alignment = taRightJustify
    Caption = '名称'
  end
  inherited btnInsert: TBitBtn
    Top = 182
    TabOrder = 4
  end
  inherited btnOk: TBitBtn
    Left = 170
    Top = 182
    TabOrder = 5
  end
  inherited btnCancel: TBitBtn
    Left = 272
    Top = 182
    TabOrder = 6
  end
  inherited DBEdit1: TDBEdit
    Left = 78
    Width = 54
    DataField = 'BH'
    DataSource = Data.sSrzclb
  end
  inherited DBNavigator1: TDBNavigator
    Top = 190
    TabOrder = 7
  end
  object DBEdit3: TDBEdit
    Left = 78
    Top = 132
    Width = 260
    Height = 23
    DataField = 'BZ'
    DataSource = Data.sSrzclb
    TabOrder = 3
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 78
    Top = 86
    Width = 164
    Height = 36
    BiDiMode = bdLeftToRight
    Columns = 2
    Ctl3D = True
    DataField = 'SRL'
    DataSource = Data.sSrzclb
    Items.Strings = (
      '收入类'
      '支出类')
    ParentBiDiMode = False
    ParentCtl3D = False
    TabOrder = 2
    Values.Strings = (
      'True'
      'False')
  end
  object DBEdit2: TDBEdit
    Left = 78
    Top = 60
    Width = 164
    Height = 23
    DataField = 'MC'
    DataSource = Data.sSrzclb
    TabOrder = 1
  end
end
