inherited BaseDBFrm: TBaseDBFrm
  Left = 65
  Top = 94
  Width = 583
  Height = 350
  Caption = 'BaseDBFrm'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBkGnd: TPanel
    Width = 575
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 575
      Height = 57
      ButtonHeight = 52
      ButtonWidth = 61
      Caption = 'ToolBar1'
      Color = 14935011
      EdgeBorders = [ebTop, ebBottom]
      Flat = True
      Images = DM.ImageList1
      ParentColor = False
      ShowCaptions = True
      TabOrder = 0
      object DN: TDBNavigator
        Left = 0
        Top = 0
        Width = 164
        Height = 52
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        TabOrder = 0
      end
      object ToolButton8: TToolButton
        Left = 164
        Top = 0
        Width = 13
        Caption = 'ToolButton8'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 177
        Top = 0
        Caption = #22686#21152'(&I)'
        ImageIndex = 0
        OnClick = ToolButton1Click
      end
      object ToolButton2: TToolButton
        Left = 238
        Top = 0
        Caption = #21024#38500'(&D)'
        ImageIndex = 1
        OnClick = ToolButton2Click
      end
      object ToolButton3: TToolButton
        Left = 299
        Top = 0
        Caption = #20462#25913'(&M)'
        ImageIndex = 2
        OnClick = ToolButton3Click
      end
      object ToolButton4: TToolButton
        Left = 360
        Top = 0
        Caption = #20445#23384'(&S)'
        ImageIndex = 3
      end
      object ToolButton5: TToolButton
        Left = 421
        Top = 0
        Caption = #21462#28040'(&C)'
        ImageIndex = 4
        OnClick = ToolButton5Click
      end
      object ToolButton6: TToolButton
        Left = 482
        Top = 0
        Width = 23
        Caption = 'ToolButton6'
        ImageIndex = 5
        Style = tbsDivider
      end
      object ToolButton7: TToolButton
        Left = 505
        Top = 0
        Caption = #20851#38381'(&X)'
        ImageIndex = 6
        OnClick = ToolButton7Click
      end
    end
  end
end
