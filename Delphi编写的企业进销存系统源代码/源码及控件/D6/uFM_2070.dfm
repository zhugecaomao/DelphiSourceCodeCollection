inherited FM_2070: TFM_2070
  Left = 158
  Top = 130
  Hint = '客户来料入(退)库单'
  Caption = '客户来料入(退)库单'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 82
    object Label1: TLabel [0]
      Left = 20
      Top = 12
      Width = 48
      Height = 12
      Caption = '单    号'
    end
    object Label2: TLabel [1]
      Left = 179
      Top = 12
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
      Top = 35
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
      Left = 362
      Top = 35
      Width = 60
      Height = 12
      Caption = '送 料 厂商'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel [4]
      Left = 20
      Top = 57
      Width = 48
      Height = 12
      Caption = '备    注'
      FocusControl = DBEdit3
    end
    object Label6: TLabel [5]
      Left = 362
      Top = 12
      Width = 60
      Height = 12
      Caption = '入(退)库人'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel [6]
      Left = 534
      Top = 12
      Width = 48
      Height = 12
      Caption = '入 退 别'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    inherited DBEdit1: TDBEdit
      Left = 76
      Width = 97
      Color = clInfoBk
      DataField = 'F01'
      ReadOnly = True
    end
    object DBDateEdit1: TDBDateEdit
      Left = 214
      Top = 8
      Width = 101
      Height = 21
      DataField = 'F02'
      DataSource = DataSource1
      NumGlyphs = 2
      TabOrder = 1
    end
    object RxDBComboEdit1: TRxDBComboEdit
      Left = 426
      Top = 31
      Width = 103
      Height = 21
      DataField = 'F04'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 17
      NumGlyphs = 1
      TabOrder = 6
      OnButtonClick = RxDBComboEdit1ButtonClick
    end
    object DBEdit3: TDBEdit
      Left = 76
      Top = 54
      Width = 636
      Height = 20
      DataField = 'F11'
      DataSource = DataSource1
      TabOrder = 8
    end
    object RxDBComboEdit2: TRxDBComboEdit
      Left = 76
      Top = 31
      Width = 97
      Height = 21
      DataField = 'F03'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 17
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = RxDBComboEdit2ButtonClick
    end
    object RxDBComboEdit3: TRxDBComboEdit
      Left = 426
      Top = 8
      Width = 103
      Height = 21
      DataField = 'F12'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 17
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = RxDBComboEdit3ButtonClick
    end
    object DBComboBox1: TDBComboBox
      Left = 586
      Top = 8
      Width = 127
      Height = 20
      Style = csDropDownList
      DataField = 'F13'
      DataSource = DataSource1
      ItemHeight = 12
      Items.Strings = (
        '入'
        '退')
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 179
      Top = 31
      Width = 172
      Height = 20
      Color = clInfoBk
      DataField = 'lkF03'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit4: TDBEdit
      Left = 535
      Top = 31
      Width = 177
      Height = 20
      Color = clInfoBk
      DataField = 'lkF04'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 7
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
    Top = 545
    Height = 28
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Top = 126
    Width = 842
    Height = 419
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
        Color = clBtnHighlight
        Expanded = False
        FieldName = 'lkF01'
        PickList.Strings = ()
        ReadOnly = True
        Title.Font.Charset = GB2312_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -12
        Title.Font.Name = '宋体'
        Title.Font.Style = []
        Width = 83
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
        Width = 122
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'lkF04'
        PickList.Strings = ()
        ReadOnly = True
        Width = 127
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
        Width = 67
        Visible = True
      end
      item
        Color = clBtnHighlight
        Expanded = False
        FieldName = 'F20'
        PickList.Strings = ()
        Title.Alignment = taRightJustify
        Width = 76
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Left = 842
    Top = 126
    Width = 30
    Height = 419
    inherited DBVertNavigator1: TDBVertNavigator
      Width = 28
      Height = 417
    end
  end
  inherited Qry1: TQuery
    Left = 455
    Top = 176
  end
  inherited Table1: TTable
    BeforeInsert = Table1BeforeInsert
    TableName = 'dbo.T2070'
    Left = 456
    object Table1F01: TStringField
      DisplayLabel = '入退单号'
      FieldName = 'F01'
      FixedChar = True
      Size = 12
    end
    object Table1F02: TDateTimeField
      DisplayLabel = '入退日期'
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
      DisplayLabel = '送料客户'
      FieldName = 'F04'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table1F11: TStringField
      DisplayLabel = '备注'
      FieldName = 'F11'
      Size = 100
    end
    object Table1F12: TStringField
      DisplayLabel = '入退库人'
      FieldName = 'F12'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table1F13: TStringField
      DisplayLabel = '入退别'
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
    object Table1lkF04: TStringField
      DisplayLabel = '客户简称'
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'lkF04'
      LookupDataSet = DM.Q_T1011
      LookupKeyFields = 'F01'
      LookupResultField = 'F03'
      KeyFields = 'F04'
      Size = 12
      Lookup = True
    end
    object Table1lkF03: TStringField
      FieldKind = fkLookup
      FieldName = 'lkF03'
      LookupDataSet = DM.Q_T1010
      LookupKeyFields = 'F01'
      LookupResultField = 'F03'
      KeyFields = 'F03'
      Size = 12
      Lookup = True
    end
  end
  inherited Table2: TTable
    AfterScroll = Table2AfterScroll
    IndexFieldNames = 'F01;D_SN'
    MasterFields = 'F01'
    TableName = 'dbo.T2070A'
    object Table2F01: TStringField
      DisplayLabel = '单号'
      DisplayWidth = 9
      FieldName = 'F01'
      FixedChar = True
      Size = 12
    end
    object Table2F02: TIntegerField
      DisplayLabel = '来料编号'
      DisplayWidth = 10
      FieldName = 'F02'
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
