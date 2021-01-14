inherited frmCome: TfrmCome
  Left = 90
  Top = 137
  HorzScrollBar.Range = 0
  VertScrollBar.Range = 0
  BorderStyle = bsSingle
  Caption = 'frmCome'
  ClientHeight = 374
  ClientWidth = 572
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBkGnd: TPanel
    Width = 572
    Height = 374
    object Label2: TLabel [0]
      Left = 200
      Top = 72
      Width = 52
      Height = 13
      Caption = #25253#21517#26085#26399
      FocusControl = DBEdit1
    end
    object Label3: TLabel [1]
      Left = 384
      Top = 72
      Width = 52
      Height = 13
      Caption = #22521#35757#31181#31867
    end
    object Label4: TLabel [2]
      Left = 200
      Top = 96
      Width = 26
      Height = 13
      Caption = #20215#26684
    end
    object Label5: TLabel [3]
      Left = 200
      Top = 144
      Width = 52
      Height = 13
      Caption = #22521#35757#35828#26126
    end
    object Label6: TLabel [4]
      Left = 384
      Top = 96
      Width = 26
      Height = 13
      Caption = #25240#25187
      FocusControl = DBEdit3
    end
    object Label7: TLabel [5]
      Left = 200
      Top = 120
      Width = 52
      Height = 13
      Caption = #23454#38469#25910#36153
      FocusControl = DBEdit4
    end
    object Label8: TLabel [6]
      Left = 384
      Top = 120
      Width = 52
      Height = 13
      Caption = #23398#21592#29366#24577
      FocusControl = DBLookupComboBox2
    end
    object Label9: TLabel [7]
      Left = 200
      Top = 216
      Width = 26
      Height = 13
      Caption = #35780#20215
      FocusControl = DBMemo2
    end
    inherited ToolBar1: TToolBar
      Width = 572
      TabOrder = 9
      inherited DN: TDBNavigator
        DataSource = DS1
        Hints.Strings = ()
      end
      inherited ToolButton4: TToolButton
        OnClick = ToolButton4Click
      end
    end
    object TPanel
      Left = 0
      Top = 57
      Width = 185
      Height = 317
      Align = alLeft
      ParentColor = True
      TabOrder = 8
      object Panel1: TPanel
        Left = 1
        Top = 1
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
        object DsFancyButton1: TDsFancyButton
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
          OnClick = DsFancyButton1Click
        end
        object Edit1: TEdit
          Left = 80
          Top = 35
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
      end
      object DBGrid1: TDBGrid
        Left = 1
        Top = 65
        Width = 183
        Height = 251
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
            FieldName = 'NAME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME_JP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SEX'
            Visible = True
          end>
      end
    end
    object DBEdit1: TDBEdit
      Left = 256
      Top = 64
      Width = 121
      Height = 21
      DataField = 'COME_DATE'
      DataSource = DS1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 256
      Top = 88
      Width = 121
      Height = 21
      Color = clInfoBk
      DataField = 'kind_price'
      DataSource = DS1
      ReadOnly = True
      TabOrder = 2
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 440
      Top = 64
      Width = 121
      Height = 21
      DataField = 'kind_mc'
      DataSource = DS1
      TabOrder = 1
    end
    object DBMemo1: TDBMemo
      Left = 256
      Top = 136
      Width = 305
      Height = 65
      Color = clInfoBk
      DataField = 'kind_detail'
      DataSource = DS1
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 6
    end
    object DBEdit3: TDBEdit
      Left = 440
      Top = 88
      Width = 49
      Height = 21
      DataField = 'ZK'
      DataSource = DS1
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 256
      Top = 112
      Width = 121
      Height = 21
      DataField = 'REAL_PRICE'
      DataSource = DS1
      TabOrder = 4
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 440
      Top = 112
      Width = 121
      Height = 21
      DataField = 'state_mc'
      DataSource = DS1
      TabOrder = 5
    end
    object DBMemo2: TDBMemo
      Left = 256
      Top = 208
      Width = 305
      Height = 65
      DataField = 'DETAIL'
      DataSource = DS1
      ScrollBars = ssVertical
      TabOrder = 7
    end
    object DBGrid2: TDBGrid
      Left = 192
      Top = 280
      Width = 369
      Height = 89
      DataSource = DS1
      FixedColor = 14935011
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 10
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COME_DATE'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kind_price'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZK'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REAL_PRICE'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kind_mc'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'state_mc'
          Width = 57
          Visible = True
        end>
    end
  end
  object DS: TDataSource
    DataSet = DM.Q_Px_Record
    Left = 120
    Top = 104
  end
  object DS1: TDataSource
    DataSet = DM.T_Px_Record
    Left = 152
    Top = 104
  end
end
