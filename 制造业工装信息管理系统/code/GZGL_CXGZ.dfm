object FrmGZGL_CXGZ: TFrmGZGL_CXGZ
  Left = 64
  Top = 99
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FrmGZGL_CXGZ'
  ClientHeight = 439
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 706
    Height = 48
    Align = alTop
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 0
    object Label16: TLabel
      Left = 28
      Top = 12
      Width = 91
      Height = 14
      Caption = #26597#35810#24037#35013#20449#24687
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Image1: TImage
      Left = 555
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
      Width = 336
      Height = 12
      Caption = #36755#20837#24037#35013#32534#21495#26597#35810#24037#35013#20449#24687#12289#24037#35013#24212#29992#20449#24687#12289#25152#24212#29992#30340#20135#21697#20449#24687
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 85
    Width = 706
    Height = 252
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 468
      Height = 248
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel3'
      TabOrder = 0
      object Pag1: TPageControl
        Left = 0
        Top = 0
        Width = 468
        Height = 248
        ActivePage = TabSheet1
        Align = alClient
        TabIndex = 0
        TabOrder = 0
        TabWidth = 80
        object TabSheet1: TTabSheet
          Caption = #24037#35013#20449#24687
          object DBCtrlGrid1: TDBCtrlGrid
            Left = 0
            Top = 0
            Width = 460
            Height = 221
            Align = alClient
            AllowDelete = False
            AllowInsert = False
            ColCount = 1
            DataSource = dmd.Src_GZ
            PanelBorder = gbNone
            PanelHeight = 221
            PanelWidth = 442
            TabOrder = 0
            RowCount = 1
            object Label1: TLabel
              Left = 21
              Top = 14
              Width = 48
              Height = 12
              Caption = #24037#35013#32534#21495
              FocusControl = DBEdit1
            end
            object Label2: TLabel
              Left = 21
              Top = 37
              Width = 48
              Height = 12
              Caption = #24037#35013#21517#31216
              FocusControl = DBEdit2
            end
            object Label3: TLabel
              Left = 21
              Top = 61
              Width = 48
              Height = 12
              Caption = #20219#21153#20070#21495
              FocusControl = DBEdit3
            end
            object Label4: TLabel
              Left = 9
              Top = 84
              Width = 60
              Height = 12
              Caption = #20219#21153#25968#26085#26399
              FocusControl = DBEdit4
            end
            object Label5: TLabel
              Left = 21
              Top = 108
              Width = 48
              Height = 12
              Caption = #35746#36135#21333#20301
              FocusControl = DBEdit5
            end
            object Label6: TLabel
              Left = 21
              Top = 131
              Width = 48
              Height = 12
              Caption = #35746#36135#26085#26399
              FocusControl = DBEdit6
            end
            object Label7: TLabel
              Left = 21
              Top = 155
              Width = 48
              Height = 12
              Caption = #35746#36135#25968#37327
              FocusControl = DBEdit7
            end
            object Label8: TLabel
              Left = 22
              Top = 178
              Width = 48
              Height = 12
              Caption = #35774#35745#21333#20301
              FocusControl = DBEdit8
            end
            object Label9: TLabel
              Left = 236
              Top = 11
              Width = 48
              Height = 12
              Caption = #21046#36896#21333#20301
              FocusControl = DBEdit9
            end
            object Label10: TLabel
              Left = 236
              Top = 34
              Width = 48
              Height = 12
              Caption = #20351#29992#21333#20301
              FocusControl = DBEdit10
            end
            object Label11: TLabel
              Left = 236
              Top = 57
              Width = 48
              Height = 12
              Caption = #23436#24037#26085#26399
              FocusControl = DBEdit11
            end
            object Label12: TLabel
              Left = 236
              Top = 80
              Width = 48
              Height = 12
              Caption = #39564#35777#26085#26399
              FocusControl = DBEdit12
            end
            object Label13: TLabel
              Left = 260
              Top = 103
              Width = 24
              Height = 12
              Caption = #24037#26102
              FocusControl = DBEdit13
            end
            object Label14: TLabel
              Left = 260
              Top = 126
              Width = 24
              Height = 12
              Caption = #20135#20540
              FocusControl = DBEdit14
            end
            object Label15: TLabel
              Left = 45
              Top = 202
              Width = 24
              Height = 12
              Caption = #22791#27880
              FocusControl = DBEdit15
            end
            object Label28: TLabel
              Left = 260
              Top = 149
              Width = 24
              Height = 12
              Caption = #31867#21035
              FocusControl = DBEdit25
            end
            object Label29: TLabel
              Left = 260
              Top = 173
              Width = 24
              Height = 12
              Caption = #29366#24577
              FocusControl = DBEdit26
            end
            object DBEdit1: TDBEdit
              Left = 80
              Top = 8
              Width = 140
              Height = 20
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              DataField = 'GZBH'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 80
              Top = 31
              Width = 140
              Height = 20
              BorderStyle = bsNone
              DataField = 'GZMC'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 80
              Top = 55
              Width = 140
              Height = 20
              BorderStyle = bsNone
              DataField = 'RWSH'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit4: TDBEdit
              Left = 80
              Top = 79
              Width = 140
              Height = 20
              BorderStyle = bsNone
              DataField = 'RWRQ'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit5: TDBEdit
              Left = 80
              Top = 102
              Width = 140
              Height = 20
              BorderStyle = bsNone
              DataField = 'DHDW'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit6: TDBEdit
              Left = 80
              Top = 126
              Width = 140
              Height = 20
              BorderStyle = bsNone
              DataField = 'DHRQ'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 5
            end
            object DBEdit7: TDBEdit
              Left = 80
              Top = 150
              Width = 140
              Height = 20
              BorderStyle = bsNone
              DataField = 'DHSL'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 6
            end
            object DBEdit8: TDBEdit
              Left = 80
              Top = 174
              Width = 140
              Height = 20
              BorderStyle = bsNone
              DataField = 'SJDW'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 7
            end
            object DBEdit9: TDBEdit
              Left = 294
              Top = 6
              Width = 140
              Height = 20
              BorderStyle = bsNone
              DataField = 'ZZDW'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 8
            end
            object DBEdit10: TDBEdit
              Left = 294
              Top = 29
              Width = 140
              Height = 20
              BorderStyle = bsNone
              DataField = 'SYDW'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 9
            end
            object DBEdit11: TDBEdit
              Left = 294
              Top = 52
              Width = 140
              Height = 20
              BorderStyle = bsNone
              DataField = 'WGRQ'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 10
            end
            object DBEdit12: TDBEdit
              Left = 294
              Top = 75
              Width = 140
              Height = 20
              BorderStyle = bsNone
              DataField = 'YZRQ'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 11
            end
            object DBEdit13: TDBEdit
              Left = 294
              Top = 98
              Width = 140
              Height = 20
              BorderStyle = bsNone
              DataField = 'GS'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 12
            end
            object DBEdit14: TDBEdit
              Left = 294
              Top = 121
              Width = 140
              Height = 20
              BorderStyle = bsNone
              DataField = 'CZ'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 13
            end
            object DBEdit15: TDBEdit
              Left = 80
              Top = 196
              Width = 269
              Height = 20
              BorderStyle = bsNone
              DataField = 'BZ'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 14
            end
            object DBEdit25: TDBEdit
              Left = 294
              Top = 144
              Width = 140
              Height = 20
              BorderStyle = bsNone
              DataField = 'LB'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 15
            end
            object DBEdit26: TDBEdit
              Left = 294
              Top = 168
              Width = 140
              Height = 20
              BorderStyle = bsNone
              DataField = 'ZT'
              DataSource = dmd.Src_GZ
              ReadOnly = True
              TabOrder = 16
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = #27169#31946#21305#37197
          ImageIndex = 1
          object Grd_gz: TDBGrid
            Left = 0
            Top = 0
            Width = 460
            Height = 221
            Align = alClient
            DataSource = dmd.SrcQry_GZ
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnDblClick = Grd_gzDblClick
          end
        end
      end
    end
    object Panel5: TPanel
      Left = 470
      Top = 2
      Width = 234
      Height = 248
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel5'
      TabOrder = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 20
        Width = 234
        Height = 228
        Align = alClient
        DataSource = dmd.Src_GZCP2
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 234
        Height = 20
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #24037#35013#24212#29992#24773#20917
        TabOrder = 1
      end
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 48
    Width = 706
    Height = 37
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label17: TLabel
      Left = 14
      Top = 13
      Width = 84
      Height = 12
      Caption = #35831#36755#20837#24037#35013#32534#21495
    end
    object btn_cx: TSpeedButton
      Left = 255
      Top = 6
      Width = 93
      Height = 25
      Caption = #26597' '#35810
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
      Left = 594
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
      OnKeyPress = Edt_cxKeyPress
    end
    object CkB_mh: TCheckBox
      Left = 384
      Top = 12
      Width = 79
      Height = 17
      Caption = #27169#31946#26597#35810
      TabOrder = 1
    end
    object CheckBox2: TCheckBox
      Left = 480
      Top = 12
      Width = 79
      Height = 17
      Caption = #20801#35768#20462#25913
      Enabled = False
      TabOrder = 2
    end
  end
  object Panel8: TPanel
    Left = 0
    Top = 337
    Width = 706
    Height = 102
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'Panel8'
    TabOrder = 3
    object DBCtrlGrid2: TDBCtrlGrid
      Left = 2
      Top = 22
      Width = 702
      Height = 78
      Align = alClient
      ColCount = 1
      DataSource = dmd.Src_cp2
      PanelBorder = gbNone
      PanelHeight = 78
      PanelWidth = 684
      TabOrder = 0
      RowCount = 1
      object Label19: TLabel
        Left = 38
        Top = 9
        Width = 24
        Height = 12
        Caption = 'CPTH'
        FocusControl = DBEdit16
      end
      object Label20: TLabel
        Left = 38
        Top = 31
        Width = 24
        Height = 12
        Caption = 'CPMC'
        FocusControl = DBEdit17
      end
      object Label21: TLabel
        Left = 50
        Top = 53
        Width = 12
        Height = 12
        Caption = 'SL'
        FocusControl = DBEdit18
      end
      object Label22: TLabel
        Left = 247
        Top = 9
        Width = 12
        Height = 12
        Caption = 'LX'
        FocusControl = DBEdit19
      end
      object Label23: TLabel
        Left = 247
        Top = 31
        Width = 12
        Height = 12
        Caption = 'CX'
        FocusControl = DBEdit20
      end
      object Label24: TLabel
        Left = 247
        Top = 53
        Width = 12
        Height = 12
        Caption = 'FZ'
        FocusControl = DBEdit21
      end
      object Label25: TLabel
        Left = 470
        Top = 31
        Width = 12
        Height = 12
        Caption = 'BZ'
        FocusControl = DBEdit22
      end
      object Label26: TLabel
        Left = 458
        Top = 53
        Width = 24
        Height = 12
        Caption = 'YSXH'
        FocusControl = DBEdit23
      end
      object Label27: TLabel
        Left = 452
        Top = 9
        Width = 30
        Height = 12
        Caption = 'TYJLX'
        FocusControl = DBEdit24
      end
      object DBEdit16: TDBEdit
        Left = 71
        Top = 5
        Width = 160
        Height = 20
        BorderStyle = bsNone
        DataField = 'CPTH'
        DataSource = dmd.Src_cp2
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit17: TDBEdit
        Left = 71
        Top = 27
        Width = 160
        Height = 20
        BorderStyle = bsNone
        DataField = 'CPMC'
        DataSource = dmd.Src_cp2
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit18: TDBEdit
        Left = 71
        Top = 49
        Width = 160
        Height = 20
        BorderStyle = bsNone
        DataField = 'SL'
        DataSource = dmd.Src_cp2
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit19: TDBEdit
        Left = 268
        Top = 5
        Width = 160
        Height = 20
        BorderStyle = bsNone
        DataField = 'LX'
        DataSource = dmd.Src_cp2
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit20: TDBEdit
        Left = 268
        Top = 27
        Width = 160
        Height = 20
        BorderStyle = bsNone
        DataField = 'CX'
        DataSource = dmd.Src_cp2
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit21: TDBEdit
        Left = 268
        Top = 49
        Width = 160
        Height = 20
        BorderStyle = bsNone
        DataField = 'FZ'
        DataSource = dmd.Src_cp2
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit22: TDBEdit
        Left = 491
        Top = 27
        Width = 160
        Height = 20
        BorderStyle = bsNone
        DataField = 'BZ'
        DataSource = dmd.Src_cp2
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit23: TDBEdit
        Left = 491
        Top = 49
        Width = 160
        Height = 20
        BorderStyle = bsNone
        DataField = 'YSXH'
        DataSource = dmd.Src_cp2
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit24: TDBEdit
        Left = 491
        Top = 5
        Width = 160
        Height = 20
        BorderStyle = bsNone
        DataField = 'TYJLX'
        DataSource = dmd.Src_cp2
        ReadOnly = True
        TabOrder = 8
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 702
      Height = 20
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = #20135#21697#20449#24687
      TabOrder = 1
    end
  end
end
