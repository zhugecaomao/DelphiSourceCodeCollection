inherited FM_2090: TFM_2090
  Left = 109
  Top = 154
  Hint = '原料内制领(退)料单'
  Caption = '原料内制领(退)料单'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 67
    object Label1: TLabel [0]
      Left = 20
      Top = 13
      Width = 24
      Height = 12
      Caption = '单号'
    end
    object Label2: TLabel [1]
      Left = 162
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
      Left = 304
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
      Left = 419
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
      Left = 548
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
      Width = 109
      Color = clInfoBk
      DataField = 'F01'
      ReadOnly = True
    end
    object DBEdit4: TDBEdit
      Left = 356
      Top = 9
      Width = 54
      Height = 20
      DataField = 'F03'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit6: TDBEdit
      Left = 48
      Top = 37
      Width = 606
      Height = 20
      DataField = 'F11'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBDateEdit1: TDBDateEdit
      Left = 189
      Top = 9
      Width = 108
      Height = 21
      DataField = 'F02'
      DataSource = DataSource1
      Enabled = False
      NumGlyphs = 2
      TabOrder = 1
    end
    object DBComboBox1: TDBComboBox
      Left = 586
      Top = 9
      Width = 69
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
      Left = 460
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
    Top = 545
    Height = 28
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Top = 111
    Width = 842
    Height = 434
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
        Width = 27
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'F06'
        PickList.Strings = ()
        Width = 93
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
        Width = 99
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkPName'
        PickList.Strings = ()
        ReadOnly = True
        Width = 151
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkPSpec'
        PickList.Strings = ()
        ReadOnly = True
        Width = 170
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
        Width = 94
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Left = 842
    Top = 111
    Width = 30
    Height = 434
    inherited DBVertNavigator1: TDBVertNavigator
      Width = 28
      Height = 432
    end
  end
  inherited Qry1: TQuery
    Left = 495
    Top = 160
  end
  inherited Table1: TTable
    BeforeInsert = Table1BeforeInsert
    TableName = 'dbo.T2090'
    object Table1F01: TStringField
      DisplayLabel = '原料领退单号'
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
    TableName = 'dbo.T2090A'
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
    object Table2F06: TStringField
      DisplayLabel = '制令单号'
      FieldName = 'F06'
      FixedChar = True
      Size = 12
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
  end
end
