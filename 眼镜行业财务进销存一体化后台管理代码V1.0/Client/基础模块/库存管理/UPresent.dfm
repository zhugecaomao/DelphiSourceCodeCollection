inherited FmPresentQuery: TFmPresentQuery
  Left = 41
  Top = 35
  Caption = #36192#21697#26597#35810
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited btnQuery: TBitBtn
      Visible = False
    end
    inherited btnpagedown: TBitBtn
      Left = 341
    end
    inherited BtnSort: TBitBtn
      Caption = #26597#35810#26465#20214
    end
  end
  inherited DBGrid1: TDBGrid
    ReadOnly = True
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Storage_NO'
        Title.Alignment = taCenter
        Title.Caption = #20179#24211#32534#21495
        Width = 80
        Visible = True
      end
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
        FieldName = 'Award_amount'
        Title.Alignment = taCenter
        Title.Caption = #36192#21697#25968#37327
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'stock_amount'
        Title.Alignment = taCenter
        Title.Caption = #24211#23384#25968#37327
        Width = 70
        Visible = True
      end>
  end
  inherited Panel1: TPanel
    inherited edtTime: TEdit
      Height = 28
    end
  end
end
