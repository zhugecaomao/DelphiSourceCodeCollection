inherited frmDq: TfrmDq
  Left = 267
  Top = 105
  Caption = #22320#21306#36164#26009
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    Top = 67
    Height = 454
    DataSource = Data.sDq
    Columns = <
      item
        Expanded = False
        FieldName = 'MC'
        Visible = True
      end>
  end
  inherited Panel1: TPanel
    Top = 28
  end
  inherited ControlBar1: TControlBar
    Height = 28
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
