object biaozhunform: Tbiaozhunform
  Left = 125
  Top = 149
  AutoScroll = False
  BorderIcons = []
  Caption = #26631#20934#24211#31649#29702
  ClientHeight = 457
  ClientWidth = 819
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
    Width = 819
    Height = 439
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 48
      Height = 13
      Caption = #31561#32423#65306#12288
    end
    object Label2: TLabel
      Left = 259
      Top = 12
      Width = 48
      Height = 13
      Caption = #20998#32452#65306#12288
    end
    object Label3: TLabel
      Left = 512
      Top = 14
      Width = 48
      Height = 13
      Caption = #39033#30446#65306#12288
    end
    object cdengji: TComboBox
      Left = 60
      Top = 9
      Width = 145
      Height = 21
      ItemHeight = 13
      PopupMenu = PopupMenu1
      TabOrder = 0
      OnChange = cdengjiChange
      OnKeyPress = cdengjiKeyPress
      Items.Strings = (
        #39640#19968#31561#32423
        #39640#20108#31561#32423
        #39640#19977#31561#32423
        #22823#23398#32423)
    end
    object cfenzu: TComboBox
      Left = 304
      Top = 9
      Width = 145
      Height = 21
      Enabled = False
      ItemHeight = 13
      PopupMenu = PopupMenu1
      TabOrder = 1
      OnChange = cfenzuChange
      OnKeyPress = cfenzuKeyPress
      Items.Strings = (
        #36523#39640#26631#20934#20307#37325#30007#32452
        #36523#39640#26631#20934#20307#37325#22899#32452
        #24179#20998#26631#20934#30007#32452
        #24179#20998#26631#20934#22899#32452)
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 30
      Width = 783
      Height = 211
      TabOrder = 2
      object DBGrid1: TDBGrid
        Left = 0
        Top = 8
        Width = 777
        Height = 196
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = PopupMenu2
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 2
      Top = 240
      Width = 783
      Height = 185
      TabOrder = 3
      object gsgnan: TGroupBox
        Left = 0
        Top = 6
        Width = 297
        Height = 179
        Caption = #36523#39640#26631#20934#20307#37325
        Enabled = False
        PopupMenu = PopupMenu2
        TabOrder = 0
        object Label4: TLabel
          Left = 4
          Top = 27
          Width = 90
          Height = 13
          Caption = #36523#39640#27573'('#21400#31859')'#65306#12288
        end
        object Label5: TLabel
          Left = 4
          Top = 51
          Width = 72
          Height = 13
          Caption = #20307#37325#27573#19968#65306#12288
        end
        object Label6: TLabel
          Left = 4
          Top = 78
          Width = 72
          Height = 13
          Caption = #20307#37325#27573#20108#65306#12288
        end
        object Label7: TLabel
          Left = 4
          Top = 103
          Width = 72
          Height = 13
          Caption = #20307#37325#27573#19977#65306#12288
        end
        object Label8: TLabel
          Left = 4
          Top = 129
          Width = 72
          Height = 13
          Caption = #20307#37325#27573#22235#65306#12288
        end
        object Label9: TLabel
          Left = 4
          Top = 155
          Width = 72
          Height = 13
          Caption = #20307#37325#27573#20116#65306#12288
        end
        object Label10: TLabel
          Left = 171
          Top = 51
          Width = 48
          Height = 13
          Caption = #20998#20540#65306#12288
        end
        object Label11: TLabel
          Left = 171
          Top = 78
          Width = 48
          Height = 13
          Caption = #20998#20540#65306#12288
        end
        object Label12: TLabel
          Left = 171
          Top = 103
          Width = 48
          Height = 13
          Caption = #20998#20540#65306#12288
        end
        object Label13: TLabel
          Left = 171
          Top = 129
          Width = 48
          Height = 13
          Caption = #20998#20540#65306#12288
        end
        object Label14: TLabel
          Left = 171
          Top = 155
          Width = 48
          Height = 13
          Caption = #20998#20540#65306#12288
        end
        object Edit1: TEdit
          Left = 88
          Top = 24
          Width = 81
          Height = 19
          Ctl3D = False
          MaxLength = 5
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
          OnKeyPress = Edit1KeyPress
        end
        object Edit2: TEdit
          Left = 88
          Top = 48
          Width = 81
          Height = 19
          Ctl3D = False
          MaxLength = 4
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 1
          OnExit = Edit2Exit
          OnKeyDown = Edit2KeyDown
          OnKeyPress = Edit2KeyPress
        end
        object Edit3: TEdit
          Left = 88
          Top = 73
          Width = 81
          Height = 19
          Ctl3D = False
          MaxLength = 4
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 2
          OnExit = Edit3Exit
          OnKeyDown = Edit3KeyDown
          OnKeyPress = Edit3KeyPress
        end
        object Edit4: TEdit
          Left = 88
          Top = 99
          Width = 81
          Height = 19
          Ctl3D = False
          MaxLength = 4
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 3
          OnExit = Edit4Exit
          OnKeyDown = Edit4KeyDown
          OnKeyPress = Edit4KeyPress
        end
        object Edit5: TEdit
          Left = 88
          Top = 125
          Width = 81
          Height = 19
          Ctl3D = False
          MaxLength = 4
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 4
          OnExit = Edit5Exit
          OnKeyDown = Edit5KeyDown
          OnKeyPress = Edit5KeyPress
        end
        object Edit6: TEdit
          Left = 88
          Top = 151
          Width = 81
          Height = 19
          Ctl3D = False
          MaxLength = 4
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 5
          OnExit = Edit6Exit
          OnKeyDown = Edit6KeyDown
          OnKeyPress = Edit6KeyPress
        end
        object Edit7: TEdit
          Left = 211
          Top = 48
          Width = 81
          Height = 19
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 6
          OnExit = Edit7Exit
          OnKeyDown = Edit7KeyDown
          OnKeyPress = Edit7KeyPress
        end
        object Edit8: TEdit
          Left = 211
          Top = 73
          Width = 81
          Height = 19
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 7
          OnExit = Edit8Exit
          OnKeyDown = Edit8KeyDown
          OnKeyPress = Edit8KeyPress
        end
        object Edit9: TEdit
          Left = 211
          Top = 98
          Width = 81
          Height = 19
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 8
          OnExit = Edit9Exit
          OnKeyDown = Edit9KeyDown
          OnKeyPress = Edit9KeyPress
        end
        object Edit10: TEdit
          Left = 211
          Top = 124
          Width = 81
          Height = 19
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 9
          OnExit = Edit10Exit
          OnKeyDown = Edit10KeyDown
          OnKeyPress = Edit10KeyPress
        end
        object Edit11: TEdit
          Left = 211
          Top = 151
          Width = 81
          Height = 19
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 10
          OnExit = Edit11Exit
          OnKeyDown = Edit11KeyDown
          OnKeyPress = Edit11KeyPress
        end
      end
      object gbznan: TGroupBox
        Left = 304
        Top = 6
        Width = 257
        Height = 179
        Caption = #24179#20998#26631#20934
        Enabled = False
        TabOrder = 1
        object Label15: TLabel
          Left = 16
          Top = 32
          Width = 72
          Height = 13
          Caption = #27979#35797#39033#30446#65306#12288
        end
        object Label16: TLabel
          Left = 16
          Top = 64
          Width = 60
          Height = 13
          Caption = #19978#38480#20540#65306#12288
        end
        object Label17: TLabel
          Left = 16
          Top = 96
          Width = 48
          Height = 13
          Caption = #25104#32489#65306#12288
        end
        object Label18: TLabel
          Left = 16
          Top = 128
          Width = 36
          Height = 13
          Caption = #31561#32423#65306
        end
        object ComboBox1: TComboBox
          Left = 88
          Top = 26
          Width = 145
          Height = 21
          ItemHeight = 13
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnChange = ComboBox1Change
          OnKeyDown = ComboBox1KeyDown
          OnKeyPress = ComboBox1KeyPress
          Items.Strings = (
            '50'#31859#36305
            '800'#31859#36305
            '1000'#31859#36305
            #31435#23450#36339#36828
            #22352#31435#20307#21069#23624
            #25569#21147#20307#37325#25351#25968
            #32954#27963#37327#20307#37325#25351#25968
            #20208#21351#36215#22352)
        end
        object Edit12: TEdit
          Left = 88
          Top = 61
          Width = 142
          Height = 19
          Ctl3D = False
          MaxLength = 8
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 1
          OnExit = Edit12Exit
          OnKeyDown = Edit12KeyDown
          OnKeyPress = Edit12KeyPress
        end
        object ComboBox2: TComboBox
          Left = 88
          Top = 126
          Width = 145
          Height = 21
          ItemHeight = 13
          PopupMenu = PopupMenu1
          TabOrder = 3
          OnKeyDown = ComboBox2KeyDown
          OnKeyPress = ComboBox2KeyPress
          Items.Strings = (
            #20248
            #33391
            #21450#26684
            #19981#21450#26684)
        end
        object Edit13: TEdit
          Left = 88
          Top = 94
          Width = 142
          Height = 19
          Ctl3D = False
          MaxLength = 3
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 2
          OnExit = Edit13Exit
          OnKeyDown = Edit13KeyDown
          OnKeyPress = Edit13KeyPress
        end
      end
      object Panel1: TPanel
        Left = 568
        Top = 11
        Width = 209
        Height = 169
        BevelOuter = bvLowered
        TabOrder = 2
        object Bevel1: TBevel
          Left = 0
          Top = 15
          Width = 209
          Height = 27
        end
        object Bevel2: TBevel
          Left = 0
          Top = 69
          Width = 209
          Height = 27
        end
        object Bevel3: TBevel
          Left = 0
          Top = 120
          Width = 209
          Height = 27
        end
        object BitBtn1: TBitBtn
          Left = 16
          Top = 16
          Width = 75
          Height = 25
          Caption = #28155#21152#25968#25454
          Enabled = False
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 112
          Top = 16
          Width = 75
          Height = 25
          Caption = #21024#38500#25968#25454
          Enabled = False
          TabOrder = 1
          OnClick = BitBtn2Click
        end
        object BitBtn3: TBitBtn
          Left = 16
          Top = 70
          Width = 75
          Height = 25
          Caption = #20462#25913#25968#25454
          Enabled = False
          TabOrder = 2
          OnClick = BitBtn3Click
        end
        object BitBtn5: TBitBtn
          Left = 112
          Top = 70
          Width = 75
          Height = 25
          Caption = #28165#31354#25968#25454
          Enabled = False
          TabOrder = 3
          OnClick = BitBtn5Click
        end
        object BitBtn6: TBitBtn
          Left = 112
          Top = 121
          Width = 75
          Height = 25
          Caption = #36864#20986#31649#29702
          TabOrder = 5
          OnClick = BitBtn6Click
        end
        object BitBtn8: TBitBtn
          Left = 16
          Top = 121
          Width = 75
          Height = 25
          Caption = #20869#23481#28165#38500
          TabOrder = 4
          OnClick = BitBtn8Click
        end
      end
    end
    object cguolv: TComboBox
      Left = 560
      Top = 10
      Width = 129
      Height = 21
      Enabled = False
      ItemHeight = 13
      PopupMenu = PopupMenu1
      TabOrder = 4
      OnChange = cguolvChange
      OnKeyPress = cguolvKeyPress
      Items.Strings = (
        '50'#31859#36305
        '800'#31859#36305
        '1000'#31859#36305
        #31435#23450#36339#36828
        #22352#31435#20307#21069#23624
        #25569#21147#20307#37325#25351#25968
        #32954#27963#37327#20307#37325#25351#25968
        #20208#21351#36215#22352)
    end
    object BitBtn7: TBitBtn
      Left = 717
      Top = 9
      Width = 67
      Height = 23
      Caption = #23436#20840#26174#31034
      Enabled = False
      TabOrder = 5
      OnClick = BitBtn7Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 439
    Width = 819
    Height = 18
    Panels = <
      item
        Text = '      '#27880#24847#65306#39640#19968#32423#65292' '#39640#20108#32423#65292' '#39640#19977#32423#65292' '#20351#29992#30456#21516#30340#36523#39640#26631#20934#20307#37325#34920#25968#25454#65288#30007#32452'-'#22899#32452#65289
        Width = 50
      end>
    SimplePanel = False
  end
  object PopupMenu1: TPopupMenu
    Left = 229
    Top = 6
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
    Left = 136
    Top = 72
  end
  object PopupMenu2: TPopupMenu
    Left = 616
    Top = 48
    object N1: TMenuItem
      Caption = #28155#21152#25968#25454
      Enabled = False
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500#25968#25454
      Enabled = False
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #20462#25913#25968#25454
      Enabled = False
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #28165#31354#25968#25454
      Enabled = False
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #25554#20837#25968#25454
      Enabled = False
      OnClick = N6Click
    end
  end
end
