object frmFilter: TfrmFilter
  Left = 278
  Top = 133
  Width = 433
  Height = 386
  BorderIcons = [biSystemMenu]
  Caption = '资料查询'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = '宋体'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object CheckBox1: TCheckBox
    Left = 6
    Top = 293
    Width = 139
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = '保存查询内容(&S)'
    TabOrder = 7
    OnClick = CheckBox1Click
  end
  object StringGrid1: TStringGrid
    Left = 6
    Top = 6
    Width = 414
    Height = 277
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 4
    DefaultRowHeight = 21
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goEditing]
    ScrollBars = ssVertical
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
    OnKeyDown = StringGrid1KeyDown
    OnMouseDown = StringGrid1MouseDown
    ColWidths = (
      108
      90
      120
      64)
  end
  object btnCancel: TBitBtn
    Left = 329
    Top = 317
    Width = 91
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '取消(&C)'
    TabOrder = 2
    Kind = bkCancel
  end
  object cbXm: TComboBox
    Left = 6
    Top = 30
    Width = 111
    Height = 23
    Style = csDropDownList
    ItemHeight = 15
    TabOrder = 3
    Visible = False
    OnExit = cbXmExit
    OnKeyDown = cbXmKeyDown
  end
  object cbBjfs: TComboBox
    Left = 116
    Top = 30
    Width = 93
    Height = 23
    Style = csDropDownList
    ItemHeight = 15
    TabOrder = 4
    Visible = False
    OnExit = cbXmExit
    OnKeyDown = cbXmKeyDown
    Items.Strings = (
      '等于'
      '包含'
      '大于等于'
      '小于等于'
      '大于'
      '小于'
      '全等于'
      '不等于'
      '为空值'
      '不为空值')
  end
  object cbZhfs: TComboBox
    Left = 328
    Top = 30
    Width = 66
    Height = 23
    Style = csDropDownList
    ItemHeight = 15
    TabOrder = 5
    Visible = False
    OnExit = cbXmExit
    OnKeyDown = cbXmKeyDown
    Items.Strings = (
      '并且'
      '或者')
  end
  object btnOk: TBitBtn
    Left = 227
    Top = 317
    Width = 91
    Height = 31
    Anchors = [akRight, akBottom]
    Caption = '确定(&O)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnOkClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnIni: TBitBtn
    Left = 125
    Top = 317
    Width = 91
    Height = 31
    Hint = '初始化查询项目的排列顺序'
    Anchors = [akRight, akBottom]
    Caption = '初始化 '
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnIniClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADAAD0000000000000DDA0FFF0FFF0FFF0AAD0FFF0FFF0FFF0DDA0FFF0FFF0F
      FF0AAD0FFF0FFF0FFF0DDA0FFF0FFF0FFF0AAD0FFF0FFF0FFF0DDA0FFF0FFF0F
      FF0AAD0FFF0FFF0FFF0DDA0FFF0FFF0FFF0AAD0000000000000DDA0888088808
      880AAD0888088808880DDA0000000000000AADADADADADADADAD}
  end
  object btnClear: TBitBtn
    Left = 5
    Top = 317
    Width = 109
    Height = 31
    Hint = '清空查询内窖中已输入的资料'
    Anchors = [akRight, akBottom]
    Caption = '清空内容(&D)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = btnClearClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADAADADADADADADADADD0000000000000DAA0FFFFFFFFFFF0ADD0FFFFFFFFFF
      F0DAA0F888888888F0ADD0F8BFBFBFB8F0DAA0F888888888F0ADD0FFFFFFFFFF
      F0DAA0F888888888F0ADD0F8BFBFBFB8F0DAA0F888888888F0ADD0FFFFFFFFFF
      F0DAA0FFFFFFFFFFF0ADD0000000000000DAADADADADADADADAD}
  end
  object ListBox1: TListBox
    Left = 207
    Top = 53
    Width = 123
    Height = 128
    ItemHeight = 15
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8')
    TabOrder = 9
    Visible = False
    OnExit = ListBox1Exit
    OnKeyDown = ListBox1KeyDown
    OnMouseDown = ListBox1MouseDown
    OnMouseMove = ListBox1MouseMove
  end
  object btnSelect: TBitBtn
    Left = 308
    Top = 32
    Width = 21
    Height = 21
    TabOrder = 10
    OnClick = btnSelectClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      7777777777707777777777777700077777777777700000777777777700000007
      7777777000000000777777777777777777777777777777777777777777777777
      7777777777777777777777777777777777777777777777777777}
  end
end
