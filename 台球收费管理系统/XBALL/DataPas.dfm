object DataForm: TDataForm
  Left = 151
  Top = 134
  Width = 544
  Height = 375
  Caption = #25968#25454#24211#36716#25442#31383#21475
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    536
    348)
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 11
    Top = 300
    Width = 84
    Height = 12
    Anchors = [akLeft, akBottom]
    Caption = #28304#25968#25454#24211#20301#32622#65306
  end
  object Button1: TButton
    Left = 450
    Top = 48
    Width = 75
    Height = 23
    Anchors = [akTop, akRight]
    Caption = #23089#20048#39033#30446
    TabOrder = 1
    OnClick = GetDBName
  end
  object Button2: TButton
    Tag = 1
    Left = 450
    Top = 80
    Width = 75
    Height = 23
    Anchors = [akTop, akRight]
    Caption = #23089#20048#26126#32454
    TabOrder = 2
    OnClick = GetDBName
  end
  object Button3: TButton
    Tag = 3
    Left = 450
    Top = 144
    Width = 75
    Height = 23
    Anchors = [akTop, akRight]
    Caption = #25130#38047#25968#25454
    TabOrder = 4
    OnClick = GetDBName
  end
  object Button4: TButton
    Tag = 4
    Left = 450
    Top = 176
    Width = 75
    Height = 23
    Anchors = [akTop, akRight]
    Caption = #37202#27700#21333#20215
    TabOrder = 5
    OnClick = GetDBName
  end
  object DBGrid1: TDBGrid
    Left = 12
    Top = 16
    Width = 200
    Height = 265
    Anchors = [akLeft, akTop, akBottom]
    DataSource = DataSource1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnEnter = DBGrid1Enter
  end
  object DBGrid2: TDBGrid
    Left = 220
    Top = 16
    Width = 216
    Height = 265
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnEnter = DBGrid1Enter
  end
  object Edit1: TEdit
    Left = 96
    Top = 296
    Width = 313
    Height = 20
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 9
    Text = 'C:\PlayBall'
  end
  object SB: TStatusBar
    Left = 0
    Top = 329
    Width = 536
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Alignment = taCenter
        Width = 50
      end>
  end
  object Button5: TButton
    Left = 450
    Top = 256
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #36716#25442'(&S)'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 450
    Top = 16
    Width = 75
    Height = 23
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = #36864#20986'(&X)'
    TabOrder = 0
    OnClick = CloseForm
  end
  object Button7: TButton
    Tag = 2
    Left = 450
    Top = 112
    Width = 75
    Height = 23
    Anchors = [akTop, akRight]
    Caption = #37202#27700#26126#32454
    TabOrder = 3
    OnClick = GetDBName
  end
  object Button8: TButton
    Left = 450
    Top = 222
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #28165#31354'(&E)'
    TabOrder = 12
    OnClick = Button8Click
  end
  object CheckBox1: TCheckBox
    Left = 452
    Top = 298
    Width = 67
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #30830#35748#25805#20316
    TabOrder = 11
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 312
    Top = 72
  end
  object Table1: TTable
    Left = 280
    Top = 72
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 312
    Top = 128
  end
  object Table2: TTable
    Left = 280
    Top = 128
  end
end
