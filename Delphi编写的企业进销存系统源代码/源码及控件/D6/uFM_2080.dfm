inherited FM_2080: TFM_2080
  Left = 34
  Top = 123
  Hint = '客户来料内制领(退)料单'
  Caption = '客户来料内制领(退)料单'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 81
    object Label1: TLabel [0]
      Left = 17
      Top = 12
      Width = 48
      Height = 12
      Caption = '单    号'
    end
    object Label2: TLabel [1]
      Left = 173
      Top = 12
      Width = 36
      Height = 12
      Caption = '日  期'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel [2]
      Left = 17
      Top = 36
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
    object Label4: TLabel [3]
      Left = 367
      Top = 36
      Width = 48
      Height = 12
      Caption = '送料厂商'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel [4]
      Left = 17
      Top = 60
      Width = 48
      Height = 12
      Caption = '备    注'
      FocusControl = DBEdit3
    end
    object Label6: TLabel [5]
      Left = 356
      Top = 12
      Width = 60
      Height = 12
      Caption = '领(退)料人'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel [6]
      Left = 535
      Top = 12
      Width = 48
      Height = 12
      Caption = '领 退 别'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel [7]
      Left = 535
      Top = 60
      Width = 48
      Height = 12
      Caption = '领料机台'
      FocusControl = DBEdit2
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    inherited DBEdit1: TDBEdit
      Left = 71
      Width = 98
      Color = clInfoBk
      DataField = 'F01'
      ReadOnly = True
    end
    object DBDateEdit1: TDBDateEdit
      Left = 217
      Top = 8
      Width = 130
      Height = 21
      DataField = 'F02'
      DataSource = DataSource1
      NumGlyphs = 2
      TabOrder = 1
    end
    object RxDBComboEdit1: TRxDBComboEdit
      Left = 422
      Top = 32
      Width = 107
      Height = 21
      DataField = 'F06'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 17
      NumGlyphs = 1
      TabOrder = 6
      OnButtonClick = RxDBComboEdit1ButtonClick
    end
    object DBEdit3: TDBEdit
      Left = 71
      Top = 56
      Width = 456
      Height = 20
      DataField = 'F11'
      DataSource = DataSource1
      TabOrder = 8
    end
    object RxDBComboEdit2: TRxDBComboEdit
      Left = 71
      Top = 32
      Width = 98
      Height = 21
      DataField = 'F05'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 17
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = RxDBComboEdit2ButtonClick
    end
    object RxDBComboEdit3: TRxDBComboEdit
      Left = 422
      Top = 8
      Width = 107
      Height = 21
      DataField = 'F04'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 17
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = RxDBComboEdit3ButtonClick
    end
    object DBComboBox1: TDBComboBox
      Left = 588
      Top = 7
      Width = 114
      Height = 20
      Style = csDropDownList
      DataField = 'F13'
      DataSource = DataSource1
      ItemHeight = 12
      Items.Strings = (
        '领'
        '退')
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 588
      Top = 56
      Width = 114
      Height = 20
      DataField = 'F03'
      DataSource = DataSource1
      TabOrder = 9
    end
    object DBEdit4: TDBEdit
      Left = 534
      Top = 32
      Width = 168
      Height = 20
      Color = clInfoBk
      DataField = 'lkF04'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit5: TDBEdit
      Left = 173
      Top = 32
      Width = 173
      Height = 20
      Color = clInfoBk
      DataField = 'lkF03'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 5
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
    Top = 545
    Height = 28
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Top = 125
    Width = 842
    Height = 420
    OnEditButtonClick = DBGrid1EditButtonClick
    Columns = <
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'D_SN'
        PickList.Strings = ()
        ReadOnly = True
        Width = 23
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'F06'
        PickList.Strings = ()
        Width = 77
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
        Width = 85
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF02'
        PickList.Strings = ()
        ReadOnly = True
        Width = 118
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF03'
        PickList.Strings = ()
        ReadOnly = True
        Width = 111
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF04'
        PickList.Strings = ()
        ReadOnly = True
        Width = 123
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
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = '新细明体'
        Font.Style = []
        PickList.Strings = ()
        Title.Alignment = taRightJustify
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -12
        Title.Font.Name = '宋体'
        Title.Font.Style = []
        Width = 80
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF07'
        PickList.Strings = ()
        ReadOnly = True
        Title.Alignment = taRightJustify
        Width = 63
        Visible = True
      end
      item
        Color = clBtnHighlight
        Expanded = False
        FieldName = 'F20'
        PickList.Strings = ()
        Title.Alignment = taRightJustify
        Width = 80
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Left = 842
    Top = 125
    Width = 30
    Height = 420
    inherited DBVertNavigator1: TDBVertNavigator
      Width = 28
      Height = 418
    end
  end
  inherited Qry1: TQuery
    Left = 463
    Top = 176
  end
  inherited Table1: TTable
    BeforeInsert = Table1BeforeInsert
    TableName = 'dbo.T2080'
    Left = 464
    object Table1F01: TStringField
      DisplayLabel = '领退单号'
      FieldName = 'F01'
      FixedChar = True
      Size = 12
    end
    object Table1F02: TDateTimeField
      DisplayLabel = '领退日期'
      FieldName = 'F02'
    end
    object Table1F03: TStringField
      DisplayLabel = '领料机台'
      FieldName = 'F03'
      FixedChar = True
      Size = 2
    end
    object Table1F04: TStringField
      DisplayLabel = '领料人'
      FieldName = 'F04'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table1F05: TStringField
      DisplayLabel = '客户编号'
      FieldName = 'F05'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table1F06: TStringField
      DisplayLabel = '送料客户'
      FieldName = 'F06'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table1F11: TStringField
      DisplayLabel = '备   注'
      FieldName = 'F11'
      Size = 100
    end
    object Table1F13: TStringField
      DisplayLabel = '领 退 别'
      FieldName = 'F13'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 2
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
      DisplayLabel = '客户简称'
      FieldKind = fkLookup
      FieldName = 'lkF03'
      LookupDataSet = DM.Q_T1010
      LookupKeyFields = 'F01'
      LookupResultField = 'F03'
      KeyFields = 'F05'
      Size = 12
      Lookup = True
    end
    object Table1lkF04: TStringField
      DisplayLabel = '客户简称'
      FieldKind = fkLookup
      FieldName = 'lkF04'
      LookupDataSet = DM.Q_T1011
      LookupKeyFields = 'F01'
      LookupResultField = 'F03'
      KeyFields = 'F06'
      Size = 12
      Lookup = True
    end
  end
  inherited Table2: TTable
    AfterScroll = Table2AfterScroll
    IndexFieldNames = 'F01;D_SN'
    MasterFields = 'F01'
    TableName = 'dbo.T2080A'
    Left = 464
    object Table2F01: TStringField
      DisplayLabel = '单号'
      DisplayWidth = 9
      FieldName = 'F01'
      Required = True
      FixedChar = True
      Size = 12
    end
    object Table2F02: TIntegerField
      DisplayLabel = '来料编号'
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
    object Table2F06: TStringField
      DisplayLabel = '制令单号'
      FieldName = 'F06'
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
      LookupDataSet = DM.Q_T1090
      LookupKeyFields = 'AutoNo'
      LookupResultField = 'F01'
      KeyFields = 'F02'
      OnValidate = RequiredValue
      Size = 4
      Lookup = True
    end
    object Table2Buser: TStringField
      DisplayLabel = '建档人'
      DisplayWidth = 10
      FieldName = 'Buser'
      FixedChar = True
      Size = 10
    end
    object Table2Etime: TDateTimeField
      DisplayLabel = '修改时间'
      DisplayWidth = 18
      FieldName = 'Etime'
    end
    object Table2Btime: TDateTimeField
      DisplayLabel = '建档时间'
      DisplayWidth = 18
      FieldName = 'Btime'
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
      Size = 5
      Lookup = True
    end
    object Table2lkF07: TFloatField
      DisplayLabel = '单重'
      FieldKind = fkLookup
      FieldName = 'lkF07'
      LookupDataSet = DM.Q_T1090
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
end
