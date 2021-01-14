inherited FM_2110: TFM_2110
  Left = 62
  Top = 131
  Hint = '半成品内制领(退)料单'
  Caption = '半成品内制领(退)料单'
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
      Left = 180
      Top = 13
      Width = 24
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
      Left = 338
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
      Left = 487
      Top = 13
      Width = 36
      Height = 12
      Caption = '领料人'
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
      Left = 618
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
      Left = 49
      Top = 9
      Color = clInfoBk
      DataField = 'F01'
      ReadOnly = True
    end
    object DBEdit4: TDBEdit
      Left = 388
      Top = 9
      Width = 88
      Height = 20
      DataField = 'F03'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit6: TDBEdit
      Left = 49
      Top = 37
      Width = 677
      Height = 20
      DataField = 'F11'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBDateEdit1: TDBDateEdit
      Left = 208
      Top = 9
      Width = 121
      Height = 21
      DataField = 'F02'
      DataSource = DataSource1
      Enabled = False
      NumGlyphs = 2
      TabOrder = 1
    end
    object DBComboBox1: TDBComboBox
      Left = 656
      Top = 9
      Width = 71
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
      Left = 527
      Top = 9
      Width = 81
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
    Width = 844
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
        FieldName = 'F06'
        PickList.Strings = ()
        Width = 79
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'lkF01'
        PickList.Strings = ()
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -12
        Title.Font.Name = '宋体'
        Title.Font.Style = []
        Width = 88
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF02'
        PickList.Strings = ()
        ReadOnly = True
        Width = 123
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF03'
        PickList.Strings = ()
        ReadOnly = True
        Width = 135
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF04'
        PickList.Strings = ()
        ReadOnly = True
        Width = 139
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
        Width = 63
        Visible = True
      end
      item
        Color = clBtnHighlight
        Expanded = False
        FieldName = 'F20'
        PickList.Strings = ()
        Title.Alignment = taRightJustify
        Width = 71
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Left = 844
    Top = 111
    Width = 28
    Height = 432
    inherited DBVertNavigator1: TDBVertNavigator
      Width = 26
      Height = 430
    end
  end
  inherited Qry1: TQuery
    Left = 495
    Top = 160
  end
  inherited Table1: TTable
    BeforeInsert = Table1BeforeInsert
    TableName = 'dbo.T2110'
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
    TableName = 'dbo.T2110A'
    object Table2K_SN: TIntegerField
      DisplayLabel = '项(键值)'
      FieldName = 'K_SN'
    end
    object Table2F01: TStringField
      DisplayLabel = '单号'
      FieldName = 'F01'
      Required = True
      FixedChar = True
      Size = 12
    end
    object Table2D_SN: TSmallintField
      DisplayLabel = '项'
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
      FieldName = 'F02'
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
    object Table2Etime: TDateTimeField
      DisplayLabel = '修改时间'
      FieldName = 'Etime'
    end
    object Table2Euser: TStringField
      DisplayLabel = '修改人'
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
    object Table2F03: TFloatField
      DisplayLabel = '数量'
      FieldName = 'F03'
      OnChange = Table2F03Change
      OnValidate = RequiredValue
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
