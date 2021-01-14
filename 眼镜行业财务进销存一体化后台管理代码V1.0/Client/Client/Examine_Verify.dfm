object frm_Examine_Verify: Tfrm_Examine_Verify
  Left = 161
  Top = 52
  Width = 531
  Height = 477
  BorderIcons = [biSystemMenu]
  Caption = #12304#23457#26680#32423#21035#35774#32622#12305
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 523
    Height = 450
    Align = alClient
    BorderStyle = bsSingle
    Caption = 'Panel1'
    Color = clSkyBlue
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 149
      Height = 444
      Align = alLeft
      BorderStyle = bsSingle
      Caption = 'Panel2'
      Color = clSkyBlue
      TabOrder = 0
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 143
        Height = 30
        Align = alTop
        BorderStyle = bsSingle
        Caption = #36873#25321#21333#25454
        Color = clSkyBlue
        TabOrder = 0
      end
      object ListBox1: TListBox
        Left = 1
        Top = 31
        Width = 143
        Height = 408
        Align = alClient
        Color = clSkyBlue
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ItemHeight = 13
        Items.Strings = (
          #21830#21697#38656#27714#21333
          #37319#36141#21512#21516
          #26469#36135#30331#35760#21333
          #36136#37327#39564#25910#21333
          #37319#36141#36864#36135#21333
          #37319#36141#20837#24211#21333
          #36130#21153#20837#24211#21333
          #37319#36141#20184#27454#21333
          #38750#33829#19994#24615#20986#24211#21333
          #38750#33829#19994#24615#20837#24211#21333
          #22871#39184#23450#20041
          #24211#23384#25253#25439#21333
          #24211#23384#25253#28322#21333
          #24211#23384#36864#36135#21333
          #36130#21153#36864#36135#21333
          #37197#36865#30003#35831#21333
          #37197#36865#21333
          #39044#23450#21830#21697#37197#36865#21333
          #37197#36865#36864#36135#21333
          #26032#24215#38138#36135
          #36192#21697#23450#20041#21333
          #29616#37329#36153#29992#21333
          #19968#33324#36153#29992#21333
          #20854#23427#25910#20837#21333
          #24453#25674#36153#29992#21457#29983#21333
          #24453#25674#36153#29992#25674#38144#21333
          #24212#20184#27454#22686#21152
          #24212#25910#27454#22686#21152
          #24212#20184#27454#20943#23569
          #24212#25910#27454#20943#23569)
        ParentFont = False
        TabOrder = 1
        OnClick = ListBox1Click
      end
    end
    object Panel4: TPanel
      Left = 150
      Top = 1
      Width = 368
      Height = 444
      Align = alClient
      Caption = 'Panel4'
      Color = clSkyBlue
      TabOrder = 1
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 366
        Height = 442
        ActivePage = TabSheet1
        Align = alClient
        TabIndex = 0
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = #12304#12305
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 358
            Height = 413
            Align = alClient
            TabOrder = 0
            object Label1: TLabel
              Left = 28
              Top = 67
              Width = 65
              Height = 13
              Caption = #23457#26680#32423#25968#65306
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label2: TLabel
              Left = 150
              Top = 69
              Width = 66
              Height = 13
              Caption = '('#26368#22810#20116#32423')'
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object SPB1: TSpeedButton
              Left = 312
              Top = 97
              Width = 23
              Height = 20
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333333333333333333333333333333333333333333333333FF333333333333
                3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                000033333373FF77777733333330003333333333333777333333333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
              ParentFont = False
              Visible = False
              OnClick = SPB1Click
            end
            object SPB2: TSpeedButton
              Left = 312
              Top = 144
              Width = 23
              Height = 20
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333333333333333333333333333333333333333333333333FF333333333333
                3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                000033333373FF77777733333330003333333333333777333333333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
              ParentFont = False
              Visible = False
              OnClick = SPB2Click
            end
            object SPB3: TSpeedButton
              Left = 312
              Top = 192
              Width = 23
              Height = 20
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333333333333333333333333333333333333333333333333FF333333333333
                3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                000033333373FF77777733333330003333333333333777333333333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
              ParentFont = False
              Visible = False
              OnClick = SPB3Click
            end
            object SPB4: TSpeedButton
              Left = 312
              Top = 239
              Width = 23
              Height = 20
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333333333333333333333333333333333333333333333333FF333333333333
                3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                000033333373FF77777733333330003333333333333777333333333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
              ParentFont = False
              Visible = False
              OnClick = SPB4Click
            end
            object SPB5: TSpeedButton
              Left = 312
              Top = 287
              Width = 23
              Height = 20
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333333333333333333333333333333333333333333333333FF333333333333
                3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                000033333373FF77777733333330003333333333333777333333333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
              ParentFont = False
              Visible = False
              OnClick = SPB5Click
            end
            object Cmd_OK: TSpeedButton
              Left = 22
              Top = 366
              Width = 80
              Height = 22
              Caption = #30830#23450
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333330000333333333333333333333333F33333333333
                00003333344333333333333333388F3333333333000033334224333333333333
                338338F3333333330000333422224333333333333833338F3333333300003342
                222224333333333383333338F3333333000034222A22224333333338F338F333
                8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
                33333338F83338F338F33333000033A33333A222433333338333338F338F3333
                0000333333333A222433333333333338F338F33300003333333333A222433333
                333333338F338F33000033333333333A222433333333333338F338F300003333
                33333333A222433333333333338F338F00003333333333333A22433333333333
                3338F38F000033333333333333A223333333333333338F830000333333333333
                333A333333333333333338330000333333333333333333333333333333333333
                0000}
              NumGlyphs = 2
              ParentFont = False
              OnClick = Cmd_OKClick
            end
            object Cmd_Edit: TSpeedButton
              Left = 101
              Top = 366
              Width = 80
              Height = 22
              Caption = #20462#25913
              Enabled = False
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                05555777775555557F5555000555555505555577755555557555}
              NumGlyphs = 2
              ParentFont = False
              OnClick = Cmd_EditClick
            end
            object Cmd_Delete: TSpeedButton
              Left = 180
              Top = 366
              Width = 80
              Height = 22
              Caption = #21024#38500
              Enabled = False
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
                3333333777333777FF33339993707399933333773337F3777FF3399933000339
                9933377333777F3377F3399333707333993337733337333337FF993333333333
                399377F33333F333377F993333303333399377F33337FF333373993333707333
                333377F333777F333333993333101333333377F333777F3FFFFF993333000399
                999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
                99933773FF777F3F777F339993707399999333773F373F77777F333999999999
                3393333777333777337333333999993333333333377777333333}
              NumGlyphs = 2
              ParentFont = False
              OnClick = Cmd_DeleteClick
            end
            object Cmd_No: TSpeedButton
              Left = 259
              Top = 366
              Width = 80
              Height = 22
              Caption = #36864#20986
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
                03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
                0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
                0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
                0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
                0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
                0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
                0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
                0333337F777FFFFF7F3333000000000003333377777777777333}
              NumGlyphs = 2
              ParentFont = False
              OnClick = Cmd_NoClick
            end
            object Edit1: TLabeledEdit
              Left = 100
              Top = 97
              Width = 210
              Height = 21
              EditLabel.Width = 70
              EditLabel.Height = 14
              EditLabel.Caption = #23457#26680#20154#19968#65306
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              LabelPosition = lpLeft
              LabelSpacing = 3
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Visible = False
            end
            object Edit2: TLabeledEdit
              Left = 100
              Top = 144
              Width = 210
              Height = 21
              EditLabel.Width = 70
              EditLabel.Height = 14
              EditLabel.Caption = #23457#26680#20154#20108#65306
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              LabelPosition = lpLeft
              LabelSpacing = 3
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Visible = False
            end
            object Edit3: TLabeledEdit
              Left = 100
              Top = 192
              Width = 210
              Height = 21
              EditLabel.Width = 70
              EditLabel.Height = 14
              EditLabel.Caption = #23457#26680#20154#19977#65306
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              LabelPosition = lpLeft
              LabelSpacing = 3
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              Visible = False
            end
            object Edit4: TLabeledEdit
              Left = 100
              Top = 239
              Width = 210
              Height = 21
              EditLabel.Width = 70
              EditLabel.Height = 14
              EditLabel.Caption = #23457#26680#20154#22235#65306
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              LabelPosition = lpLeft
              LabelSpacing = 3
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              Visible = False
            end
            object Edit5: TLabeledEdit
              Left = 100
              Top = 287
              Width = 210
              Height = 21
              EditLabel.Width = 70
              EditLabel.Height = 14
              EditLabel.Caption = #23457#26680#20154#20116#65306
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              LabelPosition = lpLeft
              LabelSpacing = 3
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
              Visible = False
            end
            object LabeledEdit1: TLabeledEdit
              Left = 100
              Top = 38
              Width = 209
              Height = 21
              EditLabel.Width = 70
              EditLabel.Height = 14
              EditLabel.Caption = #21333#25454#21517#31216#65306
              Enabled = False
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              LabelPosition = lpLeft
              LabelSpacing = 3
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
            object Edit11: TLabeledEdit
              Left = 230
              Top = 97
              Width = 79
              Height = 21
              EditLabel.Width = 16
              EditLabel.Height = 14
              EditLabel.Caption = '  '
              EditLabel.Font.Charset = ANSI_CHARSET
              EditLabel.Font.Color = clFuchsia
              EditLabel.Font.Height = -14
              EditLabel.Font.Name = #23435#20307
              EditLabel.Font.Style = [fsBold]
              EditLabel.ParentFont = False
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              LabelPosition = lpAbove
              LabelSpacing = 3
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
              Visible = False
            end
            object Edit22: TLabeledEdit
              Left = 230
              Top = 144
              Width = 79
              Height = 21
              EditLabel.Width = 16
              EditLabel.Height = 14
              EditLabel.Caption = '  '
              EditLabel.Font.Charset = ANSI_CHARSET
              EditLabel.Font.Color = clFuchsia
              EditLabel.Font.Height = -14
              EditLabel.Font.Name = #23435#20307
              EditLabel.Font.Style = [fsBold]
              EditLabel.ParentFont = False
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              LabelPosition = lpAbove
              LabelSpacing = 3
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
              Visible = False
            end
            object Edit33: TLabeledEdit
              Left = 230
              Top = 192
              Width = 79
              Height = 21
              EditLabel.Width = 16
              EditLabel.Height = 14
              EditLabel.Caption = '  '
              EditLabel.Font.Charset = ANSI_CHARSET
              EditLabel.Font.Color = clFuchsia
              EditLabel.Font.Height = -14
              EditLabel.Font.Name = #23435#20307
              EditLabel.Font.Style = [fsBold]
              EditLabel.ParentFont = False
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              LabelPosition = lpAbove
              LabelSpacing = 3
              ParentFont = False
              ReadOnly = True
              TabOrder = 8
              Visible = False
            end
            object Edit44: TLabeledEdit
              Left = 230
              Top = 239
              Width = 79
              Height = 21
              EditLabel.Width = 16
              EditLabel.Height = 14
              EditLabel.Caption = '  '
              EditLabel.Font.Charset = ANSI_CHARSET
              EditLabel.Font.Color = clFuchsia
              EditLabel.Font.Height = -14
              EditLabel.Font.Name = #23435#20307
              EditLabel.Font.Style = [fsBold]
              EditLabel.ParentFont = False
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              LabelPosition = lpAbove
              LabelSpacing = 3
              ParentFont = False
              ReadOnly = True
              TabOrder = 9
              Visible = False
            end
            object Edit55: TLabeledEdit
              Left = 230
              Top = 287
              Width = 79
              Height = 21
              EditLabel.Width = 16
              EditLabel.Height = 14
              EditLabel.Caption = '  '
              EditLabel.Font.Charset = ANSI_CHARSET
              EditLabel.Font.Color = clFuchsia
              EditLabel.Font.Height = -14
              EditLabel.Font.Name = #23435#20307
              EditLabel.Font.Style = [fsBold]
              EditLabel.ParentFont = False
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              LabelPosition = lpAbove
              LabelSpacing = 3
              ParentFont = False
              ReadOnly = True
              TabOrder = 10
              Visible = False
            end
            object ComboBox1: TComboBox
              Left = 100
              Top = 65
              Width = 51
              Height = 21
              Style = csDropDownList
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 11
              OnChange = ComboBox1Change
              Items.Strings = (
                '0'
                '1'
                '2'
                '3'
                '4'
                '5')
            end
          end
        end
      end
    end
  end
end
