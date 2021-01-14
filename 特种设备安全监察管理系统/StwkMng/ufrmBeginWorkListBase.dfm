object frmBeginWorkListBase: TfrmBeginWorkListBase
  Left = 157
  Top = 155
  Width = 696
  Height = 480
  Caption = 'frmBeginWorkListBase'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel2: TPanel
    Left = 0
    Top = 397
    Width = 688
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 326
      Top = 8
      Width = 60
      Height = 12
      Caption = #24320#24037#26085#26399#20174
    end
    object Label2: TLabel
      Left = 488
      Top = 8
      Width = 12
      Height = 12
      Caption = #21040
    end
    object bbtnFind: TBitBtn
      Left = 3
      Top = 3
      Width = 60
      Height = 22
      Caption = #26597#25214
      TabOrder = 0
      OnClick = bbtnFindClick
      Glyph.Data = {
        2A010000424D2A01000000000000760000002800000010000000100000000100
        040002000000B4000000C40E0000C40E00000000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0010DD000010DD
        00000400020D04DD0400020D000000060F000D0004DD00060F000D0000000006
        0F000D0004DD00060F000D0000000600020D0600020D0000000400F00400020F
        0400020D0000000A00F000800F000400020D0000000A00F000800F000400020D
        000002D00C0002DD00000010DD0F000D0F000DDD000002DD0400020D04000004
        0DDD0000000CDDD000DDD00004DD0000000CDDD0F0DDD0F004DD0000000CDDD0
        00DDD00004DD000010DD00000001}
    end
    object bbtnFilter: TBitBtn
      Left = 65
      Top = 3
      Width = 60
      Height = 22
      Caption = #36807#28388
      TabOrder = 1
      OnClick = bbtnFilterClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777770000000
        0000777770F7F7F7F7F07777707F7F700070777770F7F7F0F0F0777770700070
        0070777770F7F7F7F7F07777707F7F70007077770007F7F0F0F0777706000070
        007077770707F7F7F7F077770704444444447770776044444444770777760777
        7777706FF7776077777700000000000777777777777777777777}
    end
    object bbtnColCtrl: TBitBtn
      Left = 127
      Top = 3
      Width = 70
      Height = 22
      Caption = #21015#25511#21046
      TabOrder = 2
      OnClick = bbtnColCtrlClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C40E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFF333
        333330888888F333303030880888F333003030800088F330003030808008F333
        003030888808F333303030888888F33333333000000003333333333333333333
        333300000000000000000F888888F88888870F800088F80008870F888888F888
        88870F888888F88888870FFFFFF8FFFFFF870000000000000000}
    end
    object deStartDate: TCSdxDateEdit
      Left = 386
      Top = 4
      Width = 100
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 5
      Date = -700000
      SaveTime = False
      FixedDateFormat = 'yyyy-MM-dd'
      StoredValues = 4
    end
    object deEndDate: TCSdxDateEdit
      Left = 502
      Top = 4
      Width = 100
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 6
      Date = -700000
      SaveTime = False
      FixedDateFormat = 'yyyy-MM-dd'
      StoredValues = 4
    end
    object bbtnCollapse: TBitBtn
      Left = 199
      Top = 3
      Width = 60
      Height = 22
      Caption = #25910#36215
      TabOrder = 3
      OnClick = bbtnCollapseClick
      Glyph.Data = {
        0E010000424D0E01000000000000760000002800000010000000100000000100
        04000200000098000000C40E0000C40E00000000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0010FF000010FF
        00000A00020F04FF000002000833023004FF000000040B030833020F02FF0000
        00040FB00833023002FF000000060BFB03000833020F000000060FBFB0000A00
        0000020B08FB020F04FF0000020F08BF020F04FF000000040BFB0600020F04FF
        00000004F0000CFF000008FF0004000F04FF000008FF020006FF000008FF040F
        0004FF0F00000AFF0004F00002FF00000001}
    end
    object bbtnExpand: TBitBtn
      Left = 261
      Top = 3
      Width = 60
      Height = 22
      Caption = #23637#24320
      TabOrder = 4
      OnClick = bbtnExpandClick
      Glyph.Data = {
        0C010000424D0C01000000000000760000002800000010000000100000000100
        04000200000096000000C40E0000C40E00000000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0010FF000010FF
        00000A00020F04FF000002000833023004FF000000040B030833020F02FF0000
        00040FB00833023002FF000000060BFB03000833020F000000060FBFB0000A00
        0000020B08FB020F04FF0000020F08BF020F04FF000000040BFB0600020F04FF
        00000004F00008FF0004000F00000CFF0004F00F000008FF00040FFF040F0000
        08FF0004F00004FF000010FF00000001}
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 425
    Width = 688
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    object Panel3: TPanel
      Left = 533
      Top = 1
      Width = 154
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 4
      object bbtnClose: TBitBtn
        Left = 77
        Top = 2
        Width = 75
        Height = 22
        Caption = #20851#38381'(&C)'
        TabOrder = 1
        OnClick = bbtnCloseClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF000FFF
          FFFFFFFF005000FFFFFFFF0055500000FFFF0055555000000FFF055555507880
          00FF055555507770FFFF05555B5077700FF005555B507770B00B05555550770B
          BBBB05555550770BBBBB055555507770B00B0555555077700FF0055555007770
          FFFF055500777770FFFF050077777770FFFF000000000000FFFF}
      end
      object bbtnHelp: TBitBtn
        Left = 0
        Top = 2
        Width = 75
        Height = 22
        Caption = #24110#21161'(&H)'
        TabOrder = 0
        Glyph.Data = {
          36010000424D3601000000000000760000002800000010000000100000000100
          040002000000C0000000C40E0000C40E00000000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000ADD02D004DD
          00000ADD020004DD00000004DDD70477000870B07DDD000002DD060000080FF0
          07DD00000004D0FF06FB0006FFF07D0000000010D0FBFFF44FFBF07D00000010
          D0FFFBFFFBFFF07D00000010D0FBFFF47FFBF07D00000010D0FFFBF748FFF07D
          00000010D0FBFFFB747BF07D00000010D0FFF47FF44FF07D00000010D0FBF44B
          844BF07D00000006D0FFF800044400068FF07D0000000010D0FBFFFBFFFBF07D
          00000010D0FFFBFFFBFFF0DD000002DD0A0000040DDD00000001}
      end
    end
    object bbtnAddReport: TBitBtn
      Left = 3
      Top = 3
      Width = 80
      Height = 22
      Caption = #28155#21152#25253#21578
      TabOrder = 0
      OnClick = bbtnAddReportClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADAAD77777777777777D000000000000007A0FBFBFBFB00FB07D0BFBFBFBF08
        0F07A0FBFBFBFB0B8007D0BFBFBFBF000007F0F7BFBFBBFBFB077BB7FB7BFFBF
        BF07A7F7B7BFBBFBFB07777F7FBFBFBFBF07FB7BF7777000000DD7B7B7BADADA
        DADA7BA7FD7BADADADADBAD7BAD7DADADADAADA7FDADADADADAD}
    end
    object bbtnEditReport: TBitBtn
      Left = 85
      Top = 3
      Width = 80
      Height = 22
      Caption = #20462#25913#25253#21578
      TabOrder = 1
      OnClick = bbtnEditReportClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADAAD77777777777777D000000000000007A0FBFBFBFB00FB07D0BFBFBFBF08
        0F07A0F0F0F0FB0B8007D0BFBFB00F000007A0FBFBF0B0FBFB07D0BFBFB0B0BF
        BF07A0FBFBF0BB0BFB07D0BFBFB0BB0FBF07A00000000BB0000DDADADADA0BB0
        DADAADADADADA0000DADDADADADAD0110ADAADADADADAD00ADAD}
    end
    object bbtnDeleteReport: TBitBtn
      Left = 167
      Top = 3
      Width = 80
      Height = 22
      Caption = #21024#38500#25253#21578
      TabOrder = 2
      OnClick = bbtnDeleteReportClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADAAD77777777777777D000000000000007A0FBFBFBFB00FB0770BFBFBFBF08
        0F0710FBFBFBFB0B800711BFBF71BF000007717BF717FBFBFB07D117B11FBFBF
        BF07A71111FBFBFBFB07D7111FBFBFBFBF07711117000000000D117A117ADADA
        DADAADADA117ADADADADDADADA117ADADADAADADADADADADADAD}
    end
    object bbtnRefresh: TBitBtn
      Left = 249
      Top = 3
      Width = 60
      Height = 22
      Caption = #21047#26032
      TabOrder = 3
      OnClick = bbtnRefreshClick
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C000000000000000000000000000000000000000000000000
        00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F0002FF7FFF7FFF7FFF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7F00020002FF7FFF7FFF7FFF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7FFF7F00020002000200020002FF7FFF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7F00020002FF7FFF7F0002FF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F0002FF7FFF7F0002FF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7F0002FF7FFF7FFF7FFF7FFF7F0002FF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7F0002FF7FFF7F0002FF7FFF7FFF7FFF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7F0002FF7FFF7F00020002FF7FFF7FFF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7FFF7F00020002000200020002FF7FFF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F00020002FF7FFF7FFF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F0002FF7FFF7F000000000000
        00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000
        1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000001F7C
        1F7C1F7C1F7C1F7C00000000000000000000000000000000000000001F7C1F7C
        1F7C1F7C1F7C}
    end
  end
  object grdList: TdxDBGrid
    Left = 0
    Top = 0
    Width = 688
    Height = 375
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'sysid'
    ShowGroupPanel = True
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    TabOrder = 0
    DataSource = Listd
    Filter.Criteria = {00000000}
    LookAndFeel = lfFlat
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    OnChangeNode = grdListChangeNode
    OnCustomDraw = grdListCustomDraw
    object grdListreport_no: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'report_no'
    end
    object grdListdev_kind: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'dev_kind'
    end
    object grdListconst_kind: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'const_kind'
    end
    object grdListappraise_date: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'appraise_date'
    end
    object grdListproject_name: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'project_name'
    end
    object grdListproperty_com: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'property_com'
    end
    object grdListproperty_address: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'property_address'
    end
    object grdListproperty_manager: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'property_manager'
    end
    object grdListmanager_tel: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'manager_tel'
    end
    object grdListprj_design_com: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'prj_design_com'
    end
    object grdListcontract_no: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'contract_no'
    end
    object grdListcontract_date: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'contract_date'
    end
    object grdListbuild_project: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'build_project'
    end
    object grdListdev_num: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'dev_num'
    end
    object grdListstart_date: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'start_date'
    end
    object grdListend_date: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'end_date'
    end
    object grdListbuild_charge: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'build_charge'
      Nullable = False
    end
    object grdListdev_charge: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'dev_charge'
      Nullable = False
    end
    object grdListconst_com: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'const_com'
    end
    object grdListconst_address: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'const_address'
    end
    object grdListconst_reg_no: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'const_reg_no'
    end
    object grdListconst_deputy: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'const_deputy'
    end
    object grdListconst_lics_no: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'const_lics_no'
    end
    object grdListconst_lics_date: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'const_lics_date'
    end
    object grdListconst_group: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'const_group'
    end
    object grdListconst_group_address: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'const_group_address'
    end
    object grdListconst_group_tel: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'const_group_tel'
    end
    object grdListconst_group_fax: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'const_group_fax'
    end
    object grdListconst_manager: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'const_manager'
    end
    object grdListconst_manager_tel: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'const_manager_tel'
    end
    object grdListconst_instructor: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'const_instructor'
    end
    object grdListconst_instructor_tel: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'const_instructor_tel'
    end
    object grdListidea_content: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'idea_content'
    end
    object grdListnotice_no: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'notice_no'
    end
    object grdListnotice_date: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'notice_date'
    end
    object grdListstate: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'state'
    end
  end
  object CSRowCountPanel1: TCSRowCountPanel
    Left = 0
    Top = 375
    Width = 688
    Align = alBottom
    TabOrder = 1
    CaptionFormat = ' '#35760#24405#25968#65306'%d'
    DataSource = Listd
  end
  object List: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM device.equipment_stwk_report')
    Left = 90
    Top = 138
    object Listsysid: TStringField
      FieldName = 'sysid'
    end
    object Listreport_no: TStringField
      DisplayLabel = #25253#21578#32534#21495
      FieldName = 'report_no'
    end
    object Listdev_kind: TStringField
      DisplayLabel = #35774#22791#31181#31867
      FieldName = 'dev_kind'
      Size = 50
    end
    object Listconst_kind: TStringField
      DisplayLabel = #26045#24037#31867#21035
      FieldName = 'const_kind'
      Size = 10
    end
    object Listappraise_date: TStringField
      DisplayLabel = #21578#30693#26085#26399
      FieldName = 'appraise_date'
      Size = 10
    end
    object Listproject_name: TStringField
      DisplayLabel = #24037#31243#21517#31216
      FieldName = 'project_name'
      Size = 60
    end
    object Listproperty_com: TStringField
      DisplayLabel = #24314#35774#21333#20301#21517#31216
      FieldName = 'property_com'
      Size = 60
    end
    object Listproperty_address: TStringField
      DisplayLabel = #24314#35774#21333#20301#22320#22336
      FieldName = 'property_address'
      Size = 100
    end
    object Listproperty_manager: TStringField
      DisplayLabel = #24037#31243#36127#36131#20154
      FieldName = 'property_manager'
      Size = 30
    end
    object Listmanager_tel: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'manager_tel'
      Size = 30
    end
    object Listprj_design_com: TStringField
      DisplayLabel = #24037#31243#35774#35745#21333#20301
      FieldName = 'prj_design_com'
      Size = 60
    end
    object Listcontract_no: TStringField
      DisplayLabel = #21512#21516#32534#21495
      FieldName = 'contract_no'
      Size = 30
    end
    object Listcontract_date: TStringField
      DisplayLabel = #21512#21516#31614#35746#26085#26399
      FieldName = 'contract_date'
      Size = 10
    end
    object Listbuild_project: TStringField
      DisplayLabel = #20027#35201#26045#24037#39033#30446
      FieldName = 'build_project'
      Size = 60
    end
    object Listdev_num: TIntegerField
      DisplayLabel = #35774#22791#25968
      FieldName = 'dev_num'
    end
    object Liststart_date: TStringField
      DisplayLabel = #24320#24037#26085#26399
      FieldName = 'start_date'
      Size = 10
    end
    object Listend_date: TStringField
      DisplayLabel = #31459#24037#26085#26399
      FieldName = 'end_date'
      Size = 10
    end
    object Listbuild_charge: TBCDField
      DisplayLabel = #22303#24314#39044#31639
      FieldName = 'build_charge'
      Precision = 18
      Size = 3
    end
    object Listdev_charge: TBCDField
      DisplayLabel = #35774#22791#39044#31639
      FieldName = 'dev_charge'
      Precision = 18
      Size = 3
    end
    object Listconst_com: TStringField
      DisplayLabel = #26045#24037#21333#20301
      FieldName = 'const_com'
      Size = 60
    end
    object Listconst_address: TStringField
      DisplayLabel = #26045#24037#21333#20301#22320#22336
      FieldName = 'const_address'
      Size = 100
    end
    object Listconst_reg_no: TStringField
      DisplayLabel = #32452#32455#26426#26500#20195#30721
      FieldName = 'const_reg_no'
      Size = 12
    end
    object Listconst_deputy: TStringField
      DisplayLabel = #27861#23450#20195#34920#20154
      FieldName = 'const_deputy'
      Size = 30
    end
    object Listconst_lics_no: TStringField
      DisplayLabel = #35768#21487#35777#32534#21495
      FieldName = 'const_lics_no'
      Size = 50
    end
    object Listconst_lics_date: TStringField
      DisplayLabel = #35768#21487#35777#26377#25928#26399
      FieldName = 'const_lics_date'
      Size = 10
    end
    object Listconst_group: TStringField
      DisplayLabel = #26045#24037#26426#26500#21517#31216
      FieldName = 'const_group'
      Size = 60
    end
    object Listconst_group_address: TStringField
      DisplayLabel = #26045#24037#26426#26500#22320#22336
      FieldName = 'const_group_address'
      Size = 100
    end
    object Listconst_group_tel: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'const_group_tel'
      Size = 30
    end
    object Listconst_group_fax: TStringField
      DisplayLabel = #20256#30495
      FieldName = 'const_group_fax'
      Size = 30
    end
    object Listconst_manager: TStringField
      DisplayLabel = #26045#24037#29616#22330#36127#36131#20154
      FieldName = 'const_manager'
      Size = 30
    end
    object Listconst_manager_tel: TStringField
      DisplayLabel = #31227#21160#30005#35805
      FieldName = 'const_manager_tel'
      Size = 30
    end
    object Listconst_instructor: TStringField
      DisplayLabel = #29616#22330#25216#26415#36127#36131#20154
      FieldName = 'const_instructor'
      Size = 30
    end
    object Listconst_instructor_tel: TStringField
      DisplayLabel = #31227#21160#30005#35805
      FieldName = 'const_instructor_tel'
      Size = 30
    end
    object Listidea_content: TStringField
      DisplayLabel = #24847#35265
      FieldName = 'idea_content'
      Size = 300
    end
    object Listnotice_no: TStringField
      DisplayLabel = #24847#35265#36890#30693#20070#32534#21495
      FieldName = 'notice_no'
    end
    object Listnotice_date: TStringField
      DisplayLabel = #21457#20986#24847#35265#20070#26085#26399
      FieldName = 'notice_date'
      Size = 10
    end
    object Listremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 300
    end
    object Listoutflag: TIntegerField
      FieldName = 'outflag'
    end
    object Liststate: TIntegerField
      DisplayLabel = #29366#24577
      FieldName = 'state'
    end
  end
  object Listd: TDataSource
    DataSet = List
    Left = 118
    Top = 138
  end
  object ListFind: TCSDBdxGrdFind
    QuantumCtrl = grdList
    Left = 38
    Top = 258
  end
  object ListFilter: TCSADOdxGrdFilter
    QuantumCtrl = grdList
    Left = 66
    Top = 258
  end
  object ListColCtrl: TCSdxGrdColCtrl
    QuantumCtrl = grdList
    ColList = <
      item
        ColIndex = 0
        Name = 'grdListreport_no'
        Caption = #23457#25209#32534#21495
        Visible = True
      end
      item
        ColIndex = 1
        Name = 'grdListreport_kind'
        Caption = #25253#21578#31867#22411
        Visible = True
      end
      item
        ColIndex = 2
        Name = 'grdListwork_state'
        Caption = #24320#24037#24615#36136
        Visible = True
      end
      item
        ColIndex = 3
        Name = 'grdListdeclare_date'
        Caption = #30003#25253#26085#26399
        Visible = True
      end
      item
        ColIndex = 4
        Name = 'grdListstart_date'
        Caption = #24320#24037#26085#26399
        Visible = True
      end
      item
        ColIndex = 5
        Name = 'grdListend_date'
        Caption = #31459#24037#26085#26399
        Visible = True
      end
      item
        ColIndex = 6
        Name = 'grdListaudit_date'
        Caption = #25209#20934#26085#26399
        Visible = True
      end
      item
        ColIndex = 7
        Name = 'grdListinst_name'
        Caption = #23433#35013#21333#20301
        Visible = True
      end
      item
        ColIndex = 8
        Name = 'grdListinst_deputy'
        Caption = #23433#35013#21333#20301#27861#20154
        Visible = True
      end
      item
        ColIndex = 9
        Name = 'grdListinst_deputy_tel'
        Caption = #23433#35013#21333#20301#27861#20154#30005#35805
        Visible = True
      end
      item
        ColIndex = 10
        Name = 'grdListinst_principal'
        Caption = #23433#35013#29616#22330#36127#36131#20154
        Visible = True
      end
      item
        ColIndex = 11
        Name = 'grdListinst_principal_tel'
        Caption = #23433#35013#29616#22330#36127#36131#20154#30005#35805
        Visible = True
      end
      item
        ColIndex = 12
        Name = 'grdListuser_name'
        Caption = #20351#29992#21333#20301
        Visible = True
      end
      item
        ColIndex = 13
        Name = 'grdListuser_contact'
        Caption = #20351#29992#21333#20301#32852#31995#20154
        Visible = True
      end
      item
        ColIndex = 14
        Name = 'grdListuser_tel'
        Caption = #20351#29992#21333#20301#32852#31995#30005#35805
        Visible = True
      end
      item
        ColIndex = 15
        Name = 'grdListmanu_name'
        Caption = #21046#36896#21333#20301
        Visible = True
      end
      item
        ColIndex = 16
        Name = 'grdListstate'
        Caption = 'state'
        Visible = False
      end>
    Left = 94
    Top = 258
  end
  object CSBarMDIChild1: TCSBarMDIChild
    Left = 122
    Top = 258
  end
  object ScrChild: TCSScrCtrlChild
    Master = dmData.ScrMaster
    Left = 150
    Top = 258
  end
  object Temp: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 90
    Top = 166
  end
end
