object MainProduce: TMainProduce
  Left = 210
  Top = 122
  Width = 696
  Height = 530
  Caption = #20027#29983#20135#35745#21010
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 208
    Top = 328
    Width = 473
    Height = 169
    BorderStyle = bsSingle
    TabOrder = 4
    object BitBtn14: TBitBtn
      Left = 24
      Top = 16
      Width = 129
      Height = 25
      Caption = #30001#38656#27714#35745#21010#23548#20837
      TabOrder = 0
      OnClick = BitBtn14Click
      Kind = bkOK
    end
  end
  object Panel1: TPanel
    Left = -2
    Top = 48
    Width = 690
    Height = 41
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 0
    object Label6: TLabel
      Left = 87
      Top = 13
      Width = 57
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #29289#26009#32534#21495
    end
    object Label7: TLabel
      Left = 274
      Top = 13
      Width = 57
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #24180#20221
    end
    object Label8: TLabel
      Left = 458
      Top = 13
      Width = 57
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #35745#21010#26399
    end
    object BitBtn12: TBitBtn
      Left = 2
      Top = 2
      Width = 79
      Height = 33
      Caption = #25628#32034
      TabOrder = 0
      OnClick = BitBtn12Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888880008888
        8000888880808888808088888000788870008888800000000000000000800008
        00000888808000080000080080000000000008888800008000080CCCCCC00CCC
        00888C888880088800888C800800080800888C8888888888C8888CCCCCCCCCCC
        C8888C8CC8CC8CC8C8888CCCCCCCCCCCC8888888888888888888}
      Layout = blGlyphRight
      Spacing = 3
    end
    object Edit1: TEdit
      Left = 143
      Top = 10
      Width = 100
      Height = 21
      ImeName = #32043#20809#25340#38899#36755#20837#27861
      TabOrder = 1
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 330
      Top = 10
      Width = 100
      Height = 21
      ImeName = #32043#20809#25340#38899#36755#20837#27861
      TabOrder = 2
      OnKeyPress = Edit2KeyPress
    end
    object Edit3: TEdit
      Left = 514
      Top = 10
      Width = 100
      Height = 21
      ImeName = #32043#20809#25340#38899#36755#20837#27861
      TabOrder = 3
      OnKeyPress = Edit3KeyPress
    end
  end
  object Panel2: TPanel
    Left = 208
    Top = 92
    Width = 478
    Height = 229
    BorderStyle = bsSingle
    TabOrder = 2
    object Label1: TLabel
      Left = 18
      Top = 20
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20135#21697#32534#21495
    end
    object Label2: TLabel
      Left = 249
      Top = 20
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20135#21697#21517#31216
    end
    object Label3: TLabel
      Left = 18
      Top = 52
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #24180#20221
    end
    object Label4: TLabel
      Left = 249
      Top = 51
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #35745#21010#26399
    end
    object Label5: TLabel
      Left = 18
      Top = 84
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #24320#22987#26085#26399
    end
    object Label9: TLabel
      Left = 249
      Top = 84
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #32467#26463#26085#26399
    end
    object Label10: TLabel
      Left = 102
      Top = 112
      Width = 64
      Height = 13
      AutoSize = False
      Caption = #38656#27714#25968#37327
    end
    object Label11: TLabel
      Left = 14
      Top = 152
      Width = 64
      Height = 13
      AutoSize = False
      Caption = #22791#27880
    end
    object Label12: TLabel
      Left = 14
      Top = 113
      Width = 64
      Height = 13
      AutoSize = False
      Caption = #26399#21021#24211#23384
    end
    object Label13: TLabel
      Left = 190
      Top = 112
      Width = 64
      Height = 13
      AutoSize = False
      Caption = 'MPS'#25968#37327
    end
    object Label14: TLabel
      Left = 276
      Top = 112
      Width = 75
      Height = 13
      AutoSize = False
      Caption = #29983#20135#21333#25968#37327
    end
    object Label15: TLabel
      Left = 361
      Top = 112
      Width = 64
      Height = 13
      AutoSize = False
      Caption = #39044#35745#24211#23384
    end
    object DBEdit1: TDBEdit
      Left = 86
      Top = 16
      Width = 121
      Height = 21
      DataField = #29289#26009#32534#21495
      DataSource = DataSource2
      Enabled = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 318
      Top = 16
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 86
      Top = 48
      Width = 121
      Height = 21
      DataField = #24180#20221
      DataSource = DataSource2
      Enabled = False
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 318
      Top = 48
      Width = 121
      Height = 21
      DataField = #35745#21010#26399
      DataSource = DataSource2
      Enabled = False
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 86
      Top = 80
      Width = 121
      Height = 21
      DataField = #24320#22987#26085#26399
      DataSource = DataSource2
      Enabled = False
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 318
      Top = 80
      Width = 121
      Height = 21
      DataField = #32467#26463#26085#26399
      DataSource = DataSource2
      Enabled = False
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 102
      Top = 128
      Width = 80
      Height = 21
      DataField = #38656#27714#25968#37327
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 6
    end
    object DBMemo1: TDBMemo
      Left = 16
      Top = 168
      Width = 425
      Height = 49
      DataField = #22791#27880
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 7
    end
    object BitBtn13: TBitBtn
      Left = 214
      Top = 15
      Width = 25
      Height = 21
      Enabled = False
      TabOrder = 8
      OnClick = BitBtn13Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888808888888888888800088888888888800088888888888800
        0888888800000000888888800BBB000888888800BBBBB0088888880BBBBBBB08
        8888880BBB0BBB088888880BB080BB0888888800BB0BB008888888800BBB0088
        8888888800000888888888888888888888888888888888888888}
    end
    object BitBtn11: TBitBtn
      Left = 214
      Top = 47
      Width = 25
      Height = 21
      Enabled = False
      TabOrder = 9
      OnClick = BitBtn11Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888808888888888888800088888888888800088888888888800
        0888888800000000888888800BBB000888888800BBBBB0088888880BBBBBBB08
        8888880BBB0BBB088888880BB080BB0888888800BB0BB008888888800BBB0088
        8888888800000888888888888888888888888888888888888888}
    end
    object DBEdit8: TDBEdit
      Left = 14
      Top = 128
      Width = 80
      Height = 21
      DataField = #26399#21021#24211#23384
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 10
    end
    object DBEdit9: TDBEdit
      Left = 190
      Top = 128
      Width = 80
      Height = 21
      DataField = 'MPS'#25968#37327
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 11
    end
    object DBEdit10: TDBEdit
      Left = 276
      Top = 128
      Width = 80
      Height = 21
      DataField = #29983#20135#21333#25968#37327
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 12
    end
    object DBEdit11: TDBEdit
      Left = 361
      Top = 128
      Width = 80
      Height = 21
      DataField = #39044#35745#24211#23384
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 13
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 688
    Height = 47
    AutoSize = True
    BorderWidth = 1
    ButtonHeight = 39
    ButtonWidth = 36
    Caption = 'ToolBar1'
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 0
      Top = 2
      Width = 41
      Height = 39
      BiDiMode = bdLeftToRight
      Caption = #39318#35760#24405
      ParentBiDiMode = False
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888448888818888888844888811
        8888888844888111888888884488111188888888448111118888888844881111
        8888888844888111888888884488881188888888448888818888888888888888
        8888888888888888888888888888888888888888888888888888}
      Layout = blGlyphTop
      Spacing = 0
    end
    object BitBtn2: TBitBtn
      Left = 41
      Top = 2
      Width = 41
      Height = 39
      BiDiMode = bdLeftToRight
      Caption = #19978#35760#24405
      ParentBiDiMode = False
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888881888888888888881188
        8888888888811188888888888811118888888888811111888888888888111188
        8888888888811188888888888888118888888888888881888888888888888888
        8888888888888888888888888888888888888888888888888888}
      Layout = blGlyphTop
      Spacing = 0
    end
    object BitBtn3: TBitBtn
      Left = 82
      Top = 2
      Width = 41
      Height = 39
      BiDiMode = bdLeftToRight
      Caption = #19979#35760#24405
      ParentBiDiMode = False
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888881888888888888888118888
        8888888888111888888888888811118888888888881111188888888888111188
        8888888888111888888888888811888888888888881888888888888888888888
        8888888888888888888888888888888888888888888888888888}
      Layout = blGlyphTop
      Spacing = 0
    end
    object BitBtn4: TBitBtn
      Left = 123
      Top = 2
      Width = 41
      Height = 39
      BiDiMode = bdLeftToRight
      Caption = #23614#35760#24405
      ParentBiDiMode = False
      TabOrder = 3
      OnClick = BitBtn4Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888188888448888888811888844
        8888888811188844888888881111884488888888111118448888888811118844
        8888888811188844888888881188884488888888188888448888888888888888
        8888888888888888888888888888888888888888888888888888}
      Layout = blGlyphTop
      Spacing = 0
    end
    object ToolButton1: TToolButton
      Left = 164
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsDivider
    end
    object BitBtn5: TBitBtn
      Left = 172
      Top = 2
      Width = 41
      Height = 39
      BiDiMode = bdLeftToRight
      Caption = #26032#22686
      ParentBiDiMode = False
      TabOrder = 4
      OnClick = BitBtn5Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888800000000000888880888888888088888088888888
        8088888088888888808888808888888880888880888888888088888088888888
        8088888088888888808888808888888880888880888888000088888088888808
        0888888088888800888888800000000888888888888888888888}
      Layout = blGlyphTop
      Spacing = 0
    end
    object BitBtn6: TBitBtn
      Left = 213
      Top = 2
      Width = 41
      Height = 39
      BiDiMode = bdLeftToRight
      Caption = #20462#25913
      ParentBiDiMode = False
      TabOrder = 5
      OnClick = BitBtn6Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888880808080888888888888888008888888888888800088888000000000B
        708888088888880B8088880800800800B708880888888880B808880CCCCCCCCC
        0B70888C888888880B00888C800800800011888C888888888000888CCCCCCCCC
        CCC8888C8CC8CC8CC8C8888CCCCCCCCCCCC88888888888888888}
      Layout = blGlyphTop
      Spacing = 0
    end
    object BitBtn7: TBitBtn
      Left = 254
      Top = 2
      Width = 41
      Height = 39
      BiDiMode = bdLeftToRight
      Caption = #21024#38500
      ParentBiDiMode = False
      TabOrder = 6
      OnClick = BitBtn7Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888881F88881F8888888888888991F8888889F8888191F88888
        1F888888199F88891F8888888191F819F88888888819199F88888888888919F8
        888888888891911F888888888191F89F88888889191F88819F88881919F88888
        19F88891F8888888819F88888888888888888888888888888888}
      Layout = blGlyphTop
      Spacing = 0
    end
    object ToolButton2: TToolButton
      Left = 295
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsDivider
    end
    object BitBtn8: TBitBtn
      Left = 303
      Top = 2
      Width = 41
      Height = 39
      BiDiMode = bdLeftToRight
      Caption = #20445#23384
      Enabled = False
      ParentBiDiMode = False
      TabOrder = 7
      OnClick = BitBtn8Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888880000000000000880EE000000880E0880EE000000880E0880EE00000088
        0E0880EE000000000E0880EEEEEEEEEEEE0880EE00000000EE0880E088888888
        0E0880E0888888880E0880E0888888880E0880E0888888880E0880E088888888
        000880E088888888080880000000000000088888888888888888}
      Layout = blGlyphTop
      Spacing = 0
    end
    object BitBtn9: TBitBtn
      Left = 344
      Top = 2
      Width = 41
      Height = 39
      BiDiMode = bdLeftToRight
      Caption = #21462#28040
      Enabled = False
      ParentBiDiMode = False
      TabOrder = 8
      OnClick = BitBtn9Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888708888800000888880788880CC08888888088880C0888888
        8808888008088888880888808880088880788888888880000788888888888888
        8888888888888888888888888888888888888888888888888888}
      Layout = blGlyphTop
      Spacing = 0
    end
    object ToolButton3: TToolButton
      Left = 385
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsDivider
    end
    object BitBtn10: TBitBtn
      Left = 393
      Top = 2
      Width = 41
      Height = 39
      BiDiMode = bdLeftToRight
      Caption = #36864#20986
      ParentBiDiMode = False
      TabOrder = 9
      OnClick = BitBtn10Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888800888888
        8888888030888888888888033088888888888833300000000888883330880888
        88888033008808888488F033308808884488F033308808844444F03330880844
        4444803330880884444488330888088844888830888808888488880888880888
        8888880000000888888888888888888888888888888888888888}
      Layout = blGlyphTop
      Spacing = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 216
    Top = 380
    Width = 457
    Height = 109
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = #29289#26009#32534#21495
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29289#26009#21517#31216
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24180#20221
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35745#21010#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #38656#27714#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24320#22987#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32467#26463#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29366#24577
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 3
    Top = 92
    Width = 201
    Height = 405
    DataSource = DataSource2
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = #29289#26009#32534#21495
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24180#20221
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35745#21010#26399
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24320#22987#26085#26399
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32467#26463#26085#26399
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MPS'#25968#37327
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = #38656#27714#25968#37327
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29366#24577
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29983#20135#21333#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26399#21021#24211#23384
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39044#35745#24211#23384
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35760#24080#20154
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20462#25913#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23457#26680#20154
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23457#26680#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22791#27880
        Width = 150
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 480
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=mrpbook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select a.*,b.'#29289#26009#21517#31216' from '#20027#38656#27714#35745#21010' a,'#29289#26009#20027#25991#20214' b'
      'where a.'#29289#26009#32534#21495'=b.'#29289#26009#32534#21495)
    Left = 512
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=mrpbook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from '#20027#29983#20135#35745#21010)
    Left = 536
    Top = 8
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    OnDataChange = DataSource2DataChange
    Left = 560
    Top = 8
  end
  object ADOCommand1: TADOCommand
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=mrpbook'
    Parameters = <>
    Left = 448
    Top = 8
  end
  object ADOQuery3: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=mrpbook'
    CursorType = ctStatic
    Parameters = <>
    Left = 592
    Top = 8
  end
end
