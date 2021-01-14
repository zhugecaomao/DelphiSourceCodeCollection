inherited frmAdvice: TfrmAdvice
  Left = 119
  Top = 96
  Height = 448
  Caption = 'frmAdvice'
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBkGnd: TPanel
    Height = 414
    object Splitter1: TSplitter [0]
      Left = 193
      Top = 57
      Width = 8
      Height = 357
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
    object Panel1: TPanel
      Left = 0
      Top = 57
      Width = 193
      Height = 357
      Align = alLeft
      ParentColor = True
      TabOrder = 1
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 191
        Height = 355
        ActivePage = TabSheet1
        Align = alClient
        TabIndex = 0
        TabOrder = 0
        OnChange = PageControl1Change
        object TabSheet1: TTabSheet
          Caption = #24120#35268
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 183
            Height = 64
            Align = alTop
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object Label1: TLabel
              Left = 8
              Top = 39
              Width = 78
              Height = 13
              Caption = #21517#31216#25110#31616#25340#65306
            end
            object btnFind: TDsFancyButton
              Left = 96
              Top = 7
              Width = 73
              Height = 25
              ButtonColor = clBtnFace
              Caption = #26597#25214'(&F)'
              FrameColor = clGray
              FrameWidth = 6
              CornerRadius = 10
              TextStyle = txRaised
              OnClick = btnFindClick
            end
            object btnReset: TDsFancyButton
              Left = 16
              Top = 7
              Width = 73
              Height = 25
              ButtonColor = clBtnFace
              Caption = #22797#20301'(&R)'
              FrameColor = clGray
              FrameWidth = 6
              CornerRadius = 10
              TextStyle = txRaised
              OnClick = btnResetClick
            end
            object Edit1: TEdit
              Left = 80
              Top = 35
              Width = 97
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 0
              OnChange = Edit1Change
            end
          end
          object DBGrid1: TDBGrid
            Left = 0
            Top = 64
            Width = 183
            Height = 263
            Align = alClient
            DataSource = DS
            FixedColor = 14935011
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 1
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'XM'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'XM_JP'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ADVICE_DATE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WEEK'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WEATHER'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ADVICE_TYPE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ADVICE_KEY'
                Visible = True
              end>
          end
        end
        object TabSheet2: TTabSheet
          Caption = #26641#22411#32467#26500
          ImageIndex = 1
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 183
            Height = 64
            Align = alTop
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object r_Type: TRadioButton
              Left = 8
              Top = 24
              Width = 57
              Height = 17
              Caption = #31867#22411
              TabOrder = 0
              OnClick = r_TypeClick
            end
            object r_Date: TRadioButton
              Left = 8
              Top = 8
              Width = 65
              Height = 17
              Caption = #26085#26399
              Checked = True
              TabOrder = 1
              TabStop = True
              OnClick = r_DateClick
            end
            object r_Xm: TRadioButton
              Left = 8
              Top = 40
              Width = 65
              Height = 17
              Caption = #22995#21517
              TabOrder = 2
              OnClick = r_XmClick
            end
          end
          object TV: TTreeView
            Left = 0
            Top = 64
            Width = 183
            Height = 263
            Align = alClient
            Indent = 19
            ReadOnly = True
            TabOrder = 1
            OnChange = TVChange
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 201
      Top = 57
      Width = 361
      Height = 357
      Align = alClient
      ParentColor = True
      TabOrder = 2
      object Label2: TLabel
        Left = 8
        Top = 24
        Width = 26
        Height = 13
        Caption = #22995#21517
        FocusControl = DBEdit1
      end
      object Label3: TLabel
        Left = 184
        Top = 24
        Width = 26
        Height = 13
        Caption = #31616#25340
        FocusControl = DBEdit2
      end
      object Label4: TLabel
        Left = 8
        Top = 48
        Width = 26
        Height = 13
        Caption = #26085#26399
        FocusControl = DBEdit3
      end
      object Label5: TLabel
        Left = 184
        Top = 48
        Width = 39
        Height = 13
        Caption = #24037#20316#21608
        FocusControl = DBEdit4
      end
      object Label6: TLabel
        Left = 8
        Top = 72
        Width = 26
        Height = 13
        Caption = #22825#27668
      end
      object Label7: TLabel
        Left = 8
        Top = 96
        Width = 26
        Height = 13
        Caption = #31867#22411
      end
      object Label8: TLabel
        Left = 8
        Top = 120
        Width = 39
        Height = 13
        Caption = #20851#38190#23383
        FocusControl = DBEdit7
      end
      object Label9: TLabel
        Left = 24
        Top = 160
        Width = 13
        Height = 65
        Caption = #38382#13#10#39064#13#10#21450#13#10#24847#13#10#35265
        FocusControl = DBMemo1
      end
      object Label10: TLabel
        Left = 24
        Top = 296
        Width = 13
        Height = 26
        Caption = #35299#13#10#31572
        FocusControl = DBMemo2
      end
      object DBEdit1: TDBEdit
        Left = 48
        Top = 16
        Width = 129
        Height = 21
        DataField = 'XM'
        DataSource = DS
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 224
        Top = 16
        Width = 89
        Height = 21
        Color = clInfoBk
        DataField = 'XM_JP'
        DataSource = DS
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 48
        Top = 40
        Width = 129
        Height = 21
        DataField = 'ADVICE_DATE'
        DataSource = DS
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 224
        Top = 40
        Width = 89
        Height = 21
        Color = clInfoBk
        DataField = 'WEEK'
        DataSource = DS
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit7: TDBEdit
        Left = 48
        Top = 112
        Width = 305
        Height = 21
        DataField = 'ADVICE_KEY'
        DataSource = DS
        TabOrder = 5
      end
      object DBMemo1: TDBMemo
        Left = 48
        Top = 136
        Width = 305
        Height = 113
        DataField = 'DETAIL'
        DataSource = DS
        TabOrder = 6
      end
      object DBMemo2: TDBMemo
        Left = 48
        Top = 256
        Width = 305
        Height = 89
        DataField = 'ANSWER'
        DataSource = DS
        TabOrder = 7
      end
      object DBComboBox1: TDBComboBox
        Left = 48
        Top = 88
        Width = 265
        Height = 21
        DataField = 'ADVICE_TYPE'
        DataSource = DS
        ItemHeight = 13
        TabOrder = 8
      end
      object DBComboBox2: TDBComboBox
        Left = 48
        Top = 64
        Width = 130
        Height = 21
        DataField = 'WEATHER'
        DataSource = DS
        ItemHeight = 13
        TabOrder = 4
      end
    end
  end
  object DS: TDataSource
    DataSet = DM.Q_Advice
    Left = 136
    Top = 40
  end
  object Q: TQuery
    DatabaseName = 'data'
    Left = 112
    Top = 200
  end
  object Q1: TQuery
    DatabaseName = 'data'
    Left = 112
    Top = 248
  end
end
