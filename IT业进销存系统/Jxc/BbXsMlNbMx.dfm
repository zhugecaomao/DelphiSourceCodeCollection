inherited frmBbXsMlNbMx: TfrmBbXsMlNbMx
  Left = 34
  Top = 124
  Caption = #38144#21806#27611#21033#26126#32454#34920'('#19981#21547#31246#20215')'
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
      Caption = #38144' '#21806' '#27611' '#21033' '#26126' '#32454' '#34920' ( '#19981' '#21547' '#31246' '#20215' )'
    end
    inherited DBGrid1: TDBGrid
      Top = 61
      Width = 764
      Height = 288
      DataSource = DataBb.sXsMlNbMx
      OnDrawColumnCell = DBGrid1DrawColumnCell
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
          FieldName = 'BH'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DW'
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
          FieldName = 'CBDJ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JEA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CBJE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LRJE'
          Visible = True
        end>
    end
    inherited Panel2: TPanel
      Top = 349
      Width = 764
      object Label6: TLabel
        Left = 150
        Top = 7
        Width = 68
        Height = 15
        Caption = #38144#21806#37329#39069':'
      end
      object Label7: TLabel
        Tag = 1
        Left = 222
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
        Left = 354
        Top = 7
        Width = 68
        Height = 15
        Caption = #38144#21806#25104#26412':'
      end
      object Label9: TLabel
        Tag = 1
        Left = 426
        Top = 4
        Width = 108
        Height = 18
        Hint = 'CBJE'
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
        Caption = #38144#21806#27611#21033':'
      end
      object Label11: TLabel
        Tag = 1
        Left = 630
        Top = 4
        Width = 108
        Height = 18
        Hint = 'LRJE'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'labKHBH'
        Color = cl3DLight
        ParentColor = False
      end
    end
    inherited Panel3: TPanel
      Width = 764
      Height = 32
      inherited Label2: TLabel
        Top = 6
        Width = 68
        Caption = #26597#30475#26085#26399':'
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
