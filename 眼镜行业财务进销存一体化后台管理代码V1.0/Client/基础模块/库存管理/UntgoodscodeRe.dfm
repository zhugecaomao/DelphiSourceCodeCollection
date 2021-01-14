inherited fmgoodCodeRE: TfmgoodCodeRE
  Left = 32
  Top = 27
  Caption = #38656#27714#21830#21697#36873#25321
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
        Expanded = False
        FieldName = 'BarCode'
        Title.Caption = #21830#21697#26465#30721
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Title.Caption = #21830#21697#38656#27714#25968#37327
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'goodsmemo'
        Title.Alignment = taCenter
        Title.Caption = #21830#21697#22791#27880
        Visible = False
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
