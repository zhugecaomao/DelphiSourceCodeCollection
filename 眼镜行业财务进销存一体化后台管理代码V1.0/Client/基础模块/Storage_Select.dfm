object frm_Storage_Select: Tfrm_Storage_Select
  Left = 77
  Top = 238
  Width = 696
  Height = 480
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = #12304#20179#24211#36873#25321#12305
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    Align = alClient
    Color = clSkyBlue
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 552
      Height = 451
      Align = alClient
      Color = clSkyBlue
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 8
        Top = 16
        Width = 537
        Height = 89
        Caption = #26597#35810#25805#20316
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 33
          Width = 70
          Height = 14
          Caption = #20179#24211#32534#21495#65306
        end
        object Label2: TLabel
          Left = 15
          Top = 62
          Width = 70
          Height = 14
          Caption = #20179#24211#21517#31216#65306
        end
        object SpeedButton5: TSpeedButton
          Left = 426
          Top = 29
          Width = 99
          Height = 22
          Caption = #20179#24211#26597#35810
          Flat = True
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
        end
        object SpeedButton6: TSpeedButton
          Left = 426
          Top = 58
          Width = 97
          Height = 22
          Caption = #21462#28040#26597#35810
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
            3333333777333777FF3333993333339993333377FF3333377FF3399993333339
            993337777FF3333377F3393999333333993337F777FF333337FF993399933333
            399377F3777FF333377F993339993333399377F33777FF33377F993333999333
            399377F333777FF3377F993333399933399377F3333777FF377F993333339993
            399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
            99333773FF3333777733339993333339933333773FFFFFF77333333999999999
            3333333777333777333333333999993333333333377777333333}
          NumGlyphs = 2
        end
        object ComboBox1: TComboBox
          Left = 87
          Top = 29
          Width = 332
          Height = 22
          ItemHeight = 14
          TabOrder = 0
        end
        object ComboBox2: TComboBox
          Left = 87
          Top = 58
          Width = 332
          Height = 22
          ItemHeight = 14
          TabOrder = 1
        end
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 109
        Width = 537
        Height = 339
        FixedColor = clSkyBlue
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnDblClick = Cmd_SelectClick
      end
    end
    object Panel3: TPanel
      Left = 553
      Top = 1
      Width = 134
      Height = 451
      Align = alRight
      Color = clSkyBlue
      TabOrder = 1
      object Cmd_Exit: TSpeedButton
        Left = 15
        Top = 417
        Width = 106
        Height = 22
        Caption = #36864#20986
        Flat = True
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
        OnClick = Cmd_ExitClick
      end
      object Cmd_Select: TSpeedButton
        Left = 15
        Top = 80
        Width = 106
        Height = 22
        Caption = #36873#25321
        Flat = True
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
        OnClick = Cmd_SelectClick
      end
      object Cmd_Add: TSpeedButton
        Left = 15
        Top = 112
        Width = 106
        Height = 22
        Caption = #28155#21152
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333FF33333333FF333993333333300033377F3333333777333993333333
          300033F77FFF3333377739999993333333333777777F3333333F399999933333
          33003777777333333377333993333333330033377F3333333377333993333333
          3333333773333333333F333333333333330033333333F33333773333333C3333
          330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
          333333333337733333FF3333333C333330003333333733333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = Cmd_AddClick
      end
      object Cmd_All: TSpeedButton
        Left = 15
        Top = 48
        Width = 106
        Height = 22
        Caption = #20840#37096#20179#24211
        Flat = True
        OnClick = Cmd_AllClick
      end
      object Panel4: TPanel
        Left = 3
        Top = 392
        Width = 131
        Height = 4
        Color = clBlack
        TabOrder = 0
      end
      object Edit_Name: TLabeledEdit
        Left = 4
        Top = 364
        Width = 125
        Height = 22
        EditLabel.Width = 70
        EditLabel.Height = 14
        EditLabel.Caption = #20179#24211#21517#31216#65306
        Enabled = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 1
      end
      object Edit_NO: TLabeledEdit
        Left = 5
        Top = 316
        Width = 125
        Height = 22
        EditLabel.Width = 70
        EditLabel.Height = 14
        EditLabel.Caption = #20179#24211#32534#21495#65306
        Enabled = False
        LabelPosition = lpAbove
        LabelSpacing = 3
        TabOrder = 2
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
    AutoDetect = True
    Active = True
    ControlUseTrueXPStyle = True
    BtnRoundArc = 5
    BtnOutLineBorderColor = 7552000
    BtnInnerBorderMoveColor = 3257087
    BtnInnerBorderFocusColor = 15183500
    BtnSurfaceNormalColor = clSkyBlue
    BtnSurfaceDownColor = clRed
    BtnSurfaceBottomLineColor = 14608359
    BtnSurfaceDownBottomLineColor = 15199215
    RdoChkControlChkColor = 41472
    ComboBoxChkColor = 9201994
    ComboboxSurfaceMoveColor = 16771030
    ControlDisabledBorderColor = 11913158
    Left = 160
    Top = 244
  end
end
