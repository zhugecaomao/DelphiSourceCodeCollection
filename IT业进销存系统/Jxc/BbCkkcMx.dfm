inherited frmBbCkkcMx: TfrmBbCkkcMx
  Left = 208
  Top = 140
  Caption = #24211#23384#26126#32454#34920
  ClientWidth = 776
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Panel1: TPanel
    Top = 44
    Width = 776
    Height = 426
    inherited Label1: TLabel
      Width = 764
    end
    inherited DBGrid1: TDBGrid
      Top = 109
      Width = 764
      Height = 280
      DataSource = DataBb.sCkkcMx
      OnDblClick = aDjExecute
      Columns = <
        item
          Expanded = False
          FieldName = 'LX'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RQ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DJBH'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MC1'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DJ1'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SLA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JEA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SLB'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JEB'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JYSL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JYJE'
          Visible = True
        end>
    end
    inherited Panel2: TPanel
      Top = 389
      Width = 764
      inherited Label3: TLabel
        Left = 7
      end
      object Label10: TLabel
        Left = 54
        Top = 7
        Width = 68
        Height = 15
        Caption = #25910#20837#25968#37327':'
      end
      object labSLB: TLabel
        Tag = 1
        Left = 126
        Top = 5
        Width = 78
        Height = 18
        Hint = 'SLA'
        Alignment = taRightJustify
        AutoSize = False
        Color = cl3DLight
        ParentColor = False
      end
      object Label17: TLabel
        Left = 216
        Top = 7
        Width = 68
        Height = 15
        Caption = #25910#20837#37329#39069':'
      end
      object labJEB: TLabel
        Tag = 1
        Left = 288
        Top = 4
        Width = 102
        Height = 18
        Hint = 'JEA'
        Alignment = taRightJustify
        AutoSize = False
        Color = cl3DLight
        ParentColor = False
      end
      object Label19: TLabel
        Left = 414
        Top = 7
        Width = 68
        Height = 15
        Caption = #21457#20986#25968#37327':'
      end
      object labSLC: TLabel
        Tag = 1
        Left = 486
        Top = 5
        Width = 78
        Height = 18
        Hint = 'SLB'
        Alignment = taRightJustify
        AutoSize = False
        Color = cl3DLight
        ParentColor = False
      end
      object Label21: TLabel
        Left = 576
        Top = 7
        Width = 68
        Height = 15
        Caption = #21457#20986#37329#39069':'
      end
      object labJEC: TLabel
        Tag = 1
        Left = 648
        Top = 4
        Width = 102
        Height = 18
        Hint = 'JEB'
        Alignment = taRightJustify
        AutoSize = False
        Color = cl3DLight
        ParentColor = False
      end
      object Bevel2: TBevel
        Left = 403
        Top = 0
        Width = 6
        Height = 58
        Shape = bsLeftLine
      end
    end
    inherited Panel3: TPanel
      Width = 764
      Height = 80
      inherited Label2: TLabel
        Left = 210
        Top = 6
        Width = 68
        Caption = #26597#30475#26085#26399':'
      end
      object labTj: TLabel
        Tag = 1
        Left = 282
        Top = 6
        Width = 40
        Height = 15
        Caption = 'labTj'
        Color = cl3DLight
        ParentColor = False
      end
      object Label4: TLabel
        Left = 0
        Top = 32
        Width = 68
        Height = 15
        Caption = #36135#21697#32534#21495':'
      end
      object labHPBH: TLabel
        Tag = 1
        Left = 72
        Top = 30
        Width = 121
        Height = 18
        AutoSize = False
        Caption = 'labHPBH'
        Color = cl3DLight
        ParentColor = False
      end
      object Label5: TLabel
        Left = 210
        Top = 32
        Width = 68
        Height = 15
        Caption = #21697#21517#35268#26684':'
      end
      object labHPPM: TLabel
        Tag = 1
        Left = 282
        Top = 30
        Width = 280
        Height = 18
        AutoSize = False
        Caption = 'labHPPM'
        Color = cl3DLight
        ParentColor = False
      end
      object Label15: TLabel
        Left = 582
        Top = 32
        Width = 68
        Height = 15
        Caption = #35745#37327#21333#20301':'
      end
      object labHPDW: TLabel
        Tag = 1
        Left = 654
        Top = 30
        Width = 42
        Height = 18
        AutoSize = False
        Caption = 'labHPDW'
        Color = cl3DLight
        ParentColor = False
      end
      object labCK: TLabel
        Tag = 1
        Left = 72
        Top = 6
        Width = 121
        Height = 15
        AutoSize = False
        Caption = 'labCK'
        Color = cl3DLight
        ParentColor = False
      end
      object Label24: TLabel
        Left = 0
        Top = 6
        Width = 70
        Height = 15
        Caption = #20179'    '#24211':'
      end
      object Label6: TLabel
        Left = 0
        Top = 58
        Width = 68
        Height = 15
        Caption = #26399#21021#25968#37327':'
      end
      object labSLA: TLabel
        Tag = 1
        Left = 72
        Top = 56
        Width = 78
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Color = cl3DLight
        ParentColor = False
      end
      object Label8: TLabel
        Left = 162
        Top = 58
        Width = 68
        Height = 15
        Caption = #26399#21021#37329#39069':'
      end
      object labJEA: TLabel
        Tag = 1
        Left = 234
        Top = 55
        Width = 102
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Color = cl3DLight
        ParentColor = False
      end
      object Label13: TLabel
        Left = 361
        Top = 58
        Width = 68
        Height = 15
        Caption = #26399#26411#25968#37327':'
      end
      object labSLD: TLabel
        Tag = 1
        Left = 433
        Top = 56
        Width = 78
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Color = cl3DLight
        ParentColor = False
      end
      object Label14: TLabel
        Left = 523
        Top = 58
        Width = 68
        Height = 15
        Caption = #26399#26411#37329#39069':'
      end
      object labJED: TLabel
        Tag = 1
        Left = 595
        Top = 55
        Width = 102
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Color = cl3DLight
        ParentColor = False
      end
    end
  end
  inherited ControlBar1: TControlBar
    Width = 776
    Height = 44
    inherited ToolBar1: TToolBar
      ButtonWidth = 67
      object ToolButton5: TToolButton
        Left = 262
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 270
        Top = 0
        Action = aDj
        Caption = #26597#30475#21333#25454
      end
    end
  end
  inherited MainMenu1: TMainMenu
    inherited smnEdit: TMenuItem
      object N1: TMenuItem
        Caption = '-'
      end
      object E1: TMenuItem
        Action = aDj
      end
    end
  end
  inherited ActionList1: TActionList
    object aDj: TAction
      Caption = #26597#30475#21333#25454'(&E)'
      ImageIndex = 9
      ShortCut = 13
      OnExecute = aDjExecute
    end
  end
end
