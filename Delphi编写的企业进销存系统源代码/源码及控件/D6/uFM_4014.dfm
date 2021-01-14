inherited FM_4014: TFM_4014
  Left = 156
  Top = 119
  Hint = '客户来料盘点单'
  Caption = '客户来料盘点单'
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
        Left = 224
        Top = 2
        Width = 94
        Height = 41
        Caption = '产生新的盘点单'
        TabOrder = 1
        OnClick = BitBtn1Click
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C000000000000000000000001000000000000000000000000000
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
        Left = 322
        Top = 2
        Width = 76
        Height = 42
        Caption = '更新至库存'
        TabOrder = 2
        OnClick = BitBtn2Click
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000014000000120000000100
          040000000000D800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777700007777777777777777777700007777777777777000777700007777
          777777777C8E077700007777777777777C8E0777000070000000007777C8E077
          00007CEEEEEE077777C8E07700007C8888E07777777C8E0700007CF88E077777
          777C8E0700007CFF88E07777777C8E0700007CFF088E0777777C8E0700007CF0
          7C88E007777C8E0700007C0777C88EE0000E8E0700007C77777CC88EEEE8E077
          0000777777777CC888880777000077777777777CCCCC77770000777777777777
          777777770000777777777777777777770000}
        Layout = blGlyphTop
      end
      object BitBtn3: TBitBtn
        Left = 398
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
        Left = 474
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
        Left = 626
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
        Left = 550
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
        Left = 36
        Top = 16
        Width = 60
        Height = 12
        Caption = '盘点单号：'
      end
      object Label2: TLabel
        Left = 254
        Top = 16
        Width = 54
        Height = 12
        Caption = '日   期：'
      end
      object Label3: TLabel
        Left = 473
        Top = 16
        Width = 48
        Height = 12
        Caption = '盘点人：'
      end
      object DBEdit1: TDBEdit
        Left = 99
        Top = 12
        Width = 119
        Height = 20
        Color = clInfoBk
        DataField = 'F01'
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 315
        Top = 12
        Width = 109
        Height = 20
        DataField = 'F02'
        DataSource = DataSource1
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 532
        Top = 12
        Width = 123
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
          Width = 73
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'lkF08'
          ReadOnly = True
          Width = 74
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'lkF01'
          ReadOnly = True
          Width = 80
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
          Width = 90
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'lkF04'
          ReadOnly = True
          Width = 101
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'lkF05'
          ReadOnly = True
          Width = -1
          Visible = False
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'F03'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F04'
          Title.Alignment = taRightJustify
          Width = 73
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CalF05'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 78
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CalF06'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 80
          Visible = True
        end>
    end
  end
  object Table1: TTable
    BeforeDelete = Table1BeforeDelete
    AfterDelete = Table1AfterDelete
    AfterScroll = Table1AfterScroll
    DatabaseName = 'STK0311'
    TableName = 'dbo.T4014'
    Left = 41
    Top = 129
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
    Left = 81
    Top = 129
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
    TableName = 'dbo.T4014A'
    Left = 41
    Top = 233
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
      DisplayLabel = '半成品编号'
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
      LookupDataSet = DM.Q_T1090
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
      LookupDataSet = DM.Q_T1090
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
      LookupDataSet = DM.Q_T1090
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
      LookupDataSet = DM.Q_T1090
      LookupKeyFields = 'AutoNo'
      LookupResultField = 'F04'
      KeyFields = 'F02'
      Lookup = True
    end
    object Table2lkF05: TStringField
      DisplayLabel = '心孔'
      FieldKind = fkLookup
      FieldName = 'lkF05'
      LookupDataSet = DM.Q_T1090
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
    object Table2F08: TStringField
      FieldName = 'F08'
      FixedChar = True
      Size = 8
    end
    object Table2lkF07: TStringField
      DisplayLabel = '客户'
      FieldKind = fkLookup
      FieldName = 'lkF07'
      LookupDataSet = DM.Q_T1010
      LookupKeyFields = 'F01'
      LookupResultField = 'F03'
      KeyFields = 'F07'
      Size = 8
      Lookup = True
    end
    object Table2lkF08: TStringField
      DisplayLabel = '送料厂商'
      FieldKind = fkLookup
      FieldName = 'lkF08'
      LookupDataSet = DM.Q_T1011
      LookupKeyFields = 'F01'
      LookupResultField = 'F03'
      KeyFields = 'F08'
      Size = 8
      Lookup = True
    end
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 81
    Top = 233
  end
  object Qry1: TQuery
    DatabaseName = 'STK0311'
    Left = 249
    Top = 185
  end
  object Qry2: TQuery
    DatabaseName = 'STK0311'
    Left = 297
    Top = 193
  end
end
