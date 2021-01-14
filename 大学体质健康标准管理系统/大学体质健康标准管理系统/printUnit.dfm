object printform: Tprintform
  Left = 257
  Top = 126
  AutoScroll = False
  BorderIcons = []
  Caption = #25104#32489#25171#21360
  ClientHeight = 472
  ClientWidth = 663
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 663
    Height = 472
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 8
      Top = 256
      Width = 625
      Height = 201
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 622
        Height = 198
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 8
      Width = 625
      Height = 241
      TabOrder = 1
      object GroupBox3: TGroupBox
        Left = 3
        Top = 93
        Width = 615
        Height = 137
        Caption = #25171#21360#20869#23481#35774#32622
        TabOrder = 0
        object Bevel1: TBevel
          Left = 505
          Top = 5
          Width = 76
          Height = 120
        end
        object Bevel2: TBevel
          Left = 207
          Top = 16
          Width = 43
          Height = 113
        end
        object ListBox1: TListBox
          Left = 8
          Top = 16
          Width = 185
          Height = 113
          ItemHeight = 13
          Items.Strings = (
            #23398#29983#32534#21495
            #23398#29983#22995#21517
            #23398#29983#24615#21035
            #27665#26063#23646#24615
            #25152#23646#29677#32423#21517#31216
            #24635#25104#32489
            #31561#32423#35780#23450)
          TabOrder = 0
          OnDblClick = ListBox1DblClick
        end
        object BitBtn1: TBitBtn
          Left = 208
          Top = 24
          Width = 41
          Height = 25
          Caption = '>'
          TabOrder = 1
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 208
          Top = 48
          Width = 41
          Height = 25
          Caption = '>>'
          TabOrder = 2
          OnClick = BitBtn2Click
        end
        object BitBtn3: TBitBtn
          Left = 208
          Top = 72
          Width = 41
          Height = 25
          Caption = '<<'
          TabOrder = 3
          OnClick = BitBtn3Click
        end
        object BitBtn4: TBitBtn
          Left = 208
          Top = 96
          Width = 41
          Height = 25
          Caption = '<'
          TabOrder = 4
          OnClick = BitBtn4Click
        end
        object ListBox2: TListBox
          Left = 269
          Top = 16
          Width = 177
          Height = 113
          ItemHeight = 13
          TabOrder = 5
          OnDblClick = ListBox2DblClick
        end
        object BitBtn7: TBitBtn
          Left = 506
          Top = 88
          Width = 75
          Height = 25
          Caption = #36864#20986#25171#21360
          TabOrder = 6
          OnClick = BitBtn7Click
        end
        object ProgressBar1: TProgressBar
          Left = 504
          Top = 127
          Width = 78
          Height = 6
          Min = 0
          Max = 100
          TabOrder = 7
        end
      end
      object GroupBox4: TGroupBox
        Left = 2
        Top = 7
        Width = 615
        Height = 38
        TabOrder = 1
        object Label3: TLabel
          Left = 11
          Top = 16
          Width = 72
          Height = 13
          Caption = #25171#21360#26631#39064#65306#12288
        end
        object Edit1: TEdit
          Left = 80
          Top = 13
          Width = 529
          Height = 19
          Ctl3D = False
          MaxLength = 60
          ParentCtl3D = False
          TabOrder = 0
        end
      end
      object GroupBox5: TGroupBox
        Left = 3
        Top = 44
        Width = 615
        Height = 49
        TabOrder = 2
        object Label1: TLabel
          Left = 10
          Top = 20
          Width = 72
          Height = 13
          Caption = #38498#31995#36873#25321#65306#12288
        end
        object Label2: TLabel
          Left = 328
          Top = 21
          Width = 84
          Height = 13
          Caption = #29677#32423#36873#25321#65306#12288#12288
        end
        object ComboBox1: TComboBox
          Left = 101
          Top = 17
          Width = 180
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = ComboBox1Change
          OnEnter = ComboBox1Enter
        end
        object ComboBox2: TComboBox
          Left = 416
          Top = 16
          Width = 180
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          OnChange = ComboBox2Change
          OnEnter = ComboBox2Enter
        end
      end
      object BitBtn6: TBitBtn
        Left = 509
        Top = 143
        Width = 75
        Height = 25
        Caption = #23548#20986'Excel'
        Enabled = False
        TabOrder = 3
        OnClick = BitBtn6Click
      end
    end
    object BitBtn5: TBitBtn
      Left = 517
      Top = 116
      Width = 75
      Height = 25
      Caption = #25171#21360
      Enabled = False
      TabOrder = 2
      OnClick = BitBtn5Click
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 456
      Width = 659
      Height = 14
      Panels = <>
      SimplePanel = False
    end
  end
  object Query1: TQuery
    DatabaseName = 'sport'
    Left = 456
    Top = 264
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 488
    Top = 264
  end
  object SaveDialog1: TSaveDialog
    FileName = 'report.xls'
    Filter = '(*.xls)|*.xls'
    FilterIndex = 0
    Left = 520
  end
  object bsBusinessSkinForm1: TbsBusinessSkinForm
    HideCaptionButtons = False
    AlwaysShowInTray = False
    LogoBitMapTransparent = False
    AlwaysMinimizeToTray = False
    UseSkinFontInMenu = True
    ShowIcon = False
    MaximizeOnFullScreen = False
    AlphaBlend = False
    AlphaBlendAnimation = False
    AlphaBlendValue = 200
    ShowObjectHint = False
    MenusAlphaBlend = False
    MenusAlphaBlendAnimation = False
    MenusAlphaBlendValue = 200
    DefCaptionFont.Charset = DEFAULT_CHARSET
    DefCaptionFont.Color = clBtnText
    DefCaptionFont.Height = 14
    DefCaptionFont.Name = 'Arial'
    DefCaptionFont.Style = [fsBold]
    DefInActiveCaptionFont.Charset = DEFAULT_CHARSET
    DefInActiveCaptionFont.Color = clBtnShadow
    DefInActiveCaptionFont.Height = 14
    DefInActiveCaptionFont.Name = 'Arial'
    DefInActiveCaptionFont.Style = [fsBold]
    DefMenuItemHeight = 20
    DefMenuItemFont.Charset = DEFAULT_CHARSET
    DefMenuItemFont.Color = clWindowText
    DefMenuItemFont.Height = 14
    DefMenuItemFont.Name = 'Arial'
    DefMenuItemFont.Style = []
    UseDefaultSysMenu = True
    SkinData = mainform.bsSkinData1
    MinHeight = 0
    MinWidth = 0
    Magnetic = False
    MagneticSize = 5
    BorderIcons = [biSystemMenu, biMinimize]
    Left = 72
    Top = 8
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 336
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 376
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 408
  end
end
