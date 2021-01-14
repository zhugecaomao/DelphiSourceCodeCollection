inherited frmSearchAdvice: TfrmSearchAdvice
  Left = 129
  Top = 84
  Width = 571
  Height = 477
  Caption = 'frmSearchAdvice'
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBkGnd: TPanel
    Width = 563
    Height = 443
    object Splitter1: TSplitter
      Left = 185
      Top = 0
      Width = 6
      Height = 443
      Cursor = crHSplit
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 443
      Align = alLeft
      Caption = 'Panel1'
      ParentColor = True
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 183
        Height = 441
        Align = alClient
        DataSource = DS
        FixedColor = 14935011
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
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
    object Panel2: TPanel
      Left = 191
      Top = 0
      Width = 372
      Height = 443
      Align = alClient
      ParentColor = True
      TabOrder = 1
      object Label4: TLabel
        Left = 16
        Top = 112
        Width = 26
        Height = 13
        Caption = #22995#21517
        FocusControl = DBEdit1
      end
      object Label5: TLabel
        Left = 192
        Top = 112
        Width = 26
        Height = 13
        Caption = #31616#25340
        FocusControl = DBEdit2
      end
      object Label6: TLabel
        Left = 16
        Top = 136
        Width = 26
        Height = 13
        Caption = #26085#26399
        FocusControl = DBEdit3
      end
      object Label7: TLabel
        Left = 192
        Top = 136
        Width = 39
        Height = 13
        Caption = #24037#20316#21608
        FocusControl = DBEdit4
      end
      object Label8: TLabel
        Left = 16
        Top = 160
        Width = 26
        Height = 13
        Caption = #22825#27668
      end
      object Label9: TLabel
        Left = 16
        Top = 184
        Width = 26
        Height = 13
        Caption = #31867#22411
      end
      object Label10: TLabel
        Left = 16
        Top = 208
        Width = 39
        Height = 13
        Caption = #20851#38190#23383
        FocusControl = DBEdit7
      end
      object Label11: TLabel
        Left = 32
        Top = 248
        Width = 13
        Height = 65
        Caption = #38382#13#10#39064#13#10#21450#13#10#24847#13#10#35265
        FocusControl = DBMemo1
      end
      object Label12: TLabel
        Left = 32
        Top = 384
        Width = 13
        Height = 26
        Caption = #35299#13#10#31572
        FocusControl = DBMemo2
      end
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 370
        Height = 89
        Align = alTop
        ParentColor = True
        TabOrder = 0
        object Label2: TLabel
          Left = 24
          Top = 36
          Width = 39
          Height = 13
          Caption = #26085#26399#65306
        end
        object Label3: TLabel
          Left = 176
          Top = 36
          Width = 13
          Height = 13
          Caption = #21040
        end
        object btnReset: TDsFancyButton
          Left = 8
          Top = 59
          Width = 73
          Height = 25
          ButtonColor = clBtnFace
          Caption = #22797#20301
          FrameColor = clGray
          FrameWidth = 6
          CornerRadius = 10
          TextStyle = txRaised
          OnClick = btnResetClick
        end
        object btnSearch: TDsFancyButton
          Left = 88
          Top = 59
          Width = 73
          Height = 25
          ButtonColor = clBtnFace
          Caption = #26597#35810
          FrameColor = clGray
          FrameWidth = 6
          CornerRadius = 10
          TextStyle = txRaised
          OnClick = btnSearchClick
        end
        object btnSaveAs: TDsFancyButton
          Left = 256
          Top = 59
          Width = 89
          Height = 25
          ButtonColor = clBtnFace
          Caption = #21478#23384#20026'...'
          FrameColor = clGray
          FrameWidth = 6
          CornerRadius = 10
          TextStyle = txRaised
          OnClick = btnSaveAsClick
        end
        object Label1: TLabel
          Left = 24
          Top = 13
          Width = 39
          Height = 13
          Caption = #22995#21517#65306
        end
        object btnGraph: TDsFancyButton
          Left = 176
          Top = 59
          Width = 73
          Height = 25
          ButtonColor = clBtnFace
          Caption = #22270#34920
          FrameColor = clGray
          FrameWidth = 6
          CornerRadius = 10
          TextStyle = txRaised
          OnClick = btnGraphClick
        end
        object CheckBox1: TCheckBox
          Left = 8
          Top = 14
          Width = 15
          Height = 14
          Caption = '        '
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = CheckBox1Click
        end
        object ComboBox1: TComboBox
          Left = 64
          Top = 8
          Width = 105
          Height = 21
          ItemHeight = 13
          TabOrder = 0
        end
        object DateTimePicker1: TDateTimePicker
          Left = 64
          Top = 32
          Width = 105
          Height = 21
          CalAlignment = dtaLeft
          Date = 37543.8217508218
          Time = 37543.8217508218
          DateFormat = dfShort
          DateMode = dmComboBox
          Enabled = False
          Kind = dtkDate
          ParseInput = False
          TabOrder = 1
        end
        object DateTimePicker2: TDateTimePicker
          Left = 200
          Top = 32
          Width = 105
          Height = 21
          CalAlignment = dtaLeft
          Date = 37543.8217508218
          Time = 37543.8217508218
          DateFormat = dfShort
          DateMode = dmComboBox
          Enabled = False
          Kind = dtkDate
          ParseInput = False
          TabOrder = 2
        end
        object CheckBox2: TCheckBox
          Left = 8
          Top = 35
          Width = 17
          Height = 16
          Caption = '             '
          TabOrder = 4
          OnClick = CheckBox2Click
        end
      end
      object DBEdit1: TDBEdit
        Left = 56
        Top = 104
        Width = 129
        Height = 21
        DataField = 'XM'
        DataSource = DS
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 232
        Top = 104
        Width = 89
        Height = 21
        DataField = 'XM_JP'
        DataSource = DS
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 56
        Top = 128
        Width = 129
        Height = 21
        DataField = 'ADVICE_DATE'
        DataSource = DS
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 232
        Top = 128
        Width = 89
        Height = 21
        DataField = 'WEEK'
        DataSource = DS
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit7: TDBEdit
        Left = 56
        Top = 200
        Width = 305
        Height = 21
        DataField = 'ADVICE_KEY'
        DataSource = DS
        ReadOnly = True
        TabOrder = 5
      end
      object DBMemo1: TDBMemo
        Left = 56
        Top = 224
        Width = 305
        Height = 113
        DataField = 'DETAIL'
        DataSource = DS
        ReadOnly = True
        TabOrder = 6
      end
      object DBMemo2: TDBMemo
        Left = 56
        Top = 344
        Width = 305
        Height = 89
        DataField = 'ANSWER'
        DataSource = DS
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit5: TDBEdit
        Left = 56
        Top = 152
        Width = 129
        Height = 21
        DataField = 'WEATHER'
        DataSource = DS
        ReadOnly = True
        TabOrder = 8
      end
      object DBEdit6: TDBEdit
        Left = 56
        Top = 176
        Width = 129
        Height = 21
        DataField = 'ADVICE_TYPE'
        DataSource = DS
        ReadOnly = True
        TabOrder = 9
      end
    end
  end
  object DS: TDataSource
    DataSet = DM.Q_Advice
    Left = 80
    Top = 104
  end
  object SD: TSaveDialog
    DefaultExt = 'txt'
    Filter = #25991#26412#25991#20214'(*.txt)|*.txt'
    Left = 376
    Top = 8
  end
  object Q1: TQuery
    Active = True
    DatabaseName = 'data'
    SQL.Strings = (
      'SELECT XM,COUNT(XM),COUNT(XM)'
      'FROM T_ADVICE T_advice GROUP BY XM')
    Left = 88
    Top = 184
    object Q1XM: TStringField
      FieldName = 'XM'
      Origin = 'DATA.T_ADVICE.XM'
      Size = 10
    end
    object Q1COUNT: TIntegerField
      FieldName = 'COUNT'
      Origin = 'DATA.T_ADVICE.XM'
    end
  end
  object Q3: TQuery
    Active = True
    DatabaseName = 'data'
    SQL.Strings = (
      'SELECT ADVICE_TYPE,COUNT(ADVICE_TYPE)'
      'FROM T_ADVICE T_advice GROUP BY ADVICE_TYPE')
    Left = 88
    Top = 296
    object Q3ADVICE_TYPE: TStringField
      FieldName = 'ADVICE_TYPE'
      Origin = 'DATA.T_ADVICE.ADVICE_TYPE'
      Size = 30
    end
    object Q3COUNT: TIntegerField
      FieldName = 'COUNT'
      Origin = 'DATA.T_ADVICE.ADVICE_TYPE'
    end
  end
  object Q2: TQuery
    Active = True
    DatabaseName = 'data'
    SQL.Strings = (
      'SELECT ADVICE_DATE,COUNT(ADVICE_DATE)'
      'FROM T_ADVICE T_advice GROUP BY ADVICE_DATE')
    Left = 88
    Top = 240
    object Q2ADVICE_DATE: TDateTimeField
      FieldName = 'ADVICE_DATE'
      Origin = 'DATA.T_ADVICE.ADVICE_DATE'
    end
    object Q2COUNT: TIntegerField
      FieldName = 'COUNT'
      Origin = 'DATA.T_ADVICE.ADVICE_DATE'
    end
  end
end
