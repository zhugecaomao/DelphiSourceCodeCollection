inherited frmCyjsdw: TfrmCyjsdw
  Left = 474
  Top = 180
  Caption = #24120#29992#35745#31639#21333#20301
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sCyjsdw
    Columns = <
      item
        Expanded = False
        FieldName = 'MC'
        Visible = True
      end>
  end
  inherited ActionList1: TActionList
    inherited aSearch: TAction
      Tag = 1
    end
  end
end
