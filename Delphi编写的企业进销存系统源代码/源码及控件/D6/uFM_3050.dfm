object FM_3050: TFM_3050
  Left = 329
  Top = 316
  Width = 324
  Height = 259
  Hint = '进料应付对帐单列印'
  Caption = '原料进料应付对帐单列印'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = '宋体'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 11
  object Label1: TLabel
    Left = 42
    Top = 44
    Width = 52
    Height = 13
    Caption = '帐款年月'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 41
    Top = 119
    Width = 52
    Height = 13
    Caption = '厂商名称'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 41
    Top = 82
    Width = 52
    Height = 13
    Caption = '厂商编号'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
  end
  object SB6: TSpeedButton
    Left = 176
    Top = 164
    Width = 88
    Height = 25
    Hint = '退出本窗口'
    Caption = '离 开'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = '宋体'
    Font.Style = []
    Glyph.Data = {
      EE000000424DEE0000000000000076000000280000000F0000000F0000000100
      0400000000007800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888080707E7E70007080880707E7E060078088000000007600808888090E0066
      6080800009901067608080999999107070808099999910006080800009901070
      60808888090F107670808888000E106660808888080FEF0760808888880EFEF0
      708088888800000000808888888888888880}
    ParentFont = False
    OnClick = SB6Click
  end
  object SB2: TSpeedButton
    Left = 44
    Top = 164
    Width = 88
    Height = 25
    Hint = '列印资料'
    BiDiMode = bdLeftToRight
    Caption = '列 印'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = '宋体'
    Font.Style = []
    Glyph.Data = {
      4E010000424D4E01000000000000760000002800000012000000120000000100
      040000000000D800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      77777700000077777777777777777700000070000000000007700700000070FF
      FFFFFFFF07000700000070FFFFFFF00007007700000070FFFFFF077770777700
      000070FFFFF0777E77077700000070FFFFF0777777077700000070FFFFF07E77
      77077700000070FFFFF07EE777077700000070FFFFFF077770777700000070FF
      FFFFF00007777700000070FFFFFFFFFF07777700000070FFFFFFF00007777700
      000070FFFFFFF07077777700000070FFFFFFF007777777000000700000000077
      777777000000777777777777777777000000}
    ParentFont = False
    ParentBiDiMode = False
    OnClick = SB2Click
  end
  object SpinEdit1: TSpinEdit
    Left = 101
    Top = 36
    Width = 84
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = '宋体'
    Font.Style = []
    MaxValue = 3000
    MinValue = 1
    ParentFont = False
    TabOrder = 0
    Value = 2002
  end
  object ComboBox1: TComboBox
    Left = 187
    Top = 36
    Width = 78
    Height = 20
    Style = csDropDownList
    DropDownCount = 12
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = '宋体'
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 1
    Items.Strings = (
      '01'
      '02'
      '03'
      '04'
      '05'
      '06'
      '07'
      '08'
      '09'
      '10'
      '11'
      '12')
  end
  object ComboEdit1: TComboEdit
    Left = 101
    Top = 74
    Width = 164
    Height = 22
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = '宋体'
    Font.Style = []
    GlyphKind = gkEllipsis
    ButtonWidth = 16
    NumGlyphs = 1
    ParentFont = False
    TabOrder = 2
    OnButtonClick = ComboEdit1ButtonClick
  end
  object Edit1: TEdit
    Left = 101
    Top = 112
    Width = 162
    Height = 20
    Color = clInfoBk
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
end
