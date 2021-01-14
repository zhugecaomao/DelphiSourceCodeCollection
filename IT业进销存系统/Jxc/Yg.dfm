inherited frmYg: TfrmYg
  Left = -1
  Top = 95
  Caption = '员工资料'
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = Data.sYg
    Columns = <
      item
        Expanded = False
        FieldName = 'BH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'XM'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'XB'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aBMMC'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aYGLBMC'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZW'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CSRQ'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'XL'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BP'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZZ'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SFZH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JG'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YB'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RZRQ'
        PickList.Strings = ()
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'JSFF'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JBGZ'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YWYBZ'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LZ'
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
    object Label2: TLabel
      Left = 212
      Top = 12
      Width = 75
      Height = 15
      Caption = '查看方式：'
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
        '&1.在职'
        '&2.已离职'
        '&3.全部')
      ParentColor = False
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
  end
  inherited ActionList1: TActionList
    inherited aSearch: TAction
      Tag = 1
    end
  end
end
