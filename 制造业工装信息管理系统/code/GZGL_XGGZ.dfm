object FrmGZGL_XGGZ: TFrmGZGL_XGGZ
  Left = 104
  Top = 129
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FrmGZGL_XGGZ'
  ClientHeight = 379
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel2: TPanel
    Left = 0
    Top = 85
    Width = 680
    Height = 276
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 445
      Height = 276
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 17
        Top = 40
        Width = 48
        Height = 12
        Caption = #24037#35013#32534#21495
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 17
        Top = 63
        Width = 48
        Height = 12
        Caption = #24037#35013#21517#31216
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 17
        Top = 87
        Width = 48
        Height = 12
        Caption = #20219#21153#20070#21495
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 5
        Top = 108
        Width = 60
        Height = 12
        Caption = #20219#21153#25968#26085#26399
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 17
        Top = 134
        Width = 48
        Height = 12
        Caption = #35746#36135#21333#20301
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 17
        Top = 157
        Width = 48
        Height = 12
        Caption = #35746#36135#26085#26399
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 17
        Top = 181
        Width = 48
        Height = 12
        Caption = #35746#36135#25968#37327
        FocusControl = DBEdit7
      end
      object Label8: TLabel
        Left = 18
        Top = 204
        Width = 48
        Height = 12
        Caption = #35774#35745#21333#20301
        FocusControl = DBEdit8
      end
      object Label9: TLabel
        Left = 232
        Top = 37
        Width = 48
        Height = 12
        Caption = #21046#36896#21333#20301
        FocusControl = DBEdit9
      end
      object Label10: TLabel
        Left = 232
        Top = 60
        Width = 48
        Height = 12
        Caption = #20351#29992#21333#20301
        FocusControl = DBEdit10
      end
      object Label11: TLabel
        Left = 232
        Top = 83
        Width = 48
        Height = 12
        Caption = #23436#24037#26085#26399
        FocusControl = DBEdit11
      end
      object Label12: TLabel
        Left = 232
        Top = 106
        Width = 48
        Height = 12
        Caption = #39564#35777#26085#26399
        FocusControl = DBEdit12
      end
      object Label13: TLabel
        Left = 256
        Top = 129
        Width = 24
        Height = 12
        Caption = #24037#26102
        FocusControl = DBEdit13
      end
      object Label14: TLabel
        Left = 256
        Top = 152
        Width = 24
        Height = 12
        Caption = #20135#20540
        FocusControl = DBEdit14
      end
      object Label15: TLabel
        Left = 41
        Top = 228
        Width = 24
        Height = 12
        Caption = #22791#27880
        FocusControl = DBEdit15
      end
      object Label28: TLabel
        Left = 233
        Top = 175
        Width = 48
        Height = 12
        Caption = #36710#22411#24635#25104
        FocusControl = DBEdit25
      end
      object Label29: TLabel
        Left = 256
        Top = 199
        Width = 24
        Height = 12
        Caption = #29366#24577
        FocusControl = DBEdit26
      end
      object Panel4: TPanel
        Left = 2
        Top = 2
        Width = 441
        Height = 22
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #24037#35013#20449#24687
        TabOrder = 17
      end
      object DBEdit1: TDBEdit
        Left = 76
        Top = 34
        Width = 140
        Height = 20
        DataField = 'GZBH'
        DataSource = dmd.Src_GZ
        TabOrder = 0
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit2: TDBEdit
        Left = 76
        Top = 57
        Width = 140
        Height = 20
        DataField = 'GZMC'
        DataSource = dmd.Src_GZ
        TabOrder = 1
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit3: TDBEdit
        Left = 76
        Top = 81
        Width = 140
        Height = 20
        DataField = 'RWSH'
        DataSource = dmd.Src_GZ
        TabOrder = 2
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit4: TDBEdit
        Left = 76
        Top = 105
        Width = 140
        Height = 20
        DataField = 'RWRQ'
        DataSource = dmd.Src_GZ
        TabOrder = 3
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit5: TDBEdit
        Left = 76
        Top = 128
        Width = 140
        Height = 20
        DataField = 'DHDW'
        DataSource = dmd.Src_GZ
        TabOrder = 4
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit6: TDBEdit
        Left = 76
        Top = 152
        Width = 140
        Height = 20
        DataField = 'DHRQ'
        DataSource = dmd.Src_GZ
        TabOrder = 5
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit7: TDBEdit
        Left = 76
        Top = 176
        Width = 140
        Height = 20
        DataField = 'DHSL'
        DataSource = dmd.Src_GZ
        TabOrder = 6
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit8: TDBEdit
        Left = 76
        Top = 200
        Width = 140
        Height = 20
        DataField = 'SJDW'
        DataSource = dmd.Src_GZ
        TabOrder = 7
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit9: TDBEdit
        Left = 290
        Top = 32
        Width = 140
        Height = 20
        DataField = 'ZZDW'
        DataSource = dmd.Src_GZ
        TabOrder = 8
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit10: TDBEdit
        Left = 290
        Top = 55
        Width = 140
        Height = 20
        DataField = 'SYDW'
        DataSource = dmd.Src_GZ
        TabOrder = 9
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit11: TDBEdit
        Left = 290
        Top = 78
        Width = 140
        Height = 20
        DataField = 'WGRQ'
        DataSource = dmd.Src_GZ
        TabOrder = 10
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit12: TDBEdit
        Left = 290
        Top = 101
        Width = 140
        Height = 20
        DataField = 'YZRQ'
        DataSource = dmd.Src_GZ
        TabOrder = 11
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit13: TDBEdit
        Left = 290
        Top = 124
        Width = 140
        Height = 20
        DataField = 'GS'
        DataSource = dmd.Src_GZ
        TabOrder = 12
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit14: TDBEdit
        Left = 290
        Top = 147
        Width = 140
        Height = 20
        DataField = 'CZ'
        DataSource = dmd.Src_GZ
        TabOrder = 13
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit15: TDBEdit
        Left = 76
        Top = 222
        Width = 269
        Height = 20
        DataField = 'BZ'
        DataSource = dmd.Src_GZ
        TabOrder = 16
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit25: TDBEdit
        Left = 290
        Top = 170
        Width = 140
        Height = 20
        DataField = 'LB'
        DataSource = dmd.Src_GZ
        TabOrder = 14
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object DBEdit26: TDBEdit
        Left = 290
        Top = 194
        Width = 140
        Height = 20
        DataField = 'ZT'
        DataSource = dmd.Src_GZ
        TabOrder = 15
        OnEnter = Edt_cxEnter
        OnKeyPress = Edt_cxKeyPress
      end
      object Panel8: TPanel
        Left = 33
        Top = 248
        Width = 377
        Height = 25
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Panel8'
        TabOrder = 18
        object DBNavigator2: TDBNavigator
          Left = 2
          Top = 2
          Width = 373
          Height = 21
          DataSource = dmd.Src_GZ
          VisibleButtons = [nbPrior, nbNext, nbInsert, nbPost, nbCancel]
          Align = alClient
          Flat = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
      end
    end
    object Panel5: TPanel
      Left = 445
      Top = 0
      Width = 235
      Height = 276
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Panel5'
      TabOrder = 1
      object DBGrid2: TDBGrid
        Left = 2
        Top = 22
        Width = 231
        Height = 234
        TabStop = False
        Align = alClient
        DataSource = dmd.Src_GZCP2
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
      end
      object Panel6: TPanel
        Left = 2
        Top = 2
        Width = 231
        Height = 20
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #24037#35013#24212#29992#24773#20917
        TabOrder = 1
      end
      object DBNavigator1: TDBNavigator
        Left = 2
        Top = 256
        Width = 231
        Height = 18
        DataSource = dmd.Src_GZCP2
        VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
        Align = alBottom
        Flat = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 48
    Align = alTop
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 2
    object Label16: TLabel
      Left = 28
      Top = 12
      Width = 91
      Height = 14
      Caption = #20462#25913#24037#35013#20449#24687
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Image1: TImage
      Left = 529
      Top = 1
      Width = 150
      Height = 46
      Align = alRight
      AutoSize = True
      Stretch = True
    end
    object Label18: TLabel
      Left = 60
      Top = 30
      Width = 324
      Height = 12
      Caption = #36755#20837#35201#20462#25913#24037#35013#30340#32534#21495#65292#23450#20301#21518#20462#25913#24037#35013#20449#24687#12289#24037#35013#24212#29992#20449#24687
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 48
    Width = 680
    Height = 37
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label17: TLabel
      Left = 14
      Top = 13
      Width = 84
      Height = 12
      Caption = #35831#36755#20837#24037#35013#32534#21495
    end
    object btn_cx: TSpeedButton
      Left = 271
      Top = 6
      Width = 93
      Height = 25
      Caption = #23450' '#20301
      Flat = True
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7CC618C618C618C618C618C618C618C618C618C618
        1F7C1F7C1F7C1F7C1F7CC6181042D65A7B6F7B6F7B6F7B6F7B6F7B6F3967C618
        841084101F7C1F7CC618DE7B2925D65A9C739C739C739C739C739C738C31206D
        A47EC0488410C618104229258C319C739C73DE7BDE7BDE7BDE7B8C31206D517F
        317E206D8410C6187B6F9C739C739C739C737B6FB556B5568C31206D517F317E
        206D84101F7CC6189C739C739C731863AD352925292529252925517F317E206D
        84101F7C1F7CC6189C739C731863AD351F371F371F37FF263F36447D206D8410
        1F7C1F7C1F7CC6189C731863AD35B5569F5BFF47FF471F37FF263F362925C618
        1F7C1F7C1F7CC6189C731863AD359F5BFF6BFF5BFF47FF471F37FF262925C618
        1F7C1F7C1F7CC6189C731863AD359F5BFF6BFF5BFF5BFF47FF47FF262925C618
        1F7C1F7C1F7CC6189C731863AD359F5BFF6BFF5BFF5BFF5BFF47FF262925C618
        1F7C1F7C1F7CC6189C737B6FAD3518639F5BFF6BFF5BFF5B9F5BB5562925C618
        1F7C1F7C1F7CC6189C737B6F1863AD3518639F5B9F5B9F5BB55684101863C618
        1F7C1F7C1F7CC6189C737B6F7B6F1863AD35AD35AD35AD35AD3518639C73C618
        1F7C1F7C1F7CC618DE7B9C739C739C739C7318631863186318639C739C73C618
        1F7C1F7C1F7CC618C618C618C618C618C618C618C618C618C618C618C618C618
        1F7C1F7C1F7C}
      OnClick = btn_cxClick
    end
    object Btn_exit: TSpeedButton
      Left = 394
      Top = 6
      Width = 93
      Height = 25
      Caption = #36864' '#20986
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        00001B1BCB000807BE000807BE0000000000FF00FF00FF00FF00000000000505
        BC000505BC0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000393ADF005F5FF8004B4CEA0000000000FF00FF00000000001313C5006867
        FD006B6BFF002827D30000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000504FED006464FA006B6BFF004343E500000000001313C5005B5BF5006B6B
        FF006B6BFF00393ADF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000393ADF005B5BF5005B5BF5006867FD004343E5005B5BF5006464FA006867
        FD005F5FF800201FCD0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000000000393ADF005352EF005555F100605FF8006464FA005555F1006464
        FA004B4CEA00201FCD0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000393ADF00504FED005352EF005555F1006464FA004B4C
        EA00201FCD0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000004B4CEA004343E5004B4CEA004B4CEA004B4C
        EA00201FCD0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000004343E500393ADF004343E5004343E5004B4C
        EA004343E50000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000504FED002D2DD6003738DD00393ADF004343
        E5004343E5001B1BCB0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000000003434DB003434DB002D2DD6003434DB003434DB003434
        DB003D3DE1004343E5001313C50000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000000003434DB003434DB002222CF002827D300504FED004343
        E5003434DB003738DD003738DD001313C50000000000FF00FF00FF00FF00FF00
        FF00000000005352EF00393ADF001B1BCB003434DB003D3DE100000000002D2D
        D6003D3DE1003434DB004343E5001313C50000000000FF00FF00FF00FF00FF00
        FF0000000000504FED004343E5004343E5004343E5003434DB00000000000000
        00002222CF00393ADF003D3DE1002D2DD60000000000FF00FF00FF00FF00FF00
        FF00FF00FF0000000000504FED004B4CEA004B4CEA0000000000FF00FF00FF00
        FF0000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      OnClick = Btn_exitClick
    end
    object Edt_cx: TEdit
      Left = 103
      Top = 9
      Width = 133
      Height = 20
      CharCase = ecUpperCase
      TabOrder = 0
      Text = 'EDT_CX'
      OnEnter = Edt_cxEnter
      OnKeyPress = Edt_cxKeyPress
    end
  end
end
