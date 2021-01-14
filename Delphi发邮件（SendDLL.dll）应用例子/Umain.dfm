object Form1: TForm1
  Left = 224
  Top = 166
  Width = 681
  Height = 342
  Caption = #37038#20214#21457#36865' V1  TefSoft@163.com  QQ:TefSoft@QQ.com'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl7: TLabel
    Left = 48
    Top = 40
    Width = 90
    Height = 13
    Caption = 'SMTP'#37038#31665#21517#31216#65306
  end
  object lbl1: TLabel
    Left = 48
    Top = 70
    Width = 102
    Height = 13
    Caption = 'SMTP'#26381#21153#22120#22320#22336#65306
  end
  object lbl2: TLabel
    Left = 48
    Top = 100
    Width = 102
    Height = 13
    Caption = 'SMTP'#26381#21153#22120#31471#21475#65306
  end
  object lbl3: TLabel
    Left = 48
    Top = 130
    Width = 72
    Height = 13
    Caption = #30331#24405#29992#25143#21517#65306
  end
  object lbl4: TLabel
    Left = 48
    Top = 161
    Width = 60
    Height = 13
    Caption = #30331#24405#23494#30721#65306
  end
  object lbl5: TLabel
    Left = 48
    Top = 192
    Width = 84
    Height = 13
    Caption = #22791#20221#37038#31665#22320#22336#65306
  end
  object lbl6: TLabel
    Left = 48
    Top = 218
    Width = 84
    Height = 13
    Caption = #25220#36865#37038#31665#22320#22336#65306
  end
  object lbl8: TLabel
    Left = 328
    Top = 40
    Width = 60
    Height = 13
    Caption = #20869#23481#25552#35201#65306
  end
  object lbl9: TLabel
    Left = 328
    Top = 72
    Width = 60
    Height = 13
    Caption = #37038#20214#20869#23481#65306
  end
  object lbl10: TLabel
    Left = 328
    Top = 218
    Width = 36
    Height = 13
    Caption = #38468#20214#65306
  end
  object btn1: TButton
    Left = 289
    Top = 264
    Width = 75
    Height = 25
    Caption = #21457#36865#37038#20214
    TabOrder = 0
    OnClick = btn1Click
  end
  object edt1: TEdit
    Left = 156
    Top = 37
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Tefsoft@163.com'
  end
  object edt2: TEdit
    Left = 156
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'SMTP.163.com'
  end
  object edt3: TEdit
    Left = 156
    Top = 91
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '25'
  end
  object edt4: TEdit
    Left = 156
    Top = 127
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'tefsoft'
  end
  object edt5: TEdit
    Left = 156
    Top = 158
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 5
  end
  object edt6: TEdit
    Left = 156
    Top = 189
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Tefsoft@qq.com'
  end
  object edt7: TEdit
    Left = 156
    Top = 216
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object edt8: TEdit
    Left = 394
    Top = 37
    Width = 231
    Height = 21
    TabOrder = 8
    Text = 'DLL'#27979#35797#37038#20214
  end
  object mmo1: TMemo
    Left = 394
    Top = 67
    Width = 231
    Height = 143
    Lines.Strings = (
      'DLL'#27979#35797#37038#20214
      '   '#20869#23481#65306
      #22909#22909#23398#20064#65292#22825#22825#21521#19978)
    TabOrder = 9
  end
  object edt9: TEdit
    Left = 394
    Top = 216
    Width = 199
    Height = 21
    ReadOnly = True
    TabOrder = 10
  end
  object btn2: TButton
    Left = 599
    Top = 216
    Width = 33
    Height = 25
    Caption = #36873#25321
    TabOrder = 11
    OnClick = btn2Click
  end
  object dlgOpen1: TOpenDialog
    Filter = '*.*|*.*'
    Left = 312
    Top = 144
  end
end
