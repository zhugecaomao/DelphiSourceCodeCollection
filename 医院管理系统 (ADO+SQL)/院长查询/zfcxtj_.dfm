object zfcxtj: Tzfcxtj
  Left = 204
  Top = 108
  Width = 489
  Height = 438
  BorderIcons = [biSystemMenu]
  Caption = #36164#36153#26597#35810#32479#35745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 232
    Top = 152
    Width = 28
    Height = 13
    AutoSize = False
    Caption = #24180#20221
  end
  object Panel1: TPanel
    Left = 48
    Top = 16
    Width = 385
    Height = 105
    TabOrder = 0
    object Label1: TLabel
      Left = 144
      Top = 64
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #27611#25910#20837#20026
    end
    object Label2: TLabel
      Left = 216
      Top = 24
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #32467#26463#26102#38388
    end
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #24320#22987#26102#38388
    end
    object Label4: TLabel
      Left = 312
      Top = 64
      Width = 12
      Height = 13
      AutoSize = False
      Caption = #20803
    end
    object Button2: TButton
      Left = 40
      Top = 56
      Width = 81
      Height = 25
      Caption = #27611#25910#20837#32479#35745
      TabOrder = 0
      OnClick = Button1Click
    end
    object Emsr: TEdit
      Left = 200
      Top = 60
      Width = 105
      Height = 21
      TabOrder = 1
    end
    object DateTimePicker1: TDateTimePicker
      Left = 80
      Top = 16
      Width = 89
      Height = 21
      CalAlignment = dtaLeft
      Date = 37734
      Time = 37734
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
    end
    object DateTimePicker2: TDateTimePicker
      Left = 280
      Top = 16
      Width = 81
      Height = 21
      CalAlignment = dtaLeft
      Date = 37734
      Time = 37734
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
    end
  end
  object ChartYear: TChart
    Left = 48
    Top = 184
    Width = 377
    Height = 218
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -16
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #27611#25910#20837#32479#35745#22270)
    TabOrder = 1
    object Series1: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = True
      SeriesColor = clRed
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1
      YValues.Order = loNone
    end
  end
  object BitBtn1: TBitBtn
    Left = 72
    Top = 144
    Width = 131
    Height = 25
    Caption = #27611#25910#20837#32479#35745#20998#26512#22270
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Eyear: TEdit
    Left = 264
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 3
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
    Left = 24
    Top = 160
  end
end
