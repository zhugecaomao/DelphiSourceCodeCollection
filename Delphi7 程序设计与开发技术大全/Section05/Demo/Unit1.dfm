object Form1: TForm1
  Left = 230
  Top = 114
  BorderStyle = bsDialog
  Caption = #30331#24405#23545#35805#26694
  ClientHeight = 203
  ClientWidth = 302
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 52
    Height = 13
    Caption = #29992#25143#21517#65306
  end
  object Label2: TLabel
    Left = 48
    Top = 48
    Width = 53
    Height = 13
    Caption = #23494'  '#30721#65306
  end
  object UserTxt: TEdit
    Left = 104
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyDown = UserTxtKeyDown
  end
  object PSWTxt: TEdit
    Left = 104
    Top = 48
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = PSWTxtKeyPress
  end
  object Panel1: TPanel
    Left = 24
    Top = 120
    Width = 249
    Height = 73
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelWidth = 3
    TabOrder = 2
    object Label3: TLabel
      Left = 6
      Top = 6
      Width = 237
      Height = 61
      Align = alClient
    end
  end
  object CancelBtn: TButton
    Left = 56
    Top = 80
    Width = 75
    Height = 25
    Cancel = True
    Caption = #37325#32622'(&C)'
    TabOrder = 3
    OnClick = CancelBtnClick
  end
  object OKBtn: TButton
    Left = 152
    Top = 80
    Width = 75
    Height = 25
    Caption = #30830#23450'(&O)'
    TabOrder = 4
    OnClick = OKBtnClick
  end
end
