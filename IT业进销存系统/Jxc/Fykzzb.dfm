inherited frmFykzzb: TfrmFykzzb
  Left = 241
  Top = 216
  Caption = #36153#29992#24320#25903#24635#34920
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sFykzzb
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
        FieldName = 'JSR'
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
        FieldName = 'JE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BZ'
        Visible = True
      end>
  end
  inherited pnlDetail: TPanel
    inherited DBGrid2: TDBGrid
      DataSource = Data.sFykz
      Columns = <
        item
          Expanded = False
          FieldName = 'aBH'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'aMC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZY'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JE'
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
