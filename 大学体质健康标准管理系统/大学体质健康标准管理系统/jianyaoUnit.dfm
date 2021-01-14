object jianyaoform: Tjianyaoform
  Left = 211
  Top = 129
  AutoScroll = False
  BorderIcons = []
  Caption = #39318#35201#20449#24687#31649#29702
  ClientHeight = 402
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 389
    Width = 710
    Height = 13
    Panels = <>
    SimplePanel = False
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 710
    Height = 389
    Align = alClient
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 0
      Top = 0
      Width = 681
      Height = 389
      TabOrder = 0
      object Label15: TLabel
        Left = 8
        Top = 13
        Width = 96
        Height = 13
        Caption = #31649#29702#31867#22411#36873#25321#65306#12288
      end
      object ComboBox1: TComboBox
        Left = 112
        Top = 10
        Width = 145
        Height = 21
        ItemHeight = 13
        PopupMenu = PopupMenu1
        TabOrder = 0
        Text = #38498#31995#20449#24687#31649#29702
        OnChange = ComboBox1Change
        OnKeyPress = ComboBox1KeyPress
        Items.Strings = (
          #38498#31995#20449#24687#31649#29702
          #29677#32423#20449#24687#31649#29702
          #23398#29983#20449#24687#31649#29702)
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 40
        Width = 665
        Height = 177
        DataSource = DataModule1.Dxibie
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = PopupMenu2
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
      end
      object yuanxigro: TGroupBox
        Left = 7
        Top = 216
        Width = 667
        Height = 97
        TabOrder = 2
        object Label1: TLabel
          Left = 16
          Top = 40
          Width = 81
          Height = 13
          Caption = #38498' '#31995' '#20195' '#30721#65306#12288
        end
        object Label2: TLabel
          Left = 248
          Top = 40
          Width = 84
          Height = 13
          Caption = ' '#38498' '#31995' '#21517' '#31216#65306#12288
        end
        object yuanxidaima: TEdit
          Left = 96
          Top = 37
          Width = 65
          Height = 19
          Ctl3D = False
          MaxLength = 8
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnEnter = yuanxidaimaEnter
          OnKeyDown = yuanxidaimaKeyDown
          OnKeyPress = yuanxidaimaKeyPress
        end
        object yuanximingcheng: TEdit
          Left = 336
          Top = 36
          Width = 153
          Height = 19
          Ctl3D = False
          MaxLength = 30
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 1
          OnKeyDown = yuanximingchengKeyDown
          OnKeyPress = yuanximingchengKeyPress
        end
      end
      object Panel1: TPanel
        Left = 8
        Top = 320
        Width = 665
        Height = 65
        BevelOuter = bvLowered
        TabOrder = 3
        object Bevel1: TBevel
          Left = 0
          Top = 18
          Width = 665
          Height = 28
        end
        object BitBtn1: TBitBtn
          Left = 15
          Top = 19
          Width = 70
          Height = 25
          Caption = #28155#21152#25968#25454
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 131
          Top = 19
          Width = 70
          Height = 25
          Caption = #21024#38500#25968#25454
          TabOrder = 1
          OnClick = BitBtn2Click
        end
        object BitBtn3: TBitBtn
          Left = 242
          Top = 19
          Width = 70
          Height = 25
          Caption = #20462#25913#30830#23450
          TabOrder = 2
          OnClick = BitBtn3Click
        end
        object BitBtn5: TBitBtn
          Left = 354
          Top = 19
          Width = 70
          Height = 25
          Caption = #28165#31354#25968#25454
          TabOrder = 3
          OnClick = BitBtn5Click
        end
        object BitBtn6: TBitBtn
          Left = 466
          Top = 19
          Width = 70
          Height = 25
          Caption = #28165#38500#20869#23481
          TabOrder = 4
          OnClick = BitBtn6Click
        end
        object BitBtn7: TBitBtn
          Left = 578
          Top = 19
          Width = 70
          Height = 25
          Caption = #36864#20986#31649#29702
          TabOrder = 5
          OnClick = BitBtn7Click
        end
      end
      object banjigro: TGroupBox
        Left = 16
        Top = 216
        Width = 657
        Height = 97
        TabOrder = 4
        Visible = False
        object Label3: TLabel
          Left = 16
          Top = 16
          Width = 81
          Height = 13
          Caption = #29677' '#32423' '#20195' '#30721#65306#12288
        end
        object Label4: TLabel
          Left = 200
          Top = 16
          Width = 81
          Height = 13
          Caption = #29677' '#32423' '#21517' '#31216#65306#12288
        end
        object Label5: TLabel
          Left = 456
          Top = 16
          Width = 60
          Height = 13
          Caption = #20307#32946#25945#24072#65306
        end
        object Label6: TLabel
          Left = 16
          Top = 64
          Width = 69
          Height = 13
          Caption = #20837' '#23398' '#24180' '#38480#65306
        end
        object Label7: TLabel
          Left = 200
          Top = 64
          Width = 81
          Height = 13
          Caption = #23398' '#21046' '#31867' '#22411#65306#12288
        end
        object Label8: TLabel
          Left = 456
          Top = 64
          Width = 81
          Height = 13
          Caption = #25152' '#23646' '#38498' '#31995#65306#12288
        end
        object ebjdm: TEdit
          Left = 99
          Top = 13
          Width = 70
          Height = 19
          Ctl3D = False
          MaxLength = 8
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnEnter = ebjdmEnter
          OnKeyDown = ebjdmKeyDown
          OnKeyPress = ebjdmKeyPress
        end
        object ebjmc: TEdit
          Left = 296
          Top = 12
          Width = 129
          Height = 19
          Ctl3D = False
          MaxLength = 30
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 1
          OnKeyDown = ebjmcKeyDown
          OnKeyPress = ebjmcKeyPress
        end
        object ebzr: TEdit
          Left = 528
          Top = 12
          Width = 121
          Height = 19
          Ctl3D = False
          MaxLength = 10
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 2
          OnKeyDown = ebzrKeyDown
          OnKeyPress = ebzrKeyPress
        end
        object ComboBox2: TComboBox
          Left = 98
          Top = 59
          Width = 73
          Height = 21
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 3
          Text = #19968#24180
          OnKeyDown = ComboBox2KeyDown
          OnKeyPress = ComboBox2KeyPress
          Items.Strings = (
            #19968#24180
            #20108#24180
            #19977#24180
            #22235#24180
            #20116#24180)
        end
        object cssyx: TComboBox
          Left = 528
          Top = 58
          Width = 121
          Height = 21
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 4
          OnEnter = cssyxEnter
          OnKeyDown = cssyxKeyDown
          OnKeyPress = cssyxKeyPress
        end
        object xuezhileixing: TComboBox
          Left = 296
          Top = 58
          Width = 129
          Height = 21
          ItemHeight = 13
          PopupMenu = PopupMenu1
          TabOrder = 5
          Text = #20013#19987
          OnKeyDown = xuezhileixingKeyDown
          OnKeyPress = xuezhileixingKeyPress
          Items.Strings = (
            #20013#19987
            #39640#20013
            #22823#19987
            #22823#23398
            #20116#24180#21046#39640#32844
            #19977#24180#21046#39640#32844)
        end
      end
      object xueshenggro: TGroupBox
        Left = 8
        Top = 217
        Width = 665
        Height = 96
        TabOrder = 5
        Visible = False
        object Label9: TLabel
          Left = 8
          Top = 16
          Width = 81
          Height = 13
          Caption = #23398' '#29983' '#32534' '#21495#65306#12288
        end
        object Label10: TLabel
          Left = 456
          Top = 16
          Width = 81
          Height = 13
          Caption = #23398' '#29983' '#22995' '#21517#65306#12288
        end
        object Label11: TLabel
          Left = 8
          Top = 56
          Width = 81
          Height = 13
          Caption = #23398' '#29983' '#24615' '#21035#65306#12288
        end
        object Label12: TLabel
          Left = 456
          Top = 56
          Width = 81
          Height = 13
          Caption = #25152' '#23646' '#29677' '#32423#65306#12288
        end
        object Label13: TLabel
          Left = 246
          Top = 19
          Width = 72
          Height = 13
          Caption = #20986#29983#26085#26399#65306#12288
        end
        object Label14: TLabel
          Left = 246
          Top = 54
          Width = 72
          Height = 13
          Caption = #25152#23646#27665#26063#65306#12288
        end
        object exsbh: TEdit
          Left = 96
          Top = 12
          Width = 97
          Height = 19
          Ctl3D = False
          MaxLength = 8
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnKeyDown = exsbhKeyDown
          OnKeyPress = exsbhKeyPress
        end
        object exsxm: TEdit
          Left = 552
          Top = 13
          Width = 97
          Height = 19
          Ctl3D = False
          MaxLength = 15
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 2
          OnKeyDown = exsxmKeyDown
          OnKeyPress = exsxmKeyPress
        end
        object cxsxb: TComboBox
          Left = 96
          Top = 51
          Width = 97
          Height = 21
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 3
          Text = #30007
          OnKeyDown = cxsxbKeyDown
          OnKeyPress = cxsxbKeyPress
          Items.Strings = (
            #30007
            #22899)
        end
        object cssbj: TComboBox
          Left = 552
          Top = 52
          Width = 97
          Height = 21
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 5
          OnEnter = cssbjEnter
          OnKeyDown = cssbjKeyDown
          OnKeyPress = cssbjKeyPress
        end
        object minzu: TComboBox
          Left = 320
          Top = 51
          Width = 97
          Height = 21
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 4
          OnKeyDown = minzuKeyDown
          OnKeyPress = minzuKeyPress
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
            #22522#35834#26063)
        end
        object chusheng: TMaskEdit
          Left = 320
          Top = 16
          Width = 91
          Height = 19
          Ctl3D = False
          EditMask = '!9999/99/99;1;_'
          MaxLength = 10
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 1
          Text = '2000-01-01'
          OnExit = chushengExit
          OnKeyDown = chushengKeyDown
        end
      end
      object ComboBox3: TComboBox
        Left = 368
        Top = 9
        Width = 121
        Height = 21
        ItemHeight = 13
        TabOrder = 6
        Text = #38498#31995#36873#25321
        Visible = False
        OnChange = ComboBox3Change
        OnEnter = ComboBox3Enter
      end
      object ComboBox4: TComboBox
        Left = 368
        Top = 9
        Width = 121
        Height = 21
        ItemHeight = 13
        TabOrder = 7
        Text = #29677#32423#36873#25321
        Visible = False
        OnChange = ComboBox4Change
        OnEnter = ComboBox4Enter
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 288
    Top = 112
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
    Left = 80
    Top = 128
  end
  object PopupMenu2: TPopupMenu
    Left = 488
    Top = 104
    object N1: TMenuItem
      Caption = #28155#21152#25968#25454
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500#25968#25454
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #20462#25913#25968#25454
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #28165#31354#25968#25454
      OnClick = N4Click
    end
  end
end
