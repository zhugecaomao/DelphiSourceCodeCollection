inherited frmJxcTjb: TfrmJxcTjb
  Top = 95
  Caption = '进销存统计表'
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    Height = 302
    DataSource = Data.sJxcTjb
    Columns = <
      item
        Expanded = False
        FieldName = 'BH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LBBH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LB'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PPBH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PP'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PM'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GG'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YS'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DW'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QCSL1'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QCJE1'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JHSL'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JHDJ'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JHJE'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PJDJ'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'XSSL'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'XSDJ'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'XSJE'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'XSCB'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'XSLR'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QMSL1'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QMJE1'
        PickList.Strings = ()
        Visible = True
      end>
  end
  inherited Panel1: TPanel
    inherited labTj: TLabel
      Caption = '统计日期: '
    end
  end
  inherited ControlBar1: TControlBar
    inherited ToolBar1: TToolBar
      Width = 594
      object ToolButton5: TToolButton
        Left = 533
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 26
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 541
        Top = 0
        Action = aCk
        Caption = ' 全屏 '
      end
    end
  end
  object pnlCk: TPanel [4]
    Left = 0
    Top = 385
    Width = 790
    Height = 129
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object Label2: TLabel
      Left = 8
      Top = 10
      Width = 30
      Height = 15
      Caption = '编号'
    end
    object Label3: TLabel
      Left = 212
      Top = 10
      Width = 30
      Height = 15
      Alignment = taRightJustify
      Caption = '类别'
    end
    object Label4: TLabel
      Left = 446
      Top = 10
      Width = 30
      Height = 15
      Alignment = taRightJustify
      Caption = '品牌'
    end
    object Label5: TLabel
      Left = 8
      Top = 34
      Width = 30
      Height = 15
      Alignment = taRightJustify
      Caption = '品名'
    end
    object Label6: TLabel
      Left = 691
      Top = 34
      Width = 30
      Height = 15
      Alignment = taRightJustify
      Caption = '单位'
    end
    object Label7: TLabel
      Left = 314
      Top = 34
      Width = 30
      Height = 15
      Alignment = taRightJustify
      Caption = '规格'
    end
    object Label8: TLabel
      Left = 515
      Top = 32
      Width = 30
      Height = 15
      Alignment = taRightJustify
      Caption = '颜色'
    end
    object Label11: TLabel
      Left = 167
      Top = 58
      Width = 60
      Height = 15
      Alignment = taRightJustify
      Caption = '期初金额'
    end
    object Label12: TLabel
      Left = 326
      Top = 58
      Width = 60
      Height = 15
      Alignment = taRightJustify
      Caption = '进货数量'
    end
    object Label13: TLabel
      Left = 644
      Top = 58
      Width = 60
      Height = 15
      Alignment = taRightJustify
      Caption = '进货金额'
    end
    object Label18: TLabel
      Left = 485
      Top = 58
      Width = 60
      Height = 15
      Alignment = taRightJustify
      Caption = '平均进价'
    end
    object Label19: TLabel
      Left = 8
      Top = 58
      Width = 60
      Height = 15
      Alignment = taRightJustify
      Caption = '期初数量'
    end
    object Label9: TLabel
      Left = 167
      Top = 82
      Width = 60
      Height = 15
      Alignment = taRightJustify
      Caption = '销售数量'
    end
    object Label10: TLabel
      Left = 326
      Top = 82
      Width = 60
      Height = 15
      Alignment = taRightJustify
      Caption = '平均售价'
    end
    object Label15: TLabel
      Left = 485
      Top = 82
      Width = 60
      Height = 15
      Alignment = taRightJustify
      Caption = '销售金额'
    end
    object Label16: TLabel
      Left = 644
      Top = 82
      Width = 60
      Height = 15
      Alignment = taRightJustify
      Caption = '销售成本'
    end
    object Label17: TLabel
      Left = 8
      Top = 106
      Width = 60
      Height = 15
      Alignment = taRightJustify
      Caption = '销售利润'
    end
    object Label20: TLabel
      Left = 326
      Top = 106
      Width = 60
      Height = 15
      Alignment = taRightJustify
      Caption = '期末金额'
    end
    object Label21: TLabel
      Left = 167
      Top = 106
      Width = 60
      Height = 15
      Alignment = taRightJustify
      Caption = '期末数量'
    end
    object Label14: TLabel
      Left = 8
      Top = 82
      Width = 60
      Height = 15
      Alignment = taRightJustify
      Caption = '平均单价'
    end
    object DBEdit1: TDBEdit
      Left = 46
      Top = 6
      Width = 144
      Height = 23
      Color = cl3DLight
      DataField = 'BH'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit5: TDBEdit
      Left = 352
      Top = 30
      Width = 135
      Height = 23
      Color = cl3DLight
      DataField = 'GG'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit10: TDBEdit
      Left = 232
      Top = 54
      Width = 85
      Height = 23
      Color = cl3DLight
      DataField = 'QCJE1'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit11: TDBEdit
      Left = 389
      Top = 54
      Width = 85
      Height = 23
      Color = cl3DLight
      DataField = 'JHSL'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit12: TDBEdit
      Left = 707
      Top = 54
      Width = 85
      Height = 23
      Color = cl3DLight
      DataField = 'JHJE'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 289
      Top = 6
      Width = 132
      Height = 23
      Color = cl3DLight
      DataField = 'LB'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit6: TDBEdit
      Left = 523
      Top = 6
      Width = 132
      Height = 23
      Color = cl3DLight
      DataField = 'PP'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit7: TDBEdit
      Left = 551
      Top = 54
      Width = 85
      Height = 23
      Color = cl3DLight
      DataField = 'JHDJ'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit17: TDBEdit
      Left = 70
      Top = 54
      Width = 85
      Height = 23
      Color = cl3DLight
      DataField = 'QCSL1'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdit18: TDBEdit
      Left = 46
      Top = 30
      Width = 253
      Height = 23
      Color = cl3DLight
      DataField = 'PM'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 9
    end
    object DBEdit19: TDBEdit
      Left = 551
      Top = 30
      Width = 85
      Height = 23
      Color = cl3DLight
      DataField = 'YS'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 10
    end
    object DBEdit2: TDBEdit
      Left = 250
      Top = 6
      Width = 40
      Height = 23
      Color = cl3DLight
      DataField = 'LBBH'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 11
    end
    object DBEdit3: TDBEdit
      Left = 484
      Top = 6
      Width = 40
      Height = 23
      Color = cl3DLight
      DataField = 'PPBH'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 12
    end
    object DBEdit9: TDBEdit
      Left = 730
      Top = 30
      Width = 62
      Height = 23
      Color = cl3DLight
      DataField = 'DW'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 13
    end
    object DBEdit13: TDBEdit
      Left = 232
      Top = 78
      Width = 85
      Height = 23
      Color = cl3DLight
      DataField = 'XSSL'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 14
    end
    object DBEdit14: TDBEdit
      Left = 389
      Top = 78
      Width = 85
      Height = 23
      Color = cl3DLight
      DataField = 'XSDJ'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 15
    end
    object DBEdit15: TDBEdit
      Left = 551
      Top = 78
      Width = 85
      Height = 23
      Color = cl3DLight
      DataField = 'XSJE'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 16
    end
    object DBEdit16: TDBEdit
      Left = 707
      Top = 78
      Width = 85
      Height = 23
      Color = cl3DLight
      DataField = 'XSCB'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 17
    end
    object DBEdit20: TDBEdit
      Left = 70
      Top = 102
      Width = 85
      Height = 23
      Color = cl3DLight
      DataField = 'XSLR'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 18
    end
    object DBEdit21: TDBEdit
      Left = 389
      Top = 102
      Width = 85
      Height = 23
      Color = cl3DLight
      DataField = 'QMJE1'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 19
    end
    object DBEdit22: TDBEdit
      Left = 232
      Top = 102
      Width = 85
      Height = 23
      Color = cl3DLight
      DataField = 'QMSL1'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 20
    end
    object DBEdit8: TDBEdit
      Left = 70
      Top = 78
      Width = 85
      Height = 23
      Color = cl3DLight
      DataField = 'PJDJ'
      DataSource = Data.sJxcTjb
      ReadOnly = True
      TabOrder = 21
    end
  end
  inherited MainMenu1: TMainMenu
    inherited smnEdit: TMenuItem
      object N21: TMenuItem [12]
        Action = aCk
      end
      object N6: TMenuItem [13]
        Caption = '-'
      end
    end
  end
  inherited ActionList1: TActionList
    object aCk: TAction [13]
      Caption = '全屏查看(&2)'
      ImageIndex = 9
      ShortCut = 16434
      OnExecute = aCkExecute
    end
    inherited aFxt: TAction
      Tag = 1
    end
  end
end
