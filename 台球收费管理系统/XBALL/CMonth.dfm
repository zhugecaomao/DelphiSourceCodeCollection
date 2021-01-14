object MMonth: TMMonth
  Left = 78
  Top = 83
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #26085'('#26376')'#32467#34920#26174#31034#31383#21475
  ClientHeight = 438
  ClientWidth = 665
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    665
    438)
  PixelsPerInch = 96
  TextHeight = 12
  object DBGrid1: TDBGrid
    Left = 11
    Top = 16
    Width = 642
    Height = 275
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = Turns
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 12
    Top = 399
    Width = 105
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = #25171#21360#21512#35745#25968
    Enabled = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 10
    Top = 298
    Width = 644
    Height = 81
    Anchors = [akLeft, akRight, akBottom]
    Caption = ' '#32479#35745#32467#26524' '
    TabOrder = 2
    DesignSize = (
      644
      81)
    object Label3: TLabel
      Left = 16
      Top = 57
      Width = 60
      Height = 12
      Caption = #24320#22987#21333#21495#65306
    end
    object Label5: TLabel
      Left = 80
      Top = 57
      Width = 36
      Height = 12
      Caption = 'Label5'
    end
    object Label4: TLabel
      Left = 211
      Top = 57
      Width = 60
      Height = 12
      Caption = #32467#26463#21333#21495#65306
    end
    object Label6: TLabel
      Left = 275
      Top = 57
      Width = 36
      Height = 12
      Caption = 'Label6'
    end
    object Label1: TLabel
      Left = 372
      Top = 57
      Width = 36
      Height = 12
      Caption = #24635#35745#65306
    end
    object Label2: TLabel
      Left = 413
      Top = 56
      Width = 100
      Height = 14
      AutoSize = False
      Caption = #21512#35745#37329#39069#65288#20803#65289
    end
    object Bevel1: TBevel
      Left = 2
      Top = 36
      Width = 641
      Height = 9
      Anchors = [akLeft, akTop, akRight]
      Shape = bsBottomLine
    end
    object Pick1: TDateTimePicker
      Left = 16
      Top = 17
      Width = 129
      Height = 20
      Hint = #36873#25321#26085#26399#21644#26376#20221
      CalAlignment = dtaLeft
      Date = 36761.6406549769
      Time = 36761.6406549769
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = SumClick
    end
    object SumMon: TRadioButton
      Left = 372
      Top = 19
      Width = 87
      Height = 17
      Caption = #32479#35745#26376#32467#34920
      TabOrder = 1
      OnClick = SumClick
      OnDblClick = SumClick
    end
    object SumDay: TRadioButton
      Left = 217
      Top = 19
      Width = 87
      Height = 17
      Caption = #32479#35745#26085#32467#34920
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = SumClick
      OnDblClick = SumClick
    end
  end
  object Button2: TButton
    Left = 577
    Top = 399
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #36864#20986'(&X)'
    ModalResult = 2
    TabOrder = 3
  end
  object Turns: TDataSource
    DataSet = Turn
    Left = 416
    Top = 8
  end
  object Turn: TQuery
    DatabaseName = 'PlayBall'
    RequestLive = True
    Left = 376
    Top = 8
  end
end
