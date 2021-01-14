inherited FM_2100: TFM_2100
  Left = 172
  Top = 119
  Hint = '物料领(退)料单'
  Caption = '物料领(退)料单'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 67
    object Label1: TLabel [0]
      Left = 19
      Top = 13
      Width = 24
      Height = 12
      Caption = '单号'
    end
    object Label2: TLabel [1]
      Left = 147
      Top = 13
      Width = 25
      Height = 12
      Caption = '日期'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel [2]
      Left = 272
      Top = 13
      Width = 48
      Height = 12
      Caption = '领料机台'
      FocusControl = DBEdit4
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel [3]
      Left = 401
      Top = 13
      Width = 60
      Height = 12
      Caption = '领(退)料人'
    end
    object Label5: TLabel [4]
      Left = 19
      Top = 41
      Width = 24
      Height = 12
      Caption = '备注'
      FocusControl = DBEdit6
    end
    object Label6: TLabel [5]
      Left = 566
      Top = 13
      Width = 36
      Height = 12
      Caption = '领退别'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    inherited DBEdit1: TDBEdit
      Left = 48
      Top = 9
      Width = 94
      Color = clInfoBk
      DataField = 'F01'
      ReadOnly = True
    end
    object DBEdit4: TDBEdit
      Left = 323
      Top = 9
      Width = 74
      Height = 20
      DataField = 'F03'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit6: TDBEdit
      Left = 48
      Top = 37
      Width = 611
      Height = 20
      DataField = 'F11'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBDateEdit1: TDBDateEdit
      Left = 175
      Top = 9
      Width = 93
      Height = 21
      DataField = 'F02'
      DataSource = DataSource1
      Enabled = False
      NumGlyphs = 2
      TabOrder = 1
    end
    object DBComboBox1: TDBComboBox
      Left = 606
      Top = 9
      Width = 54
      Height = 20
      Style = csDropDownList
      DataField = 'F13'
      DataSource = DataSource1
      Enabled = False
      ItemHeight = 12
      Items.Strings = (
        '领'
        '退')
      TabOrder = 4
    end
    object RxDBComboEdit1: TRxDBComboEdit
      Left = 465
      Top = 9
      Width = 95
      Height = 21
      DataField = 'F04'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 17
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = RxDBComboEdit1ButtonClick
    end
  end
  inherited ToolBar1: TToolBar
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
    Top = 111
    Width = 839
    Height = 432
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
        PickList.Strings = ()
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -12
        Title.Font.Name = '宋体'
        Title.Font.Style = []
        Width = 102
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkPName'
        PickList.Strings = ()
        ReadOnly = True
        Width = 160
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkPSpce'
        PickList.Strings = ()
        ReadOnly = True
        Width = 172
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkPUnit'
        PickList.Strings = ()
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 78
        Visible = True
      end
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'F03'
        PickList.Strings = ()
        Title.Alignment = taRightJustify
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -12
        Title.Font.Name = '宋体'
        Title.Font.Style = []
        Width = 103
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Left = 839
    Top = 111
    Width = 33
    Height = 432
    inherited DBVertNavigator1: TDBVertNavigator
      Width = 31
      Height = 430
    end
  end
  inherited Qry1: TQuery
    Left = 495
    Top = 160
  end
  inherited Table1: TTable
    BeforeInsert = Table1BeforeInsert
    TableName = 'dbo.T2100'
    object Table1F01: TStringField
      DisplayLabel = '半成品领退单号'
      FieldName = 'F01'
      FixedChar = True
      Size = 12
    end
    object Table1F02: TDateTimeField
      DisplayLabel = '领退日期'
      FieldName = 'F02'
      OnValidate = RequiredValue
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
      FixedChar = True
      Size = 8
    end
    object Table1F11: TStringField
      DisplayLabel = '备注'
      FieldName = 'F11'
      Size = 100
    end
    object Table1F13: TStringField
      DisplayLabel = '领退别'
      FieldName = 'F13'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 2
    end
    object Table1Buser: TStringField
      DisplayLabel = '建档人 '
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
    IndexFieldNames = 'F01;D_SN'
    MasterFields = 'F01'
    TableName = 'dbo.T2100A'
    object Table2F01: TStringField
      DisplayLabel = '单号'
      FieldName = 'F01'
      Required = True
      FixedChar = True
      Size = 12
    end
    object Table2K_SN: TIntegerField
      DisplayLabel = '项(键值)'
      FieldName = 'K_SN'
    end
    object Table2D_SN: TSmallintField
      DisplayLabel = '项'
      FieldName = 'D_SN'
      Required = True
    end
    object Table2F02: TStringField
      DisplayLabel = '物料编号'
      FieldName = 'F02'
      OnValidate = Table2F02Validate
      FixedChar = True
      Size = 8
    end
    object Table2F03: TFloatField
      DisplayLabel = '数量'
      FieldName = 'F03'
      OnValidate = RequiredValue
    end
    object Table2Buser: TStringField
      DisplayLabel = '建档人'
      FieldName = 'Buser'
      FixedChar = True
      Size = 10
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
    object Table2lkPName: TStringField
      DisplayLabel = '品名'
      FieldKind = fkLookup
      FieldName = 'lkPName'
      LookupDataSet = DM.Q_T1060
      LookupKeyFields = 'F01'
      LookupResultField = 'F02'
      KeyFields = 'F02'
      Size = 40
      Lookup = True
    end
    object Table2lkPSpce: TStringField
      DisplayLabel = '规格'
      FieldKind = fkLookup
      FieldName = 'lkPSpce'
      LookupDataSet = DM.Q_T1060
      LookupKeyFields = 'F01'
      LookupResultField = 'F03'
      KeyFields = 'F02'
      Size = 40
      Lookup = True
    end
    object Table2lkPUnit: TStringField
      DisplayLabel = '单位'
      FieldKind = fkLookup
      FieldName = 'lkPUnit'
      LookupDataSet = DM.Q_T1060
      LookupKeyFields = 'F01'
      LookupResultField = 'F09'
      KeyFields = 'F02'
      Size = 6
      Lookup = True
    end
  end
end
