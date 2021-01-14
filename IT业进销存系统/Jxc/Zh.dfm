inherited frmZh: TfrmZh
  Left = -1
  Top = 95
  Caption = '’ ªß◊ ¡œ'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sZh
    Columns = <
      item
        Expanded = False
        FieldName = 'MC'
        PickList.Strings = ()
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YHL'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KHYH'
        PickList.Strings = ()
        Width = 253
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YHZH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QMJE'
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
