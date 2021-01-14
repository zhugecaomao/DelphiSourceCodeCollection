inherited frmBbYwXsMx: TfrmBbYwXsMx
  Left = 5
  Top = 38
  Caption = '业务员销售明细表'
  ClientWidth = 776
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 776
    inherited Label1: TLabel
      Width = 764
    end
    inherited DBGrid1: TDBGrid
      Top = 85
      Width = 764
      Height = 304
      DataSource = DataTjb.sHpXsMx
      OnDblClick = aDjExecute
      Columns = <
        item
          Expanded = False
          FieldName = 'RQ'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DJBH'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BH'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MC'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SL'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DJ'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NSL'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JEA'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JEB'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JEC'
          PickList.Strings = ()
          Visible = True
        end>
    end
    inherited Panel2: TPanel
      Top = 389
      Width = 764
      object Label6: TLabel
        Left = 174
        Top = 7
        Width = 68
        Height = 15
        Caption = '销售金额:'
      end
      object Label7: TLabel
        Tag = 1
        Left = 246
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
        Left = 366
        Top = 7
        Width = 68
        Height = 15
        Caption = '销售税额:'
      end
      object Label9: TLabel
        Tag = 1
        Left = 438
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
      object Label10: TLabel
        Left = 558
        Top = 7
        Width = 68
        Height = 15
        Caption = '税价合计:'
      end
      object Label11: TLabel
        Tag = 1
        Left = 630
        Top = 4
        Width = 108
        Height = 18
        Hint = 'JEC'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labKHBH'
        Color = cl3DLight
        ParentColor = False
      end
      object Label12: TLabel
        Left = 66
        Top = 7
        Width = 38
        Height = 15
        Caption = '数量:'
      end
      object Label13: TLabel
        Tag = 1
        Left = 108
        Top = 5
        Width = 55
        Height = 18
        Hint = 'SL'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labKHBH'
        Color = cl3DLight
        ParentColor = False
      end
    end
    inherited Panel3: TPanel
      Width = 764
      Height = 56
      inherited Label2: TLabel
        Top = 32
        Width = 68
        Caption = '货品编号:'
      end
      object Label4: TLabel
        Left = 210
        Top = 32
        Width = 68
        Height = 15
        Caption = '品名规格:'
      end
      object Label5: TLabel
        Left = 0
        Top = 8
        Width = 68
        Height = 15
        Caption = '查看日期:'
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
      object Label15: TLabel
        Left = 582
        Top = 32
        Width = 68
        Height = 15
        Caption = '计量单位:'
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
    end
  end
  inherited ControlBar1: TControlBar
    Width = 776
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
        Caption = '查看单据'
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
      Caption = '查看单据(&E)'
      ImageIndex = 9
      ShortCut = 13
      OnExecute = aDjExecute
    end
  end
end
