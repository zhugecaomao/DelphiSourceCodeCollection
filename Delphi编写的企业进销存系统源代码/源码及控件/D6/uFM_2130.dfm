inherited FM_2130: TFM_2130
  Left = 123
  Top = 115
  Hint = '原料委外领(退)料单'
  Caption = '原料委外领(退)料单'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 83
    object Label1: TLabel [0]
      Left = 20
      Top = 13
      Width = 48
      Height = 12
      Caption = '单    号'
    end
    object Label2: TLabel [1]
      Left = 211
      Top = 13
      Width = 48
      Height = 12
      Caption = '日    期'
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
    object Label4: TLabel [3]
      Left = 397
      Top = 13
      Width = 36
      Height = 12
      Caption = '领料人'
    end
    object Label5: TLabel [4]
      Left = 20
      Top = 62
      Width = 48
      Height = 12
      Caption = '备    注'
      FocusControl = DBEdit6
    end
    object Label6: TLabel [5]
      Left = 570
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
    object Label7: TLabel [6]
      Left = 212
      Top = 37
      Width = 48
      Height = 12
      Caption = '厂商名称'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    inherited DBEdit1: TDBEdit
      Left = 74
      Top = 9
      Color = clInfoBk
      DataField = 'F01'
      ReadOnly = True
    end
    object DBEdit6: TDBEdit
      Left = 74
      Top = 58
      Width = 628
      Height = 20
      DataField = 'F11'
      DataSource = DataSource1
      TabOrder = 6
    end
    object DBDateEdit1: TDBDateEdit
      Left = 267
      Top = 9
      Width = 112
      Height = 21
      DataField = 'F02'
      DataSource = DataSource1
      Enabled = False
      NumGlyphs = 2
      TabOrder = 1
    end
    object DBComboBox1: TDBComboBox
      Left = 613
      Top = 9
      Width = 89
      Height = 20
      Style = csDropDownList
      DataField = 'F13'
      DataSource = DataSource1
      Enabled = False
      ItemHeight = 12
      Items.Strings = (
        '领'
        '退')
      TabOrder = 3
    end
    object RxDBComboEdit1: TRxDBComboEdit
      Left = 439
      Top = 9
      Width = 114
      Height = 21
      DataField = 'F04'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 17
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = RxDBComboEdit1ButtonClick
    end
    object RxDBComboEdit2: TRxDBComboEdit
      Left = 74
      Top = 33
      Width = 121
      Height = 21
      DataField = 'F03'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 17
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = RxDBComboEdit2ButtonClick
    end
    object DBEdit2: TDBEdit
      Left = 267
      Top = 33
      Width = 435
      Height = 20
      Color = clInfoBk
      DataField = 'lkF02'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 5
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
      Width = 80
    end
  end
  inherited Panel3: TPanel
    Top = 544
    Height = 29
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Top = 127
    Width = 842
    Height = 417
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
        Width = 25
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'F06'
        PickList.Strings = ()
        Width = 85
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
        Width = 84
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkPName'
        PickList.Strings = ()
        ReadOnly = True
        Width = 145
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkPSpec'
        PickList.Strings = ()
        ReadOnly = True
        Width = 166
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
        Width = 85
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'F04'
        PickList.Strings = ()
        ReadOnly = True
        Title.Alignment = taRightJustify
        Width = 91
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Left = 842
    Top = 127
    Width = 30
    Height = 417
    inherited DBVertNavigator1: TDBVertNavigator
      Width = 28
      Height = 415
    end
  end
  inherited Qry1: TQuery
    Left = 495
    Top = 160
  end
  inherited Table1: TTable
    BeforeInsert = Table1BeforeInsert
    TableName = 'dbo.T2130'
    Left = 480
    Top = 208
    object Table1F01: TStringField
      DisplayLabel = '原料委外领(退)单号'
      FieldName = 'F01'
      FixedChar = True
      Size = 12
    end
    object Table1F02: TDateTimeField
      DisplayLabel = '领退日期'
      FieldName = 'F02'
      OnValidate = RequiredValue
    end
    object Table1lkF02: TStringField
      DisplayLabel = '厂商名称'
      FieldKind = fkLookup
      FieldName = 'lkF02'
      LookupDataSet = DM.Q_T1030
      LookupKeyFields = 'F01'
      LookupResultField = 'F02'
      KeyFields = 'F03'
      Size = 8
      Lookup = True
    end
    object Table1F03: TStringField
      DisplayLabel = '委外厂商'
      FieldName = 'F03'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
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
    TableName = 'dbo.T2130A'
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
      DisplayLabel = '原料编号'
      FieldName = 'F02'
      OnValidate = Table2F02Validate
      FixedChar = True
      Size = 8
    end
    object Table2F03: TFloatField
      DisplayLabel = '重量'
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
      LookupDataSet = DM.Q_T1050
      LookupKeyFields = 'F01'
      LookupResultField = 'F02'
      KeyFields = 'F02'
      Size = 12
      Lookup = True
    end
    object Table2lkPSpec: TStringField
      DisplayLabel = '规格'
      FieldKind = fkLookup
      FieldName = 'lkPSpec'
      LookupDataSet = DM.Q_T1050
      LookupKeyFields = 'F01'
      LookupResultField = 'F03'
      KeyFields = 'F02'
      Size = 14
      Lookup = True
    end
    object Table2F04: TFloatField
      DisplayLabel = '入库重量'
      FieldName = 'F04'
    end
    object Table2F06: TStringField
      DisplayLabel = '制令单号'
      FieldName = 'F06'
      FixedChar = True
      Size = 12
    end
  end
end
