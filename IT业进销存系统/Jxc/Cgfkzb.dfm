inherited frmCgfkzb: TfrmCgfkzb
  Top = 6
  Caption = '采购付款单总表'
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sCgfkzb
    Columns = <
      item
        Expanded = False
        FieldName = 'DJBH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RQ'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aGYSBH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aGYSMC'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aFKLX'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aSFKFSMC'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aZHMC'
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
  inherited pnlDetail: TPanel
    inherited DBGrid2: TDBGrid
      DataSource = Data.sCgfk
      Columns = <
        item
          Expanded = False
          FieldName = 'aDDBH'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aDDRQ'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aDDJE'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aYFJE'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aMFJE'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JE'
          PickList.Strings = ()
          Visible = True
        end>
    end
  end
  inherited ActionList1: TActionList
    inherited aSearch: TAction
      Tag = 1
    end
  end
end
