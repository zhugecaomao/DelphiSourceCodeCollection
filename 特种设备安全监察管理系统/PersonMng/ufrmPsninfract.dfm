object frmPsninfract: TfrmPsninfract
  Left = 44
  Top = 84
  Width = 690
  Height = 481
  Caption = #20154#21592#36829#35268#35760#24405
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter
    Left = 0
    Top = 89
    Width = 682
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object scrbDetail: TScrollBox
    Left = 0
    Top = 0
    Width = 682
    Height = 89
    Align = alTop
    TabOrder = 0
    object Label14: TLabel
      Left = 8
      Top = 8
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #20154#21592#22995#21517#65306
    end
    object Label19: TLabel
      Left = 193
      Top = 8
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #22870#24809#26085#26399#65306
    end
    object Label37: TLabel
      Left = 8
      Top = 31
      Width = 61
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #22870#24809#26426#26500#65306
    end
    object Label4: TLabel
      Left = 8
      Top = 54
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #22870#24809#39033#30446#65306
    end
    object Label5: TLabel
      Left = 193
      Top = 54
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #22870#24809#20107#30001#65306
    end
    object dteDate: TCSdxDBDateEdit
      Left = 253
      Top = 4
      Width = 120
      Color = clSkyBlue
      TabOrder = 0
      DataField = 'infractdatetime'
      DataSource = psnInfractd
      StyleController = dmData.dxStyleCtrl
      FixedDateFormat = 'yyyy-MM-dd'
      StoredValues = 4
    end
    object lcmbOrgan: TDBLookupComboboxEh
      Left = 68
      Top = 28
      Width = 304
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'actualize_organ'
      DataSource = psnInfractd
      EditButton.Visible = False
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = lcmbOrganEditButtons0Click
        end>
      KeyField = 'actualize_organ'
      ListField = 'actualize_organ_name'
      ListSource = mComd
      ParentCtl3D = False
      TabOrder = 1
      Visible = True
    end
    object lcmbName: TDBLookupComboboxEh
      Left = 68
      Top = 5
      Width = 120
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'person_sysid'
      DataSource = psnInfractd
      EditButton.Visible = False
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = lcmbNameEditButtons0Click
        end>
      KeyField = 'person_sysid'
      ListField = 'person_sysid_name'
      ListSource = mPersond
      ParentCtl3D = False
      TabOrder = 2
      Visible = True
    end
    object lcmbPrj: TDBLookupComboboxEh
      Left = 68
      Top = 51
      Width = 120
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'infract_content'
      DataSource = psnInfractd
      EditButtons = <>
      KeyField = 'id'
      ListField = 'name'
      ListSource = Infractprjd
      ParentCtl3D = False
      TabOrder = 3
      Visible = True
    end
    object lcmbReason: TDBLookupComboboxEh
      Left = 253
      Top = 51
      Width = 120
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'infract_reason'
      DataSource = psnInfractd
      EditButtons = <>
      KeyField = 'id'
      ListField = 'name'
      ListSource = InfractReasond
      ParentCtl3D = False
      TabOrder = 4
      Visible = True
    end
  end
  object grdInfractList: TDBGridEh
    Left = 0
    Top = 92
    Width = 682
    Height = 284
    Align = alClient
    AllowedOperations = []
    AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
    DataSource = listd
    EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -12
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    InternalSort = True
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
    ReadOnly = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'person_sysid_name'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'actualize_organ_name'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 169
      end
      item
        EditButtons = <>
        FieldName = 'infract_content_name'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'infract_reason_name'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'infractdatetime'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end>
  end
  object CSRowCountPanel1: TCSRowCountPanel
    Left = 0
    Top = 376
    Width = 682
    Align = alBottom
    TabOrder = 2
    CaptionFormat = ' '#35760#24405#25968#65306'%d'
  end
  object Panel7: TPanel
    Left = 0
    Top = 398
    Width = 682
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    object Panel8: TPanel
      Left = 229
      Top = 1
      Width = 452
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
      object Navigator: TCSDBNavigator
        Left = 302
        Top = 2
        Width = 150
        Height = 22
        DataSource = psnInfractd
        VisibleButtons = [nbPost, nbCancel, nbRefresh]
        Align = alCustom
        TabOrder = 2
        BeforeAction = NavigatorBeforeAction
        Captions.Strings = (
          #26368#21069
          #21518#36864
          #21069#36827
          #26368#21518
          #28155#21152
          #21024#38500
          #20462#25913
          #30830#35748
          #21462#28040
          #21047#26032)
      end
      object bbtnInfractIns: TBitBtn
        Left = 0
        Top = 2
        Width = 50
        Height = 22
        Hint = #28155#21152#35760#24405
        Caption = #28155#21152
        TabOrder = 0
        OnClick = bbtnInfractInsClick
        Glyph.Data = {
          46010000424D460100000000000076000000280000001C0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333300003333333333333333333FFFF333330000333330003333
          3333337333F3333300003333300033333333337333F333330000333330003333
          3333FF3333FFFF3300003300000000033337333333333F330000330000000003
          3337333333333F3300003300000000033337333333333F330000333330003333
          333777733337733300003333300033333333337333F333330000333330003333
          3333337333F33333000033333333333333333377773333330000333333333333
          33333333333333330000}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnInfractDel: TBitBtn
        Left = 50
        Top = 2
        Width = 50
        Height = 22
        Hint = #21024#38500#35760#24405
        Caption = #21024#38500
        TabOrder = 1
        OnClick = bbtnInfractDelClick
        Glyph.Data = {
          46010000424D460100000000000076000000280000001C0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333000033333333333333333333333333330000333333333333
          3333333333333333000033333333333333333333333333330000333333333333
          3337FFFFFFFFFFF3000033000000000033373333333333F30000330000000000
          33373333333333F3000033000000000033373333333333F30000333333333333
          33377777777777F3000033333333333333333333333333330000333333333333
          3333333333333333000033333333333333333333333333330000333333333333
          33333333333333330000}
        NumGlyphs = 2
        Spacing = 2
      end
      object navList: TCSDBNavigator
        Left = 102
        Top = 2
        Width = 200
        Height = 22
        DataSource = listd
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 3
        Captions.Strings = (
          #26368#21069
          #21518#36864
          #21069#36827
          #26368#21518
          #28155#21152
          #21024#38500
          #20462#25913
          #30830#35748
          #21462#28040
          #21047#26032)
      end
    end
    object bbtnFind: TBitBtn
      Left = 3
      Top = 3
      Width = 60
      Height = 22
      Hint = #26597#25214#35760#24405
      Caption = #26597#25214
      TabOrder = 0
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C000000000000000000001F7C1F7C1F7C1F7C1F7C000000000000
        000000001F7C0000FF7F0000000000001F7C1F7C1F7C1F7C1F7C0000FF7F0000
        000000001F7C0000FF7F0000000000001F7C1F7C1F7C1F7C1F7C0000FF7F0000
        000000001F7C00000000000000000000000000001F7C00000000000000000000
        000000001F7C00000000FF7F000000000000000000000000FF7F000000000000
        000000001F7C00000000FF7F000000000000186300000000FF7F000000000000
        000000001F7C00000000FF7F000000000000186300000000FF7F000000000000
        000000001F7C1F7C000000000000000000000000000000000000000000000000
        00001F7C1F7C1F7C1F7C0000FF7F0000000000001F7C0000FF7F000000000000
        1F7C1F7C1F7C1F7C1F7C000000000000000000001F7C00000000000000000000
        1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C0000000000001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F00001F7C1F7C1F7C0000FF7F00001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C0000000000001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
    object bbtnFilter: TBitBtn
      Left = 65
      Top = 3
      Width = 60
      Height = 22
      Hint = #36807#28388#35760#24405
      Caption = #36807#28388
      TabOrder = 1
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
    object bbtnColunm: TBitBtn
      Left = 127
      Top = 3
      Width = 70
      Height = 22
      Hint = #25511#21046#21015#34920#21306#22495#30340#26174#31034#39118#26684
      Caption = #21015#25511#21046
      TabOrder = 2
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 426
    Width = 682
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 4
    object Panel4: TPanel
      Left = 527
      Top = 1
      Width = 154
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbtnHelp: TBitBtn
        Left = 0
        Top = 2
        Width = 75
        Height = 22
        Hint = #33719#21462#30456#20851#24110#21161
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
      object bbtnClose: TBitBtn
        Left = 77
        Top = 2
        Width = 75
        Height = 22
        Hint = #20851#38381#24403#21069#31383#21475
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
    end
  end
  object psnInfract: TCSADOQuery
    Connection = dmData.adocon
    AfterInsert = psnInfractAfterInsert
    BeforePost = psnInfractBeforePost
    AfterPost = psnInfractAfterPost
    AfterCancel = psnInfractAfterCancel
    AfterDelete = psnInfractAfterDelete
    CommandTimeOut = 300
    Parameters = <>
    Left = 332
    Top = 259
    object psnInfractsysid: TStringField
      FieldName = 'sysid'
    end
    object psnInfractperson_sysid: TStringField
      FieldName = 'person_sysid'
    end
    object psnInfractdatetime: TStringField
      FieldName = 'infractdatetime'
      Size = 10
    end
    object psnInfractinfract_content: TStringField
      FieldName = 'infract_content'
      Size = 2
    end
    object psnInfractinfract_reason: TStringField
      FieldName = 'infract_reason'
      Size = 2
    end
    object psnInfractactualize_organ: TStringField
      FieldName = 'actualize_organ'
    end
  end
  object psnInfractd: TDataSource
    DataSet = psnInfract
    Left = 332
    Top = 287
  end
  object Infractprj: TCSADOQuery
    Connection = dmData.adocon
    CommandTimeOut = 300
    Parameters = <>
    Left = 360
    Top = 259
  end
  object Infractprjd: TDataSource
    DataSet = Infractprj
    Left = 360
    Top = 287
  end
  object InfractReason: TCSADOQuery
    Connection = dmData.adocon
    CommandTimeOut = 300
    Parameters = <>
    Left = 388
    Top = 259
  end
  object InfractReasond: TDataSource
    DataSet = InfractReason
    Left = 388
    Top = 287
  end
  object mComBak: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 444
    Top = 259
    object mComBakactualize_organ: TStringField
      FieldName = 'actualize_organ'
    end
    object mComBakactualize_organ_name: TStringField
      FieldName = 'actualize_organ_name'
      Size = 60
    end
  end
  object mCom: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 472
    Top = 259
    object mComactualize_organ: TStringField
      FieldName = 'actualize_organ'
    end
    object mComactualize_organ_name: TStringField
      FieldName = 'actualize_organ_name'
      Size = 60
    end
  end
  object mPersonBak: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 500
    Top = 259
    object mPersonBakperson_sysid: TStringField
      FieldName = 'person_sysid'
    end
    object mPersonBakperson_sysid_name: TStringField
      FieldName = 'person_sysid_name'
      Size = 30
    end
  end
  object mPerson: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 528
    Top = 259
    object mPersonperson_sysid: TStringField
      FieldName = 'person_sysid'
    end
    object mPersonperson_sysid_name: TStringField
      FieldName = 'person_sysid_name'
      Size = 30
    end
  end
  object mComd: TDataSource
    DataSet = mCom
    Left = 472
    Top = 287
  end
  object mPersond: TDataSource
    DataSet = mPerson
    Left = 528
    Top = 287
  end
  object Temp: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 416
    Top = 259
  end
  object ScrChild: TCSScrCtrlChild
    Master = dmData.ScrMaster
    Left = 8
    Top = 228
  end
  object CSBarMDIChild1: TCSBarMDIChild
    Left = 36
    Top = 228
  end
  object ListFind: TCSDBEhGrdFind
    Left = 64
    Top = 227
  end
  object ListFilter: TCSADOEhGrdFilter
    Left = 92
    Top = 227
  end
  object ListColCtrl: TCSEhGrdColCtrl
    ColList = <
      item
        ColIndex = 0
        Name = 'Columns[0]'
        Visible = True
      end>
    Left = 120
    Top = 227
  end
  object ListEhGrdStore: TCSDBEhGrdStore
    StoreToIniFile = True
    Left = 148
    Top = 227
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xls'
    FileName = 'export'
    Filter = 
      'Microsoft Excel'#25991#20214'(*.xls)|*.xls|'#25991#26412#25991#20214'(*.txt)|*.txt|HTML'#25991#20214'(*.htm)|*' +
      '.htm|Rich Text Format(*.rtf)|*.rtf|csv'#25991#20214'(*.csv)|*.csv'
    Left = 176
    Top = 227
  end
  object ListPrint: TPrintDBGridEh
    Options = [pghOptimalColWidths]
    Page.BottomMargin = 2
    Page.LeftMargin = 2
    Page.RightMargin = 1
    Page.TopMargin = 1
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 204
    Top = 227
  end
  object list: TCSADOQuery
    Connection = dmData.adocon
    AfterScroll = listAfterScroll
    Parameters = <>
    SQL.Strings = (
      'device.usp_getpsninfract')
    Left = 304
    Top = 260
    object listsysid: TStringField
      FieldName = 'sysid'
    end
    object listperson_sysid: TStringField
      FieldName = 'person_sysid'
    end
    object listperson_sysid_name: TStringField
      DisplayLabel = #20154#21592#22995#21517
      FieldName = 'person_sysid_name'
      Size = 30
    end
    object listactualize_organ: TStringField
      FieldName = 'actualize_organ'
    end
    object listactualize_organ_name: TStringField
      DisplayLabel = #22870#24809#26426#26500
      FieldName = 'actualize_organ_name'
      Size = 60
    end
    object listinfract_content: TStringField
      FieldName = 'infract_content'
      Size = 2
    end
    object listinfract_content_name: TStringField
      DisplayLabel = #22870#24809#20869#23481
      FieldName = 'infract_content_name'
    end
    object listinfract_reason: TStringField
      FieldName = 'infract_reason'
      Size = 2
    end
    object listinfract_reason_name: TStringField
      DisplayLabel = #22870#24809#20107#30001
      FieldName = 'infract_reason_name'
    end
    object listinfractdatetime: TStringField
      DisplayLabel = #22870#24809#26085#26399
      FieldName = 'infractdatetime'
      Size = 10
    end
  end
  object listd: TDataSource
    DataSet = list
    Left = 304
    Top = 288
  end
end
