inherited FM_1080: TFM_1080
  Left = 55
  Top = 129
  Height = 603
  Hint = '成品仓'
  Caption = '成品仓库'
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 872
    Height = 56
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 139
      Top = 12
      Width = 30
      Height = 12
      Caption = '型 号'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 265
      Top = 11
      Width = 48
      Height = 12
      Caption = '品    名'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 437
      Top = 12
      Width = 36
      Height = 12
      Caption = '材  质'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 437
      Top = 34
      Width = 36
      Height = 12
      Caption = '心  孔'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label5: TLabel
      Left = 139
      Top = 35
      Width = 30
      Height = 12
      Caption = '规 格'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 14
      Top = 12
      Width = 30
      Height = 12
      Caption = '客 户'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 265
      Top = 35
      Width = 48
      Height = 12
      Caption = '库存数量'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object SB3: TSpeedButton
      Left = 641
      Top = 6
      Width = 36
      Height = 45
      Hint = '查询资料|查询资料'
      Caption = '查询'
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000000000004000
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
        B6B6B6B6B6B6B6004020B6B6B6B6B6B6B6B6B6B6B6B60060A480B6B6B6B6B6B6
        B6B6B6B6B6006084E0A4B6B6B6B6B6B6B6B6B6B6B64084E0A4B6B6B6B6B6B6B6
        B6B6B6B62080E0A4B6B6B6B6B60049494924242084E020B6B6B6B6B649006D92
        92494944C020B6B6B6B6B62424B6FFFFFFFFDB4924B6B6B6B6B6B6246DFF3010
        10BAFF9249B6B6B6B6B62449FF7510FFBABA10FF4924B6B6B6B62449FF7510FF
        FFFF75FF4924B6B6B6B62449DB7510FFBABA75B64900B6B6B6B6B62449FF3010
        10BAFF9249B6B6B6B6B6B6244949DBFFFFB66D4900B6B6B6B6B6B6B624244949
        49494900B6B6B6B6B6B6B6B6B6B649494900B6B6B6B6B6B6B6B6}
      Layout = blGlyphTop
      Transparent = False
      OnClick = SB3Click
    end
    object Button1: TSpeedButton
      Left = 604
      Top = 6
      Width = 36
      Height = 45
      Caption = '新增'
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
      OnClick = Button1Click
    end
    object BitBtn1: TBitBtn
      Left = 715
      Top = 6
      Width = 36
      Height = 45
      Caption = '退出'
      TabOrder = 8
      OnClick = BitBtn1Click
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
    end
    object Edit1: TEdit
      Tag = 1
      Left = 170
      Top = 8
      Width = 90
      Height = 20
      TabOrder = 1
      OnExit = Edit1Exit
    end
    object Edit2: TEdit
      Tag = 2
      Left = 317
      Top = 8
      Width = 114
      Height = 20
      TabOrder = 2
      OnExit = Edit1Exit
    end
    object Edit3: TEdit
      Tag = 3
      Left = 476
      Top = 8
      Width = 116
      Height = 20
      TabOrder = 3
      OnExit = Edit1Exit
    end
    object Edit4: TEdit
      Tag = 4
      Left = 170
      Top = 31
      Width = 90
      Height = 20
      TabOrder = 5
      OnExit = Edit1Exit
    end
    object Edit5: TEdit
      Tag = 5
      Left = 476
      Top = 31
      Width = 116
      Height = 20
      TabOrder = 6
      Visible = False
      OnExit = Edit1Exit
    end
    object ComboEdit1: TComboEdit
      Left = 45
      Top = 8
      Width = 90
      Height = 21
      GlyphKind = gkEllipsis
      ButtonWidth = 17
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = ComboEdit1ButtonClick
    end
    object Edit6: TEdit
      Left = 317
      Top = 31
      Width = 114
      Height = 20
      TabOrder = 7
      OnExit = Edit6Exit
    end
    object edtCName: TEdit
      Left = 14
      Top = 32
      Width = 120
      Height = 20
      Color = clInfoBk
      TabOrder = 4
    end
    object BitBtn2: TBitBtn
      Left = 678
      Top = 6
      Width = 36
      Height = 45
      Caption = '列印'
      TabOrder = 9
      OnClick = BitBtn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      Layout = blGlyphTop
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 56
    Width = 872
    Height = 520
    Align = alClient
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 153
      Top = 1
      Width = 3
      Height = 518
      Cursor = crHSplit
      AutoSnap = False
      Beveled = True
    end
    object Panel3: TPanel
      Left = 156
      Top = 1
      Width = 715
      Height = 518
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 0
      object Label7: TLabel
        Left = 440
        Top = 296
        Width = 30
        Height = 12
        Caption = 'lkF10'
      end
      object Splitter2: TSplitter
        Left = 1
        Top = 428
        Width = 713
        Height = 6
        Cursor = crVSplit
        Align = alBottom
        AutoSnap = False
        Beveled = True
        MinSize = 20
      end
      object DBGrid1: TDBGrid
        Left = 1
        Top = 29
        Width = 713
        Height = 399
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = '宋体'
        TitleFont.Style = []
        OnEnter = DBGrid1Enter
        Columns = <
          item
            Expanded = False
            FieldName = 'F01'
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -12
            Title.Font.Name = '宋体'
            Title.Font.Style = []
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F02'
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -12
            Title.Font.Name = '宋体'
            Title.Font.Style = []
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F03'
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -12
            Title.Font.Name = '宋体'
            Title.Font.Style = []
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F04'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F05'
            Width = -1
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'F09'
            Width = 69
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'F06'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -12
            Title.Font.Name = '宋体'
            Title.Font.Style = []
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F07'
            Title.Alignment = taRightJustify
            Width = 55
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CalF07'
            Title.Alignment = taRightJustify
            Width = 61
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'F12'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Title.Caption = '可分配库存'
            Width = 77
            Visible = True
          end>
      end
      object DBGrid2: TDBGrid
        Left = 1
        Top = 434
        Width = 713
        Height = 83
        Align = alBottom
        DataSource = DataSource2
        TabOrder = 1
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = '宋体'
        TitleFont.Style = []
        OnEditButtonClick = DBGrid2EditButtonClick
        OnEnter = DBGrid2Enter
        Columns = <
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'F02'
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -12
            Title.Font.Name = '宋体'
            Title.Font.Style = []
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F03'
            Title.Alignment = taRightJustify
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -12
            Title.Font.Name = '宋体'
            Title.Font.Style = []
            Width = 115
            Visible = True
          end>
      end
      object DBNavPlus1: TDBNavPlus
        Left = 1
        Top = 1
        Width = 713
        Height = 28
        DataSource = DataSource1
        VisibleButtons = [nbFirst, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alTop
        Flat = True
        TabOrder = 2
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
        Layout = blGlyphLeft
        Spacing = 1
        Margin = -1
      end
    end
    object DBGrid3: TDBGrid
      Left = 1
      Top = 1
      Width = 152
      Height = 518
      Align = alLeft
      Color = clInfoBk
      DataSource = DataSource3
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = '宋体'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'F10'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F03'
          Visible = True
        end>
    end
  end
  object Table1: TTable
    BeforeInsert = Table1BeforeInsert
    AfterInsert = Table1AfterInsert
    BeforeEdit = Table1BeforeEdit
    BeforePost = Table1BeforePost
    AfterPost = Table1AfterPost
    AfterCancel = Table1AfterCancel
    BeforeDelete = Table1BeforeDelete
    AfterScroll = Table1AfterScroll
    OnCalcFields = Table1CalcFields
    DatabaseName = 'STK0311'
    IndexFieldNames = 'F10;F01;F02;F03;F04;F05'
    MasterFields = 'F10'
    MasterSource = DataSource3
    TableName = 'dbo.T1080'
    Left = 464
    Top = 193
    object Table1AutoNo: TIntegerField
      DisplayLabel = '自动编号'
      DisplayWidth = 10
      FieldName = 'AutoNo'
    end
    object Table1F01: TStringField
      DisplayLabel = '成品型号'
      DisplayWidth = 4
      FieldName = 'F01'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 4
    end
    object Table1F02: TStringField
      DisplayLabel = '品名'
      DisplayWidth = 12
      FieldName = 'F02'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 12
    end
    object Table1F03: TStringField
      DisplayLabel = '材质'
      DisplayWidth = 6
      FieldName = 'F03'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 6
    end
    object Table1F04: TStringField
      DisplayLabel = '规格'
      DisplayWidth = 20
      FieldName = 'F04'
      FixedChar = True
    end
    object Table1F05: TStringField
      DisplayLabel = '心孔'
      DisplayWidth = 4
      FieldName = 'F05'
      FixedChar = True
      Size = 5
    end
    object Table1F06: TFloatField
      DisplayLabel = '库存数量'
      DisplayWidth = 10
      FieldName = 'F06'
    end
    object Table1F08: TStringField
      DisplayLabel = '备注'
      DisplayWidth = 20
      FieldName = 'F08'
    end
    object Table1F07: TFloatField
      DisplayLabel = '单重(kg)'
      DisplayWidth = 10
      FieldName = 'F07'
    end
    object Table1BUSER: TStringField
      DisplayWidth = 10
      FieldName = 'BUSER'
      FixedChar = True
      Size = 10
    end
    object Table1BTIME: TDateTimeField
      DisplayWidth = 18
      FieldName = 'BTIME'
    end
    object Table1EUSER: TStringField
      DisplayWidth = 10
      FieldName = 'EUSER'
      FixedChar = True
      Size = 10
    end
    object Table1ETIME: TDateTimeField
      DisplayWidth = 18
      FieldName = 'ETIME'
    end
    object Table1CalF07: TFloatField
      DisplayLabel = '库存重量'
      FieldKind = fkCalculated
      FieldName = 'CalF07'
      Calculated = True
    end
    object Table1F10: TStringField
      DisplayLabel = '客户编号'
      FieldName = 'F10'
      FixedChar = True
      Size = 8
    end
    object Table1F09: TStringField
      DisplayLabel = '料号'
      FieldName = 'F09'
      FixedChar = True
      Size = 10
    end
    object Table1F12: TFloatField
      DisplayLabel = '制令单叁考库存'
      FieldName = 'F12'
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 536
    Top = 193
  end
  object Qry1: TQuery
    DatabaseName = 'STK0311'
    Left = 320
    Top = 206
  end
  object Table2: TTable
    BeforeEdit = Table2BeforeEdit
    BeforePost = Table2BeforePost
    AfterScroll = Table2AfterScroll
    DatabaseName = 'STK0311'
    IndexFieldNames = 'AutoNo;F02'
    MasterFields = 'AutoNo'
    MasterSource = DataSource1
    TableName = 'dbo.T1080A'
    Left = 500
    Top = 279
    object Table2AutoNo: TIntegerField
      DisplayLabel = '自动编号'
      FieldName = 'AutoNo'
      Required = True
    end
    object Table2F02: TDateTimeField
      DisplayLabel = '定价日期'
      FieldName = 'F02'
      OnValidate = RequiredValue
    end
    object Table2F03: TFloatField
      DisplayLabel = '单价'
      FieldName = 'F03'
      OnValidate = RequiredValue
    end
    object Table2BUSER: TStringField
      DisplayLabel = '建档人'
      FieldName = 'BUSER'
      FixedChar = True
      Size = 10
    end
    object Table2BTIME: TDateTimeField
      DisplayLabel = '建档时间'
      FieldName = 'BTIME'
    end
    object Table2EUSER: TStringField
      DisplayLabel = '修改人'
      FieldName = 'EUSER'
      FixedChar = True
      Size = 10
    end
    object Table2ETIME: TDateTimeField
      DisplayLabel = '修改时间'
      FieldName = 'ETIME'
    end
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 540
    Top = 279
  end
  object Query1: TQuery
    AfterScroll = Query1AfterScroll
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select distinct P.F10,C.F03 from T1080 AS P'
      'Left join T1010 AS C on P.F10=C.F01')
    Left = 41
    Top = 253
    object Query1F10: TStringField
      DisplayLabel = '编号'
      DisplayWidth = 4
      FieldName = 'F10'
      Origin = 'STK0311.T1080.F10'
      FixedChar = True
      Size = 8
    end
    object Query1F03: TStringField
      DisplayLabel = '客户简称'
      DisplayWidth = 11
      FieldName = 'F03'
      Origin = 'STK0311.T1010.F03'
      FixedChar = True
      Size = 12
    end
  end
  object DataSource3: TDataSource
    DataSet = Query1
    Left = 57
    Top = 293
  end
end
