object postedit: Tpostedit
  Left = 214
  Top = 254
  BorderStyle = bsDialog
  Caption = #32844#20301#31867#22411
  ClientHeight = 263
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 249
    Height = 249
    Caption = #32844#20301#21015#34920
    TabOrder = 0
    object dxDBTreeView1: TdxDBTreeView
      Left = 16
      Top = 24
      Width = 217
      Height = 209
      ShowNodeHint = True
      DataSource = DataSource1
      DisplayField = 'postname'
      KeyField = 'id'
      ListField = 'postname'
      ParentField = 'tid'
      SeparatedSt = ' - '
      RaiseOnError = True
      ReadOnly = True
      Indent = 19
      ParentColor = False
      Options = [trDBCanDelete, trDBConfirmDelete, trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
      SelectedIndex = -1
      TabOrder = 0
      OnDblClick = dxDBTreeView1DblClick
    end
  end
  object Button1: TButton
    Left = 264
    Top = 112
    Width = 75
    Height = 25
    Cancel = True
    Caption = #20851#38381
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 264
    Top = 80
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 264
    Top = 16
    Width = 75
    Height = 25
    Caption = #22686#21152#21516#32423
    Default = True
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 264
    Top = 48
    Width = 75
    Height = 25
    Caption = #22686#21152#19979#23646
    TabOrder = 4
    OnClick = Button4Click
  end
  object ADOTable1: TADOTable
    Connection = Main.ADOconn
    AfterInsert = ADOTable1AfterInsert
    IndexName = 'id'
    TableName = 'r_staffpost'
    Left = 80
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 136
    Top = 80
  end
end
