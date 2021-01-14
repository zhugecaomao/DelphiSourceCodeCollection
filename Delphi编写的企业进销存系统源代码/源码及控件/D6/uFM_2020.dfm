inherited Fm_2020: TFm_2020
  Left = 221
  Top = 150
  Hint = '制令单'
  Caption = '生产制令单'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  object Label15: TLabel [0]
    Left = 356
    Top = 38
    Width = 72
    Height = 12
    Caption = '品        名'
  end
  inherited Panel1: TPanel
    Height = 109
    object Label1: TLabel [0]
      Left = 20
      Top = 15
      Width = 48
      Height = 12
      Caption = '制令单号'
    end
    object Label2: TLabel [1]
      Left = 193
      Top = 15
      Width = 48
      Height = 12
      Caption = '开立日期'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel [2]
      Left = 20
      Top = 38
      Width = 48
      Height = 12
      Caption = '物 品 类'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel [3]
      Left = 193
      Top = 38
      Width = 48
      Height = 12
      Caption = '物品型号'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel [4]
      Left = 375
      Top = 38
      Width = 48
      Height = 12
      Caption = '品    名'
    end
    object Label6: TLabel [5]
      Left = 20
      Top = 62
      Width = 48
      Height = 12
      Caption = '材    质'
    end
    object Label7: TLabel [6]
      Left = 193
      Top = 62
      Width = 48
      Height = 12
      Caption = '规    格'
    end
    object Label8: TLabel [7]
      Left = 735
      Top = 14
      Width = 24
      Height = 12
      Caption = '心孔'
      Visible = False
    end
    object Label9: TLabel [8]
      Left = 375
      Top = 15
      Width = 48
      Height = 12
      Caption = '订 单 号'
    end
    object Label10: TLabel [9]
      Left = 545
      Top = 15
      Width = 60
      Height = 12
      Caption = '订单需求量'
    end
    object Label11: TLabel [10]
      Left = 545
      Top = 38
      Width = 60
      Height = 12
      Caption = '预计生产量'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel [11]
      Left = 453
      Top = 85
      Width = 88
      Height = 12
      Caption = '需求单生成时间'
    end
    object Label13: TLabel [12]
      Left = 545
      Top = 62
      Width = 60
      Height = 12
      Caption = '已入库数量'
    end
    object Label14: TLabel [13]
      Left = 20
      Top = 85
      Width = 48
      Height = 12
      Caption = '备    注'
    end
    inherited DBEdit1: TDBEdit
      Left = 75
      Top = 11
      Width = 100
      Color = clInfoBk
      DataField = 'F01'
      ReadOnly = True
    end
    object DBEdit5: TDBEdit
      Left = 432
      Top = 34
      Width = 100
      Height = 20
      Color = clInfoBk
      DataField = 'F13'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit6: TDBEdit
      Left = 75
      Top = 58
      Width = 100
      Height = 20
      Color = clInfoBk
      DataField = 'F15'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdit7: TDBEdit
      Left = 248
      Top = 58
      Width = 282
      Height = 20
      Color = clInfoBk
      DataField = 'F14'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 9
    end
    object DBEdit8: TDBEdit
      Left = 761
      Top = 10
      Width = 59
      Height = 20
      Color = clInfoBk
      DataField = 'F16'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 10
      Visible = False
    end
    object DBEdit10: TDBEdit
      Left = 613
      Top = 11
      Width = 107
      Height = 20
      DataField = 'F05'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit11: TDBEdit
      Left = 613
      Top = 34
      Width = 107
      Height = 20
      DataField = 'F06'
      DataSource = DataSource1
      TabOrder = 7
    end
    object DBEdit12: TDBEdit
      Left = 546
      Top = 81
      Width = 175
      Height = 20
      Color = clInfoBk
      DataField = 'F08'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 13
    end
    object DBEdit13: TDBEdit
      Left = 613
      Top = 58
      Width = 108
      Height = 20
      Color = clInfoBk
      DataField = 'F07'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 11
    end
    object DBEdit14: TDBEdit
      Left = 75
      Top = 81
      Width = 371
      Height = 20
      DataField = 'F11'
      DataSource = DataSource1
      TabOrder = 12
    end
    object DBDateEdit1: TDBDateEdit
      Left = 248
      Top = 11
      Width = 114
      Height = 21
      DataField = 'F02'
      DataSource = DataSource1
      ButtonWidth = 18
      NumGlyphs = 2
      TabOrder = 1
    end
    object RxDBComboBox1: TRxDBComboBox
      Left = 75
      Top = 34
      Width = 101
      Height = 20
      Style = csDropDownList
      DataField = 'F09'
      DataSource = DataSource1
      EnableValues = False
      ItemHeight = 12
      Items.Strings = (
        '成品'
        '半成品')
      TabOrder = 4
      OnChange = RxDBComboBox1Change
      OnExit = RxDBComboBox1Exit
    end
    object RxDBComboEdit1: TRxDBComboEdit
      Left = 248
      Top = 34
      Width = 114
      Height = 21
      DataField = 'F12'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 18
      NumGlyphs = 1
      ReadOnly = True
      TabOrder = 5
      OnButtonClick = RxDBComboEdit1ButtonClick
    end
    object RxDBComboEdit2: TRxDBComboEdit
      Left = 432
      Top = 11
      Width = 101
      Height = 21
      DataField = 'F04'
      DataSource = DataSource1
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = '新细明体'
      Font.Style = []
      GlyphKind = gkEllipsis
      ButtonWidth = 17
      NumGlyphs = 1
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      OnButtonClick = RxDBComboEdit2ButtonClick
    end
  end
  inherited ToolBar1: TToolBar
    inherited SB2: TSpeedButton
      Visible = True
    end
    inherited SB3: TSpeedButton
      Visible = True
    end
    inherited SB0: TSpeedButton
      Width = 53
      Hint = '产生MRP'
      BiDiMode = bdRightToLeft
      Caption = '产生MRP'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        80808080808080808080FFFFFF00FFFFFFFFFF000000000000000000000000C0
        C0C0FFFFFF000000000000000000000000C0C0C0FFFFFF80808000FFFFFFFFFF
        00FFFF000000FF00FF0000FF000000C0C0C000FFFF000000FF00FF0000FF0000
        00C0C0C000FFFF808080FFFFFF00FFFFFFFFFF00000000000000000000000000
        FFFFFFFFFF00000000000000000000000000FFFFFFFFFF80808000FFFFFFFFFF
        00FFFFFFFFFF000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF000000FFFFFF00FF
        FFFFFFFF00FFFF808080FFFFFF00FFFFFFFFFF00FFFFFFFFFF000000FFFFFF00
        0000FFFFFF000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF80808000FFFFC0C0C0
        C0C0C0C0C0C0C0C0C0FFFFFF00FFFF000000C0C0C0C0C0C0C0C0C0FFFFFFC0C0
        C0C0C0C0C0C0C0808080000000000000000000000000C0C0C000FFFF00000000
        0000000000000000C0C0C0000000000000000000000000808080000000FF00FF
        0000FF000000C0C0C0FFFFFF000000FF00FF0000FF000000C0C0C0000000FF00
        FF0000FF000000808080000000000000000000000000FFFFFF00FFFF00000000
        0000000000000000FFFFFF00000000000000000000000080808000FFFFFFFFFF
        000000FFFFFF00FFFFFFFFFF00FFFF00000000FFFFFFFFFF00FFFFFFFFFF0000
        00FFFFFF00FFFF808080FFFFFF00FFFFFFFFFF000000FFFFFF000000FFFFFF00
        0000FFFFFF000000FFFFFF000000FFFFFF00FFFFFFFFFF80808000FFFFFFFFFF
        00FFFFC0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF00FFFFFFFFFF00FF
        FFFFFFFF00FFFF808080FFFFFF00FFFF00000000000000000000000000000000
        0000C0C0C000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF80808000FFFFFFFFFF
        000000FF00FF0000FFFF00FF0000FF000000C0C0C0FFFFFF00FFFFFFFFFF00FF
        FFFFFFFF00FFFF808080FFFFFF00FFFF00000000000000000000000000000000
        0000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF808000}
      ParentBiDiMode = False
      Visible = True
      OnClick = SB0Click
    end
    inherited SB4: TSpeedButton
      Left = 611
      Width = 53
      Hint = '取消MRP'
      Caption = '取消MRP'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000808000808000
        8080008080000000000000000000000000000000000000000000000000008080
        008080008080008080008080008080008080000000000000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF000000808000808000808000808000808000
        0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000008080008080008080000000000000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000008080000000000000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000000000000000FFFFFFFFFFFFFF0000FF0000FFFFFFFF00
        00FF0000FFFFFFFF0000FF0000FFFFFFFF0000FF0000FF000000000000FFFFFF
        0000FF0000FFFFFFFF0000FFFFFFFF0000FFFFFFFF0000FFFFFFFF0000FFFFFF
        FF0000FF0000FF0000000000000000FF0000FFFFFFFFFFFFFF0000FFFFFFFF00
        00FFFFFFFF0000FFFFFFFF0000FFFFFFFFFFFFFF0000FF0000000000000000FF
        FFFFFF0000FF0000FF0000FFFFFFFF0000FFFFFFFF0000FFFFFFFF0000FFFFFF
        FF0000FFFFFFFF000000000000FFFFFF0000FF0000FFFFFFFF0000FFFFFFFF00
        00FFFFFFFF0000FFFFFFFF0000FFFFFFFF0000FFFFFFFF0000000000000000FF
        FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFF0000FF0000FFFFFF
        FFFFFFFF0000FF0000000000000000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000808000000000
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000008080008080008080000000000000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF000000808000808000808000808000
        8080000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        0080800080800080800080800080800080800080800000000000000000000000
        0000000000000000000000000000808000808000808000808000}
      Layout = blGlyphTop
      Visible = True
      OnClick = SB4Click
    end
    inherited SB6: TSpeedButton
      Left = 664
      Width = 56
      Caption = '离  开'
    end
  end
  inherited Panel3: TPanel
    Top = 573
    Height = 0
  end
  inherited DBGrid1: TDBGrid
    Top = 153
    Width = 838
    Height = 420
    Color = clInfoBk
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'D_SN'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F08'
        PickList.Strings = ()
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F03'
        PickList.Strings = ()
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F04'
        PickList.Strings = ()
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F06'
        PickList.Strings = ()
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F05'
        PickList.Strings = ()
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F07'
        PickList.Strings = ()
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'F09'
        PickList.Strings = ()
        Title.Alignment = taRightJustify
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F10'
        PickList.Strings = ()
        Title.Alignment = taRightJustify
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F11'
        PickList.Strings = ()
        Title.Alignment = taRightJustify
        Width = 75
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Left = 838
    Top = 153
    Width = 34
    Height = 420
    inherited DBVertNavigator1: TDBVertNavigator
      Width = 32
      Height = 418
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
    end
  end
  inherited DataSource1: TDataSource
    Top = 230
  end
  inherited DataSource2: TDataSource
    Top = 270
  end
  inherited Qry1: TQuery
    Left = 559
    Top = 232
  end
  inherited Table1: TTable
    BeforeInsert = Table1BeforeInsert
    IndexFieldNames = 'F01'
    TableName = 'dbo.T2020'
    Top = 230
    object Table1F01: TStringField
      DisplayLabel = '制令单号'
      FieldName = 'F01'
      FixedChar = True
      Size = 12
    end
    object Table1F02: TDateTimeField
      DisplayLabel = '开立日期'
      FieldName = 'F02'
      OnValidate = RequiredValue
    end
    object Table1F03: TIntegerField
      DisplayLabel = '真实编号'
      FieldName = 'F03'
    end
    object Table1F04: TStringField
      DisplayLabel = '订单单号'
      FieldName = 'F04'
      FixedChar = True
      Size = 12
    end
    object Table1F05: TFloatField
      DefaultExpression = '0'
      DisplayLabel = '订单需求量'
      FieldName = 'F05'
    end
    object Table1F06: TFloatField
      DefaultExpression = '1'
      DisplayLabel = '预计生产量'
      FieldName = 'F06'
      OnValidate = RequiredValue
    end
    object Table1F07: TFloatField
      DefaultExpression = '0'
      DisplayLabel = '已入库量'
      FieldName = 'F07'
    end
    object Table1F09: TStringField
      DefaultExpression = #39'成品'#39
      DisplayLabel = '制造物品类'
      FieldName = 'F09'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 6
    end
    object Table1F08: TDateTimeField
      DisplayLabel = '生成物料需求时间'
      FieldName = 'F08'
    end
    object Table1F11: TStringField
      FieldName = 'F11'
      Size = 100
    end
    object Table1F12: TStringField
      DisplayLabel = '制造单半成品或成品型号'
      FieldName = 'F12'
      FixedChar = True
      Size = 10
    end
    object Table1F13: TStringField
      DisplayLabel = '品名'
      FieldName = 'F13'
      FixedChar = True
      Size = 12
    end
    object Table1F14: TStringField
      DisplayLabel = '规格'
      FieldName = 'F14'
      FixedChar = True
    end
    object Table1F15: TStringField
      DisplayLabel = '材质'
      FieldName = 'F15'
      FixedChar = True
      Size = 6
    end
    object Table1F16: TStringField
      DisplayLabel = '心空'
      FieldName = 'F16'
      FixedChar = True
      Size = 5
    end
    object Table1Buser: TStringField
      FieldName = 'Buser'
      FixedChar = True
      Size = 10
    end
    object Table1Btime: TDateTimeField
      FieldName = 'Btime'
    end
    object Table1Euser: TStringField
      FieldName = 'Euser'
      FixedChar = True
      Size = 10
    end
    object Table1Etime: TDateTimeField
      FieldName = 'Etime'
    end
    object Table1F17: TDateTimeField
      FieldName = 'F17'
    end
    object Table1F18: TIntegerField
      DisplayLabel = '订单项次'
      FieldName = 'F18'
    end
  end
  inherited Table2: TTable
    IndexFieldNames = 'F01'
    MasterFields = 'F01'
    ReadOnly = True
    TableName = 'dbo.T2020A'
    Top = 270
    object Table2F01: TStringField
      DisplayLabel = '单号'
      FieldName = 'F01'
      FixedChar = True
      Size = 12
    end
    object Table2F02: TStringField
      DisplayLabel = '需求物品编号'
      FieldName = 'F02'
      FixedChar = True
      Size = 10
    end
    object Table2F03: TStringField
      DisplayLabel = '型号或原料编号'
      FieldName = 'F03'
      FixedChar = True
      Size = 10
    end
    object Table2F04: TStringField
      DisplayLabel = '品名'
      FieldName = 'F04'
      FixedChar = True
      Size = 12
    end
    object Table2F05: TStringField
      DisplayLabel = '规格'
      FieldName = 'F05'
      FixedChar = True
    end
    object Table2F06: TStringField
      DisplayLabel = '材质'
      FieldName = 'F06'
      FixedChar = True
      Size = 6
    end
    object Table2F07: TStringField
      DisplayLabel = '心孔'
      FieldName = 'F07'
      FixedChar = True
      Size = 5
    end
    object Table2F08: TStringField
      DisplayLabel = '需求物品类'
      FieldName = 'F08'
      FixedChar = True
      Size = 8
    end
    object Table2F09: TFloatField
      DisplayLabel = '当前实际库存'
      FieldName = 'F09'
    end
    object Table2F10: TFloatField
      DisplayLabel = '可领量'
      FieldName = 'F10'
    end
    object Table2F11: TFloatField
      DisplayLabel = '已领料量'
      FieldName = 'F11'
    end
    object Table2Buser: TStringField
      FieldName = 'Buser'
      FixedChar = True
      Size = 10
    end
    object Table2K_SN: TIntegerField
      DisplayLabel = '键值'
      FieldName = 'K_SN'
    end
    object Table2D_SN: TSmallintField
      DisplayLabel = '项'
      FieldName = 'D_SN'
    end
    object Table2Btime: TDateTimeField
      FieldName = 'Btime'
    end
    object Table2Euser: TStringField
      FieldName = 'Euser'
      FixedChar = True
      Size = 10
    end
    object Table2Etime: TDateTimeField
      FieldName = 'Etime'
    end
  end
  object Qry2: TQuery
    DatabaseName = 'STK0311'
    Left = 560
    Top = 272
  end
  object Qry3: TQuery
    DatabaseName = 'STK0311'
    Left = 560
    Top = 312
  end
  object Qry4: TQuery
    DatabaseName = 'STK0311'
    Left = 560
    Top = 352
  end
end
