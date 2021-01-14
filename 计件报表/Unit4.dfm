object Form4: TForm4
  Left = 269
  Top = 331
  BorderStyle = bsDialog
  Caption = #24037#20154#31649#29702
  ClientHeight = 233
  ClientWidth = 412
  Color = 12711880
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 8
    Top = 68
    Width = 42
    Height = 14
    Caption = #22995#21517#65306
  end
  object ListBox1: TListBox
    Left = 240
    Top = 32
    Width = 145
    Height = 145
    ItemHeight = 14
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 48
    Top = 64
    Width = 89
    Height = 22
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 152
    Top = 64
    Width = 75
    Height = 25
    Caption = #28155#21152'>>'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 312
    Top = 184
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 3
    OnClick = Button2Click
  end
end
