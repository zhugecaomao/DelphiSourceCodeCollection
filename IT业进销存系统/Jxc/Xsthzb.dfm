inherited frmXsthzb: TfrmXsthzb
  Left = 11
  Top = 81
  Caption = '销售退货单总表'
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sXsthzb
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
        FieldName = 'aKHBH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aKHMC'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aCKMC'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aTHLX'
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
        FieldName = 'YWY'
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
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Font.Color = clRed
    end
  end
  inherited pnlDetail: TPanel
    inherited DBGrid2: TDBGrid
      DataSource = Data.sXsth
      Columns = <
        item
          Expanded = False
          FieldName = 'aBH'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aPM'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aDW'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SL'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DJ'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NSL'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cJE'
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
