inherited XmdyForm: TXmdyForm
  Left = 156
  Top = 51
  Caption = #31995#32479
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 81
    inherited lblTitle: TLabel
      Left = 208
      Caption = #28040#36153#39033#30446
    end
    inherited Image1: TImage
      Left = 177
    end
  end
  inherited Panel2: TPanel
    Top = 81
    Height = 357
    inherited dbgXtdy: TDBGrid
      Height = 347
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XMBH'
          Title.Alignment = taCenter
          Title.Caption = #32534#21495
          Width = 110
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XMMC'
          Title.Alignment = taCenter
          Title.Caption = #39033#30446#21517#31216
          Width = 200
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_DM'
          Title.Alignment = taCenter
          Title.Caption = #20195#30721
          Width = 160
          Visible = True
        end>
    end
  end
  inherited tblXtdy: TTable
    BeforeEdit = tblXtdyBeforeEdit
    TableName = 'XMDM'
    object tblXtdyD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Required = True
      Size = 5
    end
    object tblXtdyD_XMMC: TStringField
      FieldName = 'D_XMMC'
      Required = True
      Size = 10
    end
    object tblXtdyD_XFBZ: TStringField
      FieldName = 'D_XFBZ'
      FixedChar = True
      Size = 1
    end
    object tblXtdyD_DM: TStringField
      FieldName = 'D_DM'
      Size = 10
    end
  end
end
