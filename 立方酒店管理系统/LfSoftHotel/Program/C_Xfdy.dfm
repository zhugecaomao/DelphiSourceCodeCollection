inherited XfdyForm: TXfdyForm
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    inherited lblTitle: TLabel
      Caption = #39044#23450#39033#30446
    end
    inherited cmbOption: TComboBox
      Items.Strings = (
        #32534#21495
        #21517#31216
        #20195#30721)
    end
  end
  inherited Panel2: TPanel
    inherited dbgXtdy: TDBGrid
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XFBH'
          Title.Alignment = taCenter
          Title.Caption = #39033#30446#32534#21495
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XFMC'
          Title.Alignment = taCenter
          Title.Caption = #39044#23450#39033#30446#21517#31216
          Width = 150
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_BZ'
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Width = 250
          Visible = True
        end>
    end
  end
  inherited tblXtdy: TTable
    BeforeEdit = tblXtdyBeforeEdit
    TableName = 'XFDM.db'
    object tblXtdyD_XFBH: TStringField
      FieldName = 'D_XFBH'
      Required = True
      Size = 5
    end
    object tblXtdyD_XFMC: TStringField
      FieldName = 'D_XFMC'
      Required = True
      Size = 10
    end
    object tblXtdyD_XFBZ: TStringField
      FieldName = 'D_XFBZ'
      Size = 1
    end
    object tblXtdyD_BZ: TStringField
      FieldName = 'D_BZ'
    end
  end
end
