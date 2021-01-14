object chaxunform: Tchaxunform
  Left = 230
  Top = 165
  AutoScroll = False
  BorderIcons = []
  Caption = #20449#24687#26597#35810
  ClientHeight = 431
  ClientWidth = 664
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
    Width = 664
    Height = 418
    Align = alClient
    TabOrder = 0
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 8
      Width = 617
      Height = 33
      TabOrder = 0
    end
    object classinfo: TGroupBox
      Left = 8
      Top = 40
      Width = 617
      Height = 377
      TabOrder = 1
      object GroupBox3: TGroupBox
        Left = 0
        Top = 16
        Width = 617
        Height = 81
        Caption = #25628#32034#26465#20214
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 24
          Width = 72
          Height = 13
          Caption = #29677#32423#32534#21495#65306#12288
        end
        object Label2: TLabel
          Left = 232
          Top = 24
          Width = 72
          Height = 13
          Caption = #29677#32423#21517#31216#65306#12288
        end
        object Label3: TLabel
          Left = 8
          Top = 56
          Width = 72
          Height = 13
          Caption = #20837#23398#26102#38388#65306#12288
        end
        object Label4: TLabel
          Left = 232
          Top = 56
          Width = 72
          Height = 13
          Caption = #23398#21046#31867#22411#65306#12288
        end
        object Bevel1: TBevel
          Left = 488
          Top = 5
          Width = 105
          Height = 74
        end
        object edit1: TEdit
          Left = 88
          Top = 22
          Width = 89
          Height = 19
          Ctl3D = False
          MaxLength = 8
          ParentCtl3D = False
          TabOrder = 0
          OnEnter = edit1Enter
          OnExit = edit1Exit
        end
        object edit2: TEdit
          Left = 312
          Top = 22
          Width = 121
          Height = 19
          Ctl3D = False
          MaxLength = 30
          ParentCtl3D = False
          TabOrder = 1
          OnEnter = edit2Enter
          OnExit = edit2Exit
        end
        object combox1: TComboBox
          Left = 87
          Top = 53
          Width = 91
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
          OnEnter = combox1Enter
          OnExit = combox1Exit
          Items.Strings = (
            #19968#24180
            #20108#24180
            #19977#24180
            #22235#24180
            #20116#24180
            '')
        end
        object combox2: TComboBox
          Left = 312
          Top = 51
          Width = 123
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          OnEnter = combox2Enter
          OnExit = combox2Exit
          Items.Strings = (
            #39640#20013
            #20013#19987
            #22823#19987
            #22823#23398
            #20116#24180#21046#39640#32844
            #19977#24180#21046#39640#32844
            '')
        end
        object BitBtn1: TBitBtn
          Left = 496
          Top = 15
          Width = 89
          Height = 57
          Caption = #25628#32034
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -29
          Font.Name = #26999#20307'_GB2312'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = BitBtn1Click
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 111
        Width = 617
        Height = 257
        Caption = #25628#32034#32467#26524
        TabOrder = 1
        object DBGrid1: TDBGrid
          Left = 2
          Top = 22
          Width = 615
          Height = 231
          DataSource = DataModule1.Dbanjixinxi
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
    object RadioButton2: TRadioButton
      Left = 208
      Top = 18
      Width = 113
      Height = 17
      Caption = #23398#29983#20449#24687#25628#32034
      TabOrder = 2
      OnClick = RadioButton2Click
    end
    object RadioButton3: TRadioButton
      Left = 344
      Top = 18
      Width = 113
      Height = 17
      Caption = #25104#32489#20449#24687#25628#32034
      TabOrder = 3
      OnClick = RadioButton3Click
    end
    object RadioButton1: TRadioButton
      Left = 50
      Top = 18
      Width = 113
      Height = 17
      Caption = #29677#32423#20449#24687#25628#32034
      Checked = True
      TabOrder = 4
      TabStop = True
      OnClick = RadioButton1Click
    end
    object stugre: TGroupBox
      Left = 8
      Top = 40
      Width = 617
      Height = 377
      TabOrder = 5
      Visible = False
      object GroupBox6: TGroupBox
        Left = 0
        Top = 16
        Width = 617
        Height = 81
        Caption = #25628#32034#26465#20214
        TabOrder = 0
        object Label10: TLabel
          Left = 8
          Top = 24
          Width = 72
          Height = 13
          Caption = #23398#29983#32534#21495#65306#12288
        end
        object Label11: TLabel
          Left = 8
          Top = 56
          Width = 60
          Height = 13
          Caption = #24635#25104#32489#65306#12288
        end
        object Label12: TLabel
          Left = 208
          Top = 24
          Width = 72
          Height = 13
          Caption = #23398#29983#22995#21517#65306#12288
        end
        object Label13: TLabel
          Left = 208
          Top = 56
          Width = 72
          Height = 13
          Caption = #35780#23450#31561#32423#65306#12288
        end
        object Bevel3: TBevel
          Left = 488
          Top = 5
          Width = 105
          Height = 82
        end
        object Edit3: TEdit
          Left = 72
          Top = 21
          Width = 121
          Height = 19
          Ctl3D = False
          MaxLength = 8
          ParentCtl3D = False
          TabOrder = 0
          OnEnter = Edit3Enter
          OnExit = Edit3Exit
        end
        object Edit4: TEdit
          Left = 288
          Top = 21
          Width = 121
          Height = 19
          Ctl3D = False
          Enabled = False
          MaxLength = 15
          ParentCtl3D = False
          TabOrder = 1
          Text = '   '#35831#20351#29992#35813#23398#29983#32534#21495
          OnEnter = Edit4Enter
          OnExit = Edit4Exit
        end
        object Edit5: TEdit
          Left = 72
          Top = 53
          Width = 121
          Height = 19
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          TabOrder = 2
          OnEnter = Edit5Enter
          OnExit = Edit5Exit
        end
        object dengji: TComboBox
          Left = 288
          Top = 52
          Width = 121
          Height = 21
          Style = csDropDownList
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 3
          OnEnter = dengjiEnter
          OnExit = dengjiExit
          Items.Strings = (
            #20248
            #33391
            #21450#26684
            #19981#21450#26684
            '')
        end
        object BitBtn3: TBitBtn
          Left = 496
          Top = 15
          Width = 89
          Height = 57
          Caption = #25628#32034
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -29
          Font.Name = #26999#20307'_GB2312'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = BitBtn3Click
        end
      end
      object GroupBox7: TGroupBox
        Left = 0
        Top = 112
        Width = 617
        Height = 257
        Caption = #25628#32034#32467#26524
        TabOrder = 1
        object DBGrid3: TDBGrid
          Left = 2
          Top = 21
          Width = 612
          Height = 234
          DataSource = DataModule1.dstugread
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
    object stuinfo: TGroupBox
      Left = 8
      Top = 40
      Width = 617
      Height = 377
      TabOrder = 6
      Visible = False
      object GroupBox2: TGroupBox
        Left = 0
        Top = 16
        Width = 617
        Height = 81
        Caption = #25628#32034#26465#20214
        TabOrder = 0
        object Label5: TLabel
          Left = 6
          Top = 22
          Width = 72
          Height = 13
          Caption = #23398#29983#32534#21495#65306#12288
        end
        object Label6: TLabel
          Left = 166
          Top = 22
          Width = 72
          Height = 13
          Caption = #23398#29983#22995#21517#65306#12288
        end
        object Label7: TLabel
          Left = 334
          Top = 22
          Width = 72
          Height = 13
          Caption = #25152#23646#29677#32423#65306#12288
        end
        object Label8: TLabel
          Left = 6
          Top = 56
          Width = 72
          Height = 13
          Caption = #25152#23646#27665#26063#65306#12288
        end
        object Label9: TLabel
          Left = 240
          Top = 56
          Width = 48
          Height = 13
          Caption = #24615#21035#65306#12288
        end
        object Bevel2: TBevel
          Left = 488
          Top = 5
          Width = 105
          Height = 74
        end
        object xsbh: TEdit
          Left = 80
          Top = 19
          Width = 73
          Height = 19
          Ctl3D = False
          MaxLength = 8
          ParentCtl3D = False
          TabOrder = 0
          OnEnter = xsbhEnter
          OnExit = xsbhExit
        end
        object xsxm: TEdit
          Left = 240
          Top = 19
          Width = 89
          Height = 19
          Ctl3D = False
          MaxLength = 15
          ParentCtl3D = False
          TabOrder = 1
          OnEnter = xsxmEnter
          OnExit = xsxmExit
        end
        object ssbj: TEdit
          Left = 400
          Top = 19
          Width = 81
          Height = 19
          Ctl3D = False
          MaxLength = 30
          ParentCtl3D = False
          TabOrder = 2
          OnEnter = ssbjEnter
          OnExit = ssbjExit
        end
        object ssmz: TComboBox
          Left = 80
          Top = 51
          Width = 73
          Height = 21
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 3
          OnEnter = ssmzEnter
          OnExit = ssmzExit
          Items.Strings = (
            #27721#26063
            #33945#21476#26063
            #22238#26063
            #34255#26063
            #32500#21566#23572#26063
            #33495#26063
            #24413#26063
            #22766#26063
            #24067#20381#26063
            #26397#40092#26063
            #28385#26063
            #20375#26063
            #29814#26063
            #30333#26063
            #22303#23478#26063
            #21704#23612#26063
            #21704#33832#20811#26063
            #20643#26063
            #40654#26063
            #20616#20723#26063
            #20324#26063
            #30066#26063
            #39640#23665#26063
            #25289#31068#26063
            #27700#26063
            #19996#20065#26063
            #32435#35199#26063
            #26223#39047#26063
            #26607#23572#20811#23388#26063
            #22303#26063
            #36798#26017#23572#26063
            #20203#20332#26063
            #32652#26063
            #24067#26391#26063
            #25746#25289#26063
            #27611#21335#26063
            #20193#20332#26063
            #38177#20271#26063
            #38463#26124#26063
            #22612#21513#20811#26063
            #26222#31859#26063
            #24594#26063
            #20044#23388#21035#20811#26063
            #20420#32599#26031#26063
            #37122#28201#20811#26063
            #24503#26114#26063
            #20445#23433#26063
            #35029#22266#26063
            #20140#26063
            #22612#22612#23572#26063
            #29420#40857#26063
            #37122#20262#26149#26063
            #36203#21746#26063
            #38376#24052#26063
            #29662#24052#26063
            #22522#35834#26063
            '')
        end
        object xb: TComboBox
          Left = 296
          Top = 51
          Width = 57
          Height = 21
          Style = csDropDownList
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 4
          OnEnter = xbEnter
          OnExit = xbExit
          Items.Strings = (
            #30007
            #22899
            '')
        end
        object BitBtn2: TBitBtn
          Left = 496
          Top = 15
          Width = 89
          Height = 57
          Caption = #25628#32034
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -29
          Font.Name = #26999#20307'_GB2312'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = BitBtn2Click
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 112
        Width = 617
        Height = 257
        Caption = #25628#32034#32467#26524
        TabOrder = 1
        object DBGrid2: TDBGrid
          Left = 2
          Top = 21
          Width = 613
          Height = 234
          DataSource = DataModule1.Dxueshengxinxi
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
    object RadioButton4: TRadioButton
      Left = 480
      Top = 18
      Width = 113
      Height = 17
      Caption = 'SQL'#35821#21477#26597#35810
      TabOrder = 7
      OnClick = RadioButton4Click
    end
    object sqlgroup: TGroupBox
      Left = 8
      Top = 40
      Width = 617
      Height = 377
      TabOrder = 8
      Visible = False
      object GroupBox8: TGroupBox
        Left = 8
        Top = 72
        Width = 601
        Height = 105
        Caption = 'SQL'#35821#21477#36755#20837
        TabOrder = 0
        object Bevel4: TBevel
          Left = 536
          Top = 16
          Width = 65
          Height = 84
        end
        object Bevel5: TBevel
          Left = 536
          Top = 47
          Width = 65
          Height = 26
        end
        object Memo1: TMemo
          Left = 2
          Top = 16
          Width = 535
          Height = 85
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Lines.Strings = (
            #20363#65306'  '#26597#35810#24635#25104#32489#39640#20110'50'#30340#23398#29983#25104#32489#20449#24687
            ''
            '    select * from stugread where '#24635#25104#32489'>'#39'50'#39)
          ParentFont = False
          TabOrder = 0
        end
        object BitBtn4: TBitBtn
          Left = 544
          Top = 48
          Width = 49
          Height = 25
          Caption = #26597#35810
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #40657#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtn4Click
        end
      end
      object GroupBox9: TGroupBox
        Left = 8
        Top = 6
        Width = 601
        Height = 61
        Caption = #27880#24847
        TabOrder = 1
        object Label14: TLabel
          Left = 5
          Top = 19
          Width = 174
          Height = 13
          Caption = #23398#29983#22522#26412#20449#24687#65306'xueshengxinxi'#12288#12288
        end
        object Label15: TLabel
          Left = 4
          Top = 40
          Width = 106
          Height = 13
          Caption = #29677#32423#20449#24687#65306'banji'#12288#12288
        end
        object Label16: TLabel
          Left = 224
          Top = 19
          Width = 161
          Height = 13
          Caption = #23398#29983#25104#32489#20449#24687#65306'stugread'#12288#12288#12288
        end
        object Label17: TLabel
          Left = 224
          Top = 40
          Width = 150
          Height = 13
          Caption = #23398#29983#31561#32423#20449#24687#65306'studengji'#12288#12288
        end
        object Label18: TLabel
          Left = 432
          Top = 19
          Width = 105
          Height = 13
          Caption = #38498#31995#20449#24687#65306'xibie'#12288#12288
        end
        object Label19: TLabel
          Left = 432
          Top = 40
          Width = 119
          Height = 13
          Caption = #29992#25143#20449#24687#65306'yonghu'#12288#12288
        end
      end
      object GroupBox10: TGroupBox
        Left = 8
        Top = 176
        Width = 601
        Height = 194
        TabOrder = 2
        object DBGrid4: TDBGrid
          Left = 2
          Top = 7
          Width = 595
          Height = 184
          DataSource = DataSource1
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 418
    Width = 664
    Height = 13
    Panels = <>
    SimplePanel = False
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = Query1
    Left = 120
    Top = 240
  end
  object Query1: TQuery
    DatabaseName = 'sport'
    Left = 168
    Top = 240
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
    Left = 296
    Top = 160
  end
end
