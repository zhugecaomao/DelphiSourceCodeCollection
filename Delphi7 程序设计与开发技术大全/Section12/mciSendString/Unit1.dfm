object Form1: TForm1
  Left = 230
  Top = 164
  Width = 287
  Height = 227
  Caption = #20351#29992'mciSendString'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 176
    Width = 113
    Height = 13
    AutoSize = False
    Caption = #24403#21069'CD'#20013#26354#30446#25968#65306
  end
  object Button1: TButton
    Left = 16
    Top = 16
    Width = 89
    Height = 25
    Caption = #25171#24320'CD(O)'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 64
    Width = 89
    Height = 25
    Caption = #25773#25918#26354#30446'(&P)'
    Enabled = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 16
    Top = 112
    Width = 89
    Height = 25
    Caption = #20572#27490#25773#25918'(&S)'
    Enabled = False
    TabOrder = 2
    OnClick = Button3Click
  end
  object ListBox1: TListBox
    Left = 136
    Top = 16
    Width = 129
    Height = 145
    ItemHeight = 13
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 136
    Top = 168
    Width = 129
    Height = 21
    Color = clBtnFace
    TabOrder = 4
  end
end
