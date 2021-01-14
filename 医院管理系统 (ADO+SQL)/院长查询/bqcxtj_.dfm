object bqcxtj: Tbqcxtj
  Left = 161
  Top = 65
  Width = 551
  Height = 490
  BorderIcons = [biSystemMenu]
  Caption = #30149#24773#26597#35810#32479#35745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 543
    Height = 463
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #30149#24773#32479#35745#20998#26512
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 535
        Height = 89
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 64
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #30149#21517
        end
        object Label2: TLabel
          Left = 208
          Top = 64
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #24320#22987#26102#38388
        end
        object Label3: TLabel
          Left = 368
          Top = 64
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #32456#27490#26102#38388
        end
        object Label4: TLabel
          Left = 160
          Top = 16
          Width = 153
          Height = 25
          AutoSize = False
          Caption = #20303#38498#30149#24773#32479#35745
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clOlive
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ebm: TEdit
          Left = 48
          Top = 56
          Width = 137
          Height = 21
          TabOrder = 0
        end
        object DateTimePicker1: TDateTimePicker
          Left = 272
          Top = 56
          Width = 89
          Height = 21
          CalAlignment = dtaLeft
          Date = 37731
          Time = 37731
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 1
        end
        object DateTimePicker2: TDateTimePicker
          Left = 432
          Top = 56
          Width = 89
          Height = 21
          CalAlignment = dtaLeft
          Date = 37731
          Time = 37731
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 2
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 89
        Width = 535
        Height = 40
        Align = alTop
        TabOrder = 1
        object Label6: TLabel
          Left = 208
          Top = 16
          Width = 41
          Height = 13
          AutoSize = False
          Caption = #30149#20363#25968
        end
        object Button1: TButton
          Left = 72
          Top = 8
          Width = 75
          Height = 25
          Caption = #30149#20363#32479#35745
          TabOrder = 0
          OnClick = Button1Click
        end
        object Edit1: TEdit
          Left = 256
          Top = 8
          Width = 81
          Height = 21
          TabOrder = 1
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 129
        Width = 535
        Height = 306
        Align = alClient
        TabOrder = 2
        object Label5: TLabel
          Left = 16
          Top = 16
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #24180#20221
        end
        object Button2: TButton
          Left = 208
          Top = 16
          Width = 97
          Height = 25
          Caption = #30149#20363#36235#21183#32479#35745#22270
          TabOrder = 0
          OnClick = Button2Click
        end
        object Eyear: TEdit
          Left = 56
          Top = 16
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object ChartYear: TChart
          Left = 16
          Top = 48
          Width = 505
          Height = 241
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -19
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            #30149#20363#32479#35745#36235#21183#22270)
          TabOrder = 2
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
      end
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
    Left = 136
    Top = 24
  end
end
