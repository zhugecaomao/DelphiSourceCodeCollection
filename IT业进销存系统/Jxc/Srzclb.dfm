inherited frmSrzclb: TfrmSrzclb
  Left = 358
  Top = 373
  Caption = #25910#20837#25903#20986#31867#21035
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sSrzclb
    Columns = <
      item
        Expanded = False
        FieldName = 'BH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SRL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BZ'
        Visible = True
      end>
  end
  inherited ControlBar1: TControlBar
    inherited ToolBar3: TToolBar
      Width = 57
    end
  end
  inherited ActionList1: TActionList
    inherited aSearch: TAction
      Tag = 1
    end
  end
end
