inherited frmHpHelp: TfrmHpHelp
  Left = 51
  Top = 141
  Width = 569
  Caption = #36873#25321#36135#21697
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 453
    Height = 97
  end
  inherited Label1: TLabel
    Left = 45
  end
  inherited Label2: TLabel
    Left = 15
    Width = 60
    Caption = #21697#21517#35268#26684
  end
  inherited Bevel3: TBevel
    Left = 465
    Top = 231
  end
  inherited Bevel2: TBevel
    Left = 465
    Top = 279
  end
  object Label3: TLabel [5]
    Left = 195
    Top = 22
    Width = 30
    Height = 15
    Caption = #31867#21035
  end
  inherited Edit1: TEdit
    Tag = 1
    Left = 78
    Width = 106
    Height = 23
    Hint = 'BH'
    TabOrder = 0
    OnChange = Edit1Change
  end
  inherited DBGrid1: TDBGrid
    Top = 108
    Width = 453
    Height = 307
    DataSource = Data.sHpHelp
    TabOrder = 12
    Columns = <
      item
        Expanded = False
        FieldName = 'BH'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PM'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DW'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aZKCL'
        Visible = True
      end>
  end
  inherited Edit2: TEdit
    Left = 78
    Width = 259
    Height = 23
    Hint = '%PM'
    TabOrder = 1
  end
  inherited btnOk: TBitBtn
    Left = 466
    TabOrder = 5
  end
  inherited btnCancel: TBitBtn
    Left = 466
    TabOrder = 6
  end
  inherited btnNew: TBitBtn
    Left = 466
    Top = 108
    TabOrder = 7
  end
  inherited btnModify: TBitBtn
    Left = 466
    Top = 150
    TabOrder = 8
  end
  inherited btnDel: TBitBtn
    Left = 466
    Top = 192
    TabOrder = 10
  end
  inherited Animate1: TAnimate
    Left = 488
  end
  inherited btnSetColumn: TBitBtn
    Left = 465
    Top = 241
  end
  object BitBtn1: TBitBtn
    Left = 465
    Top = 289
    Width = 90
    Height = 31
    Hint = #25226#24403#21069#36873#25321#30340#36135#21697#28155#21152#21040#21333#25454#20013', '#24182#32487#32493#20572#22312#26412#36873#25321#31383#21475#20013'(Alt+Enter)'
    Anchors = [akTop, akRight]
    Caption = #28155#21152#21040#21333#25454
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = BitBtn1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 348
    Top = 12
    Width = 97
    Height = 79
    Caption = #25968#25454#31867#22411
    ItemIndex = 0
    Items.Strings = (
      #20840#37096'(&1)'
      #23384#36135'(&2)'
      #38750#23384#36135'(&3)')
    TabOrder = 3
    OnClick = SetFilter
  end
  object CheckBox1: TCheckBox
    Left = 18
    Top = 78
    Width = 187
    Height = 17
    Caption = #21482#26174#31034#26377#23384#37327#30340#36135#21697'(&4)'
    TabOrder = 4
    OnClick = SetFilter
  end
  object ComboBox1: TComboBox
    Left = 228
    Top = 18
    Width = 109
    Height = 23
    Hint = '%aHPLBMC'
    ItemHeight = 15
    TabOrder = 2
  end
end
