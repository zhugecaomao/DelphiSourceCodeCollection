inherited frmLlzb: TfrmLlzb
  Left = 264
  Top = 166
  Caption = #39046#26009#21333#24635#34920
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sLlzb
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
        FieldName = 'aCKMC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JSR'
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
      DataSource = Data.sLl
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
          FieldName = 'cJE'
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
