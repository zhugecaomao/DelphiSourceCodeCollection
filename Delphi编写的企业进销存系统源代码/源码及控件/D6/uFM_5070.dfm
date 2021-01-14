object FM_5070: TFM_5070
  Left = 326
  Top = 273
  Width = 325
  Height = 225
  Hint = '物料应付帐款月结'
  Caption = '物料进料应付结转'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = '宋体'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 51
    Top = 102
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
    Left = 51
    Top = 72
    Width = 48
    Height = 12
    Caption = '物料厂商'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 52
    Top = 41
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
    Left = 163
    Top = 140
    Width = 88
    Height = 25
    Hint = '退出本窗口'
    Caption = '离 开'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
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
    Left = 104
    Top = 97
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
    Left = 104
    Top = 65
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
    Left = 104
    Top = 34
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
    Left = 182
    Top = 34
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
    Left = 48
    Top = 140
    Width = 88
    Height = 25
    Caption = '结 转'
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00EEEEEEEEEEEE
      EEEEEEEEEEE000000000EEEEEEE0FFFFFFF0EEEEEEE0F00F00F0EEEEEEE0FFFF
      FFF0EEEEEEE0F00F00F0EEEEEEE0FFFFFFF0E000000444444444E0FFFFF44444
      4444E0F77F77F0EEE9EEE0FFFFFFF0EE999EE0F77F77F0EEE9EEE0FFFFFFF0EE
      E9EEECCCCCCCCCE99EEEECCCCCCCCCEEEEEEEEEEEEEEEEEEEEEE}
  end
  object Qry1: TQuery
    DatabaseName = 'STK0311'
    Left = 264
    Top = 43
  end
  object Qry2: TQuery
    DatabaseName = 'STK0311'
    Left = 256
    Top = 11
  end
  object Qry3: TQuery
    DatabaseName = 'STK0311'
    Left = 264
    Top = 88
  end
end
