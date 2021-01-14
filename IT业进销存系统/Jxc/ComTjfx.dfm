inherited frmComTjfx: TfrmComTjfx
  Caption = #32479#35745#20998#26512
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000000F
    FF99999FCCCCCFDDDDDF22222FF0000FFF99999FCCCCCFDDDDDF22222FF0000F
    FF99999FCCCCCFDDDDDF22222FF0000FFF99999FCCCCCFDDDDDF22222FF0000F
    FF99999FCCCCCFDDDDDF22222FF0000888999998CCCCC8DDDDD822222880000F
    FF99999FCCCCCFDDDDDF22222FF0000FFF99999FCCCCCFDDDDDF22222FF0000F
    FF99999FCCCCCFDDDDDF22222FF0000FFF99999FCCCCCFDDDDDF22222FF0000F
    FF99999FCCCCCFDDDDDF22222FF0000888999998CCCCC8DDDDD822222880000F
    FF99999FCCCCCFDDDDDF22222FF0000FFF99999FCCCCCFDDDDDF22222FF0000F
    FF99999FCCCCCFFF8FFF22222FF0000FFF99999FCCCCCFFF8FFF22222FF0000F
    FF99999FCCCCCFFF8FFF22222FF0000888888888CCCCC888888822222880000F
    FFFF8FFFCCCCCFFF8FFF22222FF0000FFFFF8FFFCCCCCFFF8FFF22222FF0000F
    FFFF8FFFCCCCCFFF8FFFFF8FFFF0000FFFFF8FFFCCCCCFFF8FFFFF8FFFF0000F
    FFFF8FFFCCCCCFFF8FFFFF8FFFF000088888888888888888888888888880000F
    FFFF8FFFFF8FFFFF8FFFFF8FFFF0000FFFFF8FFFFF8FFFFF8FFFFF8FFFF0000F
    FFFF8FFFFF8FFFFF8FFFFF8FFFF0000FFFFF8FFFFF8FFFFF8FFFFF8FFFF0FFFF
    FFFFDF7DF7DFFFFFFFFF40000001C0000001C0000001C0000001C0000001C000
    000140000001C0000001C0000001C0000001C0000001C000000140000001C000
    0001C0000001C0000001C0000001C000000140000001C0000001C0000001C000
    0001C0000001C000000140000001C0000001C0000001C0000001C0000001}
  OldCreateOrder = True
  Scaled = False
  PixelsPerInch = 120
  TextHeight = 19
  inherited DBGrid1: TDBGrid
    OnDblClick = aMxExecute
  end
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Width = 124
      Caption = #32479#35745#20998#26512
    end
    inherited Image2: TImage
      Picture.Data = {
        055449636F6E0000010001002020100000000000E80200001600000028000000
        2000000040000000010004000000000080020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF0000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000FFF99999FCCCCCFDDDDDF22222FF0000FFF99999FCCCCCFDDDDDF
        22222FF0000FFF99999FCCCCCFDDDDDF22222FF0000FFF99999FCCCCCFDDDDDF
        22222FF0000FFF99999FCCCCCFDDDDDF22222FF0000888999998CCCCC8DDDDD8
        22222880000FFF99999FCCCCCFDDDDDF22222FF0000FFF99999FCCCCCFDDDDDF
        22222FF0000FFF99999FCCCCCFDDDDDF22222FF0000FFF99999FCCCCCFDDDDDF
        22222FF0000FFF99999FCCCCCFDDDDDF22222FF0000888999998CCCCC8DDDDD8
        22222880000FFF99999FCCCCCFDDDDDF22222FF0000FFF99999FCCCCCFDDDDDF
        22222FF0000FFF99999FCCCCCFFF8FFF22222FF0000FFF99999FCCCCCFFF8FFF
        22222FF0000FFF99999FCCCCCFFF8FFF22222FF0000888888888CCCCC8888888
        22222880000FFFFF8FFFCCCCCFFF8FFF22222FF0000FFFFF8FFFCCCCCFFF8FFF
        22222FF0000FFFFF8FFFCCCCCFFF8FFFFF8FFFF0000FFFFF8FFFCCCCCFFF8FFF
        FF8FFFF0000FFFFF8FFFCCCCCFFF8FFFFF8FFFF0000888888888888888888888
        88888880000FFFFF8FFFFF8FFFFF8FFFFF8FFFF0000FFFFF8FFFFF8FFFFF8FFF
        FF8FFFF0000FFFFF8FFFFF8FFFFF8FFFFF8FFFF0000FFFFF8FFFFF8FFFFF8FFF
        FF8FFFF0FFFFFFFFDF7DF7DFFFFFFFFF40000001C0000001C0000001C0000001
        C0000001C000000140000001C0000001C0000001C0000001C0000001C0000001
        40000001C0000001C0000001C0000001C0000001C000000140000001C0000001
        C0000001C0000001C0000001C000000140000001C0000001C0000001C0000001
        C0000001}
    end
    object labTj: TLabel
      Left = 324
      Top = 18
      Width = 76
      Height = 15
      Cursor = crHandPoint
      BiDiMode = bdLeftToRight
      Caption = #32479#35745#26376#20221': '
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      Transparent = True
    end
  end
  inherited ControlBar1: TControlBar
    inherited ToolBar2: TToolBar
      Left = 698
      Width = 80
      inherited DBNavigator1: TDBNavigator
        Width = 80
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      end
    end
    inherited ToolBar1: TToolBar
      Width = 713
      object ToolButton1: TToolButton
        Left = 568
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object btnMx: TToolButton
        Left = 576
        Top = 0
        Action = aMx
        AutoSize = True
        Caption = ' '#26126#32454' '
      end
      object btnFxt: TToolButton
        Left = 645
        Top = 0
        Action = aFxt
        AutoSize = True
        Caption = #20998#26512#22270
      end
    end
    inherited ToolBar3: TToolBar
      Left = 786
      Width = 65
    end
  end
  object pnlFxt: TPanel [3]
    Left = 252
    Top = 131
    Width = 307
    Height = 110
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = 'pnlFxt'
    TabOrder = 3
    Visible = False
    object DBChart1: TDBChart
      Left = 1
      Top = 1
      Width = 305
      Height = 108
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Gradient.EndColor = clWhite
      Gradient.StartColor = clYellow
      Gradient.Visible = True
      PrintProportional = False
      Title.Alignment = taRightJustify
      Title.Brush.Color = clWhite
      Title.Color = 14876158
      Title.Font.Charset = GB2312_CHARSET
      Title.Font.Color = clBlue
      Title.Font.Height = -21
      Title.Font.Name = #23435#20307
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        'TDBChart')
      Title.Visible = False
      BottomAxis.AxisValuesFormat = '#,##0.##'
      BottomAxis.LabelsFont.Charset = GB2312_CHARSET
      BottomAxis.LabelsFont.Color = clBlack
      BottomAxis.LabelsFont.Height = -15
      BottomAxis.LabelsFont.Name = #23435#20307
      BottomAxis.LabelsFont.Style = []
      DepthAxis.AxisValuesFormat = '#,##0.##'
      LeftAxis.AxisValuesFormat = '#,##0.##'
      Legend.Color = 14744827
      Legend.Font.Charset = GB2312_CHARSET
      Legend.Font.Color = clBlack
      Legend.Font.Height = -15
      Legend.Font.Name = #23435#20307
      Legend.Font.Style = []
      Legend.TextStyle = ltsRightValue
      RightAxis.AxisValuesFormat = '#,##0.##'
      TopAxis.AxisValuesFormat = '#,##0.##'
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
    end
  end
  inherited MainMenu1: TMainMenu
    inherited smnEdit: TMenuItem
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuMx: TMenuItem
        Action = aMx
      end
      object mnuFxt: TMenuItem
        Action = aFxt
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    object N6: TMenuItem
      Caption = '-'
    end
    object pmnMx: TMenuItem
      Action = aMx
    end
    object pmnFxt: TMenuItem
      Action = aFxt
    end
  end
  inherited ActionList1: TActionList
    inherited aNew: TAction
      Tag = 1
    end
    inherited aModify: TAction
      Tag = 1
      ShortCut = 0
    end
    inherited aDel: TAction
      Tag = 1
    end
    inherited aRefresh: TAction
      Enabled = False
    end
    object aMx: TAction
      Tag = 1
      Caption = #26126#32454#36164#26009'(&I)'
      ImageIndex = 23
      ShortCut = 13
      OnExecute = aMxExecute
    end
    object aFxt: TAction
      Caption = #20998#26512#22270'(&G)'
      ImageIndex = 25
      ShortCut = 16455
      OnExecute = aFxtExecute
    end
  end
end
