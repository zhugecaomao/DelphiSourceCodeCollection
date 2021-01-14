inherited frmYhckqk: TfrmYhckqk
  Left = -1
  Top = 95
  Caption = '银行存款/取款'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sYhckqk
    Columns = <
      item
        Expanded = False
        FieldName = 'RQ'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JSR'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aZCZHMC'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aZRZHMC'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JE'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BZ'
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
