inherited frmHplb: TfrmHplb
  Left = 412
  Top = 391
  Caption = #36135#21697#31867#21035
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sHplb
    Columns = <
      item
        Expanded = False
        FieldName = 'MC'
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
