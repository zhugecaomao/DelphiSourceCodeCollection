inherited frmKh: TfrmKh
  Left = 382
  Top = 367
  Height = 580
  Caption = #23458#25143#36164#26009
  PixelsPerInch = 96
  TextHeight = 15
  inherited Splitter1: TSplitter
    Height = 452
  end
  inherited DBGrid1: TDBGrid
    Height = 452
    DataSource = Data.sKh
    Columns = <
      item
        Expanded = False
        FieldName = 'BH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aDQMC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LXR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KHYH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YHZH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NSH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YXJE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QMJE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aSJJE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'XYED'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BZ'
        Visible = True
      end>
  end
  inherited Panel1: TPanel
    object Label2: TLabel
      Left = 212
      Top = 12
      Width = 75
      Height = 15
      Caption = #26597#30475#26041#24335#65306
      Transparent = True
    end
    object RadioGroup1: TRadioGroup
      Left = 282
      Top = -3
      Width = 297
      Height = 39
      Color = cl3DLight
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '&1.'#20351#29992#20013
        '&2.'#38750#20351#29992#20013
        '&3.'#20840#37096)
      ParentColor = False
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
  end
  inherited pnlList: TPanel
    Height = 452
    inherited StringGrid1: TStringGrid
      Height = 448
    end
  end
  inherited ActionList1: TActionList
    inherited aSearch: TAction
      Tag = 1
    end
  end
end
