object ypgl: Typgl
  Left = -13
  Top = 144
  Width = 812
  Height = 480
  Caption = #33647#21697#21450#20379#24212#21830#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 804
    Height = 453
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #33647#21697#31649#29702
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 796
        Height = 281
        Align = alTop
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        object CoolBar1: TCoolBar
          Left = 1
          Top = 1
          Width = 794
          Height = 30
          AutoSize = True
          Bands = <
            item
              Control = ToolBar1
              ImageIndex = -1
              MinHeight = 26
              Width = 790
            end>
          Color = clGradientInactiveCaption
          ParentColor = False
          object ToolBar1: TToolBar
            Left = 9
            Top = 0
            Width = 777
            Height = 26
            AutoSize = True
            Caption = 'ToolBar1'
            ShowCaptions = True
            TabOrder = 0
            object add: TBitBtn
              Left = 0
              Top = 2
              Width = 82
              Height = 22
              Caption = #28155#21152#33647#21697
              TabOrder = 0
              OnClick = addClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
                055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
                005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
                305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
                30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
                3055577777555557F7F555000555555999555577755555577755}
              NumGlyphs = 2
            end
            object delete: TBitBtn
              Left = 82
              Top = 2
              Width = 83
              Height = 22
              Caption = #21024#38500#33647#21697
              TabOrder = 1
              OnClick = deleteClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
                3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
                33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
                33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
                333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
                03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
                33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
                0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
                3333333337FFF7F3333333333000003333333333377777333333}
              NumGlyphs = 2
            end
            object BTypbb: TBitBtn
              Left = 165
              Top = 2
              Width = 81
              Height = 22
              Caption = #33647#21697#25253#34920
              TabOrder = 2
              OnClick = BTypbbClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
                0003377777777777777308888888888888807F33333333333337088888888888
                88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
                8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
                8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
                03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
                03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
                33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
                33333337FFFF7733333333300000033333333337777773333333}
              NumGlyphs = 2
            end
          end
        end
        object Panel6: TPanel
          Left = 1
          Top = 31
          Width = 794
          Height = 249
          Align = alClient
          Color = clMenu
          TabOrder = 1
          object Label14: TLabel
            Left = 208
            Top = 95
            Width = 65
            Height = 13
            AutoSize = False
            Caption = #24403#21069#26085#26399
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label1: TLabel
            Left = 8
            Top = 15
            Width = 65
            Height = 13
            AutoSize = False
            Caption = #32534'         '#21495
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label2: TLabel
            Left = 208
            Top = 15
            Width = 65
            Height = 13
            AutoSize = False
            Caption = #33647#21697#21517#31216
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label3: TLabel
            Left = 408
            Top = 15
            Width = 41
            Height = 13
            AutoSize = False
            Caption = #36827'    '#20215
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label4: TLabel
            Left = 408
            Top = 97
            Width = 49
            Height = 13
            AutoSize = False
            Caption = #21806'     '#20215
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label5: TLabel
            Left = 8
            Top = 43
            Width = 57
            Height = 13
            AutoSize = False
            Caption = #26368#23567#20215#26684
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label6: TLabel
            Left = 208
            Top = 42
            Width = 65
            Height = 13
            AutoSize = False
            Caption = #26368#23567#21333#20301
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label7: TLabel
            Left = 408
            Top = 43
            Width = 57
            Height = 13
            AutoSize = False
            Caption = #35746#36141#37327
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label8: TLabel
            Left = 600
            Top = 43
            Width = 65
            Height = 13
            AutoSize = False
            Caption = #36807#26399#26102#38388
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label9: TLabel
            Left = 8
            Top = 70
            Width = 57
            Height = 13
            AutoSize = False
            Caption = #35746#36141#26102#38388
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label10: TLabel
            Left = 208
            Top = 68
            Width = 65
            Height = 13
            AutoSize = False
            Caption = #20837#24211#26102#38388
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label11: TLabel
            Left = 408
            Top = 70
            Width = 49
            Height = 13
            AutoSize = False
            Caption = #35268'     '#26684
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label15: TLabel
            Left = 600
            Top = 15
            Width = 57
            Height = 13
            AutoSize = False
            Caption = #21333#20301#25968#37327
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label29: TLabel
            Left = 8
            Top = 97
            Width = 81
            Height = 13
            AutoSize = False
            Caption = #20379#21830#32534#21495
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label30: TLabel
            Left = 7
            Top = 140
            Width = 57
            Height = 13
            AutoSize = False
            Caption = #20379#21830#32534#21495
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label31: TLabel
            Left = 207
            Top = 140
            Width = 65
            Height = 13
            AutoSize = False
            Caption = #20379#21830#21517#31216
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label32: TLabel
            Left = 410
            Top = 140
            Width = 47
            Height = 13
            AutoSize = False
            Caption = #32852#31995#20154
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label33: TLabel
            Left = 607
            Top = 140
            Width = 58
            Height = 13
            AutoSize = False
            Caption = #22836'       '#34900
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label34: TLabel
            Left = 7
            Top = 168
            Width = 57
            Height = 13
            AutoSize = False
            Caption = #22320'         '#22336
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label35: TLabel
            Left = 207
            Top = 168
            Width = 65
            Height = 13
            AutoSize = False
            Caption = #22478'         '#24066
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label36: TLabel
            Left = 410
            Top = 168
            Width = 49
            Height = 13
            AutoSize = False
            Caption = #22320'     '#21306
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label37: TLabel
            Left = 607
            Top = 168
            Width = 58
            Height = 13
            AutoSize = False
            Caption = #37038'       '#32534
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label38: TLabel
            Left = 8
            Top = 197
            Width = 57
            Height = 13
            AutoSize = False
            Caption = #22269'         '#23478
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label39: TLabel
            Left = 208
            Top = 197
            Width = 65
            Height = 13
            AutoSize = False
            Caption = #30005'         '#35805
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label40: TLabel
            Left = 411
            Top = 197
            Width = 49
            Height = 13
            AutoSize = False
            Caption = #20256'     '#30495
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Bevel1: TBevel
            Left = 8
            Top = 125
            Width = 777
            Height = 1
          end
          object DBEdit1: TDBEdit
            Left = 72
            Top = 15
            Width = 121
            Height = 21
            DataField = #32534#21495
            DataSource = DMypgl.DSypgl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 0
            OnDblClick = DBEdit1DblClick
          end
          object DBEdit2: TDBEdit
            Left = 272
            Top = 15
            Width = 121
            Height = 21
            DataField = #33647#21697#21517#31216
            DataSource = DMypgl.DSypgl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 1
          end
          object DBEdit3: TDBEdit
            Left = 461
            Top = 15
            Width = 121
            Height = 21
            DataField = #36827#20215
            DataSource = DMypgl.DSypgl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 461
            Top = 97
            Width = 121
            Height = 21
            DataField = #21806#20215
            DataSource = DMypgl.DSypgl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 3
          end
          object DBEdit5: TDBEdit
            Left = 72
            Top = 43
            Width = 121
            Height = 21
            DataField = #26368#23567#20215#26684
            DataSource = DMypgl.DSypgl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 4
          end
          object DBEdit6: TDBEdit
            Left = 272
            Top = 43
            Width = 121
            Height = 21
            DataField = #26368#23567#21333#20301
            DataSource = DMypgl.DSypgl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 5
          end
          object DBEdit7: TDBEdit
            Left = 461
            Top = 43
            Width = 121
            Height = 21
            DataField = #35746#36141#37327
            DataSource = DMypgl.DSypgl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 6
          end
          object DBEdit8: TDBEdit
            Left = 664
            Top = 43
            Width = 121
            Height = 21
            DataField = #36807#26399#26102#38388
            DataSource = DMypgl.DSypgl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 7
          end
          object DBEdit9: TDBEdit
            Left = 72
            Top = 70
            Width = 121
            Height = 21
            DataField = #35746#36141#26102#38388
            DataSource = DMypgl.DSypgl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 8
          end
          object DBEdit10: TDBEdit
            Left = 272
            Top = 70
            Width = 121
            Height = 21
            DataField = #20837#24211#26102#38388
            DataSource = DMypgl.DSypgl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 9
          end
          object DBEdit11: TDBEdit
            Left = 461
            Top = 70
            Width = 121
            Height = 21
            DataField = #35268#26684
            DataSource = DMypgl.DSypgl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 10
          end
          object DBEdit12: TDBEdit
            Left = 664
            Top = 15
            Width = 121
            Height = 21
            DataField = #21333#20301#25968#37327
            DataSource = DMypgl.DSypgl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 11
          end
          object DBEdit13: TDBEdit
            Left = 72
            Top = 97
            Width = 121
            Height = 21
            DataField = #20379#24212#21830#32534#21495
            DataSource = DMypgl.DSypgl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 12
          end
          object DateTimedate: TDateTimePicker
            Left = 272
            Top = 97
            Width = 121
            Height = 21
            CalAlignment = dtaLeft
            Date = 37731.5975621644
            Time = 37731.5975621644
            DateFormat = dfShort
            DateMode = dmComboBox
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            Kind = dtkDate
            ParseInput = False
            ParentFont = False
            TabOrder = 13
          end
          object DBEdit14: TDBEdit
            Left = 71
            Top = 140
            Width = 121
            Height = 21
            DataField = #20379#24212#21830#32534#21495
            DataSource = DMypgl.DSgys
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 14
          end
          object DBEdit24: TDBEdit
            Left = 271
            Top = 140
            Width = 121
            Height = 21
            DataField = #20379#24212#21830#21517#31216
            DataSource = DMypgl.DSgys
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 15
          end
          object DBEdit25: TDBEdit
            Left = 463
            Top = 140
            Width = 121
            Height = 21
            DataField = #32852#31995#20154#22995#21517
            DataSource = DMypgl.DSgys
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 16
          end
          object DBEdit26: TDBEdit
            Left = 665
            Top = 140
            Width = 121
            Height = 21
            DataField = #32852#31995#20154#22836#34900
            DataSource = DMypgl.DSgys
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 17
          end
          object DBEdit27: TDBEdit
            Left = 71
            Top = 168
            Width = 121
            Height = 21
            DataField = #22320#22336
            DataSource = DMypgl.DSgys
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 18
          end
          object DBEdit28: TDBEdit
            Left = 271
            Top = 168
            Width = 121
            Height = 21
            DataField = #22478#24066
            DataSource = DMypgl.DSgys
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 19
          end
          object DBEdit29: TDBEdit
            Left = 463
            Top = 168
            Width = 121
            Height = 21
            DataField = #22320#21306
            DataSource = DMypgl.DSgys
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 20
          end
          object DBEdit30: TDBEdit
            Left = 665
            Top = 168
            Width = 121
            Height = 21
            DataField = #37038#32534
            DataSource = DMypgl.DSgys
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 21
          end
          object DBEdit31: TDBEdit
            Left = 72
            Top = 197
            Width = 121
            Height = 21
            DataField = #22269#23478
            DataSource = DMypgl.DSgys
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 22
          end
          object DBEdit32: TDBEdit
            Left = 272
            Top = 197
            Width = 121
            Height = 21
            DataField = #30005#35805
            DataSource = DMypgl.DSgys
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 23
          end
          object DBEdit33: TDBEdit
            Left = 464
            Top = 197
            Width = 121
            Height = 21
            DataField = #20256#30495
            DataSource = DMypgl.DSgys
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 24
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 288
        Width = 796
        Height = 153
        Color = cl3DLight
        TabOrder = 1
        object GroupBox1: TGroupBox
          Left = 1
          Top = 8
          Width = 794
          Height = 144
          Align = alBottom
          Caption = #33647#21697#26597#35810
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object Label12: TLabel
            Left = 16
            Top = 37
            Width = 48
            Height = 16
            Caption = #33647#21697#32534#21495
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label13: TLabel
            Left = 16
            Top = 74
            Width = 48
            Height = 16
            Caption = #33647#21697#21517#31216
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Eypcx_bh: TEdit
            Left = 72
            Top = 37
            Width = 121
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 0
          end
          object Eypcx_mc: TEdit
            Left = 72
            Top = 74
            Width = 121
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 1
          end
          object Button1: TButton
            Left = 200
            Top = 37
            Width = 57
            Height = 26
            Caption = #26597#35810
            TabOrder = 2
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 200
            Top = 74
            Width = 57
            Height = 26
            Caption = #26597#35810
            TabOrder = 3
            OnClick = Button2Click
          end
          object GroupBox2: TGroupBox
            Left = 281
            Top = 10
            Width = 511
            Height = 111
            Caption = #20998#31867#26597#35810
            TabOrder = 4
            object Label41: TLabel
              Left = 272
              Top = 32
              Width = 12
              Height = 16
              Caption = #21040
            end
            object Label42: TLabel
              Left = 224
              Top = 24
              Width = 12
              Height = 16
              Caption = #21040
            end
            object Label43: TLabel
              Left = 16
              Top = 32
              Width = 60
              Height = 16
              Caption = #25353#35746#36141#26102#38388
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object Label44: TLabel
              Left = 16
              Top = 67
              Width = 60
              Height = 16
              Caption = #25353#20837#24211#26102#38388
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object DateTimePicker1: TDateTimePicker
              Left = 88
              Top = 29
              Width = 129
              Height = 24
              CalAlignment = dtaLeft
              Date = 37755
              Time = 37755
              DateFormat = dfShort
              DateMode = dmComboBox
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
              Kind = dtkDate
              ParseInput = False
              ParentFont = False
              TabOrder = 0
            end
            object DateTimePicker2: TDateTimePicker
              Left = 240
              Top = 29
              Width = 129
              Height = 24
              CalAlignment = dtaLeft
              Date = 37755.6145103472
              Time = 37755.6145103472
              DateFormat = dfShort
              DateMode = dmComboBox
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
              Kind = dtkDate
              ParseInput = False
              ParentFont = False
              TabOrder = 1
            end
            object DateTimePicker3: TDateTimePicker
              Left = 88
              Top = 66
              Width = 129
              Height = 24
              CalAlignment = dtaLeft
              Date = 37755
              Time = 37755
              DateFormat = dfShort
              DateMode = dmComboBox
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
              Kind = dtkDate
              ParseInput = False
              ParentFont = False
              TabOrder = 2
            end
            object DateTimePicker4: TDateTimePicker
              Left = 240
              Top = 67
              Width = 129
              Height = 24
              CalAlignment = dtaLeft
              Date = 37755
              Time = 37755
              DateFormat = dfShort
              DateMode = dmComboBox
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
              Kind = dtkDate
              ParseInput = False
              ParentFont = False
              TabOrder = 3
            end
            object BitBtn1: TBitBtn
              Left = 408
              Top = 26
              Width = 75
              Height = 25
              Caption = #26597#35810
              TabOrder = 4
              OnClick = BitBtn1Click
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333FF3FF3333333333CC30003333333333773777333333333C33
                3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
                33003377333337F33377333333333C333300333F333337F33377339333333C33
                3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
                330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
                330077F377F337F33377993399333C33330077FF773337F33377399993333C33
                33333777733337F333FF333333333C33300033333333373FF7773333333333CC
                3000333333333377377733333333333333333333333333333333}
              NumGlyphs = 2
            end
            object BitBtn2: TBitBtn
              Left = 408
              Top = 67
              Width = 75
              Height = 25
              Caption = #26597#35810
              TabOrder = 5
              OnClick = BitBtn2Click
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
                333333333337FF3333333333330003333333333333777F333333333333080333
                3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
                33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
                B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
                BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
                B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
                3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
                333333333337F33333333333333B333333333333333733333333}
              NumGlyphs = 2
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #20379#24212#21830#31649#29702
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 796
        Height = 425
        Align = alClient
        TabOrder = 0
        object Label16: TLabel
          Left = 24
          Top = 40
          Width = 73
          Height = 13
          AutoSize = False
          Caption = #20379#24212#21830#32534#21495
          FocusControl = DBEgysbh
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 288
          Top = 40
          Width = 73
          Height = 13
          AutoSize = False
          Caption = #20379#24212#21830#21517#31216
          FocusControl = DBEgysmc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 544
          Top = 40
          Width = 73
          Height = 13
          AutoSize = False
          Caption = #32852#31995#20154#22995#21517
          FocusControl = DBEdit15
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 24
          Top = 64
          Width = 73
          Height = 13
          AutoSize = False
          Caption = #22320'              '#22336
          FocusControl = DBEdit17
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 288
          Top = 64
          Width = 73
          Height = 13
          AutoSize = False
          Caption = #22478'               '#24066
          FocusControl = DBEdit18
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 544
          Top = 64
          Width = 73
          Height = 13
          AutoSize = False
          Caption = #22320'              '#21306
          FocusControl = DBEdit19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 24
          Top = 88
          Width = 81
          Height = 13
          AutoSize = False
          Caption = #22269'              '#23478
          FocusControl = DBEdit21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 288
          Top = 88
          Width = 81
          Height = 13
          AutoSize = False
          Caption = #30005'               '#35805
          FocusControl = DBEdit22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 544
          Top = 88
          Width = 73
          Height = 13
          AutoSize = False
          Caption = #20256'              '#30495
          FocusControl = DBEdit23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 24
          Top = 112
          Width = 73
          Height = 13
          AutoSize = False
          Caption = #32852#31995#20154#22836#34900
          FocusControl = DBEdit16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 288
          Top = 112
          Width = 81
          Height = 13
          AutoSize = False
          Caption = #37038'               '#32534
          FocusControl = DBEdit20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Bevel2: TBevel
          Left = 8
          Top = 144
          Width = 777
          Height = 1
        end
        object ControlBar2: TControlBar
          Left = 1
          Top = 1
          Width = 794
          Height = 32
          Align = alTop
          TabOrder = 0
          object addgys: TBitBtn
            Left = 20
            Top = 2
            Width = 93
            Height = 22
            Caption = #28155#21152#20379#24212#21830
            TabOrder = 0
            OnClick = addgysClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
              055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
              005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
              B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
              305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
              305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
              30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
              3055577777555557F7F555000555555999555577755555577755}
            NumGlyphs = 2
          end
          object deletegys: TBitBtn
            Left = 150
            Top = 2
            Width = 99
            Height = 22
            Caption = #21024#38500#20379#24212#21830
            TabOrder = 1
            OnClick = deletegysClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
              3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
              33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
              33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
              333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
              03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
              33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
              0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
              3333333337FFF7F3333333333000003333333333377777333333}
            NumGlyphs = 2
          end
          object BTgysbb: TButton
            Left = 285
            Top = 2
            Width = 73
            Height = 22
            Caption = #20379#24212#21830#25253#34920
            TabOrder = 2
            OnClick = BTgysbbClick
          end
        end
        object DBEgysbh: TDBEdit
          Left = 112
          Top = 40
          Width = 140
          Height = 21
          DataField = #20379#24212#21830#32534#21495
          DataSource = DMypgl.DSgys2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          OnDblClick = DBEgysbhDblClick
        end
        object DBEgysmc: TDBEdit
          Left = 376
          Top = 40
          Width = 140
          Height = 21
          DataField = #20379#24212#21830#21517#31216
          DataSource = DMypgl.DSgys2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit15: TDBEdit
          Left = 632
          Top = 40
          Width = 140
          Height = 21
          DataField = #32852#31995#20154#22995#21517
          DataSource = DMypgl.DSgys2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit17: TDBEdit
          Left = 112
          Top = 64
          Width = 140
          Height = 21
          DataField = #22320#22336
          DataSource = DMypgl.DSgys2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit18: TDBEdit
          Left = 376
          Top = 64
          Width = 140
          Height = 21
          DataField = #22478#24066
          DataSource = DMypgl.DSgys2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit19: TDBEdit
          Left = 632
          Top = 64
          Width = 140
          Height = 21
          DataField = #22320#21306
          DataSource = DMypgl.DSgys2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit21: TDBEdit
          Left = 112
          Top = 88
          Width = 140
          Height = 21
          DataField = #22269#23478
          DataSource = DMypgl.DSgys2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit22: TDBEdit
          Left = 376
          Top = 88
          Width = 140
          Height = 21
          DataField = #30005#35805
          DataSource = DMypgl.DSgys2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit23: TDBEdit
          Left = 632
          Top = 88
          Width = 140
          Height = 21
          DataField = #20256#30495
          DataSource = DMypgl.DSgys2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit16: TDBEdit
          Left = 112
          Top = 112
          Width = 140
          Height = 21
          DataField = #32852#31995#20154#22836#34900
          DataSource = DMypgl.DSgys2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit20: TDBEdit
          Left = 376
          Top = 112
          Width = 140
          Height = 21
          DataField = #37038#32534
          DataSource = DMypgl.DSgys2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object DBGrid3: TDBGrid
          Left = 16
          Top = 152
          Width = 761
          Height = 129
          DataSource = DMypgl.DSyp
          FixedColor = clMenu
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ReadOnly = True
          TabOrder = 12
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = #32534#21495
              Visible = True
            end
            item
              Expanded = False
              FieldName = #33647#21697#21517#31216
              Visible = True
            end
            item
              Expanded = False
              FieldName = #36827#20215
              Visible = True
            end
            item
              Expanded = False
              FieldName = #21806#20215
              Visible = True
            end
            item
              Expanded = False
              FieldName = #26368#23567#20215#26684
              Visible = True
            end
            item
              Expanded = False
              FieldName = #26368#23567#21333#20301
              Visible = True
            end
            item
              Expanded = False
              FieldName = #35746#36141#37327
              Visible = True
            end
            item
              Expanded = False
              FieldName = #36807#26399#26102#38388
              Visible = True
            end
            item
              Expanded = False
              FieldName = #35746#36141#26102#38388
              Visible = True
            end
            item
              Expanded = False
              FieldName = #20837#24211#26102#38388
              Visible = True
            end
            item
              Expanded = False
              FieldName = #35268#26684
              Visible = True
            end
            item
              Expanded = False
              FieldName = #21333#20301#25968#37327
              Visible = True
            end
            item
              Expanded = False
              FieldName = #20379#24212#21830#32534#21495
              Visible = True
            end>
        end
        object GroupBox3: TGroupBox
          Left = 1
          Top = 284
          Width = 794
          Height = 140
          Align = alBottom
          Caption = #20379#24212#21830#26597#35810
          TabOrder = 13
          object Label27: TLabel
            Left = 24
            Top = 40
            Width = 36
            Height = 13
            Caption = #25353#32534#21495
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label28: TLabel
            Left = 24
            Top = 104
            Width = 36
            Height = 13
            Caption = #25353#21517#31216
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Egyscx_bh: TEdit
            Left = 80
            Top = 40
            Width = 121
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 0
          end
          object Button_gyscx_bh: TButton
            Left = 224
            Top = 40
            Width = 73
            Height = 25
            Caption = #26597#35810
            TabOrder = 1
            OnClick = Button_gyscx_bhClick
          end
          object Egyscx_mc: TEdit
            Left = 80
            Top = 104
            Width = 121
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            ParentFont = False
            TabOrder = 2
          end
          object Button_gyscx_mc: TButton
            Left = 224
            Top = 104
            Width = 73
            Height = 25
            Caption = #26597#35810
            TabOrder = 3
            OnClick = Button_gyscx_mcClick
          end
          object GroupBox4: TGroupBox
            Left = 320
            Top = 15
            Width = 472
            Height = 123
            Align = alRight
            Caption = #20855#20307#26597#35810
            TabOrder = 4
            object Label45: TLabel
              Left = 136
              Top = 24
              Width = 65
              Height = 13
              AutoSize = False
              Caption = #22269#23478#21517#31216
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label46: TLabel
              Left = 136
              Top = 56
              Width = 65
              Height = 13
              AutoSize = False
              Caption = #22320#21306#21517#31216
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label47: TLabel
              Left = 136
              Top = 88
              Width = 65
              Height = 13
              AutoSize = False
              Caption = #22478#24066#21517#31216
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object BitBtnjtcx: TBitBtn
              Left = 368
              Top = 24
              Width = 91
              Height = 25
              Caption = #20855#20307#26597#35810
              TabOrder = 0
              OnClick = BitBtnjtcxClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333FF3FF3333333333CC30003333333333773777333333333C33
                3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
                33003377333337F33377333333333C333300333F333337F33377339333333C33
                3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
                330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
                330077F377F337F33377993399333C33330077FF773337F33377399993333C33
                33333777733337F333FF333333333C33300033333333373FF7773333333333CC
                3000333333333377377733333333333333333333333333333333}
              NumGlyphs = 2
            end
            object Editgj: TEdit
              Left = 208
              Top = 24
              Width = 150
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
              ParentFont = False
              TabOrder = 1
            end
            object Editdq: TEdit
              Left = 208
              Top = 56
              Width = 150
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
              ParentFont = False
              TabOrder = 2
            end
            object Editcs: TEdit
              Left = 208
              Top = 88
              Width = 150
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
              ParentFont = False
              TabOrder = 3
            end
            object RadioButtonjq: TRadioButton
              Left = 16
              Top = 24
              Width = 73
              Height = 17
              Caption = #31934#30830#26597#35810
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object RadioButtonmh: TRadioButton
              Left = 16
              Top = 88
              Width = 73
              Height = 17
              Caption = #27169#31946#26597#35810
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              TabStop = True
            end
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
    Left = 448
    Top = 16
  end
end
