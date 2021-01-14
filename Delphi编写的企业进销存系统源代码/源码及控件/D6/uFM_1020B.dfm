inherited FM_1020B: TFM_1020B
  Left = 101
  Top = 196
  Caption = '物料询价'
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 872
    Height = 573
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 870
      Height = 50
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 16
        Top = 25
        Width = 48
        Height = 12
        Caption = '品  名：'
      end
      object Label1: TLabel
        Left = 226
        Top = 25
        Width = 48
        Height = 12
        Caption = '规  格：'
      end
      object ComboEdit1: TComboEdit
        Left = 62
        Top = 16
        Width = 147
        Height = 21
        GlyphKind = gkEllipsis
        NumGlyphs = 1
        TabOrder = 0
        OnButtonClick = ComboEdit1ButtonClick
      end
      object BitBtn1: TBitBtn
        Left = 485
        Top = 11
        Width = 88
        Height = 26
        Caption = '查询'
        TabOrder = 1
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
        Left = 582
        Top = 11
        Width = 88
        Height = 26
        Caption = '退出'
        TabOrder = 2
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
      object ComboEdit2: TComboEdit
        Left = 274
        Top = 16
        Width = 145
        Height = 21
        GlyphKind = gkEllipsis
        NumGlyphs = 1
        TabOrder = 3
        OnButtonClick = ComboEdit2ButtonClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 51
      Width = 870
      Height = 521
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
          FieldName = 'F01'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F02'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F03'
          Width = 159
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F04'
          Width = 129
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F05'
          Title.Alignment = taRightJustify
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F06'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F07'
          Width = 209
          Visible = True
        end>
    end
  end
  object Query1: TQuery
    Active = True
    DatabaseName = 'STK0311'
    SQL.Strings = (
      ' select * from T1020A')
    Left = 40
    Top = 184
    object Query1F01: TStringField
      DisplayLabel = '厂商简称'
      FieldName = 'F01'
      Origin = 'STK0311.T5010A.F01'
      FixedChar = True
    end
    object Query1F02: TStringField
      DisplayLabel = '物品编号'
      FieldName = 'F02'
      Origin = 'STK0311.T5010A.F02'
      FixedChar = True
      Size = 8
    end
    object Query1F03: TStringField
      DisplayLabel = '品名'
      FieldName = 'F03'
      Origin = 'STK0311.T5010A.F03'
      FixedChar = True
      Size = 12
    end
    object Query1F04: TStringField
      DisplayLabel = '规格'
      FieldName = 'F04'
      Origin = 'STK0311.T5010A.F04'
      FixedChar = True
      Size = 14
    end
    object Query1F05: TFloatField
      DisplayLabel = '单价'
      FieldName = 'F05'
      Origin = 'STK0311.T5010A.F05'
    end
    object Query1K_SN: TSmallintField
      FieldName = 'K_SN'
      Origin = 'STK0311.T1020A.K_SN'
    end
    object Query1F06: TDateTimeField
      DisplayLabel = '日期'
      FieldName = 'F06'
      Origin = 'STK0311.T1020A.F06'
    end
    object Query1F07: TStringField
      DisplayLabel = '备注'
      FieldName = 'F07'
      Origin = 'STK0311.T1020A.F07'
      FixedChar = True
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 72
    Top = 184
  end
end
