object chartbm: Tchartbm
  Left = 214
  Top = 152
  Width = 708
  Height = 494
  Caption = #37096#38376#35774#32622
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object DBTree: TdxDbOrgChart
    Left = 0
    Top = 30
    Width = 700
    Height = 399
    DataSource = DataSource1
    KeyFieldName = 'id'
    ParentFieldName = 'pid'
    TextFieldName = 'branchname'
    ImageFieldName = 'image'
    DefaultNodeWidth = 90
    DefaultNodeHeight = 70
    Options = [ocSelect, ocFocus, ocButtons, ocDblClick, ocEdit, ocCanDrag, ocShowDrag, ocInsDel, ocRect3D, ocAnimate]
    EditMode = [emLeft, emCenter, emRight, emVCenter, emWrap, emUpper, emLower, emGrow]
    Images = Main.Branchimage
    DefaultImageAlign = iaLT
    OnCreateNode = dxDbOrgChart1CreateNode
    OnChange = DBTreeChange
    OnChanging = DBTreeChanging
    Align = alClient
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    OnClick = DBTreeClick
    OnDragOver = DBTreeDragOver
    PopupMenu = PopupMenu1
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 429
    Width = 700
    Height = 19
    Panels = <
      item
        Text = #23601#32490
        Width = 50
      end>
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 700
    Height = 30
    Align = alTop
    DockSite = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object ToolBar1: TToolBar
      Left = 11
      Top = 2
      Width = 102
      Height = 22
      Caption = 'ToolBar1'
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = Main.ImageList1
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Hint = #26032#24314#37096#38376
        Caption = 'ToolButton1'
        ImageIndex = 224
        OnClick = N9Click
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Hint = #26032#24314#19979#23646#37096#38376
        Caption = 'ToolButton2'
        ImageIndex = 225
        OnClick = N10Click
      end
      object ToolButton3: TToolButton
        Left = 46
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 54
        Top = 0
        Hint = #21024#38500
        Caption = 'ToolButton4'
        ImageIndex = 73
        OnClick = N16Click
      end
      object ToolButton5: TToolButton
        Left = 77
        Top = 0
        Hint = #26356#25913#22270#26631
        Caption = 'ToolButton5'
        ImageIndex = 12
        ParentShowHint = False
        ShowHint = True
        OnClick = N15Click
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Main.branch
    Left = 144
    Top = 72
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 72
    object N6: TMenuItem
      Caption = #22686#21152#21516#32423#37096#38376'...'
      OnClick = N9Click
    end
    object N7: TMenuItem
      Caption = #22686#21152#19979#23646#37096#38376'...'
      OnClick = N10Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #21024#38500'...'
      OnClick = N16Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #26356#25913#21517#31216'...'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #26356#25913#22270#26631'...'
      OnClick = N15Click
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 224
    Top = 104
  end
  object MainMenu1: TMainMenu
    Left = 48
    Top = 64
    object N8: TMenuItem
      Caption = #22522#26412
      object N9: TMenuItem
        Caption = #26032#24314#21516#32423#37096#38376'...'
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = #26032#24314#19979#23646#37096#38376'...'
        OnClick = N10Click
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object N29: TMenuItem
        Caption = #25171#21360#39044#35272
        OnClick = N29Click
      end
      object N28: TMenuItem
        Caption = '-'
      end
      object N13: TMenuItem
        Caption = #36864#20986
        OnClick = N13Click
      end
    end
    object N12: TMenuItem
      Caption = #32534#36753
      object N16: TMenuItem
        Caption = #21024#38500'...'
        ShortCut = 46
        OnClick = N16Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object N14: TMenuItem
        Caption = #32534#36753'...'
        OnClick = N14Click
      end
      object N15: TMenuItem
        Caption = #22270#26631'...'
        OnClick = N15Click
      end
      object N26: TMenuItem
        Caption = #32972#26223#33394'...'
        OnClick = N26Click
      end
    end
    object N24: TMenuItem
      Caption = #25968#25454
      object N25: TMenuItem
        Caption = #32479#35745'...'
        OnClick = N25Click
      end
    end
    object N18: TMenuItem
      Caption = #35270#22270
      object N19: TMenuItem
        Caption = #36866#21512#31383#21475'...'
        OnClick = N19Click
      end
      object N20: TMenuItem
        Caption = #21160#30011#25928#26524'...'
        Checked = True
        OnClick = N20Click
      end
      object N3D1: TMenuItem
        Caption = '3D'#25928#26524'...'
        Checked = True
        OnClick = N3D1Click
      end
      object N27: TMenuItem
        Caption = #23621#24038'...'
        OnClick = N27Click
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object N22: TMenuItem
        Caption = #20840#37096#23637#24320'...'
        OnClick = N22Click
      end
      object N23: TMenuItem
        Caption = #20840#37096#25910#32553'...'
        OnClick = N23Click
      end
    end
  end
  object ColorDialog1: TColorDialog
    Left = 280
    Top = 96
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link2
    PreviewOptions.Caption = #25171#21360#39044#35272
    PreviewOptions.VisibleOptions = [pvoPrint]
    PreviewOptions.WindowState = wsMaximized
    PreviewOptions.PreviewBoundsRect = {000000000000000000050000C4030000}
    Version = 0
    Left = 93
    Top = 187
    object dxComponentPrinter1Link2: TdxDBOrgChartReportLink
      Caption = 'dxComponentPrinter1Link2'
      Component = DBTree
      DesignerHelpContext = 0
      PrinterPage.Background.Brush.Style = bsClear
      PrinterPage.Footer = 6350
      PrinterPage.Header = 2692
      PrinterPage.Margins.Bottom = 25400
      PrinterPage.Margins.Left = 25400
      PrinterPage.Margins.Right = 25400
      PrinterPage.Margins.Top = 10008
      PrinterPage.MinMargins.Bottom = 0
      PrinterPage.MinMargins.Left = 0
      PrinterPage.MinMargins.Right = 0
      PrinterPage.MinMargins.Top = 0
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clWindowText
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Tahoma'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clWindowText
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportTitle.Font.Charset = DEFAULT_CHARSET
      ReportTitle.Font.Color = clWindowText
      ReportTitle.Font.Height = -19
      ReportTitle.Font.Name = 'Times New Roman'
      ReportTitle.Font.Style = [fsBold]
      Color = clWindow
      FullExpand = True
      BuiltInReportLink = True
    end
  end
end
