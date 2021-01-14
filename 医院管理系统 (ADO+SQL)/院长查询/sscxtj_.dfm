object sscxtj: Tsscxtj
  Left = 86
  Top = 111
  Width = 665
  Height = 394
  BorderIcons = [biSystemMenu]
  Caption = #25163#26415#26597#35810#32479#35745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 16
    Width = 241
    Height = 337
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 16
      Top = 24
      Width = 201
      Height = 281
      Caption = #21307#29983#25163#26415#27425#25968#32479#35745
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 40
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #21307#29983#22995#21517
      end
      object Label2: TLabel
        Left = 8
        Top = 96
        Width = 65
        Height = 13
        AutoSize = False
        Caption = #36215#22987#26102#38388
      end
      object Label3: TLabel
        Left = 8
        Top = 136
        Width = 65
        Height = 13
        AutoSize = False
        Caption = #32456#27490#26102#38388
      end
      object Label4: TLabel
        Left = 16
        Top = 240
        Width = 41
        Height = 13
        AutoSize = False
        Caption = #27425#25968#20026
      end
      object Label5: TLabel
        Left = 72
        Top = 40
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #25163#26415#21517#31216
      end
      object Eysxm: TEdit
        Left = 8
        Top = 56
        Width = 57
        Height = 21
        MaxLength = 8
        TabOrder = 0
      end
      object DateTimePicker1: TDateTimePicker
        Left = 8
        Top = 112
        Width = 145
        Height = 21
        CalAlignment = dtaLeft
        Date = 37735
        Time = 37735
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
      object DateTimePicker2: TDateTimePicker
        Left = 8
        Top = 152
        Width = 145
        Height = 21
        CalAlignment = dtaLeft
        Date = 37735
        Time = 37735
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 2
      end
      object BitBtn1: TBitBtn
        Left = 8
        Top = 192
        Width = 75
        Height = 25
        Caption = #27425#25968#32479#35745
        TabOrder = 3
        OnClick = BitBtn1Click
      end
      object Ecs: TEdit
        Left = 64
        Top = 232
        Width = 97
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
      object Essmc: TEdit
        Left = 72
        Top = 56
        Width = 121
        Height = 21
        MaxLength = 40
        TabOrder = 5
      end
    end
  end
  object Panel2: TPanel
    Left = 256
    Top = 16
    Width = 393
    Height = 337
    TabOrder = 1
    object Label6: TLabel
      Left = 16
      Top = 16
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #24320#22987#26102#38388
    end
    object Label7: TLabel
      Left = 16
      Top = 40
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #32456#27490#26102#38388
    end
    object Label8: TLabel
      Left = 200
      Top = 16
      Width = 56
      Height = 13
      AutoSize = False
      Caption = #21307#29983#22995#21517
    end
    object DBChart1: TDBChart
      Left = 8
      Top = 64
      Width = 377
      Height = 233
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Title.Text.Strings = (
        #26102#27573#25163#26415#27425#25968#32479#35745)
      TabOrder = 0
      object Series1: TBarSeries
        Marks.ArrowLength = 20
        Marks.Visible = True
        DataSource = DMyzcx.ADOQOPSCount
        SeriesColor = clRed
        XLabelsSource = #39033#30446#36153#29992#21517#31216
        BarWidthPercent = 15
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        YValues.ValueSource = #27425#25968
      end
    end
    object DateTimePicker3: TDateTimePicker
      Left = 80
      Top = 8
      Width = 113
      Height = 21
      CalAlignment = dtaLeft
      Date = 37755.406548669
      Time = 37755.406548669
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object DateTimePicker4: TDateTimePicker
      Left = 80
      Top = 32
      Width = 113
      Height = 21
      CalAlignment = dtaLeft
      Date = 37755.4066856713
      Time = 37755.4066856713
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
    end
    object BitBtn2: TBitBtn
      Left = 136
      Top = 304
      Width = 121
      Height = 21
      Caption = #24320#22987#32479#35745
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object EysxmTJ: TEdit
      Left = 256
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 4
    end
  end
  object XPMenu1: TXPMenu
    DimLevel = 30
    GrayLevel = 10
    Font.Charset = GB2312_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = clBtnFace
    IconBackColor = clBtnFace
    MenuBarColor = clBtnFace
    SelectColor = clHighlight
    SelectBorderColor = clHighlight
    SelectFontColor = clMenuText
    DisabledColor = clInactiveCaption
    SeparatorColor = clBtnFace
    CheckedColor = clHighlight
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = True
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = False
    Active = True
    Left = 232
    Top = 32
  end
end
