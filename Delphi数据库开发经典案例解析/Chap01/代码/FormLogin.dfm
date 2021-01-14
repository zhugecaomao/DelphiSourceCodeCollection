object login: Tlogin
  Left = 611
  Top = 253
  Width = 300
  Height = 200
  Caption = #29992#25143#30331#24405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 40
    Width = 39
    Height = 13
    Caption = #29992#25143#21517' '
  end
  object Label2: TLabel
    Left = 40
    Top = 72
    Width = 27
    Height = 13
    Caption = #23494#30721' '
  end
  object Label3: TLabel
    Left = 40
    Top = 8
    Width = 57
    Height = 13
    Caption = #29992#25143#32534#21495'   '
  end
  object Edit1: TEdit
    Left = 128
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 128
    Top = 72
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    OnKeyPress = Edit2KeyPress
  end
  object Button1: TButton
    Left = 104
    Top = 136
    Width = 75
    Height = 25
    Caption = #30331#24405
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 128
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '1'
    OnExit = Edit3Exit
    OnKeyPress = Edit3KeyPress
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=jxcbook'
    Parameters = <>
    Left = 24
    Top = 120
  end
end
