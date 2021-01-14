inherited frmBm: TfrmBm
  Left = -1
  Top = 95
  Caption = '部门资料'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sBm
    Columns = <
      item
        Expanded = False
        FieldName = 'MC'
        PickList.Strings = ()
        Visible = True
      end>
  end
  inherited ActionList1: TActionList
    inherited aSearch: TAction
      Tag = 1
    end
  end
end
