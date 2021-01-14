inherited frmQtkcbdHpHelp: TfrmQtkcbdHpHelp
  Left = 63
  Top = 61
  Width = 483
  Caption = '选择货品'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 367
  end
  inherited Label1: TLabel
    Left = 45
  end
  inherited Label2: TLabel
    Left = 15
    Width = 60
    Caption = '品名规格'
  end
  inherited Bevel3: TBevel
    Left = 379
  end
  inherited Bevel2: TBevel
    Left = 379
  end
  inherited Edit1: TEdit
    Left = 78
    Width = 106
    Hint = 'aBH'
    TabOrder = 0
  end
  inherited DBGrid1: TDBGrid
    Width = 367
    DataSource = Data.sQtkcbdHpHelp
    TabOrder = 9
    Columns = <
      item
        Expanded = False
        FieldName = 'aBH'
        PickList.Strings = ()
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aPM'
        PickList.Strings = ()
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aDW'
        PickList.Strings = ()
        Visible = True
      end>
  end
  inherited Edit2: TEdit
    Tag = 1
    Left = 78
    Width = 259
    Hint = '%aPM'
    TabOrder = 1
  end
  inherited btnOk: TBitBtn
    Left = 380
    TabOrder = 2
  end
  inherited btnCancel: TBitBtn
    Left = 380
    TabOrder = 3
  end
  inherited btnNew: TBitBtn
    Tag = 1
    Left = 380
    TabOrder = 4
  end
  inherited btnModify: TBitBtn
    Tag = 1
    Left = 380
    TabOrder = 5
  end
  inherited btnDel: TBitBtn
    Tag = 1
    Left = 380
  end
  inherited Animate1: TAnimate
    Left = 402
  end
  inherited btnSetColumn: TBitBtn
    Left = 379
    TabOrder = 6
  end
end
