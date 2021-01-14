inherited FM_SYS: TFM_SYS
  Left = 255
  Top = 148
  Width = 714
  Height = 498
  Hint = '系统参数设定'
  Caption = '系统参数设定'
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 706
    Height = 471
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 86
      Top = 51
      Width = 78
      Height = 12
      Caption = '公司名称(中) '
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 86
      Top = 75
      Width = 78
      Height = 12
      Caption = '公司名称(英) '
    end
    object Label3: TLabel
      Left = 86
      Top = 99
      Width = 78
      Height = 12
      Caption = '公司简称(中) '
    end
    object Label4: TLabel
      Left = 86
      Top = 123
      Width = 78
      Height = 12
      Caption = '公司简称(英) '
    end
    object Label5: TLabel
      Left = 86
      Top = 148
      Width = 72
      Height = 12
      Caption = '公司电话 一 '
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 355
      Top = 148
      Width = 66
      Height = 12
      Caption = '公司电话二 '
    end
    object Label7: TLabel
      Left = 86
      Top = 172
      Width = 72
      Height = 12
      Caption = '公 司 传 真 '
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 86
      Top = 196
      Width = 84
      Height = 12
      Caption = '公司地址(中)  '
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 86
      Top = 220
      Width = 78
      Height = 12
      Caption = '公司地址(英) '
    end
    object Label10: TLabel
      Left = 367
      Top = 172
      Width = 54
      Height = 12
      Caption = '邮政区号 '
    end
    object Label11: TLabel
      Left = 86
      Top = 244
      Width = 72
      Height = 12
      Caption = '统 一 编 号 '
    end
    object Label12: TLabel
      Left = 86
      Top = 268
      Width = 72
      Height = 12
      Caption = '发票 负责人 '
    end
    object Label14: TLabel
      Left = 368
      Top = 244
      Width = 54
      Height = 12
      Caption = '网    页 '
    end
    object Label15: TLabel
      Left = 86
      Top = 293
      Width = 66
      Height = 12
      Caption = '电 子 邮 件'
    end
    object Label16: TLabel
      Left = 367
      Top = 293
      Width = 54
      Height = 12
      Caption = '客服专线 '
    end
    object Label17: TLabel
      Left = 86
      Top = 317
      Width = 72
      Height = 12
      Caption = '公 司 商 标 '
    end
    object Label18: TLabel
      Left = 368
      Top = 317
      Width = 54
      Height = 12
      Caption = '营业项目 '
    end
    object Label19: TLabel
      Left = 86
      Top = 368
      Width = 72
      Height = 12
      Caption = '结  账   日 '
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 86
      Top = 341
      Width = 72
      Height = 12
      Caption = '常 用 币 别 '
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 367
      Top = 342
      Width = 54
      Height = 12
      Caption = '常用税别 '
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 368
      Top = 368
      Width = 48
      Height = 12
      Caption = '参考税率'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 368
      Top = 268
      Width = 54
      Height = 12
      Caption = '发票地址 '
    end
    object DBEdit1: TDBEdit
      Left = 170
      Top = 48
      Width = 431
      Height = 20
      DataField = 'F01'
      DataSource = DataSource1
      TabOrder = 0
      OnExit = DBEdit1Exit
    end
    object DBEdit2: TDBEdit
      Left = 170
      Top = 72
      Width = 431
      Height = 20
      DataField = 'F02'
      DataSource = DataSource1
      TabOrder = 1
      OnExit = DBEdit2Exit
    end
    object DBEdit3: TDBEdit
      Left = 170
      Top = 96
      Width = 431
      Height = 20
      DataField = 'F03'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 170
      Top = 120
      Width = 431
      Height = 20
      DataField = 'F04'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 170
      Top = 145
      Width = 179
      Height = 20
      DataField = 'F05'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 422
      Top = 145
      Width = 179
      Height = 20
      DataField = 'F06'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 170
      Top = 169
      Width = 179
      Height = 20
      DataField = 'F07'
      DataSource = DataSource1
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 422
      Top = 169
      Width = 179
      Height = 20
      DataField = 'F10'
      DataSource = DataSource1
      TabOrder = 7
    end
    object DBEdit9: TDBEdit
      Left = 170
      Top = 217
      Width = 431
      Height = 20
      DataField = 'F09'
      DataSource = DataSource1
      TabOrder = 9
    end
    object DBEdit10: TDBEdit
      Left = 170
      Top = 241
      Width = 179
      Height = 20
      DataField = 'F11'
      DataSource = DataSource1
      TabOrder = 10
    end
    object DBEdit11: TDBEdit
      Left = 422
      Top = 241
      Width = 179
      Height = 20
      DataField = 'F14'
      DataSource = DataSource1
      TabOrder = 11
    end
    object DBEdit12: TDBEdit
      Left = 422
      Top = 265
      Width = 179
      Height = 20
      DataField = 'F13'
      DataSource = DataSource1
      TabOrder = 13
    end
    object DBEdit13: TDBEdit
      Left = 170
      Top = 265
      Width = 179
      Height = 20
      DataField = 'F12'
      DataSource = DataSource1
      TabOrder = 12
    end
    object DBEdit14: TDBEdit
      Left = 170
      Top = 193
      Width = 431
      Height = 20
      DataField = 'F08'
      DataSource = DataSource1
      TabOrder = 8
      OnExit = DBEdit14Exit
    end
    object DBEdit15: TDBEdit
      Left = 170
      Top = 290
      Width = 179
      Height = 20
      DataField = 'F15'
      DataSource = DataSource1
      TabOrder = 14
    end
    object DBEdit16: TDBEdit
      Left = 422
      Top = 290
      Width = 179
      Height = 20
      DataField = 'F16'
      DataSource = DataSource1
      TabOrder = 15
    end
    object DBEdit17: TDBEdit
      Left = 170
      Top = 314
      Width = 179
      Height = 20
      DataField = 'F17'
      DataSource = DataSource1
      TabOrder = 16
    end
    object DBEdit18: TDBEdit
      Left = 422
      Top = 314
      Width = 179
      Height = 20
      DataField = 'F18'
      DataSource = DataSource1
      TabOrder = 17
    end
    object BitBtn1: TBitBtn
      Left = 482
      Top = 402
      Width = 119
      Height = 28
      Caption = '确  定'
      TabOrder = 22
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
    object DBComboBox1: TDBComboBox
      Left = 170
      Top = 364
      Width = 179
      Height = 20
      DataField = 'F20'
      DataSource = DataSource1
      ItemHeight = 12
      Items.Strings = (
        '25'
        '月底')
      TabOrder = 20
    end
    object RxDBComboEdit1: TRxDBComboEdit
      Left = 170
      Top = 338
      Width = 179
      Height = 21
      DataField = 'F21'
      DataSource = DataSource1
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      TabOrder = 18
      OnButtonClick = RxDBComboEdit1ButtonClick
    end
    object DBComboBox2: TDBComboBox
      Left = 422
      Top = 338
      Width = 179
      Height = 20
      DataField = 'F22'
      DataSource = DataSource1
      ItemHeight = 12
      Items.Strings = (
        '外加'
        '内含'
        '免税')
      TabOrder = 19
    end
    object DBEdit19: TDBEdit
      Left = 422
      Top = 361
      Width = 179
      Height = 20
      DataField = 'F23'
      DataSource = DataSource1
      TabOrder = 21
    end
  end
  object Table1: TTable
    BeforePost = Table1BeforePost
    AfterPost = Table1AfterPost
    AfterScroll = Table1AfterScroll
    DatabaseName = 'STK0311'
    TableName = 'dbo.TSysParam'
    Left = 16
    object Table1F01: TStringField
      DisplayLabel = '公司名称'
      FieldName = 'F01'
      OnValidate = Table1F01Validate
      Size = 40
    end
    object Table1F02: TStringField
      FieldName = 'F02'
      Size = 40
    end
    object Table1F03: TStringField
      FieldName = 'F03'
      FixedChar = True
    end
    object Table1F04: TStringField
      FieldName = 'F04'
    end
    object Table1F05: TStringField
      DisplayLabel = '公司电话一'
      FieldName = 'F05'
      OnValidate = Table1F05Validate
      FixedChar = True
      Size = 25
    end
    object Table1F06: TStringField
      FieldName = 'F06'
      Size = 25
    end
    object Table1F07: TStringField
      DisplayLabel = '公司传真'
      FieldName = 'F07'
      OnValidate = Table1F07Validate
      FixedChar = True
      Size = 25
    end
    object Table1F08: TStringField
      DisplayLabel = '公司地址(中)'
      FieldName = 'F08'
      OnValidate = Table1F08Validate
      Size = 60
    end
    object Table1F09: TStringField
      FieldName = 'F09'
      Size = 60
    end
    object Table1F10: TStringField
      FieldName = 'F10'
      FixedChar = True
      Size = 10
    end
    object Table1F11: TStringField
      FieldName = 'F11'
      FixedChar = True
      Size = 10
    end
    object Table1F12: TStringField
      FieldName = 'F12'
      FixedChar = True
      Size = 10
    end
    object Table1F13: TStringField
      FieldName = 'F13'
      Size = 60
    end
    object Table1F14: TStringField
      FieldName = 'F14'
      Size = 60
    end
    object Table1F15: TStringField
      FieldName = 'F15'
      Size = 40
    end
    object Table1F16: TStringField
      FieldName = 'F16'
    end
    object Table1F17: TStringField
      FieldName = 'F17'
      Size = 100
    end
    object Table1F18: TStringField
      FieldName = 'F18'
      Size = 100
    end
    object Table1F20: TSmallintField
      DisplayLabel = '结账日'
      FieldName = 'F20'
      OnGetText = Table1F20GetText
      OnSetText = Table1F20SetText
      OnValidate = Table1F20Validate
    end
    object Table1F21: TStringField
      DisplayLabel = '常用币别'
      FieldName = 'F21'
      OnValidate = Table1F21Validate
      FixedChar = True
      Size = 8
    end
    object Table1F22: TStringField
      DisplayLabel = '常用税别'
      FieldName = 'F22'
      OnValidate = Table1F22Validate
      FixedChar = True
      Size = 4
    end
    object Table1BUSER: TStringField
      DisplayLabel = '建档人'
      FieldName = 'BUSER'
      FixedChar = True
      Size = 10
    end
    object Table1BTIME: TDateTimeField
      DisplayLabel = '建档时间'
      FieldName = 'BTIME'
    end
    object Table1EUSER: TStringField
      DisplayLabel = '修改人'
      FieldName = 'EUSER'
      FixedChar = True
      Size = 10
    end
    object Table1ETIME: TDateTimeField
      DisplayLabel = '修改时间'
      FieldName = 'ETIME'
    end
    object Table1F23: TFloatField
      DisplayLabel = '叁考汇率'
      FieldName = 'F23'
      OnValidate = Table1F23Validate
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 48
  end
end
