inherited FM_2030: TFM_2030
  Left = 52
  Top = 132
  Hint = '原料采购单'
  ActiveControl = DBDateEdit1
  Caption = '原料采购单'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 105
    object Label1: TLabel [0]
      Left = 21
      Top = 11
      Width = 60
      Height = 12
      Caption = '采 购 单号'
    end
    object Label2: TLabel [1]
      Left = 212
      Top = 11
      Width = 30
      Height = 12
      Caption = '日 期'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel [2]
      Left = 21
      Top = 58
      Width = 60
      Height = 12
      Caption = '税      别'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel [3]
      Left = 365
      Top = 11
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
      Left = 21
      Top = 35
      Width = 60
      Height = 12
      Caption = '原料供应商'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel [5]
      Left = 520
      Top = 34
      Width = 48
      Height = 12
      Caption = '进料总额'
    end
    object Label9: TLabel [6]
      Left = 520
      Top = 11
      Width = 48
      Height = 12
      Caption = '明细总额'
    end
    object Label10: TLabel [7]
      Left = 365
      Top = 57
      Width = 30
      Height = 12
      Caption = '税 额'
    end
    object Label11: TLabel [8]
      Left = 212
      Top = 57
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
    object Label12: TLabel [9]
      Left = 21
      Top = 82
      Width = 60
      Height = 12
      Caption = '备      注'
    end
    object Label4: TLabel [10]
      Left = 520
      Top = 57
      Width = 48
      Height = 12
      Caption = '应付总额'
    end
    object Label6: TLabel [11]
      Left = 212
      Top = 34
      Width = 30
      Height = 12
      Caption = '名 称'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    inherited DBEdit1: TDBEdit
      Left = 91
      Top = 7
      Width = 108
      Color = clInfoBk
      DataField = 'F01'
      ReadOnly = True
    end
    object DBEdit4: TDBEdit
      Left = 248
      Top = 30
      Width = 256
      Height = 20
      Color = clInfoBk
      DataField = 'lk_FirmsName'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 248
      Top = 53
      Width = 100
      Height = 20
      DataField = 'F07'
      DataSource = DataSource1
      TabOrder = 8
    end
    object DBEdit9: TDBEdit
      Left = 400
      Top = 53
      Width = 104
      Height = 20
      Color = clInfoBk
      DataField = 'F08'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 9
    end
    object DBEdit10: TDBEdit
      Left = 577
      Top = 7
      Width = 105
      Height = 20
      Color = clInfoBk
      DataField = 'F09'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit11: TDBEdit
      Left = 577
      Top = 30
      Width = 105
      Height = 20
      Color = clInfoBk
      DataField = 'F10'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit12: TDBEdit
      Left = 91
      Top = 76
      Width = 591
      Height = 20
      DataField = 'F11'
      DataSource = DataSource1
      TabOrder = 11
    end
    object DBDateEdit1: TDBDateEdit
      Left = 248
      Top = 7
      Width = 100
      Height = 21
      DataField = 'F02'
      DataSource = DataSource1
      NumGlyphs = 2
      TabOrder = 1
    end
    object RxDBComboEdit1: TRxDBComboEdit
      Left = 91
      Top = 30
      Width = 108
      Height = 21
      DataField = 'F03'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = RxDBComboEdit1ButtonClick
    end
    object RxDBComboEdit2: TRxDBComboEdit
      Left = 400
      Top = 7
      Width = 104
      Height = 21
      DataField = 'F04'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 17
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = RxDBComboEdit2ButtonClick
    end
    object DBComboBox1: TDBComboBox
      Left = 91
      Top = 53
      Width = 108
      Height = 20
      Style = csDropDownList
      DataField = 'F06'
      DataSource = DataSource1
      ItemHeight = 12
      Items.Strings = (
        '外加'
        '内含'
        '免税')
      TabOrder = 7
    end
    object DBEdit2: TDBEdit
      Left = 577
      Top = 53
      Width = 105
      Height = 20
      Color = clInfoBk
      DataField = 'Cal_PayMoney'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 10
    end
  end
  inherited ToolBar1: TToolBar
    inherited SB2: TSpeedButton
      Visible = True
    end
    inherited SB3: TSpeedButton
      Visible = True
    end
    inherited SB6: TSpeedButton
      Width = 52
      Caption = '离  开'
    end
  end
  inherited Panel3: TPanel
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Top = 149
    Width = 840
    Height = 394
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
        FieldName = 'F02'
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = '新细明体'
        Font.Style = []
        PickList.Strings = ()
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -12
        Title.Font.Name = '宋体'
        Title.Font.Style = []
        Width = 85
        Visible = True
      end
      item
        ButtonStyle = cbsNone
        Color = clInfoBk
        Expanded = False
        FieldName = 'lk_MaterialName'
        PickList.Strings = ()
        Width = 123
        Visible = True
      end
      item
        ButtonStyle = cbsNone
        Color = clInfoBk
        Expanded = False
        FieldName = 'lk_MaterialGuiGe'
        PickList.Strings = ()
        Width = 151
        Visible = True
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
        Width = 67
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
        Width = 62
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'Cal_Money'
        PickList.Strings = ()
        ReadOnly = True
        Title.Alignment = taRightJustify
        Width = 85
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
        Alignment = taCenter
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
        Width = 78
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Left = 840
    Top = 149
    Width = 32
    Height = 394
    inherited DBVertNavigator1: TDBVertNavigator
      Width = 30
      Height = 392
    end
  end
  inherited DataSource1: TDataSource
    Top = 233
  end
  inherited DataSource2: TDataSource
    Top = 273
  end
  inherited Qry1: TQuery
    Left = 607
    Top = 240
  end
  inherited Table1: TTable
    BeforeInsert = Table1BeforeInsert
    OnCalcFields = Table1CalcFields
    IndexFieldNames = 'F01'
    TableName = 'dbo.T2030'
    Top = 240
    object Table1F01: TStringField
      DisplayLabel = '采购单号'
      FieldName = 'F01'
      FixedChar = True
      Size = 12
    end
    object Table1F02: TDateTimeField
      DisplayLabel = '采购日期'
      FieldName = 'F02'
      OnValidate = RequiredValue
    end
    object Table1F03: TStringField
      DisplayLabel = '厂商编号'
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
      DefaultExpression = '1'
      DisplayLabel = '汇率'
      FieldName = 'F05'
    end
    object Table1F06: TStringField
      DefaultExpression = #39'外加'#39
      DisplayLabel = '税别'
      FieldName = 'F06'
      OnChange = Table1F06Change
      OnValidate = RequiredValue
      FixedChar = True
      Size = 4
    end
    object Table1F07: TFloatField
      DefaultExpression = '0.05'
      DisplayLabel = '税率'
      FieldName = 'F07'
      OnChange = Table1F07Change
      OnValidate = RequiredValue
    end
    object Table1F08: TFloatField
      DefaultExpression = '0'
      DisplayLabel = '税额'
      FieldName = 'F08'
      OnValidate = RequiredValue
    end
    object Table1F09: TFloatField
      DefaultExpression = '0'
      DisplayLabel = '明细总额'
      FieldName = 'F09'
      OnValidate = RequiredValue
    end
    object Table1F10: TFloatField
      DefaultExpression = '0'
      DisplayLabel = '进料总额'
      FieldName = 'F10'
      OnValidate = RequiredValue
    end
    object Table1F11: TStringField
      DisplayLabel = '备注'
      FieldName = 'F11'
      Size = 100
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
    object Table1lk_Rate: TStringField
      FieldKind = fkLookup
      FieldName = 'lk_Rate'
      LookupDataSet = DM.Q_T1100
      LookupKeyFields = 'F01'
      LookupResultField = 'F02'
      KeyFields = 'F04'
      Size = 4
      Lookup = True
    end
    object Table1lk_FirmsName: TStringField
      FieldKind = fkLookup
      FieldName = 'lk_FirmsName'
      LookupDataSet = DM.Q_T1020
      LookupKeyFields = 'F01'
      LookupResultField = 'F03'
      KeyFields = 'F03'
      Size = 10
      Lookup = True
    end
    object Table1Cal_PayMoney: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cal_PayMoney'
      Calculated = True
    end
  end
  inherited Table2: TTable
    AfterScroll = Table2AfterScroll
    OnCalcFields = Table2CalcFields
    IndexFieldNames = 'F01;D_SN'
    MasterFields = 'F01'
    TableName = 'dbo.T2030A'
    object Table2D_SN: TSmallintField
      DisplayLabel = '项'
      FieldName = 'D_SN'
    end
    object Table2K_SN: TIntegerField
      FieldName = 'K_SN'
    end
    object Table2F01: TStringField
      FieldName = 'F01'
      FixedChar = True
      Size = 12
    end
    object Table2F02: TStringField
      DisplayLabel = '原料编号'
      FieldName = 'F02'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table2F03: TFloatField
      DefaultExpression = '0'
      DisplayLabel = '重量'
      FieldName = 'F03'
      OnValidate = RequiredValue
    end
    object Table2F04: TFloatField
      DefaultExpression = '0'
      DisplayLabel = '单价'
      FieldName = 'F04'
      OnValidate = RequiredValue
    end
    object Table2Cal_Money: TFloatField
      DisplayLabel = '金额'
      FieldKind = fkCalculated
      FieldName = 'Cal_Money'
      Calculated = True
    end
    object Table2F05: TFloatField
      DefaultExpression = '0'
      DisplayLabel = '金额'
      FieldName = 'F05'
      OnValidate = RequiredValue
    end
    object Table2F06: TDateTimeField
      DisplayLabel = '交货日期'
      FieldName = 'F06'
    end
    object Table2F07: TFloatField
      DefaultExpression = '0'
      DisplayLabel = '已进重量'
      FieldName = 'F07'
      OnValidate = RequiredValue
    end
    object Table2lk_MaterialName: TStringField
      DisplayLabel = '品名'
      FieldKind = fkLookup
      FieldName = 'lk_MaterialName'
      LookupDataSet = DM.Q_T1050
      LookupKeyFields = 'F01'
      LookupResultField = 'F02'
      KeyFields = 'F02'
      ReadOnly = True
      Lookup = True
    end
    object Table2lk_MaterialGuiGe: TStringField
      DisplayLabel = '规格'
      FieldKind = fkLookup
      FieldName = 'lk_MaterialGuiGe'
      LookupDataSet = DM.Q_T1050
      LookupKeyFields = 'F01'
      LookupResultField = 'F03'
      KeyFields = 'F02'
      ReadOnly = True
      Lookup = True
    end
    object Table2Buser: TStringField
      FieldName = 'Buser'
      FixedChar = True
      Size = 10
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
end
