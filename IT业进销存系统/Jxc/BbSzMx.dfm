inherited frmBbSzMx: TfrmBbSzMx
  Left = 135
  Caption = #36153#29992#24320#25903#21450#20854#23427#25910#20837#26126#32454#34920
  ClientWidth = 499
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Panel1: TPanel
    Top = 44
    Width = 499
    Height = 426
    inherited Label1: TLabel
      Width = 487
      Caption = #36153#29992#24320#25903#21450#20854#23427#25910#20837#26126#32454#34920
    end
    inherited DBGrid1: TDBGrid
      Top = 85
      Width = 487
      Height = 288
      DataSource = DataBb.sSzMx
      OnDblClick = aDjExecute
      Columns = <
        item
          Expanded = False
          FieldName = 'RQ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LX'
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JEB'
          Visible = True
        end>
    end
    inherited Panel2: TPanel
      Top = 373
      Width = 487
      object Label6: TLabel
        Left = 72
        Top = 7
        Width = 68
        Height = 15
        Caption = #25910#20837#37329#39069':'
      end
      object Label7: TLabel
        Tag = 1
        Left = 144
        Top = 5
        Width = 108
        Height = 18
        Hint = 'JEA'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labKHBH'
        Color = cl3DLight
        ParentColor = False
      end
      object Label8: TLabel
        Left = 276
        Top = 7
        Width = 68
        Height = 15
        Caption = #25903#20986#31246#39069':'
      end
      object Label9: TLabel
        Tag = 1
        Left = 348
        Top = 4
        Width = 108
        Height = 18
        Hint = 'JEB'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labKHBH'
        Color = cl3DLight
        ParentColor = False
      end
    end
    inherited Panel3: TPanel
      Width = 487
      Height = 56
      inherited Label2: TLabel
        Top = 32
        Width = 70
        Caption = #32534'    '#21495':'
      end
      object Label4: TLabel
        Left = 146
        Top = 32
        Width = 128
        Height = 15
        Alignment = taRightJustify
        Caption = #25910#20837#25903#20986#31867#21035#21517#31216':'
      end
      object Label5: TLabel
        Left = 0
        Top = 8
        Width = 68
        Height = 15
        Caption = #26597#30475#26085#26399':'
      end
      object labBH: TLabel
        Tag = 1
        Left = 72
        Top = 30
        Width = 61
        Height = 18
        AutoSize = False
        Caption = 'labBH'
        Color = cl3DLight
        ParentColor = False
      end
      object labMC: TLabel
        Tag = 1
        Left = 278
        Top = 30
        Width = 180
        Height = 18
        AutoSize = False
        Caption = 'labMC'
        Color = cl3DLight
        ParentColor = False
      end
      object labTj: TLabel
        Tag = 1
        Left = 72
        Top = 6
        Width = 40
        Height = 15
        Caption = 'labTj'
        Color = cl3DLight
        ParentColor = False
      end
    end
  end
  inherited ControlBar1: TControlBar
    Width = 499
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
    inherited ToolBar3: TToolBar
      Left = 453
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
