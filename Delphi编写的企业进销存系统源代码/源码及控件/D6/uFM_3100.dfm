object FM_3100: TFM_3100
  Left = 386
  Top = 346
  Width = 310
  Height = 225
  Hint = '委外应付帐款月结'
  Caption = '委外应付结转'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = '宋体'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 46
    Top = 95
    Width = 48
    Height = 12
    Caption = '厂商名称'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 46
    Top = 65
    Width = 48
    Height = 12
    Caption = '厂商编号'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 47
    Top = 37
    Width = 48
    Height = 12
    Caption = '帐款年月'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
  end
  object SB6: TSpeedButton
    Left = 160
    Top = 136
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
  object Edit1: TEdit
    Left = 100
    Top = 89
    Width = 146
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
  object ComboEdit1: TComboEdit
    Left = 100
    Top = 60
    Width = 147
    Height = 21
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
  object SpinEdit1: TSpinEdit
    Left = 100
    Top = 30
    Width = 73
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
    Left = 178
    Top = 30
    Width = 69
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
  object BitBtn1: TBitBtn
    Left = 44
    Top = 136
    Width = 88
    Height = 25
    Caption = '结 转'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000
      0000000000000000000000000000000000000000000000000000FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000
      0000FFFFFF000000000000FFFFFF000000000000FFFFFF000000FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000
      0000FFFFFF000000000000FFFFFF000000000000FFFFFF000000FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFF0000000000000000000000000000000000000084
      0000840000840000840000840000840000840000840000840000FFFF00000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8400008400008400008400008400008400
      00840000840000840000FFFF00000000FFFFFF848284848284FFFFFF84828484
      8284FFFFFF000000FFFF00FFFF00FFFF000000FFFFFF00FFFF00FFFF00000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000
      FF0000FF0000FFFFFF00FFFF00000000FFFFFF848284848284FFFFFF84828484
      8284FFFFFF000000FFFF00FFFF00FFFF000000FFFFFF00FFFF00FFFF00000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF00FFFF
      000000FFFFFF00FFFF00FFFF00FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FFFF000000FF0000FFFFFF00FFFF00FFFF00FFFF00FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00}
  end
  object Qry1: TQuery
    DatabaseName = 'STK0311'
    Left = 8
    Top = 16
  end
  object Qry2: TQuery
    DatabaseName = 'STK0311'
    Left = 8
    Top = 64
  end
  object Qry3: TQuery
    DatabaseName = 'STK0311'
    Left = 8
    Top = 104
  end
end
