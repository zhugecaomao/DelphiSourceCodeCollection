object changepost: Tchangepost
  Left = 324
  Top = 142
  BorderStyle = bsDialog
  Caption = #32844#20301#21464#21160
  ClientHeight = 336
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 273
    Height = 105
    Caption = #20449#24687
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 32
      Width = 36
      Height = 12
      Caption = #26032#32844#20301
    end
    object Label2: TLabel
      Left = 20
      Top = 60
      Width = 48
      Height = 12
      Caption = #26356#26032#26085#26399
    end
    object dxLookupTreeView1: TdxLookupTreeView
      Left = 72
      Top = 28
      Width = 169
      Height = 20
      CanSelectParents = True
      ParentColor = False
      TabOrder = 0
      TabStop = True
      TreeViewColor = clWindow
      TreeViewCursor = crDefault
      TreeViewFont.Charset = DEFAULT_CHARSET
      TreeViewFont.Color = clWindowText
      TreeViewFont.Height = -11
      TreeViewFont.Name = 'MS Sans Serif'
      TreeViewFont.Style = []
      TreeViewIndent = 19
      TreeViewReadOnly = False
      TreeViewShowButtons = True
      TreeViewShowHint = False
      TreeViewShowLines = True
      TreeViewShowRoot = True
      TreeViewSortType = stNone
      DividedChar = '.'
      ListSource = DataSource1
      KeyField = 'id'
      ListField = 'postname'
      Options = [trDBCanDelete, trDBConfirmDelete, trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
      ParentField = 'tid'
      TextStyle = tvtsShort
      Alignment = taLeftJustify
    end
    object DateTimePicker1: TDateTimePicker
      Left = 72
      Top = 56
      Width = 113
      Height = 20
      Date = 37747.803855729160000000
      Time = 37747.803855729160000000
      DateFormat = dfLong
      TabOrder = 1
    end
  end
  object Button1: TButton
    Left = 200
    Top = 304
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 304
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 2
    OnClick = Button2Click
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 120
    Width = 273
    Height = 177
    Caption = #21464#21160#35828#26126
    TabOrder = 3
    object Memo1: TMemo
      Left = 16
      Top = 24
      Width = 241
      Height = 137
      TabOrder = 0
    end
  end
  object ADOTable1: TADOTable
    Connection = Main.ADOconn
    IndexName = 'id'
    TableName = 'r_staffpost'
    Left = 56
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 112
    Top = 168
  end
  object ADOTable2: TADOTable
    Connection = Main.ADOconn
    IndexName = 'id'
    TableName = 'r_stachpostedit'
    Left = 56
    Top = 240
  end
end
