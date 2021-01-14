inherited FM_2151: TFM_2151
  Left = 86
  Top = 124
  Hint = '成品委外入库'
  Caption = '成品委外入库'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 108
    object Label1: TLabel [0]
      Left = 20
      Top = 12
      Width = 48
      Height = 12
      Caption = '入库单号'
    end
    object Label2: TLabel [1]
      Left = 198
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
      Left = 20
      Top = 37
      Width = 48
      Height = 12
      Caption = '委外厂商'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel [3]
      Left = 384
      Top = 36
      Width = 48
      Height = 12
      Caption = '币    别'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel [4]
      Left = 20
      Top = 61
      Width = 48
      Height = 12
      Caption = '税    别'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel [5]
      Left = 198
      Top = 60
      Width = 30
      Height = 12
      Caption = '税 率'
      FocusControl = DBEdit6
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel [6]
      Left = 384
      Top = 60
      Width = 48
      Height = 12
      Caption = '税    额'
    end
    object Label10: TLabel [7]
      Left = 594
      Top = 11
      Width = 48
      Height = 12
      Caption = '明细总额'
    end
    object Label11: TLabel [8]
      Left = 594
      Top = 36
      Width = 48
      Height = 12
      Caption = '进料总额'
    end
    object Label12: TLabel [9]
      Left = 385
      Top = 11
      Width = 48
      Height = 12
      Caption = '帐款年月'
      FocusControl = DBEdit10
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel [10]
      Left = 20
      Top = 86
      Width = 48
      Height = 12
      Caption = '备    注'
      FocusControl = DBEdit11
    end
    object Label6: TLabel [11]
      Left = 594
      Top = 60
      Width = 48
      Height = 12
      Hint = '<应付额>=<税额>+<进料总额>'
      Caption = '应付总额'
      FocusControl = DBEdit2
    end
    inherited DBEdit1: TDBEdit
      Left = 75
      Width = 111
      Color = clInfoBk
      DataField = 'F01'
      ReadOnly = True
    end
    object DBDateEdit1: TDBDateEdit
      Left = 234
      Top = 7
      Width = 128
      Height = 21
      DataField = 'F02'
      DataSource = DataSource1
      NumGlyphs = 2
      TabOrder = 1
      OnExit = DBDateEdit1Exit
    end
    object DBEdit6: TDBEdit
      Left = 234
      Top = 56
      Width = 128
      Height = 20
      DataField = 'F07'
      DataSource = DataSource1
      TabOrder = 8
    end
    object DBEdit10: TDBEdit
      Left = 440
      Top = 8
      Width = 128
      Height = 20
      DataField = 'F12'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit11: TDBEdit
      Left = 75
      Top = 81
      Width = 707
      Height = 20
      DataField = 'F11'
      DataSource = DataSource1
      TabOrder = 10
    end
    object DBEdit8: TDBEdit
      Left = 648
      Top = 8
      Width = 134
      Height = 20
      Color = clInfoBk
      DataField = 'DSum'
      DataSource = DataSource3
      ReadOnly = True
      TabOrder = 6
    end
    object DBComboBox1: TDBComboBox
      Left = 75
      Top = 56
      Width = 112
      Height = 20
      DataField = 'F06'
      DataSource = DataSource1
      ItemHeight = 12
      Items.Strings = (
        '免税'
        '外加'
        '内含')
      TabOrder = 7
    end
    object DBEdit5: TDBEdit
      Left = 440
      Top = 56
      Width = 128
      Height = 20
      Hint = '免税 = 0; 外加 = 内含 = <明细总额> * <税率>'
      Color = clInfoBk
      DataField = 'CalF08'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 648
      Top = 32
      Width = 134
      Height = 20
      Hint = '免税 = 外加 = <明细总额> ; 内含 = <明细总额>-<税额>'
      Color = clInfoBk
      DataField = 'CalF10'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 9
    end
    object RxDBComboEdit2: TRxDBComboEdit
      Left = 75
      Top = 32
      Width = 112
      Height = 21
      DataField = 'F03'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = RxDBComboEdit2ButtonClick
      OnExit = DBDateEdit1Exit
    end
    object RxDBComboEdit3: TRxDBComboEdit
      Left = 440
      Top = 31
      Width = 128
      Height = 21
      DataField = 'F04'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = RxDBComboEdit3ButtonClick
    end
    object DBEdit2: TDBEdit
      Left = 648
      Top = 56
      Width = 134
      Height = 20
      Color = clInfoBk
      DataField = 'CalPay'
      DataSource = DataSource1
      TabOrder = 11
    end
    object DBEdit4: TDBEdit
      Left = 198
      Top = 33
      Width = 164
      Height = 20
      Color = clInfoBk
      DataField = 'lkF03'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 12
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
    Top = 547
    Height = 26
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Top = 152
    Height = 395
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
        Width = 22
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'F06'
        PickList.Strings = ()
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -12
        Title.Font.Name = '宋体'
        Title.Font.Style = []
        Width = 69
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'F10'
        PickList.Strings = ()
        ReadOnly = True
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = '宋体'
        Title.Font.Style = []
        Width = 68
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF01'
        PickList.Strings = ()
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 64
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF02'
        PickList.Strings = ()
        ReadOnly = True
        Width = 103
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF03'
        PickList.Strings = ()
        ReadOnly = True
        Width = 93
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF04'
        PickList.Strings = ()
        ReadOnly = True
        Width = 100
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF05'
        PickList.Strings = ()
        ReadOnly = True
        Visible = False
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF07'
        PickList.Strings = ()
        ReadOnly = True
        Title.Alignment = taRightJustify
        Width = 44
        Visible = True
      end
      item
        Color = clBtnHighlight
        Expanded = False
        FieldName = 'F20'
        PickList.Strings = ()
        Title.Alignment = taRightJustify
        Width = 45
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
        Width = 41
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
        Width = 40
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'CalF05'
        PickList.Strings = ()
        Title.Alignment = taRightJustify
        Width = 69
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'F07'
        PickList.Strings = ()
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -12
        Title.Font.Name = '宋体'
        Title.Font.Style = []
        Width = 72
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Top = 152
    Height = 395
    inherited DBVertNavigator1: TDBVertNavigator
      Height = 393
    end
  end
  inherited Qry1: TQuery
    Left = 479
    Top = 192
  end
  inherited Table1: TTable
    BeforeInsert = Table1BeforeInsert
    OnCalcFields = Table1CalcFields
    TableName = 'dbo.T2151'
    Top = 232
    object Table1F01: TStringField
      DisplayLabel = '入库单号'
      FieldName = 'F01'
      FixedChar = True
      Size = 12
    end
    object Table1F02: TDateTimeField
      DisplayLabel = '入库日期'
      FieldName = 'F02'
    end
    object Table1F03: TStringField
      DisplayLabel = '委外厂商'
      FieldName = 'F03'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table1F04: TStringField
      DisplayLabel = '币别'
      FieldName = 'F04'
      FixedChar = True
      Size = 8
    end
    object Table1F11: TStringField
      DisplayLabel = '备   注'
      FieldName = 'F11'
      Size = 100
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
      DisplayLabel = '明细总额'
      FieldName = 'F09'
    end
    object Table1F10: TFloatField
      DisplayLabel = '进料总额'
      FieldName = 'F10'
    end
    object Table1F12: TStringField
      DisplayLabel = '帐款年月'
      FieldName = 'F12'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 4
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
    object Table1CalPay: TFloatField
      DisplayLabel = '应付额'
      FieldKind = fkCalculated
      FieldName = 'CalPay'
      Calculated = True
    end
    object Table1lkF03: TStringField
      FieldKind = fkLookup
      FieldName = 'lkF03'
      LookupDataSet = DM.Q_T1030
      LookupKeyFields = 'F01'
      LookupResultField = 'F03'
      KeyFields = 'F03'
      Lookup = True
    end
  end
  inherited Table2: TTable
    AfterScroll = Table2AfterScroll
    OnCalcFields = Table2CalcFields
    IndexFieldNames = 'F01;D_SN'
    MasterFields = 'F01'
    TableName = 'dbo.T2151A'
    Left = 464
    object Table2F01: TStringField
      DisplayLabel = '单号'
      DisplayWidth = 9
      FieldName = 'F01'
      FixedChar = True
      Size = 12
    end
    object Table2K_SN: TIntegerField
      DisplayLabel = '键值项'
      DisplayWidth = 10
      FieldName = 'K_SN'
    end
    object Table2D_SN: TSmallintField
      DisplayLabel = '项'
      DisplayWidth = 10
      FieldName = 'D_SN'
      Required = True
    end
    object Table2F06: TStringField
      DisplayLabel = '制令单号'
      FieldName = 'F06'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 12
    end
    object Table2F02: TIntegerField
      DisplayLabel = '编号'
      DisplayWidth = 10
      FieldName = 'F02'
      OnValidate = RequiredValue
    end
    object Table2Buser: TStringField
      DisplayLabel = '建档人'
      DisplayWidth = 10
      FieldName = 'Buser'
      FixedChar = True
      Size = 10
    end
    object Table2Btime: TDateTimeField
      DisplayLabel = '建档时间'
      DisplayWidth = 18
      FieldName = 'Btime'
    end
    object Table2Etime: TDateTimeField
      DisplayLabel = '修改时间'
      DisplayWidth = 18
      FieldName = 'Etime'
    end
    object Table2Euser: TStringField
      DisplayLabel = '修改人'
      DisplayWidth = 10
      FieldName = 'Euser'
      FixedChar = True
      Size = 10
    end
    object Table2F03: TFloatField
      DisplayLabel = '数量'
      DisplayWidth = 10
      FieldName = 'F03'
      OnChange = Table2F03Change
      OnValidate = RequiredValue
    end
    object Table2F04: TFloatField
      DisplayLabel = '单价'
      FieldName = 'F04'
      OnValidate = RequiredValue
    end
    object Table2F05: TFloatField
      DisplayLabel = '金额'
      FieldName = 'F05'
    end
    object Table2F07: TStringField
      DisplayLabel = '领料单号'
      FieldName = 'F07'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 12
    end
    object Table2F08: TStringField
      DisplayLabel = '领料原料编号'
      FieldName = 'F08'
      FixedChar = True
      Size = 8
    end
    object Table2F09: TIntegerField
      DisplayLabel = '领料半成品编号'
      FieldName = 'F09'
    end
    object Table2CalF05: TFloatField
      DisplayLabel = '总额'
      FieldKind = fkCalculated
      FieldName = 'CalF05'
      Calculated = True
    end
    object Table2CalF07: TFloatField
      DisplayLabel = '重量'
      FieldKind = fkCalculated
      FieldName = 'CalF07'
      Calculated = True
    end
    object Table2F10: TStringField
      DisplayLabel = '订单单号'
      FieldName = 'F10'
      FixedChar = True
      Size = 12
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
      DisplayLabel = '重量'
      FieldName = 'F20'
      OnChange = Table2F20Change
    end
  end
  object DSum: TQuery
    DatabaseName = 'STK0311'
    DataSource = DataSource1
    SQL.Strings = (
      'select F01,sum(F05) as DSum from T2151A '
      'Where F01=:F01'
      'Group by F01')
    Left = 168
    Top = 272
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'F01'
        ParamType = ptUnknown
      end>
    object DSumDSum: TFloatField
      FieldName = 'DSum'
      Origin = 'STK0311.T2150A.F05'
    end
  end
  object DataSource3: TDataSource
    DataSet = DSum
    Left = 128
    Top = 272
  end
end
