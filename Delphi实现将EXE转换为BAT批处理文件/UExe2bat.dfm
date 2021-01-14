object Form1: TForm1
  Left = 192
  Top = 107
  Width = 580
  Height = 178
  Caption = #36716#25442'EXE'#21040'BAT'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object LabeledEdit1: TLabeledEdit
    Left = 8
    Top = 32
    Width = 561
    Height = 20
    EditLabel.Width = 90
    EditLabel.Height = 12
    EditLabel.Caption = #24453#36716#25442'EXE'#25991#20214#65306
    TabOrder = 0
  end
  object LabeledEdit2: TLabeledEdit
    Left = 8
    Top = 80
    Width = 561
    Height = 20
    EditLabel.Width = 84
    EditLabel.Height = 12
    EditLabel.Caption = #20445#23384#20026'bat'#25991#20214':'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 112
    Width = 75
    Height = 25
    Caption = #24320#22987#36716#25442
    TabOrder = 2
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 112
    Top = 120
    Width = 97
    Height = 17
    Caption = #33258#21160#36716#25442
    TabOrder = 3
  end
end
