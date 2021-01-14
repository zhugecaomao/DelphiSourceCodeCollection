inherited frmViewDataBase: TfrmViewDataBase
  Left = 92
  Top = 90
  Caption = ''
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar [0]
    Left = 0
    Top = 0
    Width = 688
    Height = 74
    AutoSize = True
    ButtonHeight = 36
    ButtonWidth = 68
    Caption = 'ToolBar1'
    Flat = True
    Images = ImageList
    ShowCaptions = True
    TabOrder = 0
    object tbNew: TToolButton
      Left = 0
      Top = 0
      Action = atNew
      Caption = #28155#21152'(F2)'
    end
    object tbEdit: TToolButton
      Left = 68
      Top = 0
      Action = atEdit
      Caption = #20462#25913'(F3)'
    end
    object tbSave: TToolButton
      Left = 136
      Top = 0
      Action = atSave
      Caption = #20445#23384'(F9)'
    end
    object tbDel: TToolButton
      Left = 204
      Top = 0
      Action = atDel
      Caption = #21024#38500'(F4)'
    end
    object tbFindData: TToolButton
      Left = 272
      Top = 0
      Action = atFindData
      Caption = #26597#25214'(F5)'
    end
    object ToolButton1: TToolButton
      Left = 340
      Top = 0
      Action = atPreview
      Caption = #39044#35272'(F6)'
      Wrap = True
    end
    object ToolButton2: TToolButton
      Left = 0
      Top = 36
      Action = atPrint
      Caption = #25171#21360'(F7)'
    end
    object tbConfirm: TToolButton
      Left = 68
      Top = 36
      Action = atConfirm
    end
    object tbExport: TToolButton
      Left = 136
      Top = 36
      Action = atExport
    end
    object tbCancel: TToolButton
      Left = 204
      Top = 36
      Action = atCancel
      Caption = #21462#28040'(F11)'
    end
    object ToolButton6: TToolButton
      Left = 272
      Top = 36
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 64
      Style = tbsSeparator
    end
    object tbExit: TToolButton
      Left = 280
      Top = 36
      Action = atExit
      Caption = #36864#20986'(F12)'
    end
  end
  object grdList: TdxDBGrid [1]
    Left = 0
    Top = 74
    Width = 688
    Height = 379
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    TabOrder = 1
    DataSource = Viewd
    Filter.Criteria = {00000000}
    HeaderColor = 4227327
    LookAndFeel = lfFlat
  end
  object ActionList1: TActionList
    Images = ImageList
    Left = 308
    Top = 224
    object atNew: TAction
      Caption = #28155#21152
      Hint = #28155#21152
      ImageIndex = 34
      OnExecute = atNewExecute
    end
    object atEdit: TAction
      Caption = #20462#25913
      Hint = #20462#25913
      ImageIndex = 79
      OnExecute = atEditExecute
    end
    object atSave: TAction
      Caption = #20445#23384
      Hint = #20445#23384
      ImageIndex = 88
      OnExecute = atSaveExecute
    end
    object atDel: TAction
      Caption = #21024#38500
      Hint = #21024#38500
      ImageIndex = 157
      OnExecute = atDelExecute
    end
    object atCancel: TAction
      Caption = #21462#28040
      Hint = #21462#28040
      ImageIndex = 63
      OnExecute = atCancelExecute
    end
    object atFindData: TAction
      Caption = #26597#25214#25968#25454
      Hint = #26597#25214#25968#25454
      ImageIndex = 85
      OnExecute = atFindDataExecute
    end
    object atConfirm: TAction
      Caption = #30830#23450#36873#25321
      Hint = #30830#23450#36873#25321
      ImageIndex = 92
    end
    object atExport: TAction
      Caption = #23548#20986#25968#25454
      ImageIndex = 91
      OnExecute = atExportExecute
    end
    object atExit: TAction
      Caption = #36864#20986
      Hint = #36864#20986
      ImageIndex = 144
      OnExecute = atExitExecute
    end
    object atPreview: TAction
      Caption = 'atPreview'
      ImageIndex = 128
    end
    object atPrint: TAction
      Caption = 'atPrint'
      ImageIndex = 129
    end
  end
  object Viewd: TDataSource
    DataSet = Viewq
    Left = 224
    Top = 212
  end
  object Viewq: TCSADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ' ')
    Left = 224
    Top = 184
  end
  object grdPrint: TdxComponentPrinter
    PreviewOptions.PreviewBoundsRect = {000000000000000000040000E2020000}
    Version = 0
    Left = 252
    Top = 184
  end
end
