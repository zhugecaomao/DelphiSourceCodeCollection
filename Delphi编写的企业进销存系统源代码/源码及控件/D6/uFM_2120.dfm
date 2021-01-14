inherited FM_2120: TFM_2120
  Left = 143
  Top = 117
  Hint = '半成品内制入库'
  Caption = '半成品入库'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 38
    object Label1: TLabel [0]
      Left = 19
      Top = 13
      Width = 48
      Height = 12
      Caption = '入库单号'
    end
    object Label2: TLabel [1]
      Left = 194
      Top = 13
      Width = 42
      Height = 12
      Caption = '日   期'
    end
    object Label3: TLabel [2]
      Left = 553
      Top = 13
      Width = 48
      Height = 12
      Caption = '生产机台'
      FocusControl = DBEdit3
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel [3]
      Left = 375
      Top = 13
      Width = 36
      Height = 12
      Caption = '入库人'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    inherited DBEdit1: TDBEdit
      Left = 73
      Top = 9
      Width = 102
      Color = clInfoBk
      DataField = 'F01'
      ReadOnly = True
    end
    object DBEdit3: TDBEdit
      Left = 606
      Top = 9
      Width = 109
      Height = 20
      DataField = 'F03'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBDateEdit1: TDBDateEdit
      Left = 242
      Top = 9
      Width = 111
      Height = 21
      DataField = 'F02'
      DataSource = DataSource1
      NumGlyphs = 2
      TabOrder = 1
    end
    object RxDBComboEdit1: TRxDBComboEdit
      Left = 419
      Top = 9
      Width = 107
      Height = 21
      DataField = 'F04'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 18
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = RxDBComboEdit1ButtonClick
    end
  end
  inherited ToolBar1: TToolBar
    inherited SB1: TSpeedButton
      Width = 47
    end
    inherited SB2: TSpeedButton
      Left = 461
      Width = 47
      Visible = True
    end
    inherited SB3: TSpeedButton
      Left = 508
      Width = 47
      Visible = True
    end
    inherited SB0: TSpeedButton
      Left = 555
    end
    inherited SB4: TSpeedButton
      Left = 559
    end
    inherited SB6: TSpeedButton
      Left = 563
    end
  end
  inherited Panel3: TPanel
    Top = 544
    Height = 29
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Top = 82
    Width = 842
    Height = 462
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
        FieldName = 'F06'
        PickList.Strings = ()
        Width = 81
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
        Width = 89
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF02'
        PickList.Strings = ()
        ReadOnly = True
        Width = 125
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF03'
        PickList.Strings = ()
        ReadOnly = True
        Width = 128
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF04'
        PickList.Strings = ()
        ReadOnly = True
        Width = 144
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
        Width = 72
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF07'
        PickList.Strings = ()
        ReadOnly = True
        Title.Alignment = taRightJustify
        Width = 60
        Visible = True
      end
      item
        Color = clBtnHighlight
        Expanded = False
        FieldName = 'F20'
        PickList.Strings = ()
        Title.Alignment = taRightJustify
        Width = 73
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Left = 842
    Top = 82
    Width = 30
    Height = 462
    inherited DBVertNavigator1: TDBVertNavigator
      Width = 28
      Height = 460
    end
  end
  inherited Qry1: TQuery
    Left = 495
    Top = 136
  end
  inherited Table1: TTable
    BeforeInsert = Table1BeforeInsert
    TableName = 'dbo.T2120'
    object Table1F01: TStringField
      DisplayLabel = '半成品入库单号'
      FieldName = 'F01'
      FixedChar = True
      Size = 12
    end
    object Table1F02: TDateTimeField
      DisplayLabel = '入库日期'
      FieldName = 'F02'
    end
    object Table1F03: TStringField
      DisplayLabel = '生产机台'
      FieldName = 'F03'
      FixedChar = True
      Size = 2
    end
    object Table1F04: TStringField
      DisplayLabel = '入库人'
      FieldName = 'F04'
      OnValidate = RequiredValue
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
  end
  inherited Table2: TTable
    AfterScroll = Table2AfterScroll
    OnCalcFields = Table2CalcFields
    IndexFieldNames = 'F01;D_SN'
    MasterFields = 'F01'
    TableName = 'dbo.T2120A'
    object Table2F01: TStringField
      DisplayLabel = '单号'
      DisplayWidth = 9
      FieldName = 'F01'
      Required = True
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
    object Table2lkF01: TStringField
      DisplayLabel = '型号'
      FieldKind = fkLookup
      FieldName = 'lkF01'
      LookupDataSet = DM.Q_T1070
      LookupKeyFields = 'AutoNo'
      LookupResultField = 'F01'
      KeyFields = 'F02'
      OnValidate = RequiredValue
      Size = 4
      Lookup = True
    end
    object Table2F02: TIntegerField
      DisplayLabel = '编号'
      DisplayWidth = 10
      FieldName = 'F02'
    end
    object Table2F03: TFloatField
      DisplayLabel = '数量'
      DisplayWidth = 10
      FieldName = 'F03'
      OnChange = Table2F03Change
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
    object Table2lkF02: TStringField
      DisplayLabel = '品名'
      FieldKind = fkLookup
      FieldName = 'lkF02'
      LookupDataSet = DM.Q_T1070
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
      LookupDataSet = DM.Q_T1070
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
      LookupDataSet = DM.Q_T1070
      LookupKeyFields = 'AutoNo'
      LookupResultField = 'F04'
      KeyFields = 'F02'
      Lookup = True
    end
    object Table2lkF05: TStringField
      DisplayLabel = '心孔'
      FieldKind = fkLookup
      FieldName = 'lkF05'
      LookupDataSet = DM.Q_T1070
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
      LookupDataSet = DM.Q_T1070
      LookupKeyFields = 'AutoNo'
      LookupResultField = 'F07'
      KeyFields = 'F02'
      Lookup = True
    end
    object Table2F06: TStringField
      DisplayLabel = '制令单号'
      FieldName = 'F06'
      FixedChar = True
      Size = 12
    end
    object Table2F20: TFloatField
      DisplayLabel = '重量'
      FieldName = 'F20'
      OnChange = Table2F20Change
    end
  end
end
