inherited FM_1020: TFM_1020
  Left = 181
  Top = 115
  Width = 796
  Height = 518
  Hint = '原料供应商资料'
  Caption = '原料供应商基本资料'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 497
    Height = 447
    object Label4: TLabel [0]
      Left = 53
      Top = 86
      Width = 48
      Height = 12
      Caption = '负 责 人'
      FocusControl = DBEdit5
    end
    object Label5: TLabel [1]
      Left = 53
      Top = 117
      Width = 48
      Height = 12
      Caption = '电 话 一'
      FocusControl = DBEdit6
    end
    object Label6: TLabel [2]
      Left = 255
      Top = 117
      Width = 48
      Height = 12
      Caption = '电 话 二'
      FocusControl = DBEdit7
    end
    object Label7: TLabel [3]
      Left = 53
      Top = 147
      Width = 48
      Height = 12
      Caption = '传    真'
      FocusControl = DBEdit8
    end
    object Label8: TLabel [4]
      Left = 53
      Top = 178
      Width = 48
      Height = 12
      Caption = '地    址'
      FocusControl = DBEdit9
    end
    object Label9: TLabel [5]
      Left = 255
      Top = 147
      Width = 48
      Height = 12
      Caption = '邮递区号'
      FocusControl = DBEdit10
    end
    object Label10: TLabel [6]
      Left = 53
      Top = 209
      Width = 48
      Height = 12
      Caption = '电    邮'
      FocusControl = DBEdit11
    end
    object Label11: TLabel [7]
      Left = 29
      Top = 239
      Width = 72
      Height = 12
      Caption = '往来起始日期'
    end
    object Label13: TLabel [8]
      Left = 53
      Top = 270
      Width = 48
      Height = 12
      Caption = '联 络 人'
      FocusControl = DBEdit13
    end
    object Label14: TLabel [9]
      Left = 171
      Top = 270
      Width = 24
      Height = 12
      Caption = '电话'
      FocusControl = DBEdit14
    end
    object Label15: TLabel [10]
      Left = 307
      Top = 270
      Width = 24
      Height = 12
      Caption = '手机'
      FocusControl = DBEdit15
    end
    object Label21: TLabel [11]
      Left = 254
      Top = 300
      Width = 48
      Height = 12
      Caption = '常用币别'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel [12]
      Left = 53
      Top = 331
      Width = 48
      Height = 12
      Caption = '常用税别'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel [13]
      Left = 254
      Top = 331
      Width = 48
      Height = 12
      Caption = '参考税率'
      FocusControl = DBEdit23
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel [14]
      Left = 41
      Top = 25
      Width = 60
      Height = 12
      Caption = '供应商编号'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel [15]
      Left = 255
      Top = 25
      Width = 48
      Height = 12
      Caption = '简    称'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel [16]
      Left = 41
      Top = 56
      Width = 60
      Height = 12
      Caption = '供应商名称'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel [17]
      Left = 53
      Top = 300
      Width = 48
      Height = 12
      Caption = '结 帐 日'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    inherited DBEdit1: TDBEdit
      Left = 107
      Top = 21
      Width = 142
      DataField = 'F01'
    end
    object DBEdit3: TDBEdit
      Left = 107
      Top = 52
      Width = 359
      Height = 20
      DataField = 'F02'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 307
      Top = 21
      Width = 159
      Height = 20
      DataField = 'F03'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit5: TDBEdit
      Left = 107
      Top = 82
      Width = 359
      Height = 20
      DataField = 'F04'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 107
      Top = 113
      Width = 143
      Height = 20
      DataField = 'F05'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 307
      Top = 113
      Width = 159
      Height = 20
      DataField = 'F06'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 107
      Top = 143
      Width = 143
      Height = 20
      DataField = 'F07'
      DataSource = DataSource1
      TabOrder = 6
    end
    object DBEdit9: TDBEdit
      Left = 107
      Top = 174
      Width = 359
      Height = 20
      DataField = 'F08'
      DataSource = DataSource1
      TabOrder = 8
    end
    object DBEdit10: TDBEdit
      Left = 307
      Top = 143
      Width = 159
      Height = 20
      DataField = 'F09'
      DataSource = DataSource1
      TabOrder = 7
    end
    object DBEdit11: TDBEdit
      Left = 107
      Top = 205
      Width = 359
      Height = 20
      DataField = 'F10'
      DataSource = DataSource1
      TabOrder = 9
    end
    object DBEdit13: TDBEdit
      Left = 107
      Top = 266
      Width = 59
      Height = 20
      DataField = 'F13'
      DataSource = DataSource1
      TabOrder = 11
    end
    object DBEdit14: TDBEdit
      Left = 200
      Top = 266
      Width = 102
      Height = 20
      DataField = 'F14'
      DataSource = DataSource1
      TabOrder = 12
    end
    object DBEdit15: TDBEdit
      Left = 337
      Top = 266
      Width = 128
      Height = 20
      DataField = 'F15'
      DataSource = DataSource1
      TabOrder = 13
    end
    object DBEdit23: TDBEdit
      Left = 307
      Top = 327
      Width = 159
      Height = 20
      DataField = 'F23'
      DataSource = DataSource1
      TabOrder = 17
    end
    object DBComboBox1: TDBComboBox
      Left = 107
      Top = 296
      Width = 143
      Height = 20
      DataField = 'F20'
      DataSource = DataSource1
      ItemHeight = 12
      Items.Strings = (
        '25'
        '月底')
      TabOrder = 14
    end
    object DBDateEdit1: TDBDateEdit
      Left = 107
      Top = 235
      Width = 358
      Height = 20
      DataField = 'F11'
      DataSource = DataSource1
      ButtonWidth = 16
      NumGlyphs = 2
      TabOrder = 10
    end
    object DBComboBox2: TDBComboBox
      Left = 107
      Top = 327
      Width = 142
      Height = 20
      Style = csDropDownList
      DataField = 'F22'
      DataSource = DataSource1
      ItemHeight = 12
      Items.Strings = (
        '外加'
        '内含'
        '免税')
      TabOrder = 16
    end
    object RxDBComboEdit2: TRxDBComboEdit
      Left = 307
      Top = 296
      Width = 159
      Height = 20
      DataField = 'F21'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      TabOrder = 15
      OnButtonClick = RxDBComboEdit2ButtonClick
    end
  end
  inherited ToolBar1: TToolBar
    Width = 788
    inherited SB2: TSpeedButton
      Visible = True
    end
    inherited SB3: TSpeedButton
      Visible = True
    end
    inherited SB0: TSpeedButton
      Width = 56
      Caption = '原料价格'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFF333333333333000333333333
        3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
        3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
        0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
        BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
        33337777773FF733333333333300033333333333337773333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      Visible = True
      OnClick = SB0Click
    end
    inherited SB4: TSpeedButton
      Left = 614
      Width = 56
      Caption = '原料询价'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      Layout = blGlyphTop
      NumGlyphs = 2
      Visible = True
      OnClick = SB4Click
    end
    inherited SB6: TSpeedButton
      Left = 670
    end
  end
  inherited DBGrid1: TDBGrid
    Left = 497
    Width = 291
    Height = 447
    Columns = <
      item
        Expanded = False
        FieldName = 'F01'
        PickList.Strings = ()
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F03'
        PickList.Strings = ()
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F05'
        PickList.Strings = ()
        Width = 97
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
    TableName = 'dbo.T1020'
    object Table1F01: TStringField
      DisplayLabel = '供应商编号'
      FieldName = 'F01'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table1F02: TStringField
      DisplayLabel = '供应商名称'
      FieldName = 'F02'
      OnValidate = Table1F02Validate
      Size = 40
    end
    object Table1F03: TStringField
      DisplayLabel = '简称'
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
    object Table1F20: TSmallintField
      DefaultExpression = '25'
      DisplayLabel = '结帐日'
      FieldName = 'F20'
      OnGetText = Table1F20GetText
      OnSetText = Table1F20SetText
      OnValidate = RequiredValue
    end
    object Table1F21: TStringField
      DisplayLabel = '常用币别'
      FieldName = 'F21'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table1F22: TStringField
      DisplayLabel = '常用税别'
      FieldName = 'F22'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 4
    end
    object Table1F23: TFloatField
      DisplayLabel = '叁考税率'
      FieldName = 'F23'
      OnValidate = RequiredValue
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
