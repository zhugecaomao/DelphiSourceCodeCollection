inherited fmgoodCodedetail: TfmgoodCodedetail
  Left = 31
  Top = 46
  ClientHeight = 472
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 431
  end
  inherited DBGrid1: TDBGrid
    Left = 0
    Columns = <
      item
        Expanded = False
        FieldName = 'Type'
        Title.Caption = #21830#21697#31867#21035
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Goods_NO'
        Title.Caption = #21830#21697#32534#21495
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Goods_Name'
        Title.Caption = #21830#21697#21517#31216
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BarCode'
        Title.Caption = #21830#21697#26465#30721
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Stock_amount'
        Title.Alignment = taCenter
        Title.Caption = #24211#23384#25968#37327
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Totalamount'
        Title.Alignment = taCenter
        Title.Caption = #35201#36135#25968#37327
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NSendQty'
        Title.Alignment = taCenter
        Title.Caption = #24050#37197#25968#37327
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'singleprice'
        Title.Caption = #21830#21697#21333#20215
        Width = 70
        Visible = True
      end>
  end
  inherited Panel1: TPanel
    inherited edtTime: TEdit
      Height = 28
    end
    inherited Panel3: TPanel
      inherited CBType: TComboBox
        Style = csDropDown
        OnKeyPress = CBTypeKeyPress
      end
    end
  end
end
