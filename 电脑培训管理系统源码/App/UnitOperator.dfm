inherited frmOperator: TfrmOperator
  Left = 157
  Top = 131
  Height = 404
  Caption = 'frmOperator'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBkGnd: TPanel
    Height = 370
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
      Width = 562
      Height = 160
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 65
        Height = 13
        Caption = #25805#20316#21592#32534#21495
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 16
        Top = 40
        Width = 39
        Height = 13
        Caption = #25805#20316#21592
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 16
        Top = 64
        Width = 26
        Height = 13
        Caption = #23494#30721
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 16
        Top = 132
        Width = 26
        Height = 13
        Caption = #26631#24535
        FocusControl = DBLookupComboBox1
      end
      object Label5: TLabel
        Left = 200
        Top = 133
        Width = 52
        Height = 13
        Caption = #23545#24212#21592#24037
      end
      object DBEdit1: TDBEdit
        Left = 88
        Top = 8
        Width = 134
        Height = 21
        DataField = 'OPERATOR_BH'
        DataSource = DS
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 88
        Top = 32
        Width = 264
        Height = 21
        DataField = 'OPERATOR_MC'
        DataSource = DS
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 88
        Top = 56
        Width = 134
        Height = 21
        DataField = 'PASSWD'
        DataSource = DS
        PasswordChar = '#'
        TabOrder = 2
      end
      object CheckBox1: TCheckBox
        Left = 24
        Top = 88
        Width = 97
        Height = 17
        Caption = 'CheckBox1'
        TabOrder = 3
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 112
        Top = 88
        Width = 97
        Height = 17
        Caption = 'CheckBox2'
        TabOrder = 4
        OnClick = CheckBox1Click
      end
      object CheckBox3: TCheckBox
        Left = 216
        Top = 88
        Width = 97
        Height = 17
        Caption = 'CheckBox3'
        TabOrder = 5
        OnClick = CheckBox1Click
      end
      object CheckBox4: TCheckBox
        Left = 320
        Top = 88
        Width = 97
        Height = 17
        Caption = 'CheckBox4'
        TabOrder = 6
        OnClick = CheckBox1Click
      end
      object CheckBox5: TCheckBox
        Left = 424
        Top = 88
        Width = 97
        Height = 17
        Caption = 'CheckBox5'
        TabOrder = 7
        OnClick = CheckBox1Click
      end
      object CheckBox6: TCheckBox
        Left = 24
        Top = 104
        Width = 97
        Height = 17
        Caption = 'CheckBox1'
        TabOrder = 8
        OnClick = CheckBox1Click
      end
      object CheckBox7: TCheckBox
        Left = 112
        Top = 104
        Width = 97
        Height = 17
        Caption = 'CheckBox2'
        TabOrder = 9
        OnClick = CheckBox1Click
      end
      object CheckBox8: TCheckBox
        Left = 216
        Top = 104
        Width = 97
        Height = 17
        Caption = 'CheckBox3'
        TabOrder = 10
        OnClick = CheckBox1Click
      end
      object CheckBox9: TCheckBox
        Left = 320
        Top = 104
        Width = 97
        Height = 17
        Caption = 'CheckBox4'
        TabOrder = 11
        OnClick = CheckBox1Click
      end
      object CheckBox10: TCheckBox
        Left = 424
        Top = 104
        Width = 97
        Height = 17
        Caption = 'CheckBox5'
        TabOrder = 12
        OnClick = CheckBox1Click
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 48
        Top = 128
        Width = 144
        Height = 21
        DataField = 'flag_mc'
        DataSource = DS
        TabOrder = 13
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 256
        Top = 131
        Width = 121
        Height = 21
        DataField = 'bh_mc'
        DataSource = DS
        TabOrder = 14
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 217
      Width = 562
      Height = 153
      Align = alClient
      DataSource = DS
      FixedColor = 14935011
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'OPERATOR_BH'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OPERATOR_MC'
          Width = 189
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'WARRANT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'flag_mc'
          Visible = True
        end>
    end
  end
  object DS: TDataSource
    DataSet = DM.T_Operator
    Left = 224
    Top = 64
  end
end
