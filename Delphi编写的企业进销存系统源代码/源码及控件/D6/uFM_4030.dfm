inherited FM_4030: TFM_4030
  Left = 146
  Top = 122
  Width = 784
  Height = 524
  Caption = '订单查询'
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 776
    Height = 105
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 48
      Height = 12
      Caption = '客户单号'
    end
    object Label2: TLabel
      Left = 177
      Top = 11
      Width = 48
      Height = 12
      Caption = '起始日期'
    end
    object Label4: TLabel
      Left = 384
      Top = 11
      Width = 48
      Height = 12
      Caption = '终止日期'
    end
    object Label5: TLabel
      Left = 16
      Top = 35
      Width = 48
      Height = 12
      Caption = '客户编号'
    end
    object Label6: TLabel
      Left = 384
      Top = 35
      Width = 48
      Height = 12
      Caption = '厂商编号'
    end
    object Label3: TLabel
      Left = 16
      Top = 60
      Width = 48
      Height = 12
      Caption = '型    号'
    end
    object Label7: TLabel
      Left = 177
      Top = 60
      Width = 48
      Height = 12
      Caption = '品    名'
    end
    object Label8: TLabel
      Left = 384
      Top = 60
      Width = 48
      Height = 12
      Caption = '材    质'
    end
    object Label9: TLabel
      Left = 570
      Top = 60
      Width = 48
      Height = 12
      Caption = '规    格'
    end
    object Label10: TLabel
      Left = 570
      Top = 11
      Width = 48
      Height = 12
      Caption = '心    孔'
    end
    object Label11: TLabel
      Left = 16
      Top = 85
      Width = 48
      Height = 12
      Caption = '订购数量'
    end
    object Label12: TLabel
      Left = 177
      Top = 85
      Width = 48
      Height = 12
      Caption = '结 存 量'
    end
    object Label13: TLabel
      Left = 384
      Top = 85
      Width = 48
      Height = 12
      Caption = '交货日期'
    end
    object BitBtn1: TBitBtn
      Left = 570
      Top = 77
      Width = 88
      Height = 24
      Caption = '查询'
      TabOrder = 0
      OnClick = BitBtn1Click
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
    end
    object BitBtn2: TBitBtn
      Left = 661
      Top = 77
      Width = 88
      Height = 24
      Caption = '退出'
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
        BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
        BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
        BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
        BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
        EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
        EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
        EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
        EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
      NumGlyphs = 2
    end
    object DateEdit1: TDateEdit
      Left = 231
      Top = 4
      Width = 143
      Height = 21
      ButtonWidth = 16
      NumGlyphs = 2
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 176
      Top = 30
      Width = 198
      Height = 20
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 3
    end
    object DateEdit2: TDateEdit
      Left = 438
      Top = 4
      Width = 124
      Height = 21
      ButtonWidth = 16
      NumGlyphs = 2
      TabOrder = 4
    end
    object DateEdit3: TDateEdit
      Left = 438
      Top = 79
      Width = 124
      Height = 21
      NumGlyphs = 2
      TabOrder = 5
    end
    object ComboEdit2: TComboEdit
      Left = 438
      Top = 29
      Width = 124
      Height = 22
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      TabOrder = 6
      OnButtonClick = ComboEdit2ButtonClick
    end
    object ComboEdit1: TComboEdit
      Left = 70
      Top = 29
      Width = 98
      Height = 22
      GlyphKind = gkEllipsis
      ButtonWidth = 18
      NumGlyphs = 1
      TabOrder = 7
      OnButtonClick = ComboEdit1ButtonClick
    end
    object Edit1: TEdit
      Left = 70
      Top = 5
      Width = 98
      Height = 20
      TabOrder = 8
    end
    object Edit3: TEdit
      Left = 231
      Top = 54
      Width = 143
      Height = 20
      TabOrder = 9
    end
    object Edit5: TEdit
      Left = 622
      Top = 54
      Width = 127
      Height = 20
      TabOrder = 10
    end
    object Edit6: TEdit
      Left = 622
      Top = 5
      Width = 47
      Height = 20
      TabOrder = 11
    end
    object Edit7: TEdit
      Left = 70
      Top = 79
      Width = 98
      Height = 20
      TabOrder = 12
    end
    object Edit2: TEdit
      Left = 70
      Top = 54
      Width = 98
      Height = 20
      TabOrder = 13
    end
    object Edit4: TEdit
      Left = 438
      Top = 54
      Width = 124
      Height = 20
      TabOrder = 14
    end
    object ComboBox1: TComboBox
      Left = 231
      Top = 81
      Width = 143
      Height = 20
      ItemHeight = 12
      TabOrder = 15
      Items.Strings = (
        '未交'
        '已交'
        '超交')
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 105
    Width = 776
    Height = 392
    Align = alClient
    Color = clInfoBk
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = '宋体'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'mF01'
        Title.Caption = '订单单号'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MF02'
        Title.Alignment = taCenter
        Title.Caption = '日期'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MF03'
        Title.Caption = '客户编号'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CF03'
        Title.Caption = '客户'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MF12'
        Title.Caption = '客户单号'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MF14'
        Title.Caption = '指送厂商'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FF03'
        Title.Caption = '厂商'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF01'
        Title.Caption = '型号'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF02'
        Title.Caption = '品名'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF03'
        Title.Caption = '材质'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF04'
        Title.Caption = '规格'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF05'
        Title.Caption = '心孔'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DF03'
        Title.Alignment = taRightJustify
        Title.Caption = '订购数量'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DF04'
        Title.Alignment = taRightJustify
        Title.Caption = '单价'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DF05'
        Title.Alignment = taRightJustify
        Title.Caption = '金额'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DF06'
        Title.Alignment = taCenter
        Title.Caption = '交货日期'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DF07'
        Title.Alignment = taRightJustify
        Title.Caption = '已出货量'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DF08'
        Title.Alignment = taRightJustify
        Title.Caption = '已开制造量'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DCal21'
        Title.Alignment = taRightJustify
        Title.Caption = '结存量'
        Visible = True
      end>
  end
  object DBEdit2: TDBEdit
    Left = 570
    Top = 30
    Width = 179
    Height = 20
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 2
  end
  object Query1: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      
        'Select m.f01 as mF01,m.f02 AS MF02,M.F03 AS MF03,M.F12 AS MF12,M' +
        '.F14 AS MF14,'
      
        'D.F02 AS DF02,D.F03 AS DF03,D.F04 AS DF04,D.F05 AS DF05,D.F06 AS' +
        ' DF06,D.F03-D.F07 AS DCal21,D.F07 AS DF07,D.F08 AS DF08,'
      
        'P.F01 AS PF01,P.F02 AS PF02,P.F03 AS PF03,P.F04 AS PF04,P.F05 AS' +
        ' PF05,'
      'C.F03 AS CF03,F.F03 AS FF03'
      'FROM T2010A AS D '
      'LEFT JOIN T2010 AS M ON M.F01 = D.F01'
      'LEFT JOIN T1080 AS P ON D.F02 = P.Autono'
      'LEFT JOIN T1010 AS C ON M.F03 = C.F01'
      'LEFT  JOIN T1011 AS F ON M.F14 = F.F01'
      'where 0=0')
    Left = 24
    Top = 208
    object Query1mF01: TStringField
      FieldName = 'mF01'
      FixedChar = True
      Size = 12
    end
    object Query1MF02: TDateTimeField
      FieldName = 'MF02'
    end
    object Query1MF03: TStringField
      FieldName = 'MF03'
      FixedChar = True
      Size = 8
    end
    object Query1CF03: TStringField
      FieldName = 'CF03'
      FixedChar = True
      Size = 12
    end
    object Query1MF12: TStringField
      FieldName = 'MF12'
      FixedChar = True
      Size = 15
    end
    object Query1MF14: TStringField
      FieldName = 'MF14'
      FixedChar = True
      Size = 8
    end
    object Query1DF02: TIntegerField
      FieldName = 'DF02'
    end
    object Query1DF03: TFloatField
      FieldName = 'DF03'
    end
    object Query1DF04: TFloatField
      FieldName = 'DF04'
    end
    object Query1DF05: TFloatField
      FieldName = 'DF05'
    end
    object Query1DF06: TDateTimeField
      FieldName = 'DF06'
    end
    object Query1DF07: TFloatField
      FieldName = 'DF07'
    end
    object Query1DF08: TFloatField
      FieldName = 'DF08'
    end
    object Query1PF01: TStringField
      FieldName = 'PF01'
      FixedChar = True
      Size = 4
    end
    object Query1PF02: TStringField
      FieldName = 'PF02'
      FixedChar = True
      Size = 12
    end
    object Query1PF03: TStringField
      FieldName = 'PF03'
      FixedChar = True
      Size = 6
    end
    object Query1PF04: TStringField
      FieldName = 'PF04'
      FixedChar = True
    end
    object Query1PF05: TStringField
      FieldName = 'PF05'
      FixedChar = True
      Size = 5
    end
    object Query1DCal21: TFloatField
      FieldName = 'DCal21'
    end
    object Query1FF03: TStringField
      FieldName = 'FF03'
      FixedChar = True
      Size = 12
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 8
    Top = 160
  end
end
