object frmSuprTotal: TfrmSuprTotal
  Left = 297
  Top = 254
  Width = 522
  Height = 331
  Caption = #21160#24577#30417#23519#32479#35745
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 276
    Width = 514
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel5: TPanel
      Left = 359
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
    object bbtnPrint: TBitBtn
      Left = 3
      Top = 3
      Width = 60
      Height = 22
      Hint = #25171#21360#21015#34920#21306#22495#30340#20869#23481
      Caption = #25171#21360
      TabOrder = 1
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C40E0000C40E00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00030888888888888880088888888888888000000000000000000F8F8F8F8F8F
        8F8008F8F8F8F8F8F9F00F8F8F8F8F8F8F8000000000000000003330FFFFFFFF
        03333330F0000F0F03333330FFFFFFFF03333330F00F000003333330FFFF0FF0
        33333330F08F0F0333333330FFFF003333333330000003333333}
    end
  end
  object grdList: TdxDBGrid
    Left = 0
    Top = 31
    Width = 514
    Height = 245
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'RecId'
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    TabOrder = 1
    OnClick = grdListClick
    DataSource = memListd
    Filter.Criteria = {00000000}
    LookAndFeel = lfFlat
    OptionsView = [edgoBandHeaderWidth, edgoShowButtonAlways, edgoUseBitmap]
    object grdListRecId: TdxDBGridColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'RecId'
    end
    object grdListid: TdxDBGridColumn
      Alignment = taCenter
      DisableEditor = True
      HeaderAlignment = taCenter
      Width = 43
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id'
    end
    object grdListitem: TdxDBGridColumn
      DisableEditor = True
      HeaderAlignment = taCenter
      Width = 153
      BandIndex = 0
      RowIndex = 0
      FieldName = 'item'
    end
    object grdListstart_date: TdxDBGridColumn
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'start_date'
    end
    object grdListend_date: TdxDBGridColumn
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'end_date'
    end
    object grdListamount: TdxDBGridColumn
      DisableEditor = True
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'amount'
    end
    object grdListexecute: TdxDBGridButtonColumn
      Alignment = taCenter
      HeaderAlignment = taCenter
      ReadOnly = True
      Width = 41
      BandIndex = 0
      RowIndex = 0
      FieldName = 'execute'
      OnEditButtonClick = grdListexecuteEditButtonClick
      ButtonOnly = True
      Buttons = <
        item
          Default = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 514
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    Caption = #21160#24577#30417#23519#32479#35745
    TabOrder = 2
  end
  object deStartDate: TCSAdxDBDateEdit
    Left = 148
    Top = 216
    Width = 121
    TabOrder = 3
    Visible = False
    DataField = 'start_date'
    DataSource = memListd
    StyleController = dmData.dxStyleCtrl
    FixedDateFormat = 'yyyy-MM-dd'
    StoredValues = 4
  end
  object deEndDate: TCSAdxDBDateEdit
    Left = 274
    Top = 216
    Width = 121
    TabOrder = 4
    Visible = False
    DataField = 'end_date'
    DataSource = memListd
    StyleController = dmData.dxStyleCtrl
    FixedDateFormat = 'yyyy-MM-dd'
    StoredValues = 4
  end
  object List: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 6
    Top = 210
  end
  object memList: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      566572CDCCCCCCCCCCFC3F0600000004000000030003006964001F0000000100
      05006974656D000B00000001000B0073746172745F64617465000B0000000100
      0900656E645F64617465000400000003000700616D6F756E74000B0000000100
      0800657865637574650001010000000D000000D6D8B5E3BCE0B2ECB5A5CEBB00
      010000000001000000000000681300010000000001020000000F000000B5BDC6
      DABBFAB9B9D0EDBFC9D6A4000100000000010000000000002700000100000000
      01030000000D000000B5BDC6DAC8CBD4B1D7CAD6CA0001000000000100000000
      0002000000010000000001040000000D000000C9E8B1B8CAC2B9CAD2FEBBBC00
      0100000000010000000000020000000100000000010500000017000000D3E2C6
      DACEB4B7B4C0A1B5C4BCE0B2ECD2E2BCFBCAE900010000000301000000000000
      0000000100000000010600000009000000B7A2C9FACAC2B9CA00010000000301
      0000000000092C00000100000000}
    SortOptions = []
    AfterScroll = memListAfterScroll
    Left = 34
    Top = 210
    object memListid: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object memListitem: TStringField
      DisplayLabel = #39033#30446
      FieldName = 'item'
      Size = 30
    end
    object memListstart_date: TStringField
      DisplayLabel = #36215#22987#26085#26399
      FieldName = 'start_date'
      Size = 10
    end
    object memListend_date: TStringField
      DisplayLabel = #32467#26463#26085#26399
      FieldName = 'end_date'
      Size = 10
    end
    object memListamount: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'amount'
    end
    object memListexecute: TStringField
      DisplayLabel = #25191#34892
      FieldName = 'execute'
      Size = 10
    end
  end
  object memListd: TDataSource
    DataSet = memList
    Left = 62
    Top = 210
  end
  object CSBarMDIChild1: TCSBarMDIChild
    Left = 90
    Top = 210
  end
  object ScrChild: TCSScrCtrlChild
    Master = dmData.ScrMaster
    Left = 118
    Top = 210
  end
end
