inherited frmGysHelp: TfrmGysHelp
  Left = 63
  Top = 61
  Width = 571
  Caption = '选择供应商'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 455
  end
  inherited Label1: TLabel
    Left = 39
  end
  inherited Label2: TLabel
    Left = 207
    Top = 22
    Caption = '简称'
  end
  object Label3: TLabel [3]
    Left = 207
    Top = 52
    Width = 30
    Height = 15
    Alignment = taRightJustify
    Caption = '电话'
  end
  inherited Bevel3: TBevel
    Left = 467
  end
  inherited Bevel2: TBevel
    Left = 467
  end
  object Label7: TLabel [6]
    Left = 24
    Top = 52
    Width = 45
    Height = 15
    Alignment = taRightJustify
    Caption = '联系人'
  end
  inherited Edit1: TEdit
    Tag = 1
    Left = 72
    Width = 120
    Hint = 'BH'
    TabOrder = 0
    OnChange = Edit1Change
  end
  inherited DBGrid1: TDBGrid
    Width = 455
    DataSource = Data.sGysHelp
    TabOrder = 11
    Columns = <
      item
        Expanded = False
        FieldName = 'BH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MC'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LXR'
        PickList.Strings = ()
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DH'
        PickList.Strings = ()
        Width = 80
        Visible = True
      end>
  end
  inherited Edit2: TEdit
    Left = 240
    Top = 18
    Width = 190
    Hint = '%MC'
    TabOrder = 1
  end
  inherited btnOk: TBitBtn
    Left = 468
    TabOrder = 4
  end
  inherited btnCancel: TBitBtn
    Left = 468
    TabOrder = 5
  end
  inherited btnNew: TBitBtn
    Left = 468
    TabOrder = 6
  end
  inherited btnModify: TBitBtn
    Left = 468
    TabOrder = 7
  end
  object Edit3: TEdit [14]
    Left = 240
    Top = 48
    Width = 190
    Height = 23
    Hint = '%DH'
    TabOrder = 2
  end
  object Edit7: TEdit [15]
    Left = 72
    Top = 48
    Width = 120
    Height = 23
    Hint = '%LXR'
    TabOrder = 3
  end
  inherited btnDel: TBitBtn
    Left = 468
    TabOrder = 9
  end
  inherited Animate1: TAnimate
    Left = 490
  end
  inherited btnSetColumn: TBitBtn
    Left = 467
    TabOrder = 8
  end
end
