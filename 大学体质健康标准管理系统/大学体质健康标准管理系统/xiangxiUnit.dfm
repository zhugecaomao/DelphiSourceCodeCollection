object xiangxiform: Txiangxiform
  Left = 350
  Top = 73
  AutoScroll = False
  BorderIcons = []
  Caption = #35814#32454#25104#32489#25171#21360
  ClientHeight = 487
  ClientWidth = 646
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
    Width = 646
    Height = 473
    Align = alClient
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 4
      Top = 0
      Width = 601
      Height = 473
      TabOrder = 0
      object Label1: TLabel
        Left = 232
        Top = 8
        Width = 131
        Height = 13
        Caption = #35814#32454#25104#32489#25171#21360#35774#32622#12288#12288
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 32
        Width = 96
        Height = 13
        Caption = #25171#21360#26631#39064#35774#32622#65306#12288
      end
      object Label3: TLabel
        Left = 8
        Top = 98
        Width = 96
        Height = 13
        Caption = #25171#21360#20869#23481#35774#32622#65306#12288
      end
      object Edit1: TEdit
        Left = 104
        Top = 28
        Width = 492
        Height = 21
        MaxLength = 60
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 8
        Top = 112
        Width = 585
        Height = 201
        BevelOuter = bvLowered
        TabOrder = 1
        object Bevel1: TBevel
          Left = 496
          Top = 0
          Width = 77
          Height = 201
        end
        object Bevel2: TBevel
          Left = 223
          Top = 31
          Width = 42
          Height = 143
        end
        object SpeedButton1: TSpeedButton
          Left = 228
          Top = 36
          Width = 33
          Height = 33
          Caption = '>'
          Flat = True
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 228
          Top = 69
          Width = 33
          Height = 33
          Caption = '>>'
          Flat = True
          OnClick = SpeedButton2Click
        end
        object SpeedButton3: TSpeedButton
          Left = 228
          Top = 135
          Width = 33
          Height = 33
          Caption = '<'
          Flat = True
          OnClick = SpeedButton3Click
        end
        object SpeedButton4: TSpeedButton
          Left = 228
          Top = 102
          Width = 33
          Height = 33
          Caption = '<<'
          Flat = True
          OnClick = SpeedButton4Click
        end
        object ListBox1: TListBox
          Left = 0
          Top = 0
          Width = 193
          Height = 201
          ItemHeight = 13
          Items.Strings = (
            #23398#29983#32534#21495
            #23398#29983#22995#21517
            #23398#29983#24615#21035
            #36523#39640
            #20307#37325
            '50'#31859#36305
            '800'#31859#36305
            '1000'#31859#36305
            #25569#21147#20307#37325
            #32954#27963#37327#20307#37325
            #31435#23450#36339#36828
            #20208#21351#36215#22352
            #22352#31435#20307#21069#23624
            #36523#39640#20307#37325#25104#32489
            '50'#31859#36305#25104#32489
            '800'#31859#36305#25104#32489
            '1000'#31859#36305#25104#32489
            #25569#21147#20307#37325#25351#25968
            #25569#21147#20307#37325#25351#25968#25104#32489
            #32954#27963#37327#20307#37325#25351#25968
            #32954#27963#37327#20307#37325#25351#25968#25104#32489
            #31435#23450#36339#36828#25104#32489
            #20208#21351#36215#22352#25104#32489
            #22352#31435#20307#21069#23624#25104#32489
            #24635#25104#32489)
          TabOrder = 0
          OnDblClick = ListBox1DblClick
        end
        object ListBox2: TListBox
          Left = 296
          Top = 0
          Width = 193
          Height = 201
          ItemHeight = 13
          TabOrder = 1
          OnDblClick = ListBox2DblClick
        end
        object BitBtn1: TBitBtn
          Left = 497
          Top = 32
          Width = 75
          Height = 25
          Caption = #25171#21360#39044#35272
          Enabled = False
          TabOrder = 2
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 497
          Top = 88
          Width = 75
          Height = 25
          Caption = #21040#20837'Excel'
          Enabled = False
          TabOrder = 3
          OnClick = BitBtn2Click
        end
        object BitBtn3: TBitBtn
          Left = 497
          Top = 144
          Width = 75
          Height = 25
          Caption = #36864#20986#25171#21360
          TabOrder = 4
          OnClick = BitBtn3Click
        end
        object ProgressBar1: TProgressBar
          Left = 193
          Top = 192
          Width = 103
          Height = 9
          Min = 0
          Max = 100
          TabOrder = 5
        end
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 320
        Width = 585
        Height = 145
        DataSource = DataSource1
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object GroupBox3: TGroupBox
        Left = 2
        Top = 56
        Width = 596
        Height = 41
        TabOrder = 3
        object Label4: TLabel
          Left = 8
          Top = 16
          Width = 72
          Height = 13
          Caption = #38498#31995#36873#25321#65306#12288
        end
        object Label5: TLabel
          Left = 216
          Top = 16
          Width = 72
          Height = 13
          Caption = #29677#32423#36873#25321#65306#12288
        end
        object Label6: TLabel
          Left = 440
          Top = 16
          Width = 48
          Height = 13
          Caption = #25945#24072#65306#12288
        end
        object ComboBox1: TComboBox
          Left = 80
          Top = 12
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = ComboBox1Change
          OnEnter = ComboBox1Enter
        end
        object ComboBox2: TComboBox
          Left = 296
          Top = 13
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          OnChange = ComboBox2Change
          OnEnter = ComboBox2Enter
        end
        object Edit2: TEdit
          Left = 480
          Top = 12
          Width = 110
          Height = 21
          MaxLength = 10
          TabOrder = 2
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 473
    Width = 646
    Height = 14
    Panels = <>
    SimplePanel = False
  end
  object Query1: TQuery
    DatabaseName = 'sport'
    Left = 208
    Top = 336
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 288
    Top = 336
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
    BorderIcons = [biSystemMenu, biRollUp]
    Left = 64
    Top = 8
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 328
    Top = 48
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 376
    Top = 48
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 416
    Top = 48
  end
  object SaveDialog1: TSaveDialog
    FileName = 'reprot.xls'
    Filter = '(*.xls)|*.xls'
    Left = 464
    Top = 48
  end
end
