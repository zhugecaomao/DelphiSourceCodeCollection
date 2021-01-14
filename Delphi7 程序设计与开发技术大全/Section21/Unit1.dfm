object Form1: TForm1
  Left = 412
  Top = 250
  Width = 327
  Height = 231
  Caption = #22270#20070#31649#29702#31995#32479#30331#24405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 40
    Width = 48
    Height = 13
    Caption = #29992#25143#21517#65306
  end
  object Label2: TLabel
    Left = 64
    Top = 104
    Width = 36
    Height = 13
    Caption = #23494#30721#65306
  end
  object Edt_user: TEdit
    Left = 120
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edt_passwd: TEdit
    Left = 120
    Top = 96
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 144
    Width = 75
    Height = 25
    Caption = #30331#24405
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 200
    Top = 144
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object Pwquery: TQuery
    DatabaseName = 'work'
    SQL.Strings = (
      'select Passwd,Authority from User1.db where Userid=:Userid;')
    Left = 264
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'Userid'
        ParamType = ptUnknown
      end>
  end
end
