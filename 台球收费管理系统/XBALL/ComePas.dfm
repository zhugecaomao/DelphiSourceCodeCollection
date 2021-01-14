object ComeForm: TComeForm
  Left = 105
  Top = 108
  Width = 596
  Height = 450
  Caption = #24320#21488#65292#37202#27700#25130#38047#31383#21475
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    588
    423)
  PixelsPerInch = 96
  TextHeight = 14
  object Group1: TGroupBox
    Left = 14
    Top = 9
    Width = 559
    Height = 169
    Anchors = [akLeft, akTop, akRight]
    Caption = ' '#24320#21488#35760#24405' '
    TabOrder = 0
    DesignSize = (
      559
      169)
    object Label1: TLabel
      Left = 20
      Top = 28
      Width = 70
      Height = 14
      Anchors = [akLeft]
      Caption = #27969' '#27700' '#21495#65306
    end
    object Label2: TLabel
      Left = 20
      Top = 63
      Width = 70
      Height = 14
      Anchors = [akLeft]
      Caption = #23089#20048#21517#31216#65306
    end
    object Label3: TLabel
      Left = 228
      Top = 28
      Width = 70
      Height = 14
      Anchors = [akLeft]
      Caption = #36827#20837#26102#38388#65306
    end
    object Label4: TLabel
      Left = 20
      Top = 98
      Width = 70
      Height = 14
      Anchors = [akLeft]
      Caption = #25152#22312#32534#21495#65306
    end
    object Label7: TLabel
      Left = 228
      Top = 98
      Width = 70
      Height = 14
      Anchors = [akLeft]
      Caption = #31199#25293#25968#37327#65306
    end
    object Label6: TLabel
      Left = 228
      Top = 63
      Width = 70
      Height = 14
      Anchors = [akLeft]
      Caption = #23089#20048#31867#21035#65306
    end
    object Label12: TLabel
      Left = 20
      Top = 133
      Width = 70
      Height = 14
      Anchors = [akLeft]
      Caption = #20250#21592#21345#21495#65306
      Visible = False
    end
    object Label13: TLabel
      Left = 228
      Top = 133
      Width = 70
      Height = 14
      Anchors = [akLeft]
      Caption = #25171#25240#20313#39069#65306
      Visible = False
    end
    object Edit06: TEdit
      Left = 296
      Top = 94
      Width = 131
      Height = 22
      Anchors = [akLeft, akRight]
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 1
      ParentFont = False
      TabOrder = 5
      OnKeyPress = Edit06KeyPress
    end
    object Button1: TButton
      Left = 451
      Top = 23
      Width = 85
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #30830#23450'(&O)'
      Enabled = False
      TabOrder = 6
      OnClick = Button1Click
    end
    object Edit05: TComboBox
      Left = 88
      Top = 94
      Width = 105
      Height = 22
      Style = csDropDownList
      Anchors = [akLeft]
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      Sorted = True
      TabOrder = 4
      OnClick = Edit05Click
    end
    object Edit01: TComboBox
      Left = 88
      Top = 24
      Width = 105
      Height = 22
      Style = csOwnerDrawFixed
      Anchors = [akLeft]
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      Sorted = True
      TabOrder = 0
      OnClick = Edit01Click
      OnDrawItem = Edit01DrawItem
    end
    object Edit02: TDateTimePicker
      Left = 296
      Top = 24
      Width = 131
      Height = 22
      Anchors = [akLeft, akRight]
      CalAlignment = dtaLeft
      Date = 36760
      Time = 36760
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkTime
      ParseInput = False
      TabOrder = 1
    end
    object Edit03: TComboBox
      Left = 88
      Top = 59
      Width = 105
      Height = 22
      Style = csDropDownList
      Anchors = [akLeft]
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      TabOrder = 2
      OnChange = Edit03Change
      OnClick = Edit03Click
    end
    object Edit04: TEdit
      Left = 296
      Top = 59
      Width = 131
      Height = 22
      Anchors = [akLeft, akRight]
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object Button4: TButton
      Left = 451
      Top = 58
      Width = 85
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21333'(&P)'
      Enabled = False
      TabOrder = 7
      OnClick = Button4Click
    end
    object Button2: TButton
      Left = 451
      Top = 93
      Width = 85
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #36864#20986'(&X)'
      TabOrder = 8
      OnClick = Button2Click
    end
    object CardList: TComboBox
      Left = 88
      Top = 129
      Width = 105
      Height = 22
      Style = csDropDownList
      Anchors = [akLeft]
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      Sorted = True
      TabOrder = 9
      Visible = False
    end
    object DBEdit1: TDBEdit
      Left = 296
      Top = 129
      Width = 131
      Height = 22
      Anchors = [akLeft, akRight]
      DataField = #20313#39069
      ReadOnly = True
      TabOrder = 10
      Visible = False
    end
  end
  object Group2: TGroupBox
    Left = 14
    Top = 188
    Width = 559
    Height = 200
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' '#37202#27700#65292#25130#38047#35760#24405' '
    TabOrder = 1
    DesignSize = (
      559
      200)
    object Label5: TLabel
      Left = 228
      Top = 30
      Width = 70
      Height = 14
      Anchors = [akLeft]
      Caption = #37202#27700#21517#31216#65306
    end
    object Label8: TLabel
      Left = 228
      Top = 95
      Width = 70
      Height = 14
      Anchors = [akLeft]
      Caption = #37202#27700#21333#20215#65306
    end
    object Label9: TLabel
      Left = 228
      Top = 63
      Width = 70
      Height = 14
      Anchors = [akLeft]
      Caption = #37202#27700#25968#37327#65306
    end
    object Label10: TLabel
      Left = 228
      Top = 128
      Width = 70
      Height = 14
      Anchors = [akLeft]
      Caption = #37202#27700#37329#39069#65306
    end
    object Label11: TLabel
      Left = 28
      Top = 87
      Width = 7
      Height = 14
    end
    object Image1: TImage
      Left = 21
      Top = 24
      Width = 165
      Height = 165
      Stretch = True
    end
    object Edit13: TEdit
      Left = 296
      Top = 59
      Width = 131
      Height = 22
      Anchors = [akLeft, akRight]
      Color = clWhite
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 2
      OnChange = Edit13Exit
      OnExit = Edit13Exit
    end
    object Button3: TButton
      Left = 451
      Top = 25
      Width = 85
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #30830#23450'(&D)'
      Enabled = False
      TabOrder = 4
      OnClick = Button3Click
    end
    object Edit14: TEdit
      Left = 296
      Top = 124
      Width = 131
      Height = 22
      Anchors = [akLeft, akRight]
      Color = clWhite
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object Edit11: TDBLookupComboBox
      Left = 296
      Top = 26
      Width = 131
      Height = 22
      Anchors = [akLeft, akRight]
      Color = clWhite
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      KeyField = #21517#31216
      ListField = #21517#31216
      ListSource = DM.Waters
      ParentFont = False
      TabOrder = 0
    end
    object Edit12: TDBEdit
      Left = 296
      Top = 91
      Width = 131
      Height = 22
      Anchors = [akLeft, akRight]
      Color = clWhite
      DataField = #21333#20215
      DataSource = DM.Waters
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object Check1: TCheckBox
      Left = 209
      Top = 162
      Width = 89
      Height = 17
      Anchors = [akLeft]
      Caption = #25130#38047#26102#38388#65306
      TabOrder = 6
      OnClick = Check1Exit
      OnExit = Check1Exit
    end
    object Edit21: TDateTimePicker
      Left = 296
      Top = 159
      Width = 131
      Height = 22
      Anchors = [akLeft, akRight]
      CalAlignment = dtaLeft
      Date = 36760
      Time = 36760
      Color = clWhite
      DateFormat = dfShort
      DateMode = dmComboBox
      Font.Charset = GB2312_CHARSET
      Font.Color = clWhite
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      Kind = dtkTime
      ParseInput = False
      ParentFont = False
      TabOrder = 5
    end
  end
  object SBar: TPanel
    Left = 0
    Top = 401
    Width = 588
    Height = 22
    Align = alBottom
    Color = clGreen
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 240
    Top = 184
  end
end
