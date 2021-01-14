object Form_YYMM: TForm_YYMM
  Left = 296
  Top = 288
  Width = 402
  Height = 133
  ActiveControl = Button1
  Caption = '年月选择'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = '宋体'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 21
    Top = 23
    Width = 30
    Height = 12
    Caption = '年份:'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 221
    Top = 23
    Width = 30
    Height = 12
    Caption = '月份:'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = '宋体'
    Font.Style = []
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 258
    Top = 15
    Width = 105
    Height = 20
    Color = 16764622
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = '宋体'
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 0
    Text = '10'
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
  object SpinEdit1: TSpinEdit
    Left = 58
    Top = 14
    Width = 144
    Height = 21
    Color = 16764622
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = '宋体'
    Font.Style = []
    MaxValue = 2999
    MinValue = 1999
    ParentFont = False
    TabOrder = 1
    Value = 2002
  end
  object Button1: TButton
    Left = 171
    Top = 55
    Width = 86
    Height = 23
    Caption = '确定'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = '宋体'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
  end
  object Button2: TButton
    Left = 276
    Top = 55
    Width = 86
    Height = 23
    Caption = '取消'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = '宋体'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
  end
end
