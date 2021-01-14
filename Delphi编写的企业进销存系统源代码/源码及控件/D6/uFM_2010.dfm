inherited FM_2010: TFM_2010
  Left = 72
  Top = 119
  Hint = '订单'
  Caption = '订单处理'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 102
    object Label1: TLabel [0]
      Left = 20
      Top = 10
      Width = 48
      Height = 12
      Caption = '订单单号'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel [1]
      Left = 180
      Top = 10
      Width = 66
      Height = 12
      Caption = '订 购 日 期'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel [2]
      Left = 20
      Top = 33
      Width = 48
      Height = 12
      Caption = '客户编号'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel [3]
      Left = 414
      Top = 10
      Width = 30
      Height = 12
      Caption = '币 别'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel [4]
      Left = 414
      Top = 33
      Width = 30
      Height = 12
      Caption = '税 别'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel [5]
      Left = 414
      Top = 56
      Width = 30
      Height = 12
      Caption = '税 率'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel [6]
      Left = 414
      Top = 79
      Width = 30
      Height = 12
      Caption = '税 额'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel [7]
      Left = 568
      Top = 33
      Width = 48
      Height = 12
      Caption = '明细总额'
    end
    object Label15: TLabel [8]
      Left = 568
      Top = 56
      Width = 48
      Height = 12
      Caption = '出货总额'
    end
    object Label16: TLabel [9]
      Left = 20
      Top = 79
      Width = 48
      Height = 12
      Caption = '备    注'
    end
    object Label9: TLabel [10]
      Left = 568
      Top = 79
      Width = 48
      Height = 12
      Caption = '应收总额'
    end
    object Label6: TLabel [11]
      Left = 568
      Top = 10
      Width = 48
      Height = 12
      Caption = '客户单号'
      FocusControl = DBEdit6
    end
    object Label10: TLabel [12]
      Left = 20
      Top = 56
      Width = 48
      Height = 12
      Caption = '指送厂商'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    inherited DBEdit1: TDBEdit
      Left = 75
      Top = 6
      Width = 100
      Color = clInfoBk
      DataField = 'F01'
      ReadOnly = True
    end
    object DBEdit4: TDBEdit
      Left = 180
      Top = 29
      Width = 215
      Height = 20
      Color = clInfoBk
      DataField = 'lkF03'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 451
      Top = 52
      Width = 101
      Height = 20
      DataField = 'F07'
      DataSource = DataSource1
      TabOrder = 10
    end
    object RxDBComboEdit1: TRxDBComboEdit
      Left = 75
      Top = 29
      Width = 100
      Height = 21
      DataField = 'F03'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 17
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = RxDBComboEdit1ButtonClick
    end
    object DBEdit2: TDBEdit
      Left = 451
      Top = 75
      Width = 101
      Height = 20
      Hint = '免税: 税额为=零.外加与内含: 税额为=明细总额 * 税率'
      Color = clInfoBk
      DataField = 'CalF08'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 13
    end
    object DBEdit3: TDBEdit
      Left = 623
      Top = 52
      Width = 130
      Height = 20
      Hint = '免税与外加:出货总额=明细总额.内含:出货总额=明细总额 *(1-税率)'
      Color = clInfoBk
      DataField = 'CalF10'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 11
    end
    object DBEdit9: TDBEdit
      Left = 623
      Top = 29
      Width = 130
      Height = 20
      Color = clInfoBk
      DataField = 'CalF09'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 7
    end
    object RxDBComboEdit2: TRxDBComboEdit
      Left = 451
      Top = 6
      Width = 101
      Height = 21
      DataField = 'F04'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = RxDBComboEdit2ButtonClick
    end
    object DBEdit5: TDBEdit
      Left = 75
      Top = 75
      Width = 320
      Height = 20
      DataField = 'F11'
      DataSource = DataSource1
      TabOrder = 12
    end
    object DBComboBox1: TDBComboBox
      Left = 451
      Top = 29
      Width = 101
      Height = 20
      DataField = 'F06'
      DataSource = DataSource1
      ItemHeight = 12
      Items.Strings = (
        '内含'
        '免税'
        '外加')
      TabOrder = 6
    end
    object DBDateEdit1: TDBDateEdit
      Left = 251
      Top = 5
      Width = 145
      Height = 21
      DataField = 'F02'
      DataSource = DataSource1
      ButtonWidth = 18
      NumGlyphs = 2
      TabOrder = 1
    end
    object DBEdit7: TDBEdit
      Left = 623
      Top = 75
      Width = 130
      Height = 20
      Hint = '应收总额=出货总额+税额'
      Color = clInfoBk
      DataField = 'CalTotal'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 14
    end
    object DBEdit6: TDBEdit
      Left = 623
      Top = 6
      Width = 130
      Height = 20
      DataField = 'F12'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit10: TDBEdit
      Left = 128
      Top = 184
      Width = 52
      Height = 20
      DataField = 'F04'
      DataSource = DataSource1
      TabOrder = 15
    end
    object RxDBComboEdit3: TRxDBComboEdit
      Left = 75
      Top = 52
      Width = 100
      Height = 21
      DataField = 'F14'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 17
      NumGlyphs = 1
      TabOrder = 8
      OnButtonClick = RxDBComboEdit3ButtonClick
    end
    object DBEdit11: TDBEdit
      Left = 180
      Top = 52
      Width = 215
      Height = 20
      Color = clInfoBk
      DataField = 'lkF14'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 9
    end
  end
  inherited ToolBar1: TToolBar
    inherited DBNavPlus1: TDBNavPlus
      Hints.Strings = (
        'Ctrl + Home  '
        'Alt + Home'
        'Alt + End'
        'Ctrl + End'
        'Ins'
        'Ctrl + Del'
        'No HotKey'
        'Ctrl+S'
        'ESC'
        'F5'
        '')
    end
    inherited SB2: TSpeedButton
      Visible = True
    end
    inherited SB3: TSpeedButton
      Visible = True
    end
  end
  inherited Panel3: TPanel
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Top = 146
    Width = 838
    Height = 397
    OnEditButtonClick = DBGrid1EditButtonClick
    Columns = <
      item
        Alignment = taCenter
        Color = clInfoBk
        Expanded = False
        FieldName = 'D_SN'
        PickList.Strings = ()
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 24
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'lkF01'
        PickList.Strings = ()
        ReadOnly = True
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -12
        Title.Font.Name = '宋体'
        Title.Font.Style = []
        Width = 75
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF02'
        PickList.Strings = ()
        ReadOnly = True
        Width = 104
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF03'
        PickList.Strings = ()
        ReadOnly = True
        Width = 96
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF04'
        PickList.Strings = ()
        ReadOnly = True
        Width = 108
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF05'
        PickList.Strings = ()
        ReadOnly = True
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'F03'
        PickList.Strings = ()
        Title.Alignment = taRightJustify
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -12
        Title.Font.Name = '宋体'
        Title.Font.Style = []
        Width = 77
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF07'
        PickList.Strings = ()
        ReadOnly = True
        Title.Alignment = taRightJustify
        Width = 55
        Visible = True
      end
      item
        Color = clBtnHighlight
        Expanded = False
        FieldName = 'F20'
        PickList.Strings = ()
        Title.Alignment = taRightJustify
        Title.Caption = '总重量'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F04'
        PickList.Strings = ()
        Title.Alignment = taRightJustify
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -12
        Title.Font.Name = '宋体'
        Title.Font.Style = []
        Width = 56
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'CalF05'
        PickList.Strings = ()
        ReadOnly = True
        Title.Alignment = taRightJustify
        Width = 80
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'F06'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = '宋体'
        Title.Font.Style = []
        Width = 66
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'F07'
        PickList.Strings = ()
        ReadOnly = True
        Title.Alignment = taRightJustify
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'F08'
        PickList.Strings = ()
        ReadOnly = True
        Title.Alignment = taRightJustify
        Width = 78
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'CalF21'
        PickList.Strings = ()
        ReadOnly = True
        Title.Alignment = taRightJustify
        Title.Caption = '结存量'
        Width = 70
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Left = 838
    Top = 146
    Width = 34
    Height = 397
    inherited DBVertNavigator1: TDBVertNavigator
      Width = 32
      Height = 395
    end
  end
  inherited DataSource1: TDataSource
    Top = 193
  end
  inherited DataSource2: TDataSource
    Top = 226
  end
  inherited Qry1: TQuery
    Left = 559
    Top = 208
  end
  inherited Table1: TTable
    BeforeInsert = Table1BeforeInsert
    OnCalcFields = Table1CalcFields
    TableName = 'dbo.T2010'
    Top = 192
    object Table1F01: TStringField
      DisplayLabel = '订单单号'
      FieldName = 'F01'
      FixedChar = True
      Size = 12
    end
    object Table1F02: TDateTimeField
      DisplayLabel = '订购日期'
      FieldName = 'F02'
    end
    object Table1F03: TStringField
      DisplayLabel = '客户编号'
      FieldName = 'F03'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table1F04: TStringField
      DisplayLabel = '币别'
      FieldName = 'F04'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table1F05: TFloatField
      DisplayLabel = '汇率'
      FieldName = 'F05'
    end
    object Table1F06: TStringField
      DisplayLabel = '税别'
      FieldName = 'F06'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 4
    end
    object Table1F07: TFloatField
      DisplayLabel = '税率'
      FieldName = 'F07'
      OnValidate = RequiredValue
    end
    object Table1F08: TFloatField
      DisplayLabel = '税额'
      FieldName = 'F08'
    end
    object Table1F09: TFloatField
      FieldName = 'F09'
    end
    object Table1F10: TFloatField
      FieldName = 'F10'
    end
    object Table1F11: TStringField
      FieldName = 'F11'
      Size = 100
    end
    object Table1F12: TStringField
      DisplayLabel = '客户单号'
      FieldName = 'F12'
      FixedChar = True
      Size = 15
    end
    object Table1F14: TStringField
      DisplayLabel = '指送厂商'
      FieldName = 'F14'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table1Buser: TStringField
      DisplayLabel = '建档人'
      FieldName = 'Buser'
      FixedChar = True
      Size = 10
    end
    object Table1Btime: TDateTimeField
      DisplayLabel = '建档时间'
      FieldName = 'Btime'
    end
    object Table1Euser: TStringField
      DisplayLabel = '修改人'
      FieldName = 'Euser'
      FixedChar = True
      Size = 10
    end
    object Table1Etime: TDateTimeField
      DisplayLabel = '修改时间'
      FieldName = 'Etime'
    end
    object Table1lkF03: TStringField
      FieldKind = fkLookup
      FieldName = 'lkF03'
      LookupDataSet = DM.Q_T1010
      LookupKeyFields = 'F01'
      LookupResultField = 'F03'
      KeyFields = 'F03'
      Size = 40
      Lookup = True
    end
    object Table1CalF09: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalF09'
      Calculated = True
    end
    object Table1CalF08: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalF08'
      Calculated = True
    end
    object Table1CalF10: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalF10'
      Calculated = True
    end
    object Table1CalTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalTotal'
      Calculated = True
    end
    object Table1lkF14: TStringField
      FieldKind = fkLookup
      FieldName = 'lkF14'
      LookupDataSet = DM.Q_T1011
      LookupKeyFields = 'F01'
      LookupResultField = 'F03'
      KeyFields = 'F14'
      Size = 12
      Lookup = True
    end
  end
  inherited Table2: TTable
    AfterScroll = Table2AfterScroll
    OnCalcFields = Table2CalcFields
    IndexFieldNames = 'F01;D_SN'
    MasterFields = 'F01'
    TableName = 'dbo.T2010A'
    Top = 232
    object Table2F01: TStringField
      FieldName = 'F01'
      FixedChar = True
      Size = 12
    end
    object Table2F02: TIntegerField
      DisplayLabel = '成品编号'
      FieldName = 'F02'
    end
    object Table2F03: TFloatField
      DisplayLabel = '订购数量'
      FieldName = 'F03'
      OnChange = Table2F03Change
      OnValidate = RequiredValue
    end
    object Table2F05: TFloatField
      DisplayLabel = '金额'
      FieldName = 'F05'
    end
    object Table2F04: TFloatField
      DisplayLabel = '单价'
      FieldName = 'F04'
      OnValidate = RequiredValue
    end
    object Table2F06: TDateTimeField
      DisplayLabel = '交货日期'
      FieldName = 'F06'
    end
    object Table2F07: TFloatField
      DisplayLabel = '已出货量'
      FieldName = 'F07'
    end
    object Table2F08: TFloatField
      DisplayLabel = '已开制造量'
      FieldName = 'F08'
    end
    object Table2Buser: TStringField
      DisplayLabel = '建档人'
      FieldName = 'Buser'
      FixedChar = True
      Size = 10
    end
    object Table2D_SN: TSmallintField
      DisplayLabel = '项'
      FieldName = 'D_SN'
    end
    object Table2K_SN: TIntegerField
      FieldName = 'K_SN'
    end
    object Table2Btime: TDateTimeField
      DisplayLabel = '建档时间'
      FieldName = 'Btime'
    end
    object Table2Euser: TStringField
      DisplayLabel = '修改人'
      FieldName = 'Euser'
      FixedChar = True
      Size = 10
    end
    object Table2Etime: TDateTimeField
      DisplayLabel = '修改时间'
      FieldName = 'Etime'
    end
    object Table2CalF05: TFloatField
      DisplayLabel = '金额'
      FieldKind = fkCalculated
      FieldName = 'CalF05'
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
      Size = 3
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
      Size = 5
      Lookup = True
    end
    object Table2lkF07: TFloatField
      DisplayLabel = '单重'
      FieldKind = fkLookup
      FieldName = 'lkF07'
      LookupDataSet = DM.Q_T1080
      LookupKeyFields = 'AutoNo'
      LookupResultField = 'F07'
      KeyFields = 'F02'
      Lookup = True
    end
    object Table2F20: TFloatField
      FieldName = 'F20'
      OnChange = Table2F20Change
    end
    object Table2CalF21: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalF21'
      Calculated = True
    end
  end
  object Query1: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      '')
    Left = 184
    Top = 224
  end
  object Qry2: TQuery
    DatabaseName = 'STK0311'
    Left = 296
    Top = 208
  end
end
