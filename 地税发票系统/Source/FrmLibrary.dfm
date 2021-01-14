object GenLibrary: TGenLibrary
  Left = 200
  Top = 173
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21457#31080#24635#24211
  ClientHeight = 499
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 729
    Height = 41
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 54
      Height = 13
      Caption = #21457#31080#31181#31867'  '
    end
    object Label2: TLabel
      Left = 200
      Top = 16
      Width = 57
      Height = 13
      Caption = #21457#31080#21495#30721'   '
    end
    object Label3: TLabel
      Left = 472
      Top = 16
      Width = 54
      Height = 13
      Caption = #21333#20301#21517#31216'  '
    end
    object AdvEdit1: TAdvEdit
      Left = 264
      Top = 16
      Width = 121
      Height = 21
      EmptyText = ' '#21457#31080#21495#30721#36827#34892#26597#35810
      FocusColor = 10541820
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      TabOrder = 1
      Visible = True
      OnKeyPress = AdvEdit1KeyPress
      Version = '2.7.0.0'
    end
    object AdvComboBox1: TAdvComboBox
      Left = 64
      Top = 16
      Width = 129
      Height = 21
      Color = clWindow
      Version = '1.2.0.0'
      Visible = True
      ButtonWidth = 18
      Style = csDropDownList
      DropWidth = 0
      Enabled = True
      ItemIndex = -1
      ItemHeight = 13
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      TabOrder = 0
      OnChange = AdvComboBox1Change
    end
    object AdvEdit2: TAdvEdit
      Left = 528
      Top = 16
      Width = 185
      Height = 21
      EmptyText = #20197#21333#20301#21517#31216#36827#34892#26597#35810
      FocusColor = 10541820
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      TabOrder = 3
      Visible = True
      OnKeyPress = AdvEdit2KeyPress
      Version = '2.7.0.0'
    end
    object CheckBox1: TCheckBox
      Left = 392
      Top = 16
      Width = 73
      Height = 17
      Caption = #27169#31946#26597#35810
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 400
    Width = 729
    Height = 97
    Caption = #21457#31080#24211#31649#29702
    TabOrder = 2
    object Label4: TLabel
      Left = 24
      Top = 24
      Width = 48
      Height = 13
      Caption = #26597#35810#26085#26399
    end
    object Label5: TLabel
      Left = 176
      Top = 24
      Width = 51
      Height = 13
      Caption = '------'#33267'-------'
    end
    object Label6: TLabel
      Left = 24
      Top = 56
      Width = 48
      Height = 13
      Caption = #24635#20849#37329#39069
    end
    object Label7: TLabel
      Left = 176
      Top = 56
      Width = 48
      Height = 13
      Caption = #21457#31080#20221#25968
    end
    object cxDateEdit1: TcxDateEdit
      Left = 80
      Top = 24
      Width = 89
      Height = 21
      TabOrder = 4
    end
    object cxDateEdit2: TcxDateEdit
      Left = 232
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object cxTextEdit1: TcxTextEdit
      Left = 80
      Top = 56
      Width = 89
      Height = 21
      Properties.ReadOnly = True
      TabOrder = 10
    end
    object cxTextEdit2: TcxTextEdit
      Left = 232
      Top = 56
      Width = 121
      Height = 21
      Properties.ReadOnly = True
      TabOrder = 11
    end
    object cxButton19: TcxButton
      Left = 371
      Top = 17
      Width = 75
      Height = 25
      Caption = #26597'  '#35810
      TabOrder = 0
      OnClick = cxButton19Click
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
    object cxButton7: TcxButton
      Left = 465
      Top = 17
      Width = 75
      Height = 25
      Caption = #21047'  '#26032
      TabOrder = 1
      OnClick = cxButton7Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00559999999995
        5555557777777775F5555559999999505555555777777757FFF5555555555550
        0955555555555FF7775F55555555995501955555555577557F75555555555555
        01995555555555557F5755555555555501905555555555557F57555555555555
        0F905555555555557FF75555555555500005555555555557777555555555550F
        F05555555555557F57F5555555555008F05555555555F775F755555555570000
        05555555555775577555555555700007555555555F755F775555555570000755
        55555555775F77555555555700075555555555F75F7755555555570007555555
        5555577F77555555555500075555555555557777555555555555}
      NumGlyphs = 2
    end
    object cxButton21: TcxButton
      Left = 646
      Top = 17
      Width = 75
      Height = 25
      Caption = #20851'  '#38381
      TabOrder = 3
      OnClick = cxButton21Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0000377777777777777703030303030303037F7F7F7F7F7F7F7F000000000000
        00007777777777777777933393303933337073F37F37F73F3377393393303393
        379037FF7F37F37FF777379793303379793037777337F3777737339933303339
        93303377F3F7F3F77F3733993930393993303377F737F7377FF7399993303399
        999037777337F377777793993330333393307377FF37F3337FF7333993303333
        993033377F37F33377F7333993303333993033377337F3337737333333303333
        33303FFFFFF7FFFFFFF700000000000000007777777777777777030303030303
        03037F7F7F7F7F7F7F7F00000000000000007777777777777777}
      NumGlyphs = 2
    end
    object cxButton9: TcxButton
      Left = 465
      Top = 52
      Width = 75
      Height = 25
      Caption = #20316'  '#24223
      TabOrder = 7
      OnClick = cxButton9Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object cxButton3: TcxButton
      Left = 556
      Top = 17
      Width = 75
      Height = 25
      Caption = #25171'  '#21360
      TabOrder = 2
      OnClick = cxButton3Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF999903333
        333333377777FFF33333FF9FFFF9993333333F7F3FF7773FF333009F00F03399
        3333777F7737FF773F33FF9FFFF9933393333F73FFF7733373F300F999903333
        393377377777F33337F3FFFFFFF0333339333FF33337F333373300FFFFF03333
        93337733FFF7F3337333FFF00000333333333F377777FF33FF330FF0FF999339
        93337337F3777FF77F33FFF0F993993993333337F77377F77F33FFF003339939
        93333337733F77377FFFFFF03399933999933FF733777337777F000339933339
        93997773377F3FF77F7733333993993993993333377F77377F77333333999339
        9993333333777337777333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object cxButton4: TcxButton
      Left = 556
      Top = 52
      Width = 75
      Height = 25
      Caption = #26597#30475#24223#31080
      Enabled = False
      TabOrder = 8
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
    end
    object cxButton2: TcxButton
      Left = 371
      Top = 52
      Width = 75
      Height = 25
      Caption = #20462'  '#25913
      TabOrder = 6
      OnClick = cxButton2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
    end
    object cxButton6: TcxButton
      Left = 647
      Top = 52
      Width = 75
      Height = 25
      Caption = #20851'  '#20110
      TabOrder = 9
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00559999999995
        5555557777777775F5555559999999505555555777777757FFF5555555555550
        0955555555555FF7775F55555555995501955555555577557F75555555555555
        01995555555555557F5755555555555501905555555555557F57555555555555
        0F905555555555557FF75555555555500005555555555557777555555555550F
        F05555555555557F57F5555555555008F05555555555F775F755555555570000
        05555555555775577555555555700007555555555F755F775555555570000755
        55555555775F77555555555700075555555555F75F7755555555570007555555
        5555577F77555555555500075555555555557777555555555555}
      NumGlyphs = 2
    end
  end
  object DBAdvGrid1: TDBAdvGrid
    Left = 0
    Top = 40
    Width = 729
    Height = 361
    Cursor = crDefault
    ColCount = 2
    DefaultRowHeight = 22
    RowCount = 2
    FixedRows = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    Bands.Active = True
    OnClickCell = DBAdvGrid1ClickCell
    SortSettings.AutoColumnMerge = True
    Look = glStandard
    SearchFooter.FindNextCaption = 'Find next'
    SearchFooter.FindPrevCaption = 'Find previous'
    SearchFooter.HighLightCaption = 'Highlight'
    SearchFooter.HintClose = 'Close'
    SearchFooter.HintFindNext = 'Find next occurence'
    SearchFooter.HintFindPrev = 'Find previous occurence'
    SearchFooter.HintHighlight = 'Highlight occurences'
    SearchFooter.MatchCaseCaption = 'Match case'
    PrintSettings.DateFormat = 'dd/mm/yyyy'
    PrintSettings.Font.Charset = DEFAULT_CHARSET
    PrintSettings.Font.Color = clWindowText
    PrintSettings.Font.Height = -11
    PrintSettings.Font.Name = 'MS Sans Serif'
    PrintSettings.Font.Style = []
    PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
    PrintSettings.FixedFont.Color = clWindowText
    PrintSettings.FixedFont.Height = -11
    PrintSettings.FixedFont.Name = 'MS Sans Serif'
    PrintSettings.FixedFont.Style = []
    PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
    PrintSettings.HeaderFont.Color = clWindowText
    PrintSettings.HeaderFont.Height = -11
    PrintSettings.HeaderFont.Name = 'MS Sans Serif'
    PrintSettings.HeaderFont.Style = []
    PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
    PrintSettings.FooterFont.Color = clWindowText
    PrintSettings.FooterFont.Height = -11
    PrintSettings.FooterFont.Name = 'MS Sans Serif'
    PrintSettings.FooterFont.Style = []
    PrintSettings.PageNumSep = '/'
    MouseActions.AllColumnSize = True
    MouseActions.RowSelect = True
    ScrollWidth = 16
    FixedColWidth = 20
    FixedRowHeight = 22
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = [fsBold]
    FloatFormat = '%.2f'
    Filter = <>
    Version = '2.0.5.0'
    AutoCreateColumns = True
    AutoRemoveColumns = True
    Columns = <
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Style = []
        Width = 20
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Style = []
        Width = 64
      end>
    DataSource = DataSource1
    ShowMemoFields = False
    ShowBooleanFields = False
    ShowPictureFields = False
    ShowUnicode = False
    ColWidths = (
      20
      64)
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = ADOGen
    Left = 80
    Top = 88
  end
  object ADOGen: TADOQuery
    Connection = DataModule1.ADOCon
    CursorType = ctStatic
    Parameters = <>
    Left = 80
    Top = 56
  end
end
