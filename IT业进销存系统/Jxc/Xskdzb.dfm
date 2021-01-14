inherited frmXskdzb: TfrmXskdzb
  Left = 323
  Top = 120
  Caption = #38144#21806#24320#21333#24635#34920
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sXskdzb
    Columns = <
      item
        Expanded = False
        FieldName = 'DJBH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RQ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aKHBH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aKHMC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aXSLX'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aCKMC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aFPLX'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aSFKFSMC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aZHMC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKQX'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YWY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JHDD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YSJE1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MSJE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CZY'
        Visible = True
      end>
  end
  inherited ControlBar1: TControlBar
    inherited ToolBar3: TToolBar
      Width = 53
    end
  end
  inherited pnlDetail: TPanel
    inherited DBGrid2: TDBGrid
      DataSource = Data.sXskd
      Columns = <
        item
          Expanded = False
          FieldName = 'aBH'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aPM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aDW'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DJ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NSL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cJE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cDDBH'
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
