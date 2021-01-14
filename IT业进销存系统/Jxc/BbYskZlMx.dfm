inherited frmBbYskZlMx: TfrmBbYskZlMx
  Left = 110
  Top = 34
  Caption = #24212#25910#27454#24080#40836#26126#32454#34920
  ClientWidth = 608
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Panel1: TPanel
    Top = 44
    Width = 608
    Height = 426
    inherited Label1: TLabel
      Width = 596
    end
    inherited DBGrid1: TDBGrid
      Top = 133
      Width = 596
      Height = 240
      DataSource = DataBb.sYskZlMx
      OnDblClick = aDjExecute
      Columns = <
        item
          Expanded = False
          FieldName = 'RQ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DJBH'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JEA'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JEB'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JEC'
          Width = 105
          Visible = True
        end>
    end
    inherited Panel2: TPanel
      Top = 373
      Width = 596
      object Label6: TLabel
        Left = 54
        Top = 7
        Width = 68
        Height = 15
        Caption = #38144#21806#37329#39069':'
      end
      object Label7: TLabel
        Tag = 1
        Left = 126
        Top = 5
        Width = 99
        Height = 18
        Hint = 'JEA'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labKHBH'
        Color = cl3DLight
        ParentColor = False
      end
      object Label8: TLabel
        Left = 234
        Top = 7
        Width = 68
        Height = 15
        Caption = #24050#25910#37329#39069':'
      end
      object Label9: TLabel
        Tag = 1
        Left = 306
        Top = 4
        Width = 99
        Height = 18
        Hint = 'JEB'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labKHBH'
        Color = cl3DLight
        ParentColor = False
      end
      object Label10: TLabel
        Left = 414
        Top = 7
        Width = 68
        Height = 15
        Caption = #26411#25910#37329#39069':'
      end
      object Label11: TLabel
        Tag = 1
        Left = 486
        Top = 4
        Width = 99
        Height = 18
        Hint = 'JEC'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labKHBH'
        Color = cl3DLight
        ParentColor = False
      end
    end
    inherited Panel3: TPanel
      Width = 596
      Height = 104
      inherited Label2: TLabel
        Left = 204
        Caption = #23458#25143':'
      end
      object Label5: TLabel
        Left = 0
        Top = 8
        Width = 68
        Height = 15
        Caption = #25130#27490#26085#26399':'
      end
      object labKHBH: TLabel
        Tag = 1
        Left = 246
        Top = 6
        Width = 108
        Height = 18
        AutoSize = False
        Caption = 'labKHBH'
        Color = cl3DLight
        ParentColor = False
      end
      object labKHMC: TLabel
        Tag = 1
        Left = 360
        Top = 6
        Width = 180
        Height = 18
        AutoSize = False
        Caption = 'labKHMC'
        Color = cl3DLight
        ParentColor = False
      end
      object labTj: TLabel
        Tag = 1
        Left = 72
        Top = 6
        Width = 115
        Height = 18
        AutoSize = False
        Caption = '1999'#24180'12'#26376'31'#26085
        Color = cl3DLight
        ParentColor = False
      end
      object BT1: TLabel
        Left = 0
        Top = 32
        Width = 93
        Height = 15
        Caption = '180'#33267'180'#22825#65306
      end
      object TS1: TLabel
        Tag = 1
        Left = 90
        Top = 30
        Width = 97
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99,999,99.99'
        Color = cl3DLight
        ParentColor = False
      end
      object BT4: TLabel
        Left = 204
        Top = 32
        Width = 93
        Height = 15
        Caption = '180'#33267'180'#22825#65306
      end
      object TS4: TLabel
        Tag = 1
        Left = 294
        Top = 30
        Width = 97
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99,999,99.99'
        Color = cl3DLight
        ParentColor = False
      end
      object BT7: TLabel
        Left = 408
        Top = 32
        Width = 93
        Height = 15
        Caption = '180'#33267'180'#22825#65306
      end
      object TS7: TLabel
        Tag = 1
        Left = 498
        Top = 30
        Width = 97
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99,999,99.99'
        Color = cl3DLight
        ParentColor = False
      end
      object BT2: TLabel
        Left = 0
        Top = 56
        Width = 93
        Height = 15
        Caption = '180'#33267'180'#22825#65306
      end
      object TS2: TLabel
        Tag = 1
        Left = 90
        Top = 54
        Width = 97
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99,999,99.99'
        Color = cl3DLight
        ParentColor = False
      end
      object BT5: TLabel
        Left = 204
        Top = 56
        Width = 93
        Height = 15
        Caption = '180'#33267'180'#22825#65306
      end
      object TS5: TLabel
        Tag = 1
        Left = 294
        Top = 54
        Width = 97
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99,999,99.99'
        Color = cl3DLight
        ParentColor = False
      end
      object BT8: TLabel
        Left = 408
        Top = 56
        Width = 93
        Height = 15
        Caption = '180'#33267'180'#22825#65306
      end
      object TS8: TLabel
        Tag = 1
        Left = 497
        Top = 54
        Width = 97
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99,999,99.99'
        Color = cl3DLight
        ParentColor = False
      end
      object BT3: TLabel
        Left = 0
        Top = 80
        Width = 93
        Height = 15
        Caption = '180'#33267'180'#22825#65306
      end
      object TS3: TLabel
        Tag = 1
        Left = 90
        Top = 78
        Width = 97
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99,999,99.99'
        Color = cl3DLight
        ParentColor = False
      end
      object BT6: TLabel
        Left = 204
        Top = 80
        Width = 93
        Height = 15
        Caption = '180'#33267'180'#22825#65306
      end
      object TS6: TLabel
        Tag = 1
        Left = 294
        Top = 78
        Width = 97
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99,999,99.99'
        Color = cl3DLight
        ParentColor = False
      end
      object BT9: TLabel
        Left = 408
        Top = 80
        Width = 38
        Height = 15
        Caption = #21512#35745':'
      end
      object TS9: TLabel
        Tag = 1
        Left = 497
        Top = 78
        Width = 97
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99,999,99.99'
        Color = cl3DLight
        ParentColor = False
      end
    end
  end
  inherited ControlBar1: TControlBar
    Width = 608
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
