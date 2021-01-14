inherited frmQtkcbdlx: TfrmQtkcbdlx
  Left = -1
  Top = 95
  Caption = '其它库存变动类型'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sQtkcbdlx
    Columns = <
      item
        Expanded = False
        FieldName = 'MC'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RKL'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'THBZ'
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
