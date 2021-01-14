inherited frmBbYskMx: TfrmBbYskMx
  Left = 5
  Top = 38
  Caption = '应收款明细帐'
  ClientWidth = 596
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 596
    inherited Label1: TLabel
      Width = 584
    end
    inherited DBGrid1: TDBGrid
      Top = 109
      Width = 584
      Height = 279
      DataSource = DataBb.sYskMx
      OnDrawColumnCell = DBGrid1DrawColumnCell
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
          FieldName = 'LX'
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
          FieldName = 'JYJE'
          PickList.Strings = ()
          Visible = True
        end>
    end
    inherited Panel2: TPanel
      Width = 584
      Height = 31
      inherited Shape2: TShape
        Height = 66
      end
      object labJEA: TLabel
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
      object Label11: TLabel
        Left = 174
        Top = 7
        Width = 68
        Height = 15
        Caption = '应收金额:'
      end
      object Label12: TLabel
        Left = 378
        Top = 7
        Width = 68
        Height = 15
        Caption = '收款金额:'
      end
      object labJEB: TLabel
        Tag = 1
        Left = 450
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
      Width = 584
      Height = 80
      inherited Label2: TLabel
        Top = 32
        Width = 68
        Caption = '客户编号:'
      end
      object Label4: TLabel
        Left = 222
        Top = 32
        Width = 68
        Height = 15
        Caption = '客户名称:'
      end
      object Label5: TLabel
        Left = 0
        Top = 8
        Width = 68
        Height = 15
        Caption = '查看日期:'
      end
      object labKHBH: TLabel
        Tag = 1
        Left = 72
        Top = 30
        Width = 108
        Height = 18
        AutoSize = False
        Caption = 'labKHBH'
        Color = cl3DLight
        ParentColor = False
      end
      object labKHMC: TLabel
        Tag = 1
        Left = 294
        Top = 30
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
        Width = 40
        Height = 15
        Caption = 'labTj'
        Color = cl3DLight
        ParentColor = False
      end
      object Label6: TLabel
        Left = 0
        Top = 58
        Width = 83
        Height = 15
        Caption = '期初应收额:'
      end
      object labQCYE: TLabel
        Tag = 1
        Left = 87
        Top = 56
        Width = 111
        Height = 18
        Hint = 'JEA'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labKHBH'
        Color = cl3DLight
        ParentColor = False
      end
      object Label8: TLabel
        Left = 222
        Top = 58
        Width = 83
        Height = 15
        Caption = '期末应收款:'
      end
      object labQMYE: TLabel
        Tag = 1
        Left = 309
        Top = 55
        Width = 111
        Height = 18
        Hint = 'JEB'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labKHBH'
        Color = cl3DLight
        ParentColor = False
      end
    end
  end
  inherited ControlBar1: TControlBar
    Width = 596
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
