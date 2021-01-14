object frm_Storage_Select: Tfrm_Storage_Select
  Left = 67
  Top = 115
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #12304#20179#24211#36873#25321#12305
  ClientHeight = 361
  ClientWidth = 628
  Color = clSkyBlue
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 361
    Align = alClient
    Color = clSkyBlue
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 520
      Height = 357
      Color = clSkyBlue
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 8
        Top = 16
        Width = 510
        Height = 89
        Caption = #26597#35810#25805#20316
        TabOrder = 0
        object SpeedButton5: TSpeedButton
          Left = 426
          Top = 29
          Width = 80
          Height = 22
          Caption = #20179#24211#26597#35810
          Flat = True
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
            333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
            300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
            330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
            333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
            339977FF777777773377000BFB03333333337773FF733333333F333000333333
            3300333777333333337733333333333333003333333333333377333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          ParentFont = False
          OnClick = SpeedButton5Click
        end
        object edtstorageid: TLabeledEdit
          Left = 88
          Top = 32
          Width = 329
          Height = 21
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = #20179#24211#32534#21495':'
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 0
        end
        object edtname: TLabeledEdit
          Left = 88
          Top = 59
          Width = 329
          Height = 21
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = #20179#24211#21517#31216':'
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 1
        end
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 109
        Width = 509
        Height = 242
        DataSource = DSDATA
        FixedColor = clSkyBlue
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnDblClick = Cmd_SelectClick
      end
    end
    object Panel3: TPanel
      Left = 521
      Top = 1
      Width = 104
      Height = 355
      Color = clSkyBlue
      TabOrder = 1
      object Cmd_Exit: TSpeedButton
        Left = 17
        Top = 61
        Width = 80
        Height = 22
        Caption = #36864#20986
        Flat = True
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
          33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
          993337777F777F3377F3393999707333993337F77737333337FF993399933333
          399377F3777FF333377F993339903333399377F33737FF33377F993333707333
          399377F333377FF3377F993333101933399377F333777FFF377F993333000993
          399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
          99333773FF777F777733339993707339933333773FF7FFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = Cmd_ExitClick
      end
      object Cmd_Select: TSpeedButton
        Left = 15
        Top = 26
        Width = 80
        Height = 22
        Caption = #36873#25321
        Flat = True
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
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
        ParentFont = False
        OnClick = Cmd_SelectClick
      end
      object Edit_Name: TLabeledEdit
        Left = 20
        Top = 152
        Width = 77
        Height = 21
        EditLabel.Width = 65
        EditLabel.Height = 13
        EditLabel.Caption = #20179#24211#21517#31216#65306
        Enabled = False
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        LabelPosition = lpAbove
        LabelSpacing = 3
        ParentFont = False
        TabOrder = 0
        Visible = False
      end
      object Edit_NO: TLabeledEdit
        Left = 21
        Top = 104
        Width = 77
        Height = 21
        EditLabel.Width = 65
        EditLabel.Height = 13
        EditLabel.Caption = #20179#24211#32534#21495#65306
        Enabled = False
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        LabelPosition = lpAbove
        LabelSpacing = 3
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
    end
  end
  object DSDATA: TDataSource
    DataSet = dmmain.CDSquery
    Left = 496
    Top = 136
  end
end
