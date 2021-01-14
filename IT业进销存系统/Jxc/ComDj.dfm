object frmComDj: TfrmComDj
  Left = 366
  Top = 103
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #21333#25454
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
  OnCloseQuery = FormCloseQuery
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
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -19
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnColExit = DBGrid1ColExit
      OnDblClick = DBGrid1EditButtonClick
      OnEditButtonClick = DBGrid1EditButtonClick
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
        Width = 86
        Height = 19
        Caption = #21333#25454#32534#21495':'
      end
      object DBEdit1: TDBEdit
        Left = 94
        Top = 8
        Width = 114
        Height = 22
        BorderStyle = bsNone
        Color = cl3DLight
        DataField = 'DJBH'
        TabOrder = 0
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
      Width = 353
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
      object ToolButton9: TToolButton
        Left = 82
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object btnSave: TToolButton
        Left = 90
        Top = 0
        Action = aSave
        AutoSize = True
        Caption = #20445#23384
      end
      object btnCancel: TToolButton
        Left = 131
        Top = 0
        Action = aCancel
        AutoSize = True
        Caption = #21462#28040
      end
      object ToolButton3: TToolButton
        Left = 172
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object btnNew: TToolButton
        Left = 180
        Top = 0
        Action = aNew
        AutoSize = True
        Caption = #26032#21333
      end
      object btnDel: TToolButton
        Left = 221
        Top = 0
        Action = aDel
        AutoSize = True
        Caption = #21024#21333
      end
      object ToolButton13: TToolButton
        Left = 262
        Top = 0
        Width = 8
        Caption = 'ToolButton13'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object btnInsert: TToolButton
        Left = 270
        Top = 0
        Action = aInsert
        AutoSize = True
        Caption = #22686#21152
      end
      object btnDelete: TToolButton
        Left = 311
        Top = 0
        Action = aDelete
        AutoSize = True
        Caption = #21024#38500
      end
    end
    object ToolBar2: TToolBar
      Left = 407
      Top = 2
      Width = 81
      Height = 37
      AutoSize = True
      ButtonHeight = 37
      Caption = 'ToolBar2'
      Color = clSilver
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      ParentColor = False
      TabOrder = 1
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 0
        Width = 80
        Height = 37
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alRight
        Flat = True
        Ctl3D = True
        Hints.Strings = (
          #31532#19968#24352#21333
          #19978#19968#24352#21333
          #19979#19968#24352#21333
          #26368#21518#19968#24352#21333
          ''
          ''
          ''
          ''
          ''
          #21047#26032)
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
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
      TabOrder = 2
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
        Action = aSave
      end
      object smnCancel: TMenuItem
        Action = aCancel
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object smnPreview: TMenuItem
        Action = aPreview
      end
      object smnPrint: TMenuItem
        Action = aPrint
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object smnExit: TMenuItem
        Action = aExit
      end
    end
    object smnEdit: TMenuItem
      Caption = #32534#36753'(&E)'
      GroupIndex = 1
      object smnNew: TMenuItem
        Action = aNew
      end
      object smnDel: TMenuItem
        Action = aDel
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object smnInsert: TMenuItem
        Action = aInsert
      end
      object smnDelete: TMenuItem
        Action = aDelete
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object O1: TMenuItem
        Action = aSetColumn
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object smnFirst: TMenuItem
        Action = aFirst
      end
      object smnPrior: TMenuItem
        Action = aPrior
      end
      object smnNext: TMenuItem
        Action = aNext
      end
      object smnLast: TMenuItem
        Action = aLast
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
    object pmnSave: TMenuItem
      Action = aSave
    end
    object pmnCancel: TMenuItem
      Action = aCancel
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object pmnNew: TMenuItem
      Action = aNew
    end
    object pmnDel: TMenuItem
      Action = aDel
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object pmnInsert: TMenuItem
      Action = aInsert
    end
    object pmnDelete: TMenuItem
      Action = aDelete
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object O2: TMenuItem
      Action = aSetColumn
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object pmnFirst: TMenuItem
      Action = aFirst
    end
    object pmnPrior: TMenuItem
      Action = aPrior
    end
    object pmnNext: TMenuItem
      Action = aNext
    end
    object pmnLast: TMenuItem
      Action = aLast
    end
  end
  object ActionList1: TActionList
    Images = frmMain.ilsSub
    Left = 84
    Top = 204
    object aSave: TAction
      Caption = #20445#23384'(&S)'
      ImageIndex = 10
      ShortCut = 16467
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #21462#28040'(&C)'
      ImageIndex = 14
      OnExecute = aCancelExecute
    end
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
    object aNew: TAction
      Caption = #24320#26032#21333'(&N)'
      ImageIndex = 11
      ShortCut = 16462
      OnExecute = aNewExecute
    end
    object aDel: TAction
      Caption = #25972#21333#21024#38500'(&D)'
      ImageIndex = 13
      ShortCut = 16452
      OnExecute = aDelExecute
    end
    object aInsert: TAction
      Caption = #22686#21152#39033#30446'(&A)'
      ImageIndex = 3
      ShortCut = 45
      OnExecute = aInsertExecute
    end
    object aDelete: TAction
      Caption = #21024#38500#39033#30446'(&E)'
      ImageIndex = 5
      ShortCut = 16430
      OnExecute = aDeleteExecute
    end
    object aSetColumn: TAction
      Caption = #26639#30446#24067#23616'(&O)'
      ImageIndex = 21
      ShortCut = 16463
      OnExecute = aSetColumnExecute
    end
    object aFirst: TAction
      Caption = #31532#19968#24352#21333'(&F)'
      ImageIndex = 17
      ShortCut = 16420
      OnExecute = aFirstExecute
    end
    object aPrior: TAction
      Caption = #19978#19968#24352#21333'(&P)'
      ImageIndex = 19
      ShortCut = 16422
      OnExecute = aPriorExecute
    end
    object aNext: TAction
      Caption = #19979#19968#24352#21333'(&X)'
      ImageIndex = 20
      ShortCut = 16424
      OnExecute = aNextExecute
    end
    object aLast: TAction
      Caption = #26368#21518#19968#24352#21333'(&L)'
      ImageIndex = 18
      ShortCut = 16419
      OnExecute = aLastExecute
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
