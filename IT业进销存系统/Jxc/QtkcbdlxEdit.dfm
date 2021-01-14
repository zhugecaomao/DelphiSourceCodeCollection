inherited frmQtkcbdlxEdit: TfrmQtkcbdlxEdit
  Left = 306
  Top = 19
  Width = 352
  Height = 247
  Caption = 'frmQtkcbdlxEdit'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 320
    Height = 151
  end
  inherited Label1: TLabel
    Left = 60
    Caption = '名称'
  end
  object Label2: TLabel [2]
    Left = 60
    Top = 79
    Width = 30
    Height = 15
    Alignment = taRightJustify
    Caption = '类别'
  end
  object Label3: TLabel [3]
    Left = 30
    Top = 129
    Width = 60
    Height = 15
    Alignment = taRightJustify
    Caption = '退还标志'
  end
  inherited btnInsert: TBitBtn
    Top = 176
    TabOrder = 3
  end
  inherited btnOk: TBitBtn
    Left = 141
    Top = 176
    TabOrder = 4
  end
  inherited btnCancel: TBitBtn
    Left = 243
    Top = 176
    TabOrder = 5
  end
  inherited DBEdit1: TDBEdit
    Left = 96
    Width = 164
    DataField = 'MC'
    DataSource = Data.sQtkcbdlx
  end
  inherited DBNavigator1: TDBNavigator
    Top = 184
    TabOrder = 6
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 96
    Top = 49
    Width = 164
    Height = 66
    BiDiMode = bdLeftToRight
    Ctl3D = True
    DataField = 'RKL'
    DataSource = Data.sQtkcbdlx
    Items.Strings = (
      '入库类(库存增加)'
      '出库类(库存减少)')
    ParentBiDiMode = False
    ParentCtl3D = False
    TabOrder = 1
    Values.Strings = (
      'True'
      'False')
  end
  object DBRadioGroup2: TDBRadioGroup
    Left = 96
    Top = 115
    Width = 164
    Height = 36
    BiDiMode = bdLeftToRight
    Columns = 2
    Ctl3D = True
    DataField = 'THBZ'
    DataSource = Data.sQtkcbdlx
    Items.Strings = (
      '需要'
      '不需要')
    ParentBiDiMode = False
    ParentCtl3D = False
    TabOrder = 2
    Values.Strings = (
      'True'
      'False')
  end
end
