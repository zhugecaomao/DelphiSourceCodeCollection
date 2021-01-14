inherited frmSearchWorkLog: TfrmSearchWorkLog
  Left = 120
  Top = 160
  Width = 552
  Height = 366
  Caption = 'frmSearchWorkLog'
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBkGnd: TPanel
    Width = 544
    object Splitter1: TSplitter
      Left = 185
      Top = 0
      Width = 6
      Height = 337
      Cursor = crHSplit
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 337
      Align = alLeft
      Caption = 'Panel1'
      ParentColor = True
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 183
        Height = 335
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
            FieldName = 'bh_mc'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOG_DATE'
            Width = 80
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
          end>
      end
    end
    object Panel2: TPanel
      Left = 191
      Top = 0
      Width = 353
      Height = 337
      Align = alClient
      ParentColor = True
      TabOrder = 1
      object Label4: TLabel
        Left = 16
        Top = 104
        Width = 26
        Height = 13
        Caption = #22995#21517
      end
      object Label5: TLabel
        Left = 192
        Top = 104
        Width = 26
        Height = 13
        Caption = #26085#26399
        FocusControl = DBEdit2
      end
      object Label6: TLabel
        Left = 16
        Top = 128
        Width = 39
        Height = 13
        Caption = #24037#20316#21608
        FocusControl = DBEdit3
      end
      object Label7: TLabel
        Left = 192
        Top = 128
        Width = 26
        Height = 13
        Caption = #22825#27668
        FocusControl = DBEdit4
      end
      object Label8: TLabel
        Left = 16
        Top = 152
        Width = 26
        Height = 13
        Caption = #20869#23481
        FocusControl = DBMemo1
      end
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 351
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
          Width = 80
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
          Left = 96
          Top = 59
          Width = 80
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
          Left = 200
          Top = 59
          Width = 105
          Height = 25
          ButtonColor = clBtnFace
          Caption = #23384#20026#25991#26412
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
        Left = 64
        Top = 96
        Width = 81
        Height = 21
        DataField = 'bh_mc'
        DataSource = DS
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 224
        Top = 96
        Width = 121
        Height = 21
        DataField = 'LOG_DATE'
        DataSource = DS
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 64
        Top = 120
        Width = 82
        Height = 21
        DataField = 'WEEK'
        DataSource = DS
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 224
        Top = 120
        Width = 57
        Height = 21
        DataField = 'WEATHER'
        DataSource = DS
        ReadOnly = True
        TabOrder = 4
      end
      object DBMemo1: TDBMemo
        Left = 64
        Top = 144
        Width = 281
        Height = 177
        DataField = 'DETAIL'
        DataSource = DS
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 5
      end
    end
  end
  object DS: TDataSource
    DataSet = DM.Q_Work_Log
    Left = 80
    Top = 104
  end
  object SD: TSaveDialog
    DefaultExt = 'txt'
    Filter = #25991#26412#25991#20214'(*.txt)|*.txt'
    Left = 352
    Top = 96
  end
end
