inherited frmWork_Log: TfrmWork_Log
  Left = 203
  Top = 150
  Height = 374
  Caption = 'frmWork_Log'
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBkGnd: TPanel
    Height = 340
    object Splitter1: TSplitter [0]
      Left = 153
      Top = 57
      Width = 6
      Height = 283
      Cursor = crHSplit
    end
    inherited ToolBar1: TToolBar
      inherited DN: TDBNavigator
        DataSource = DS
        Hints.Strings = ()
      end
      inherited ToolButton4: TToolButton
        OnClick = ToolButton4Click
      end
    end
    object TV: TTreeView
      Left = 0
      Top = 57
      Width = 153
      Height = 283
      Align = alLeft
      HideSelection = False
      Indent = 19
      ReadOnly = True
      ShowRoot = False
      TabOrder = 1
      OnChange = TVChange
    end
    object Panel1: TPanel
      Left = 159
      Top = 57
      Width = 403
      Height = 283
      Align = alClient
      ParentColor = True
      TabOrder = 2
      object Label1: TLabel
        Left = 16
        Top = 13
        Width = 26
        Height = 13
        Caption = #26085#26399
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 16
        Top = 38
        Width = 39
        Height = 13
        Caption = #24037#20316#21608
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 144
        Top = 37
        Width = 26
        Height = 13
        Caption = #22825#27668
      end
      object Label4: TLabel
        Left = 16
        Top = 64
        Width = 26
        Height = 13
        Caption = #20869#23481
        FocusControl = DBMemo1
      end
      object DBEdit1: TDBEdit
        Left = 56
        Top = 8
        Width = 185
        Height = 21
        DataField = 'LOG_DATE'
        DataSource = DS
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 56
        Top = 32
        Width = 82
        Height = 21
        Color = clInfoBk
        DataField = 'WEEK'
        DataSource = DS
        ReadOnly = True
        TabOrder = 1
      end
      object DBMemo1: TDBMemo
        Left = 56
        Top = 56
        Width = 337
        Height = 217
        DataField = 'DETAIL'
        DataSource = DS
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object DBComboBox1: TDBComboBox
        Left = 176
        Top = 32
        Width = 105
        Height = 21
        DataField = 'WEATHER'
        DataSource = DS
        ItemHeight = 13
        TabOrder = 2
      end
    end
  end
  object DS: TDataSource
    DataSet = DM.Q_Work_Log
    Left = 96
    Top = 80
  end
  object Q: TQuery
    DatabaseName = 'data'
    Left = 96
    Top = 128
  end
end
