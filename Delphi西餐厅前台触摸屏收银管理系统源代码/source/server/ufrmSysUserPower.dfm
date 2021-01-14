object frmSysUserPower: TfrmSysUserPower
  Left = 49
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #26435#38480#31649#29702
  ClientHeight = 453
  ClientWidth = 558
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 423
    Width = 558
    Height = 30
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object bbtnSave: TBitBtn
      Left = 4
      Top = 4
      Width = 75
      Height = 22
      Caption = #20445#23384'(F9)'
      TabOrder = 0
      OnClick = bbtnSaveClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00004A
        7300004A7300004A7300004A7300004A7300004A7300004A7300004A7300004A
        7300004A7300004A7300004A7300004A7300FFFFFF00FFFFFF00006296003232
        3200007AB900CECECE00CECECE00CECECE00CECECE00CECECE00DADADA00DADA
        DA00DADADA00F2F2F200B1E2FF003232320000325000FFFFFF000062960048B8
        FF00007AB900C2C2C200CECECE00CECECE00CECECE00CECECE00CECECE00DADA
        DA00DADADA00DADADA00B1E2FF0048B8FF0000325000FFFFFF00006296006BC6
        FF00007AB900B6B6B600C2C2C200C2C2C200C2C2C200CECECE00CECECE00CECE
        CE00CECECE00DADADA00B1E2FF0048B8FF0000325000FFFFFF00006296006BC6
        FF00007AB900B6B6B600B6B6B600B6B6B600C2C2C200CECECE00CECECE00CECE
        CE00CECECE00C2C2C200B1E2FF0048B8FF0000325000FFFFFF00006296006BC6
        FF00007AB90092929200A4A0A000B6B6B600B6B6B600C2C2C200CECECE00C2C2
        C200C2C2C200B6B6B600B1E2FF0048B8FF0000325000FFFFFF00006296006BC6
        FF00007AB9009292920092929200A4A0A000A4A0A000B6B6B600C2C2C200C2C2
        C200B6B6B600B6B6B600B1E2FF0048B8FF0000325000FFFFFF00006296008ED4
        FF00007AB900007AB900007AB900007AB900007AB900007AB900007AB900007A
        B900007AB900007AB9008ED4FF0048B8FF0000325000FFFFFF00006296008ED4
        FF008ED4FF008ED4FF008ED4FF008ED4FF008ED4FF008ED4FF008ED4FF008ED4
        FF008ED4FF008ED4FF00B1E2FF0048B8FF0000325000FFFFFF00006296008ED4
        FF00007AB90000AAFF00007AB900007AB900007AB900007AB900007AB900007A
        B900007AB90048B8FF008ED4FF0048B8FF0000325000FFFFFF00006296006BC6
        FF00007AB900FFFFFF0000629600FFFFFF00F2F2F200F2F2F200B6B6B600B6B6
        B600F2F2F200007AB9008ED4FF006BC6FF0000325000FFFFFF00006296008ED4
        FF00007AB900FFFFFF0000629600FFFFFF00DADADA00DADADA00808080008080
        8000F2F2F200006296008ED4FF006BC6FF0000325000FFFFFF000062960048B8
        FF00007AB900FFFFFF0000629600FFFFFF00DADADA00DADADA006E6E6E009292
        9200DADADA00006296008ED4FF006BC6FF0000325000FFFFFF00006296008ED4
        FF00007AB900FFFFFF0000629600FFFFFF00E6E6E600DADADA00323232003232
        3200F2F2F200006296008ED4FF006BC6FF0000325000FFFFFF0000629600B1E2
        FF00007AB900DADADA00007AB900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000629600B1E2FF00004A7300FFFFFF00FFFFFF00FFFFFF008686
        8600868686008686860086868600868686008686860086868600868686008686
        8600868686008686860086868600FFFFFF00FFFFFF00FFFFFF00}
    end
    object Panel2: TPanel
      Left = 474
      Top = 2
      Width = 82
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object bbtnExit: TBitBtn
        Left = 4
        Top = 2
        Width = 75
        Height = 22
        Caption = #36864#20986
        TabOrder = 0
        OnClick = bbtnExitClick
      end
    end
    object bbtnSaveOther: TBitBtn
      Left = 84
      Top = 4
      Width = 141
      Height = 22
      Caption = #20445#23384#29305#27530#26435#38480'(F10)'
      TabOrder = 2
      Visible = False
      OnClick = bbtnSaveOtherClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00004A
        7300004A7300004A7300004A7300004A7300004A7300004A7300004A7300004A
        7300004A7300004A7300004A7300004A7300FFFFFF00FFFFFF00006296003232
        3200007AB900CECECE00CECECE00CECECE00CECECE00CECECE00DADADA00DADA
        DA00DADADA00F2F2F200B1E2FF003232320000325000FFFFFF000062960048B8
        FF00007AB900C2C2C200CECECE00CECECE00CECECE00CECECE00CECECE00DADA
        DA00DADADA00DADADA00B1E2FF0048B8FF0000325000FFFFFF00006296006BC6
        FF00007AB900B6B6B600C2C2C200C2C2C200C2C2C200CECECE00CECECE00CECE
        CE00CECECE00DADADA00B1E2FF0048B8FF0000325000FFFFFF00006296006BC6
        FF00007AB900B6B6B600B6B6B600B6B6B600C2C2C200CECECE00CECECE00CECE
        CE00CECECE00C2C2C200B1E2FF0048B8FF0000325000FFFFFF00006296006BC6
        FF00007AB90092929200A4A0A000B6B6B600B6B6B600C2C2C200CECECE00C2C2
        C200C2C2C200B6B6B600B1E2FF0048B8FF0000325000FFFFFF00006296006BC6
        FF00007AB9009292920092929200A4A0A000A4A0A000B6B6B600C2C2C200C2C2
        C200B6B6B600B6B6B600B1E2FF0048B8FF0000325000FFFFFF00006296008ED4
        FF00007AB900007AB900007AB900007AB900007AB900007AB900007AB900007A
        B900007AB900007AB9008ED4FF0048B8FF0000325000FFFFFF00006296008ED4
        FF008ED4FF008ED4FF008ED4FF008ED4FF008ED4FF008ED4FF008ED4FF008ED4
        FF008ED4FF008ED4FF00B1E2FF0048B8FF0000325000FFFFFF00006296008ED4
        FF00007AB90000AAFF00007AB900007AB900007AB900007AB900007AB900007A
        B900007AB90048B8FF008ED4FF0048B8FF0000325000FFFFFF00006296006BC6
        FF00007AB900FFFFFF0000629600FFFFFF00F2F2F200F2F2F200B6B6B600B6B6
        B600F2F2F200007AB9008ED4FF006BC6FF0000325000FFFFFF00006296008ED4
        FF00007AB900FFFFFF0000629600FFFFFF00DADADA00DADADA00808080008080
        8000F2F2F200006296008ED4FF006BC6FF0000325000FFFFFF000062960048B8
        FF00007AB900FFFFFF0000629600FFFFFF00DADADA00DADADA006E6E6E009292
        9200DADADA00006296008ED4FF006BC6FF0000325000FFFFFF00006296008ED4
        FF00007AB900FFFFFF0000629600FFFFFF00E6E6E600DADADA00323232003232
        3200F2F2F200006296008ED4FF006BC6FF0000325000FFFFFF0000629600B1E2
        FF00007AB900DADADA00007AB900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000629600B1E2FF00004A7300FFFFFF00FFFFFF00FFFFFF008686
        8600868686008686860086868600868686008686860086868600868686008686
        8600868686008686860086868600FFFFFF00FFFFFF00FFFFFF00}
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 257
    Height = 376
    Align = alLeft
    Caption = ' '#29992#25143#21015#34920' '
    TabOrder = 1
    object grdListUser: TdxDBGrid
      Left = 2
      Top = 15
      Width = 253
      Height = 359
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'user_id'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      TabOrder = 0
      DataSource = Userd
      Filter.Criteria = {00000000}
      HeaderColor = 4227327
      LookAndFeel = lfFlat
      OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
      object grdListUseruser_id: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 104
        BandIndex = 0
        RowIndex = 0
        FieldName = 'user_id'
      end
      object grdListUseruser_name: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 137
        BandIndex = 0
        RowIndex = 0
        FieldName = 'user_name'
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 257
    Top = 0
    Width = 301
    Height = 376
    Align = alClient
    TabOrder = 2
    object GroupBox3: TGroupBox
      Left = 2
      Top = 15
      Width = 297
      Height = 174
      Align = alTop
      Caption = ' '#20027#33756#21333#21015#34920
      TabOrder = 0
      object grdListMenuPrent: TdxDBGrid
        Left = 2
        Top = 15
        Width = 293
        Height = 157
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'RecId'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        TabOrder = 0
        DataSource = MenuParentd
        Filter.Criteria = {00000000}
        HeaderColor = 4227327
        LookAndFeel = lfFlat
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
        object grdListMenuPrentRecId: TdxDBGridColumn
          Visible = False
          Width = 72
          BandIndex = 0
          RowIndex = 0
          FieldName = 'RecId'
        end
        object grdListMenuPrentmenu_itemid: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          Visible = False
          Width = 135
          BandIndex = 0
          RowIndex = 0
          FieldName = 'menu_itemid'
        end
        object grdListMenuPrentmenu_caption: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          Width = 150
          BandIndex = 0
          RowIndex = 0
          FieldName = 'menu_caption'
        end
        object grdListMenuPrentis_enable: TdxDBGridCheckColumn
          HeaderAlignment = taCenter
          Width = 120
          BandIndex = 0
          RowIndex = 0
          FieldName = 'is_enable'
          ValueChecked = 'True'
          ValueGrayed = 'True'
          ValueUnchecked = 'False'
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 2
      Top = 189
      Width = 297
      Height = 185
      Align = alClient
      Caption = #23376#33756#21333#21015#34920
      TabOrder = 1
      object grdListMenuChild: TdxDBGrid
        Left = 2
        Top = 15
        Width = 293
        Height = 168
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'RecId'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        TabOrder = 0
        DataSource = MenuChildd
        Filter.Criteria = {00000000}
        HeaderColor = 4227327
        LookAndFeel = lfFlat
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
        object grdListMenuChildRecId: TdxDBGridColumn
          Visible = False
          Width = 58
          BandIndex = 0
          RowIndex = 0
          FieldName = 'RecId'
        end
        object grdListMenuChildmenu_itemid: TdxDBGridMaskColumn
          Visible = False
          Width = 58
          BandIndex = 0
          RowIndex = 0
          FieldName = 'menu_itemid'
        end
        object grdListMenuChildmenu_caption: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          Width = 150
          BandIndex = 0
          RowIndex = 0
          FieldName = 'menu_caption'
        end
        object grdListMenuChildis_enable: TdxDBGridCheckColumn
          HeaderAlignment = taCenter
          Width = 120
          BandIndex = 0
          RowIndex = 0
          FieldName = 'is_enable'
          ValueChecked = 'True'
          ValueGrayed = 'True'
          ValueUnchecked = 'False'
        end
      end
    end
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 376
    Width = 558
    Height = 47
    Align = alBottom
    Caption = #29305#27530#26435#38480
    TabOrder = 3
    object chbDelete: TCheckBox
      Left = 16
      Top = 20
      Width = 53
      Height = 17
      Caption = #20316#24223
      TabOrder = 0
    end
    object chbDiscount: TCheckBox
      Left = 76
      Top = 20
      Width = 53
      Height = 17
      Caption = #25171#25240
      TabOrder = 1
    end
  end
  object Userd: TDataSource
    DataSet = Userq
    Left = 20
    Top = 72
  end
  object Userq: TCSADOQuery
    AfterScroll = UserqAfterScroll
    Parameters = <>
    Left = 20
    Top = 44
    object Userquser_id: TStringField
      DisplayLabel = #29992#25143#32534#21495
      FieldName = 'user_id'
      ReadOnly = True
      Size = 6
    end
    object Userquser_name: TStringField
      DisplayLabel = #29992#25143#21517#31216
      FieldName = 'user_name'
      ReadOnly = True
      Size = 30
    end
  end
  object memMenuParent: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterScroll = memMenuParentAfterScroll
    Left = 356
    Top = 108
    object memMenuParentmenu_itemid: TStringField
      DisplayLabel = #33756#21333#32534#21495
      FieldName = 'menu_itemid'
      ReadOnly = True
      Size = 10
    end
    object memMenuParentmenu_name: TStringField
      DisplayLabel = #33756#21333#21517#31216
      FieldName = 'menu_caption'
      ReadOnly = True
      Size = 30
    end
    object memMenuParentis_enable: TBooleanField
      DisplayLabel = #26159#21542#21487#29992
      FieldName = 'is_enable'
    end
  end
  object MenuParentq: TCSADOQuery
    Parameters = <>
    Left = 332
    Top = 108
    object MenuParentqmenu_itemid: TStringField
      FieldName = 'menu_itemid'
      Size = 10
    end
    object MenuParentqmenu_caption: TStringField
      FieldName = 'menu_caption'
      Size = 30
    end
  end
  object MenuChildq: TCSADOQuery
    Parameters = <>
    Left = 348
    Top = 228
    object MenuChildqmenu_itemid: TStringField
      FieldName = 'menu_itemid'
      Size = 10
    end
    object MenuChildqmenu_caption: TStringField
      FieldName = 'menu_caption'
      Size = 30
    end
  end
  object memMenuChild: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 376
    Top = 228
    object memMenuChildmenu_itemid: TStringField
      DisplayLabel = #33756#21333#32534#21495
      FieldName = 'menu_itemid'
      ReadOnly = True
      Size = 10
    end
    object memMenuChildmenu_name: TStringField
      DisplayLabel = #33756#21333#21517#31216
      FieldName = 'menu_caption'
      ReadOnly = True
      Size = 30
    end
    object memMenuChildis_enable: TBooleanField
      DisplayLabel = #26159#21542#21487#29992
      FieldName = 'is_enable'
    end
  end
  object MenuParentd: TDataSource
    DataSet = memMenuParent
    Left = 356
    Top = 132
  end
  object MenuChildd: TDataSource
    DataSet = memMenuChild
    Left = 376
    Top = 256
  end
end
