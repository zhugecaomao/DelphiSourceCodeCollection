inherited frmCgddzb: TfrmCgddzb
  Left = 3
  Top = 10
  Caption = '采购订单总表'
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sCgddzb
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
        FieldName = 'JHRQ'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JHDD'
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
        FieldName = 'YWY'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZT'
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
      DataSource = Data.sCgdd
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
        end
        item
          Expanded = False
          FieldName = 'aSHSL'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aMSSL'
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
