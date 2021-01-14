inherited fmSelgoodCode: TfmSelgoodCode
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TDBGrid
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'stock_amount'
        Title.Alignment = taCenter
        Title.Caption = #24211#23384#25968#37327
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NQty'
        Title.Alignment = taCenter
        Title.Caption = #37197#36865#24635#35745
        Width = 70
        Visible = True
      end>
  end
  inherited Panel1: TPanel
    inherited LblSort: TLabel
      Left = 527
    end
    inherited edtTime: TEdit
      Height = 28
    end
    inherited Panel3: TPanel
      inherited cbBrand: TComboBox
        ParentShowHint = False
        ShowHint = True
      end
    end
    object RDB1: TRadioButton
      Left = 288
      Top = 56
      Width = 97
      Height = 17
      Caption = #20165#37197#36865#21830#21697
      Checked = True
      TabOrder = 4
      TabStop = True
      OnClick = RDB1Click
    end
    object RDB2: TRadioButton
      Left = 416
      Top = 56
      Width = 81
      Height = 17
      Caption = #25152#26377#21830#21697
      TabOrder = 5
      OnClick = RDB2Click
    end
  end
end
