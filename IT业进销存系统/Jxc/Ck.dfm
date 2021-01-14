inherited frmCk: TfrmCk
  Left = 18
  Top = 142
  Caption = #20179#24211#36164#26009
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sCk
    Columns = <
      item
        Expanded = False
        FieldName = 'XH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BZ'
        Visible = True
      end>
  end
  inherited ActionList1: TActionList
    inherited aSearch: TAction
      Tag = 1
    end
  end
end
