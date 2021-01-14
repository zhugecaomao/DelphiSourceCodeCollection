inherited FM_1011: TFM_1011
  Left = 191
  Top = 135
  Width = 774
  Height = 516
  Hint = '协力厂商资料'
  Caption = '协力厂商基本资料'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 481
    Height = 445
    object Label4: TLabel [0]
      Left = 36
      Top = 71
      Width = 48
      Height = 12
      Caption = '负 责 人'
      FocusControl = DBEdit5
    end
    object Label5: TLabel [1]
      Left = 36
      Top = 95
      Width = 48
      Height = 12
      Caption = '电 话 一'
      FocusControl = DBEdit6
    end
    object Label6: TLabel [2]
      Left = 36
      Top = 118
      Width = 48
      Height = 12
      Caption = '电 话 二'
      FocusControl = DBEdit7
    end
    object Label7: TLabel [3]
      Left = 36
      Top = 142
      Width = 48
      Height = 12
      Caption = '传    真'
      FocusControl = DBEdit8
    end
    object Label8: TLabel [4]
      Left = 36
      Top = 190
      Width = 48
      Height = 12
      Caption = '地    址'
      FocusControl = DBEdit9
    end
    object Label9: TLabel [5]
      Left = 36
      Top = 166
      Width = 48
      Height = 12
      Caption = '邮递区号'
      FocusControl = DBEdit10
    end
    object Label10: TLabel [6]
      Left = 36
      Top = 214
      Width = 48
      Height = 12
      Caption = '电    邮'
      FocusControl = DBEdit11
    end
    object Label11: TLabel [7]
      Left = 12
      Top = 238
      Width = 72
      Height = 12
      Caption = '往来起始日期'
    end
    object Label12: TLabel [8]
      Left = 36
      Top = 261
      Width = 48
      Height = 12
      Caption = '送货地址'
      FocusControl = DBEdit12
    end
    object Label13: TLabel [9]
      Left = 36
      Top = 285
      Width = 48
      Height = 12
      Caption = '联 络 人'
      FocusControl = DBEdit13
    end
    object Label14: TLabel [10]
      Left = 36
      Top = 309
      Width = 48
      Height = 12
      Caption = '联络电话'
      FocusControl = DBEdit14
    end
    object Label15: TLabel [11]
      Left = 36
      Top = 333
      Width = 48
      Height = 12
      Caption = '手    机'
      FocusControl = DBEdit15
    end
    object Label1: TLabel [12]
      Left = 36
      Top = 23
      Width = 48
      Height = 12
      Caption = '厂商编号'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel [13]
      Left = 217
      Top = 23
      Width = 48
      Height = 12
      Caption = '厂商简称'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel [14]
      Left = 36
      Top = 47
      Width = 48
      Height = 12
      Caption = '厂商名称'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    inherited DBEdit1: TDBEdit
      Left = 91
      Top = 19
      DataField = 'F01'
    end
    object DBEdit3: TDBEdit
      Left = 91
      Top = 43
      Width = 372
      Height = 20
      DataField = 'F02'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 268
      Top = 19
      Width = 195
      Height = 20
      DataField = 'F03'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit5: TDBEdit
      Left = 91
      Top = 67
      Width = 372
      Height = 20
      DataField = 'F04'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 91
      Top = 91
      Width = 372
      Height = 20
      DataField = 'F05'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 91
      Top = 115
      Width = 372
      Height = 20
      DataField = 'F06'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 91
      Top = 139
      Width = 372
      Height = 20
      DataField = 'F07'
      DataSource = DataSource1
      TabOrder = 6
    end
    object DBEdit9: TDBEdit
      Left = 91
      Top = 186
      Width = 372
      Height = 20
      DataField = 'F08'
      DataSource = DataSource1
      TabOrder = 8
    end
    object DBEdit10: TDBEdit
      Left = 91
      Top = 163
      Width = 372
      Height = 20
      DataField = 'F09'
      DataSource = DataSource1
      TabOrder = 7
    end
    object DBEdit11: TDBEdit
      Left = 91
      Top = 210
      Width = 372
      Height = 20
      DataField = 'F10'
      DataSource = DataSource1
      TabOrder = 9
    end
    object DBEdit12: TDBEdit
      Left = 91
      Top = 258
      Width = 372
      Height = 20
      DataField = 'F12'
      DataSource = DataSource1
      TabOrder = 11
    end
    object DBEdit13: TDBEdit
      Left = 91
      Top = 282
      Width = 372
      Height = 20
      DataField = 'F13'
      DataSource = DataSource1
      TabOrder = 12
    end
    object DBEdit14: TDBEdit
      Left = 91
      Top = 306
      Width = 372
      Height = 20
      DataField = 'F14'
      DataSource = DataSource1
      TabOrder = 13
    end
    object DBEdit15: TDBEdit
      Left = 91
      Top = 330
      Width = 372
      Height = 20
      DataField = 'F15'
      DataSource = DataSource1
      TabOrder = 14
    end
    object DBDateEdit1: TDBDateEdit
      Left = 91
      Top = 234
      Width = 372
      Height = 20
      DataField = 'F11'
      DataSource = DataSource1
      ButtonWidth = 16
      NumGlyphs = 2
      TabOrder = 10
    end
  end
  inherited ToolBar1: TToolBar
    Width = 766
    inherited SB2: TSpeedButton
      Visible = True
    end
    inherited SB3: TSpeedButton
      Visible = True
    end
  end
  inherited DBGrid1: TDBGrid
    Left = 481
    Width = 285
    Height = 445
    Columns = <
      item
        Expanded = False
        FieldName = 'F01'
        PickList.Strings = ()
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F03'
        PickList.Strings = ()
        Title.Caption = '简称'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F05'
        PickList.Strings = ()
        Width = 107
        Visible = True
      end>
  end
  inherited DataSource1: TDataSource
    Left = 512
    Top = 112
  end
  inherited Qry1: TQuery
    Top = 80
  end
  inherited Table1: TTable
    Active = True
    AfterScroll = Table1AfterScroll
    TableName = 'dbo.T1011'
    object Table1F01: TStringField
      DisplayLabel = '厂商编号'
      FieldName = 'F01'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table1F02: TStringField
      DisplayLabel = '厂商名称'
      FieldName = 'F02'
      OnValidate = Table1F02Validate
      Size = 40
    end
    object Table1F03: TStringField
      DisplayLabel = '厂商简称'
      FieldName = 'F03'
      OnValidate = Table1F03Validate
      FixedChar = True
      Size = 12
    end
    object Table1F04: TStringField
      DisplayLabel = '负责人'
      FieldName = 'F04'
      FixedChar = True
      Size = 8
    end
    object Table1F05: TStringField
      DisplayLabel = '电话一'
      FieldName = 'F05'
      FixedChar = True
      Size = 25
    end
    object Table1F06: TStringField
      DisplayLabel = '电话二'
      FieldName = 'F06'
      Size = 25
    end
    object Table1F07: TStringField
      DisplayLabel = '传真'
      FieldName = 'F07'
      FixedChar = True
      Size = 25
    end
    object Table1F08: TStringField
      DisplayLabel = '地址'
      FieldName = 'F08'
      Size = 60
    end
    object Table1F09: TStringField
      DisplayLabel = '邮递区号'
      FieldName = 'F09'
      FixedChar = True
      Size = 10
    end
    object Table1F10: TStringField
      DisplayLabel = 'E_Mail'
      FieldName = 'F10'
      Size = 40
    end
    object Table1F11: TDateTimeField
      DisplayLabel = '往来起始日期'
      FieldName = 'F11'
    end
    object Table1F12: TStringField
      DisplayLabel = '送货地址'
      FieldName = 'F12'
      Size = 60
    end
    object Table1F13: TStringField
      DisplayLabel = '联络人'
      FieldName = 'F13'
      FixedChar = True
      Size = 8
    end
    object Table1F14: TStringField
      DisplayLabel = '联络人电话'
      FieldName = 'F14'
      FixedChar = True
      Size = 25
    end
    object Table1F15: TStringField
      DisplayLabel = '行动电话'
      FieldName = 'F15'
      FixedChar = True
    end
    object Table1BUser: TStringField
      DisplayLabel = '建档人'
      FieldName = 'BUser'
      FixedChar = True
      Size = 10
    end
    object Table1BTime: TDateTimeField
      DisplayLabel = '建档日期'
      FieldName = 'BTime'
    end
    object Table1EUser: TStringField
      DisplayLabel = '修改人'
      FieldName = 'EUser'
      FixedChar = True
      Size = 10
    end
    object Table1ETime: TDateTimeField
      DisplayLabel = '修改日期'
      FieldName = 'ETime'
    end
  end
end
