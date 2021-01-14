inherited frmBeginWorkList: TfrmBeginWorkList
  Caption = #30005#26799#24320#24037#23457#25209#25253#21578
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel2: TPanel
    inherited deStartDate: TCSdxDateEdit
      StoredValues = 4
    end
    inherited deEndDate: TCSdxDateEdit
      StoredValues = 4
    end
  end
  inherited grdList: TdxDBGrid
    Filter.Criteria = {00000000}
  end
  inherited List: TCSADOQuery
    SQL.Strings = ()
  end
end
