object toexcel: Ttoexcel
  Left = 218
  Top = 230
  AutoScroll = False
  BorderIcons = []
  Caption = #25968#25454#23548#20986
  ClientHeight = 376
  ClientWidth = 702
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
    Width = 702
    Height = 376
    Align = alClient
    TabOrder = 0
    object ProgressBar1: TProgressBar
      Left = 16
      Top = 338
      Width = 649
      Height = 17
      Min = 0
      Max = 100
      TabOrder = 0
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 120
      Width = 649
      Height = 169
      Color = clBtnFace
      ParentColor = False
      TabOrder = 1
      object Bevel1: TBevel
        Left = 567
        Top = 7
        Width = 67
        Height = 160
      end
      object SpeedButton1: TbsSkinSpeedButton
        Left = 568
        Top = 30
        Width = 65
        Height = 113
        SkinDataName = 'toolbutton'
        DefaultFont.Charset = GB2312_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = -19
        DefaultFont.Name = #26999#20307'_GB2312'
        DefaultFont.Style = [fsBold]
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ImageIndex = 0
        RepeatMode = False
        RepeatInterval = 100
        Transparent = True
        Flat = True
        AllowAllUp = False
        Down = False
        GroupIndex = 0
        Caption = #24320#10#22987#10#23548#10#20986
        ShowCaption = True
        NumGlyphs = 1
        Spacing = 1
        OnClick = SpeedButton1Click
      end
      object Panel3: TPanel
        Left = 8
        Top = 8
        Width = 545
        Height = 153
        BevelOuter = bvLowered
        TabOrder = 0
        object Bevel2: TBevel
          Left = 250
          Top = 0
          Width = 45
          Height = 153
        end
        object SpeedButton10: TSpeedButton
          Left = 256
          Top = 11
          Width = 33
          Height = 33
          Caption = '>'
          Flat = True
          OnClick = SpeedButton10Click
        end
        object SpeedButton11: TSpeedButton
          Left = 256
          Top = 44
          Width = 33
          Height = 33
          Caption = '>>'
          Flat = True
          OnClick = SpeedButton11Click
        end
        object SpeedButton12: TSpeedButton
          Left = 256
          Top = 77
          Width = 33
          Height = 33
          Caption = '<<'
          Flat = True
          OnClick = SpeedButton12Click
        end
        object SpeedButton9: TSpeedButton
          Left = 256
          Top = 110
          Width = 33
          Height = 33
          Caption = '<'
          Flat = True
          OnClick = SpeedButton9Click
        end
        object ListBox7: TListBox
          Left = 0
          Top = 0
          Width = 241
          Height = 153
          ItemHeight = 13
          Items.Strings = (
            #23398#29983#32534#21495
            #23398#29983#24615#21035
            #23398#29983#22995#21517
            #20986#29983#26085#26399
            #27665#26063#23646#24615
            #25152#23646#29677#32423#21517#31216
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
            #25569#21147#20307#37325#25351#25968
            #32954#27963#37327#20307#37325#25351#25968
            #36523#39640#20307#37325#25104#32489
            '50'#31859#36305#25104#32489
            '800'#31859#36305#25104#32489
            '1000'#31859#36305#25104#32489
            #25569#21147#20307#37325#25351#25968#25104#32489
            #32954#27963#37327#20307#37325#25351#25968#25104#32489
            #31435#23450#36339#36828#25104#32489
            #20208#21351#36215#22352#25104#32489
            #22352#31435#20307#21069#23624#25104#32489
            #24635#25104#32489
            #31561#32423#35780#23450)
          TabOrder = 0
          OnDblClick = ListBox7DblClick
        end
        object ListBox8: TListBox
          Left = 304
          Top = 0
          Width = 241
          Height = 153
          ItemHeight = 13
          TabOrder = 1
          OnDblClick = ListBox8DblClick
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 41
      Width = 649
      Height = 72
      TabOrder = 2
      object Label2: TLabel
        Left = 16
        Top = 16
        Width = 96
        Height = 13
        Caption = #38498#31995#23548#20986#35774#32622#65306#12288
      end
      object Label3: TLabel
        Left = 224
        Top = 16
        Width = 99
        Height = 13
        Caption = ' '#29677#32423#23548#20986#35774#32622#65306#12288
      end
      object Label4: TLabel
        Left = 424
        Top = 16
        Width = 75
        Height = 13
        Caption = ' '#36335#24452#35774#32622#65306#12288
      end
      object Bevel3: TBevel
        Left = 591
        Top = 33
        Width = 49
        Height = 30
      end
      object SpeedButton2: TSpeedButton
        Left = 594
        Top = 37
        Width = 43
        Height = 22
        Caption = #36873#25321
        Flat = True
        OnClick = SpeedButton2Click
      end
      object CheckBox1: TCheckBox
        Left = 128
        Top = 13
        Width = 97
        Height = 17
        Caption = #23436#20840#23548#20986
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object ComboBox1: TComboBox
        Left = 16
        Top = 38
        Width = 185
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        TabOrder = 1
        OnEnter = ComboBox1Enter
      end
      object CheckBox2: TCheckBox
        Left = 328
        Top = 13
        Width = 97
        Height = 17
        Caption = #23436#20840#23548#20986
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 2
        OnClick = CheckBox2Click
      end
      object ComboBox2: TComboBox
        Left = 224
        Top = 38
        Width = 177
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        TabOrder = 3
        OnEnter = ComboBox2Enter
      end
      object Edit2: TEdit
        Left = 424
        Top = 37
        Width = 161
        Height = 21
        TabOrder = 4
      end
    end
    object GroupBox4: TGroupBox
      Left = 16
      Top = 8
      Width = 649
      Height = 33
      TabOrder = 3
      object Label1: TLabel
        Left = 8
        Top = 11
        Width = 48
        Height = 13
        Caption = #26631#39064#65306#12288
      end
      object Edit1: TEdit
        Left = 56
        Top = 8
        Width = 585
        Height = 21
        MaxLength = 254
        TabOrder = 0
      end
    end
    object DBGrid1: TDBGrid
      Left = 15
      Top = 296
      Width = 650
      Height = 39
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 520
    Top = 8
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 560
    Top = 8
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 600
    Top = 8
  end
  object Query1: TQuery
    DatabaseName = 'sport'
    Left = 144
    Top = 304
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 208
    Top = 304
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
    Top = 24
  end
end
