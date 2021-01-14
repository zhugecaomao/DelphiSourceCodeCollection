inherited frmCbjgb: TfrmCbjgb
  Caption = '成本价格表'
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sCbjgb
    Columns = <
      item
        Expanded = False
        FieldName = 'JGBH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aGSMC'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aSFGMC'
        PickList.Strings = ()
        Width = 166
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aMDGMC'
        PickList.Strings = ()
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZDSF'
        PickList.Strings = ()
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZL45'
        PickList.Strings = ()
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZL45A'
        PickList.Strings = ()
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZL100A'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZL300A'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZL500A'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZL1000A'
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
  inherited ControlBar1: TControlBar
    inherited ToolBar1: TToolBar
      Width = 537
    end
  end
end
