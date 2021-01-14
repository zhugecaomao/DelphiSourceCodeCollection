object frmComMx: TfrmComMx
  Left = 131
  Top = 31
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #26126#32454
  ClientHeight = 595
  ClientWidth = 693
  Color = clSilver
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = #23435#20307
  Font.Style = []
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000007
    777777777777777777777777000000000000000000000000000000070000000F
    FFFFFF7FFFFFFF7FFFFFFF070000000FFFFFFF7FFFFFFF7FFFFFFF070000000F
    FFFFFF7FFFFFFF7FFFFFFF07000000077777777777707777777777070000000F
    FFFFFF7FFFFF007FFFFFFF070000000FFFFFFF7FFFFF0B008FFFFF070000000F
    FFFFFF7FFFFFF07708FFFF070000000777777777777770BB707777070000000F
    FFFFFF7FFFFFFF0FB708FF0700000008888888788888FF70FB708F0700000000
    0000000000088F7F0FB7080000000066666666666660777770FB7007000000E0
    0600600600608F7FFF0F0807000000EE06E06E06E0608F7FFFF0FB70000000E6
    6666666666608F7FFFFF0FB7000000E00600600600607777777770FB700000EE
    06E06E06E0608F7FFFFFFF0FB70000E66666666666608F7FFFFFFF00F00000E0
    0600600600608F7FFFFFFF0700F000EE06E06E06E060777777777707000000E6
    6666666666608F7FFFFFFF07000000E00600600600608F7FFFFFFF07000000EE
    06E06E06E0608F7FFFFFFF07000000E6666666666660000000000000000000E6
    666666666660700000000000000000E08FFFFFFFF060700000000000000000E0
    888888888060700000000000000000E0000000000060700000000000000000EE
    EEEEEEEEEE60000000000000000000000000000000000000000000000000E000
    000FC000000FC000000FC000000FC000000FC000000FC000000FC000000FC000
    000FC000000FC000000FC000000FC000000F800000078000000B8000000D8000
    0005800000018000000180000001800000008000000C8000000F8000000F8000
    000F8000001F80007FFF80007FFF80007FFF80007FFF8000FFFFC001FFFF}
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 19
  object Panel1: TPanel
    Left = 0
    Top = 28
    Width = 693
    Height = 567
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    BorderStyle = bsSingle
    Color = 15793919
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object Label1: TLabel
      Left = 5
      Top = 5
      Width = 681
      Height = 30
      Align = alTop
      Alignment = taCenter
      Caption = 'Title'
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -30
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 74
      Width = 681
      Height = 415
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clWhite
      FixedColor = clSilver
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -19
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
    end
    object Panel2: TPanel
      Left = 5
      Top = 489
      Width = 681
      Height = 38
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clWindow
      TabOrder = 1
      DesignSize = (
        679
        36)
      object Label3: TLabel
        Left = 10
        Top = 9
        Width = 38
        Height = 19
        Caption = #21512#35745
      end
      object Shape2: TShape
        Left = 56
        Top = -1
        Width = 1
        Height = 82
        Anchors = [akLeft, akTop, akBottom]
      end
    end
    object Panel3: TPanel
      Left = 5
      Top = 35
      Width = 681
      Height = 39
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 2
      object Label2: TLabel
        Left = 0
        Top = 10
        Width = 48
        Height = 19
        Caption = #32534#21495':'
      end
    end
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 693
    Height = 28
    Align = alTop
    AutoSize = True
    BevelInner = bvNone
    DockSite = False
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 11
      Top = 2
      Width = 262
      Height = 38
      AutoSize = True
      ButtonHeight = 38
      ButtonWidth = 37
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      Images = frmMain.ilsSub
      ParentFont = False
      ShowCaptions = True
      TabOrder = 0
      Wrapable = False
      object btnPreview: TToolButton
        Left = 0
        Top = 0
        Action = aPreview
        AutoSize = True
        Caption = #39044#35272
      end
      object btnPrint: TToolButton
        Left = 41
        Top = 0
        Action = aPrint
        AutoSize = True
        Caption = #25171#21360
      end
      object ToolButton3: TToolButton
        Left = 82
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 23
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 90
        Top = 0
        Action = aSetColumn
        AutoSize = True
        Caption = #26639#30446
      end
      object ToolButton2: TToolButton
        Left = 131
        Top = 0
        Action = aSetSort
        AutoSize = True
        Caption = #25490#24207
      end
      object ToolButton9: TToolButton
        Left = 172
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object btnSave: TToolButton
        Left = 180
        Top = 0
        Action = aSearch
        AutoSize = True
        Caption = #26597#25214
      end
      object btnCancel: TToolButton
        Left = 221
        Top = 0
        Action = aAll
        AutoSize = True
        Caption = #20840#37096
      end
    end
    object ToolBar3: TToolBar
      Left = 501
      Top = 2
      Width = 42
      Height = 38
      AutoSize = True
      ButtonHeight = 38
      ButtonWidth = 37
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      Images = frmMain.ilsSub
      ParentFont = False
      ShowCaptions = True
      TabOrder = 1
      Wrapable = False
      object btnExit: TToolButton
        Left = 0
        Top = 0
        Action = aExit
        AutoSize = True
        Caption = #36820#22238
      end
    end
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Images = frmMain.ilsSub
    Left = 144
    Top = 204
    object smnFile: TMenuItem
      Caption = #25991#20214'(&F)'
      GroupIndex = 1
      object smnSave: TMenuItem
        Action = aSearch
      end
      object smnCancel: TMenuItem
        Action = aAll
      end
      object LineF1: TMenuItem
        Caption = '-'
      end
      object smnPreview: TMenuItem
        Action = aPreview
      end
      object smnPrint: TMenuItem
        Action = aPrint
      end
      object LineF2: TMenuItem
        Caption = '-'
      end
      object smnExit: TMenuItem
        Action = aExit
      end
    end
    object smnEdit: TMenuItem
      Caption = #32534#36753'(&E)'
      GroupIndex = 1
      object mnuSetColumn: TMenuItem
        Action = aSetColumn
      end
      object mnuSetSoft: TMenuItem
        Action = aSetSort
      end
      object LineE1: TMenuItem
        Caption = '-'
      end
      object F1: TMenuItem
        Action = aSearch
      end
      object L1: TMenuItem
        Action = aAll
      end
    end
    object Stool: TMenuItem
      Caption = #24037#20855'(&T)'
      GroupIndex = 1
      object smmCalendar: TMenuItem
        Action = aCalendar
      end
      object smmCalculator: TMenuItem
        Action = aCalculator
      end
    end
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Images = frmMain.ilsSub
    Left = 210
    Top = 204
    object pmnSetColumn: TMenuItem
      Caption = #26639#30446#24067#23616'(&O)'
      ImageIndex = 21
      ShortCut = 16463
      OnClick = aSetColumnExecute
    end
    object pmnSetSort: TMenuItem
      Action = aSetSort
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object pmnSave: TMenuItem
      Action = aSearch
    end
    object pmnCancel: TMenuItem
      Action = aAll
    end
  end
  object ActionList1: TActionList
    Images = frmMain.ilsSub
    Left = 84
    Top = 204
    object aPreview: TAction
      Caption = #25171#21360#39044#35272'(&V)'
      ImageIndex = 0
      OnExecute = aPreviewExecute
    end
    object aPrint: TAction
      Caption = #25171#21360'(&P)'
      ImageIndex = 1
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aExit: TAction
      Caption = #36820#22238'(&X)'
      ImageIndex = 2
      ShortCut = 27
      OnExecute = aExitExecute
    end
    object aSetColumn: TAction
      Caption = #26639#30446#24067#23616'(&O)'
      ImageIndex = 21
      ShortCut = 16463
      OnExecute = aSetColumnExecute
    end
    object aSetSort: TAction
      Caption = #25968#25454#25490#24207'(&S)'
      ImageIndex = 22
      ShortCut = 16467
      OnExecute = aSetSortExecute
    end
    object aSearch: TAction
      Caption = #26597#25214'(&F)'
      ImageIndex = 7
      ShortCut = 114
      OnExecute = aSearchExecute
    end
    object aAll: TAction
      Caption = #20840#37096'(&L)'
      ImageIndex = 8
      ShortCut = 16449
      OnExecute = aAllExecute
    end
    object aCalendar: TAction
      Caption = #19975#24180#21382'(&C)'
      ImageIndex = 15
      OnExecute = aCalendarExecute
    end
    object aCalculator: TAction
      Caption = #35745#31639#22120'(&A)'
      ImageIndex = 16
      ShortCut = 122
      OnExecute = aCalculatorExecute
    end
  end
end
