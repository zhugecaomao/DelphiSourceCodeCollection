inherited FM_4012: TFM_4012
  Left = 165
  Top = 121
  Hint = '成品盘点单'
  Caption = '成品盘点单'
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 872
    Height = 573
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 872
      Height = 46
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 322
        Top = 2
        Width = 76
        Height = 42
        Caption = '产生新盘点单'
        TabOrder = 1
        OnClick = BitBtn1Click
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C0000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDD0000000DDDD88888888888DD0000000DDD000000000008DD0000000DDD0
          FFFFFFFFF08DD0000000DDD0FFFFFFFFF08DD0000000DDD0F7777777F08DD000
          0000DDD0FFFFFFFFF08DD0000000DDD0F7777777F08DD0000000DDD0FFFFFFFF
          F08DD0000000DDD0F7777777F08DD0000000DDD0FFFFFFFFF08DD0000000DDD0
          F7777F0000DDD0000000DDD0FFFFFF080DDDD0000000DDD0FFFFFF00DDDDD000
          0000DDD00000000DDDDDD0000000DDDDDDDDDDDDDDDDD0000000}
        Layout = blGlyphTop
      end
      object BitBtn2: TBitBtn
        Left = 398
        Top = 2
        Width = 76
        Height = 42
        Caption = '更新至库存'
        TabOrder = 2
        OnClick = BitBtn2Click
        Glyph.Data = {
          9E050000424D9E05000000000000360400002800000014000000120000000100
          08000000000068010000C40E0000C40E00000001000000000000000000004000
          000080000000FF000000002000004020000080200000FF200000004000004040
          000080400000FF400000006000004060000080600000FF600000008000004080
          000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
          000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
          200080002000FF002000002020004020200080202000FF202000004020004040
          200080402000FF402000006020004060200080602000FF602000008020004080
          200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
          200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
          400080004000FF004000002040004020400080204000FF204000004040004040
          400080404000FF404000006040004060400080604000FF604000008040004080
          400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
          400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
          600080006000FF006000002060004020600080206000FF206000004060004040
          600080406000FF406000006060004060600080606000FF606000008060004080
          600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
          600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
          800080008000FF008000002080004020800080208000FF208000004080004040
          800080408000FF408000006080004060800080608000FF608000008080004080
          800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
          800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
          A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
          A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
          A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
          A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
          C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
          C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
          C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
          C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
          FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
          FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
          FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
          FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6000000B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6B62F9F3B00B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B62F9F3B00B6B6B6B600
          0000000000000000B6B6B6B62F9F3B00B6B6B62F3B3B3B3B3B3B00B6B6B6B6B6
          2F9F3B00B6B6B62F9F9F9F9F3B00B6B6B6B6B6B6B62F9F3B00B6B62FDF9F9F3B
          00B6B6B6B6B6B6B6B62F9F3B00B6B62FDFDF9F9F3B00B6B6B6B6B6B6B62F9F3B
          00B6B62FDFDF009F9F3B00B6B6B6B6B6B62F9F3B00B6B62FFF00B62F9F9F3B00
          00B6B6B6B62F9F3B00B6B62F00B6B6B62F9F9F3B3B000000003B9F3B00B6B62F
          B6B6B6B6B62F2F9F9F3B3B3B3B9F3B00B6B6B6B6B6B6B6B6B6B6B62F2F9F9F9F
          9F9F00B6B6B6B6B6B6B6B6B6B6B6B6B6B62F2F2F2F2FB6B6B6B6B6B6B6B6B6B6
          B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
          B6B6}
        Layout = blGlyphTop
      end
      object BitBtn3: TBitBtn
        Left = 474
        Top = 2
        Width = 76
        Height = 42
        Caption = '列印盘点新单'
        TabOrder = 3
        OnClick = BitBtn3Click
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777700000077777777777777777700000070000000000007700700000070FF
          FFFFFFFF07000700000070FFFFFFF00007007700000070FFFFFF077770777700
          000070FFFFF0777E77077700000070FFFFF0777777077700000070FFFFF07E77
          77077700000070FFFFF07EE777077700000070FFFFFF077770777700000070FF
          FFFFF00007777700000070FFFFFFFFFF07777700000070FFFFFFF00007777700
          000070FFFFFFF07077777700000070FFFFFFF007777777000000700000000077
          777777000000777777777777777777000000}
        Layout = blGlyphTop
      end
      object BitBtn4: TBitBtn
        Left = 550
        Top = 2
        Width = 76
        Height = 42
        Caption = '列印盘点旧单'
        TabOrder = 4
        OnClick = BitBtn4Click
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777700000077777777777777777700000070000000000007700700000070FF
          FFFFFFFF07000700000070FFFFFFF00007007700000070FFFFFF077770777700
          000070FFFFF0777E77077700000070FFFFF0777777077700000070FFFFF07E77
          77077700000070FFFFF07EE777077700000070FFFFFF077770777700000070FF
          FFFFF00007777700000070FFFFFFFFFF07777700000070FFFFFFF00007777700
          000070FFFFFFF07077777700000070FFFFFFF007777777000000700000000077
          777777000000777777777777777777000000}
        Layout = blGlyphTop
      end
      object BitBtn5: TBitBtn
        Left = 702
        Top = 2
        Width = 76
        Height = 42
        Caption = '退  出'
        TabOrder = 5
        OnClick = BitBtn5Click
        Glyph.Data = {
          EE000000424DEE0000000000000076000000280000000F0000000F0000000100
          0400000000007800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888080707E7E70007080880707E7E060078088000000007600808888090E0066
          6080800009901067608080999999107070808099999910006080800009901070
          60808888090F107670808888000E106660808888080FEF0760808888880EFEF0
          708088888800000000808888888888888880}
        Layout = blGlyphTop
        Margin = 4
      end
      object BitBtn6: TBitBtn
        Left = 626
        Top = 2
        Width = 76
        Height = 42
        Caption = '查  找'
        TabOrder = 6
        OnClick = BitBtn6Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
          300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
          330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
          333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
          339977FF777777773377000BFB03333333337773FF733333333F333000333333
          3300333777333333337733333333333333003333333333333377333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        Layout = blGlyphTop
        Margin = 4
        NumGlyphs = 2
      end
      object DBNavigator1: TDBNavPlus
        Left = 2
        Top = 2
        Width = 320
        Height = 42
        DataSource = DataSource1
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete]
        Align = alLeft
        TabOrder = 0
        Captions.Strings = (
          '首笔'
          '上笔'
          '下笔'
          '末笔'
          '新增'
          '删除'
          '编辑'
          '存储'
          '撤消'
          '更新')
        Margin = 8
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 46
      Width = 872
      Height = 41
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 62
        Top = 16
        Width = 60
        Height = 12
        Caption = '盘点单号：'
      end
      object Label2: TLabel
        Left = 278
        Top = 16
        Width = 54
        Height = 12
        Caption = '日   期：'
      end
      object Label3: TLabel
        Left = 488
        Top = 16
        Width = 48
        Height = 12
        Caption = '盘点人：'
      end
      object DBEdit1: TDBEdit
        Left = 128
        Top = 12
        Width = 114
        Height = 20
        Color = clInfoBk
        DataField = 'F01'
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 339
        Top = 12
        Width = 98
        Height = 20
        DataField = 'F02'
        DataSource = DataSource1
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 544
        Top = 12
        Width = 98
        Height = 20
        Color = clInfoBk
        DataField = 'F03'
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 2
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 87
      Width = 872
      Height = 486
      Align = alClient
      DataSource = DataSource2
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = '宋体'
      TitleFont.Style = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'lkF07'
          ReadOnly = True
          Width = 77
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'lkF01'
          ReadOnly = True
          Width = 93
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'lkF02'
          ReadOnly = True
          Width = 119
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'lkF03'
          ReadOnly = True
          Width = 111
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'lkF04'
          ReadOnly = True
          Width = 122
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'lkF05'
          ReadOnly = True
          Visible = False
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'F03'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F04'
          Title.Alignment = taRightJustify
          Width = 81
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CalF05'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 76
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CalF06'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 79
          Visible = True
        end>
    end
  end
  object Table1: TTable
    BeforeDelete = Table1BeforeDelete
    AfterDelete = Table1AfterDelete
    AfterScroll = Table1AfterScroll
    DatabaseName = 'STK0311'
    TableName = 'dbo.T4012'
    Left = 121
    Top = 225
    object Table1F01: TStringField
      FieldName = 'F01'
      Required = True
      FixedChar = True
      Size = 6
    end
    object Table1F02: TDateTimeField
      FieldName = 'F02'
      Required = True
    end
    object Table1F03: TStringField
      FieldName = 'F03'
      Required = True
      FixedChar = True
      Size = 8
    end
    object Table1F04: TBooleanField
      FieldName = 'F04'
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 145
    Top = 281
  end
  object Table2: TTable
    BeforeInsert = Table2BeforeInsert
    BeforePost = Table2BeforePost
    BeforeDelete = Table2BeforeDelete
    OnCalcFields = Table2CalcFields
    DatabaseName = 'STK0311'
    IndexFieldNames = 'F01'
    MasterFields = 'F01'
    MasterSource = DataSource1
    TableName = 'dbo.T4012A'
    Left = 161
    Top = 225
    object Table2F01: TStringField
      FieldName = 'F01'
      Required = True
      FixedChar = True
      Size = 6
    end
    object Table2K_SN: TSmallintField
      FieldName = 'K_SN'
    end
    object Table2F02: TIntegerField
      DisplayLabel = '成品编号'
      FieldName = 'F02'
      Required = True
    end
    object Table2F03: TFloatField
      DisplayLabel = '帐面数量'
      FieldName = 'F03'
    end
    object Table2F04: TFloatField
      DisplayLabel = '实际数量'
      FieldName = 'F04'
    end
    object Table2F05: TFloatField
      FieldName = 'F05'
    end
    object Table2F06: TFloatField
      FieldName = 'F06'
    end
    object Table2CalF05: TFloatField
      DisplayLabel = '盘盈数量'
      FieldKind = fkCalculated
      FieldName = 'CalF05'
      Calculated = True
    end
    object Table2CalF06: TFloatField
      DisplayLabel = '盘亏数量'
      FieldKind = fkCalculated
      FieldName = 'CalF06'
      Calculated = True
    end
    object Table2lkF01: TStringField
      DisplayLabel = '型号'
      FieldKind = fkLookup
      FieldName = 'lkF01'
      LookupDataSet = DM.Q_T1080
      LookupKeyFields = 'AutoNo'
      LookupResultField = 'F01'
      KeyFields = 'F02'
      Size = 4
      Lookup = True
    end
    object Table2lkF02: TStringField
      DisplayLabel = '品名'
      FieldKind = fkLookup
      FieldName = 'lkF02'
      LookupDataSet = DM.Q_T1080
      LookupKeyFields = 'AutoNo'
      LookupResultField = 'F02'
      KeyFields = 'F02'
      Size = 12
      Lookup = True
    end
    object Table2lkF03: TStringField
      DisplayLabel = '材质'
      FieldKind = fkLookup
      FieldName = 'lkF03'
      LookupDataSet = DM.Q_T1080
      LookupKeyFields = 'AutoNo'
      LookupResultField = 'F03'
      KeyFields = 'F02'
      Size = 6
      Lookup = True
    end
    object Table2lkF04: TStringField
      DisplayLabel = '规格'
      FieldKind = fkLookup
      FieldName = 'lkF04'
      LookupDataSet = DM.Q_T1080
      LookupKeyFields = 'AutoNo'
      LookupResultField = 'F04'
      KeyFields = 'F02'
      Lookup = True
    end
    object Table2lkF05: TStringField
      DisplayLabel = '心孔'
      FieldKind = fkLookup
      FieldName = 'lkF05'
      LookupDataSet = DM.Q_T1080
      LookupKeyFields = 'AutoNo'
      LookupResultField = 'F05'
      KeyFields = 'F02'
      Size = 3
      Lookup = True
    end
    object Table2F07: TStringField
      FieldName = 'F07'
      FixedChar = True
      Size = 8
    end
    object Table2lkF07: TStringField
      DisplayLabel = '客户简称'
      FieldKind = fkLookup
      FieldName = 'lkF07'
      LookupDataSet = DM.Q_T1010
      LookupKeyFields = 'F01'
      LookupResultField = 'F03'
      KeyFields = 'F07'
      Size = 8
      Lookup = True
    end
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 177
    Top = 273
  end
  object Qry1: TQuery
    DatabaseName = 'STK0311'
    Left = 209
    Top = 217
  end
  object Qry2: TQuery
    DatabaseName = 'STK0311'
    Left = 249
    Top = 225
  end
end
