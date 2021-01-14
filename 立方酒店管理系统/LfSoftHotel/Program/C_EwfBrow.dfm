inherited EwfBrowForm: TEwfBrowForm
  Left = 247
  Height = 500
  Caption = #32479#35745
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    inherited lblTitle: TLabel
      Width = 94
      Caption = #39069#22806#36153
    end
    inherited Image1: TImage
      Left = 168
    end
  end
  inherited Panel2: TPanel
    Height = 352
    inherited DBGrid1: TDBGrid
      Height = 342
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KRXM'
          Title.Alignment = taCenter
          Title.Caption = #23458#20154#22995#21517
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_EWF'
          Title.Alignment = taCenter
          Title.Caption = #39069#22806#36153
          Width = 100
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_JZRQ'
          Title.Alignment = taCenter
          Title.Caption = #32467#24080#26085#26399
          Width = 100
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_JZSJ'
          Title.Alignment = taCenter
          Title.Caption = #32467#24080#26102#38388
          Width = 100
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 432
    inherited btnPrint: TBitBtn
      OnClick = btnPrintClick
    end
  end
  inherited qryWork: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from EWF')
    object qryWorkD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Origin = 'LFHOTELUSER."EWF.DB".D_JZBH'
      Size = 12
    end
    object qryWorkD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Origin = 'LFHOTELUSER."EWF.DB".D_KRXM'
      Size = 30
    end
    object qryWorkD_EWF: TCurrencyField
      FieldName = 'D_EWF'
      Origin = 'LFHOTELUSER."EWF.DB".D_EWF'
    end
    object qryWorkD_JZRQ: TDateField
      FieldName = 'D_JZRQ'
      Origin = 'LFHOTELUSER."EWF.DB".D_JZRQ'
    end
    object qryWorkD_JZSJ: TTimeField
      FieldName = 'D_JZSJ'
      Origin = 'LFHOTELUSER."EWF.DB".D_JZSJ'
    end
    object qryWorkD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Origin = 'LFHOTELUSER."EWF.DB".D_YSRQ'
      Size = 8
    end
  end
end
