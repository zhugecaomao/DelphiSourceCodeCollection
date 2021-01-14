object frmPopedomCopy: TfrmPopedomCopy
  Left = 199
  Top = 153
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = '权限复制'
  ClientHeight = 99
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = '宋体'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Label2: TLabel
    Left = 44
    Top = 20
    Width = 45
    Height = 15
    Caption = '确定从'
  end
  object Label1: TLabel
    Left = 222
    Top = 17
    Width = 30
    Height = 15
    Caption = '制复'
  end
  object Label3: TLabel
    Left = 12
    Top = 54
    Width = 45
    Height = 15
    Caption = '权限给'
  end
  object ComboBox1: TComboBox
    Left = 98
    Top = 16
    Width = 116
    Height = 23
    Style = csDropDownList
    ItemHeight = 15
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object btnOk: TBitBtn
    Left = 271
    Top = 13
    Width = 90
    Height = 31
    Caption = '确定(&O)'
    Enabled = False
    TabOrder = 1
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 271
    Top = 54
    Width = 90
    Height = 31
    Caption = '取消(&C)'
    TabOrder = 2
    Kind = bkCancel
  end
end
