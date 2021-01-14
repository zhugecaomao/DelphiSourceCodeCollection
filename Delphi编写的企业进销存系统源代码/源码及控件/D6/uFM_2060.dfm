inherited FM_2060: TFM_2060
  Left = 105
  Top = 174
  Hint = #29289#26009#36827'('#36864')'#26009#21333
  ActiveControl = DBDateEdit1
  Caption = #29289#26009#36827'('#36864')'#26009#21333
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 106
    object Label1: TLabel [0]
      Left = 21
      Top = 11
      Width = 60
      Height = 12
      Caption = #21333'      '#21495
    end
    object Label2: TLabel [1]
      Left = 194
      Top = 11
      Width = 48
      Height = 12
      Caption = #26085'    '#26399
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel [2]
      Left = 21
      Top = 59
      Width = 60
      Height = 12
      Caption = #31246'      '#21035
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel [3]
      Left = 365
      Top = 34
      Width = 48
      Height = 12
      Caption = #24065'    '#21035
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel [4]
      Left = 21
      Top = 35
      Width = 60
      Height = 12
      Caption = #29289#26009#20379#24212#21830
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel [5]
      Left = 543
      Top = 35
      Width = 48
      Height = 12
      Caption = #36827#26009#24635#39069
    end
    object Label9: TLabel [6]
      Left = 543
      Top = 11
      Width = 48
      Height = 12
      Caption = #26126#32454#24635#39069
    end
    object Label10: TLabel [7]
      Left = 365
      Top = 59
      Width = 48
      Height = 12
      Caption = #31246'    '#39069
    end
    object Label11: TLabel [8]
      Left = 194
      Top = 59
      Width = 48
      Height = 12
      Caption = #31246'    '#29575
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel [9]
      Left = 21
      Top = 83
      Width = 60
      Height = 12
      Caption = #22791'      '#27880
    end
    object Label13: TLabel [10]
      Left = 366
      Top = 11
      Width = 48
      Height = 12
      Caption = #24080#27454#24180#26376
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel [11]
      Left = 543
      Top = 83
      Width = 48
      Height = 12
      Caption = #36827#36864#31867#22411
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel [12]
      Left = 543
      Top = 59
      Width = 48
      Height = 12
      Caption = #24212#20184#24635#39069
    end
    inherited DBEdit1: TDBEdit
      Left = 87
      Top = 7
      Width = 100
      Color = clInfoBk
      DataField = 'F01'
      ReadOnly = True
    end
    object DBEdit4: TDBEdit
      Left = 194
      Top = 32
      Width = 157
      Height = 20
      Color = clInfoBk
      DataField = 'lk_FirmName'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 251
      Top = 55
      Width = 100
      Height = 20
      DataField = 'F07'
      DataSource = DataSource1
      TabOrder = 9
    end
    object DBEdit9: TDBEdit
      Left = 420
      Top = 55
      Width = 108
      Height = 20
      Color = clInfoBk
      DataField = 'F08'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 10
    end
    object DBEdit10: TDBEdit
      Left = 598
      Top = 7
      Width = 102
      Height = 20
      Color = clInfoBk
      DataField = 'F09'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit11: TDBEdit
      Left = 598
      Top = 31
      Width = 102
      Height = 20
      Color = clInfoBk
      DataField = 'F10'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit12: TDBEdit
      Left = 87
      Top = 79
      Width = 441
      Height = 20
      DataField = 'F11'
      DataSource = DataSource1
      TabOrder = 12
    end
    object DBDateEdit1: TDBDateEdit
      Left = 251
      Top = 7
      Width = 100
      Height = 21
      DataField = 'F02'
      DataSource = DataSource1
      NumGlyphs = 2
      TabOrder = 1
    end
    object RxDBComboEdit1: TRxDBComboEdit
      Left = 87
      Top = 31
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
    object RxDBComboEdit2: TRxDBComboEdit
      Left = 420
      Top = 31
      Width = 108
      Height = 21
      DataField = 'F04'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 17
      NumGlyphs = 1
      TabOrder = 6
      OnButtonClick = RxDBComboEdit2ButtonClick
    end
    object DBComboBox1: TDBComboBox
      Left = 87
      Top = 55
      Width = 100
      Height = 20
      Style = csDropDownList
      DataField = 'F06'
      DataSource = DataSource1
      ItemHeight = 12
      Items.Strings = (
        #22806#21152
        #20869#21547
        #20813#31246)
      TabOrder = 8
    end
    object DBEdit2: TDBEdit
      Left = 420
      Top = 7
      Width = 108
      Height = 20
      DataField = 'F12'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBComboBox2: TDBComboBox
      Left = 598
      Top = 79
      Width = 103
      Height = 20
      Style = csDropDownList
      DataField = 'F13'
      DataSource = DataSource1
      ItemHeight = 12
      Items.Strings = (
        #36827
        #36864)
      TabOrder = 13
    end
    object DBEdit3: TDBEdit
      Left = 598
      Top = 55
      Width = 102
      Height = 20
      Color = clInfoBk
      DataField = 'Cal_PayMoney'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 11
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
      Width = 49
      Caption = #31163'  '#24320
    end
  end
  inherited Panel3: TPanel
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Top = 150
    Width = 772
    Height = 393
    OnEditButtonClick = DBGrid1EditButtonClick
    Columns = <
      item
        Alignment = taCenter
        Color = clInfoBk
        Expanded = False
        FieldName = 'D_SN'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 25
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'F06'
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -12
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 82
        Visible = True
      end
      item
        ButtonStyle = cbsNone
        Color = clInfoBk
        Expanded = False
        FieldName = 'F02'
        ReadOnly = True
        Width = 92
        Visible = True
      end
      item
        ButtonStyle = cbsNone
        Color = clInfoBk
        Expanded = False
        FieldName = 'lk_MaterialName'
        Width = 142
        Visible = True
      end
      item
        ButtonStyle = cbsNone
        Color = clInfoBk
        Expanded = False
        FieldName = 'lk_MaterialGuiGe'
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F03'
        Title.Alignment = taRightJustify
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -12
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F04'
        Title.Alignment = taRightJustify
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -12
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'Cal_Money'
        ReadOnly = True
        Title.Alignment = taRightJustify
        Width = 83
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Left = 772
    Top = 150
    Width = 32
    Height = 393
    inherited DBVertNavigator1: TDBVertNavigator
      Width = 30
      Height = 391
    end
  end
  inherited DataSource1: TDataSource
    Top = 233
  end
  inherited DataSource2: TDataSource
    Top = 273
  end
  inherited Qry1: TQuery
    Left = 655
    Top = 240
  end
  inherited Table1: TTable
    BeforeInsert = Table1BeforeInsert
    OnCalcFields = Table1CalcFields
    TableName = 'dbo.T2060'
    Left = 456
    Top = 232
    object Table1F01: TStringField
      DisplayLabel = #29289#26009#36827#36864#21333#21495
      FieldName = 'F01'
      FixedChar = True
      Size = 12
    end
    object Table1F02: TDateTimeField
      DisplayLabel = #36827#36864#26085#26399
      FieldName = 'F02'
      OnValidate = RequiredValue
    end
    object Table1F03: TStringField
      DisplayLabel = #21378#21830#32534#21495
      FieldName = 'F03'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table1F04: TStringField
      DisplayLabel = #24065#21035
      FieldName = 'F04'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table1F05: TFloatField
      DefaultExpression = '1'
      DisplayLabel = #27719#29575
      FieldName = 'F05'
      OnValidate = RequiredValue
    end
    object Table1F06: TStringField
      DefaultExpression = #39#22806#21152#39
      DisplayLabel = #31246#21035
      FieldName = 'F06'
      OnChange = Table1F06Change
      OnValidate = RequiredValue
      FixedChar = True
      Size = 4
    end
    object Table1F07: TFloatField
      DefaultExpression = '0.05'
      DisplayLabel = #31246#29575
      FieldName = 'F07'
      OnChange = Table1F07Change
      OnValidate = RequiredValue
    end
    object Table1F08: TFloatField
      DefaultExpression = '0'
      DisplayLabel = #31246#39069
      FieldName = 'F08'
      OnValidate = RequiredValue
    end
    object Table1F09: TFloatField
      DefaultExpression = '0'
      DisplayLabel = #26126#32454#24635#39069
      FieldName = 'F09'
      OnValidate = RequiredValue
    end
    object Table1F10: TFloatField
      DefaultExpression = '0'
      DisplayLabel = #36827#26009#24635#39069
      FieldName = 'F10'
      OnValidate = RequiredValue
    end
    object Table1F11: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'F11'
      Size = 100
    end
    object Table1F12: TStringField
      DisplayLabel = #24080#27454#24180#26376
      FieldName = 'F12'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 4
    end
    object Table1F13: TStringField
      DefaultExpression = #39#36827#39
      DisplayLabel = #36827#36864#31867#22411
      FieldName = 'F13'
      FixedChar = True
      Size = 2
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
    object Table1lk_FirmName: TStringField
      FieldKind = fkLookup
      FieldName = 'lk_FirmName'
      LookupDataSet = DM.Q_T5010
      LookupKeyFields = 'F01'
      LookupResultField = 'F02'
      KeyFields = 'F03'
      Size = 40
      Lookup = True
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
    TableName = 'dbo.T2060A'
    Top = 280
    object Table2D_SN: TSmallintField
      DisplayLabel = #39033
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
    object Table2F06: TStringField
      DisplayLabel = #37319#36141#21333#21495
      FieldName = 'F06'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 12
    end
    object Table2F02: TStringField
      DisplayLabel = #29289#26009#32534#21495
      FieldName = 'F02'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table2F03: TFloatField
      DefaultExpression = '0'
      DisplayLabel = #25968#37327
      FieldName = 'F03'
      OnValidate = RequiredValue
    end
    object Table2F04: TFloatField
      DefaultExpression = '0'
      DisplayLabel = #21333#20215
      FieldName = 'F04'
      OnValidate = RequiredValue
    end
    object Table2F05: TFloatField
      DefaultExpression = '0'
      DisplayLabel = #37329#39069
      FieldName = 'F05'
      OnValidate = RequiredValue
    end
    object Table2Cal_Money: TFloatField
      DisplayLabel = #37329#39069
      FieldKind = fkCalculated
      FieldName = 'Cal_Money'
      Calculated = True
    end
    object Table2lk_MaterialName: TStringField
      DisplayLabel = #21697#21517
      FieldKind = fkLookup
      FieldName = 'lk_MaterialName'
      LookupDataSet = DM.Q_T1060
      LookupKeyFields = 'F01'
      LookupResultField = 'F02'
      KeyFields = 'F02'
      ReadOnly = True
      Size = 40
      Lookup = True
    end
    object Table2lk_MaterialGuiGe: TStringField
      DisplayLabel = #35268#26684
      FieldKind = fkLookup
      FieldName = 'lk_MaterialGuiGe'
      LookupDataSet = DM.Q_T1060
      LookupKeyFields = 'F01'
      LookupResultField = 'F03'
      KeyFields = 'F02'
      ReadOnly = True
      Size = 40
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
