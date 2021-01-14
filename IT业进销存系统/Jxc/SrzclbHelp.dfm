inherited frmSrzclbHelp: TfrmSrzclbHelp
  Left = 336
  Top = 422
  Width = 526
  Caption = #36873#25321#25910#25903#31867#21035
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Bevel1: TBevel
    Width = 410
    Height = 49
  end
  inherited Label1: TLabel
    Left = 21
  end
  inherited Label2: TLabel
    Left = 120
    Top = 22
  end
  inherited Bevel3: TBevel
    Left = 422
    Top = 183
  end
  inherited Bevel2: TBevel
    Left = 422
    Top = 231
  end
  object Label3: TLabel [5]
    Left = 267
    Top = 22
    Width = 30
    Height = 15
    Alignment = taRightJustify
    Caption = #35828#26126
  end
  inherited Edit1: TEdit
    Width = 54
    Height = 23
    Hint = 'BH'
    TabOrder = 0
  end
  inherited DBGrid1: TDBGrid
    Top = 60
    Width = 410
    Height = 355
    DataSource = Data.sSrzclbHelp
    TabOrder = 9
    Columns = <
      item
        Expanded = False
        FieldName = 'BH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BZ'
        Width = 164
        Visible = True
      end>
  end
  inherited Edit2: TEdit
    Tag = 1
    Left = 153
    Top = 18
    Width = 102
    Height = 23
    Hint = '%MC'
    TabOrder = 1
  end
  inherited btnOk: TBitBtn
    Left = 423
    TabOrder = 2
  end
  inherited btnCancel: TBitBtn
    Left = 423
    TabOrder = 3
  end
  inherited btnNew: TBitBtn
    Left = 423
    Top = 60
    TabOrder = 4
  end
  inherited btnModify: TBitBtn
    Left = 423
    Top = 102
    TabOrder = 5
  end
  inherited btnDel: TBitBtn
    Left = 423
    Top = 144
  end
  inherited Animate1: TAnimate
    Left = 445
    Top = 8
  end
  inherited btnSetColumn: TBitBtn
    Left = 422
    Top = 193
    TabOrder = 6
  end
  object Edit3: TEdit
    Tag = 1
    Left = 300
    Top = 18
    Width = 102
    Height = 23
    Hint = '%BZ'
    TabOrder = 10
  end
end
