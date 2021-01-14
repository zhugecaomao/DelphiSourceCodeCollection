inherited YjcjForm: TYjcjForm
  Caption = #32467#24080
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    inherited lblTitle: TLabel
      Caption = #25276#37329#20652#20132
    end
  end
  inherited Panel2: TPanel
    inherited DBGrid1: TDBGrid
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
      Columns = <
        item
          Expanded = False
          FieldName = 'D_CJBZ'
          Title.Alignment = taCenter
          Title.Caption = #26159#21542#20652#20132
          Width = 50
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KRXM'
          Title.Alignment = taCenter
          Title.Caption = #23458#20154#22995#21517
          Width = 150
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KFBH'
          Title.Alignment = taCenter
          Title.Caption = #23458#25151#21495
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFJE'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#37329#39069
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_YFJE'
          Title.Alignment = taCenter
          Title.Caption = #25276#37329#37329#39069
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_YE'
          Title.Alignment = taCenter
          Title.Caption = #20313#39069
          Width = 70
          Visible = True
        end>
    end
  end
  inherited qryWork: TQuery
    OnCalcFields = qryWorkCalcFields
    DatabaseName = 'LFHOTELUSER'
    SQL.Strings = (
      
        'select a.D_ZDBH,a.D_KRBH,a.D_KFBH,a.D_XFJE,b.D_YFJE from KRZD a,' +
        'KRYJ b where (a.D_HH=0)and(a.D_YJBH=b.D_YJBH)and(b.D_FKFS="'#20154#27665#24065'")')
    object qryWorkD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Origin = 'LFHOTELUSER."KRZD.DB".D_ZDBH'
      Size = 12
    end
    object qryWorkD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER."KRZD.DB".D_KRBH'
      Size = 12
    end
    object qryWorkD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Origin = 'LFHOTELUSER."KRZD.DB".D_KFBH'
      Size = 5
    end
    object qryWorkD_XFJE: TCurrencyField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER."KRZD.DB".D_XFJE'
    end
    object qryWorkD_YFJE: TCurrencyField
      FieldName = 'D_YFJE'
      Origin = 'LFHOTELUSER."KRYJ.DB".D_YFJE'
    end
    object qryWorkD_KRXM: TStringField
      FieldKind = fkLookup
      FieldName = 'D_KRXM'
      LookupDataSet = HotelData.tblKrxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_KRXM'
      KeyFields = 'D_KRBH'
      Lookup = True
    end
    object qryWorkD_YE: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'D_YE'
      Calculated = True
    end
    object qryWorkD_CJBZ: TStringField
      FieldKind = fkCalculated
      FieldName = 'D_CJBZ'
      Calculated = True
    end
  end
end
