object Form1: TForm1
  Left = 430
  Top = 270
  Width = 212
  Height = 110
  Caption = #33258#21160#25552#37266#31995#32479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 32
    Width = 75
    Height = 25
    Caption = #24320#21551
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 112
    Top = 32
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 1
    OnClick = Button2Click
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 8
  end
  object Timer2: TTimer
    Interval = 7200000
    OnTimer = Timer2Timer
    Left = 176
  end
  object ado: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=flower;Persist Security Info=True;U' +
      'ser ID=sa;Initial Catalog=ccmeet;Data Source=172.100.0.12;Use Pr' +
      'ocedure for Prepare=1;Auto Translate=True;Packet Size=4096;Works' +
      'tation ID=CCJG-OFFICE-LJT;Use Encryption for Data=False;Tag with' +
      ' column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
  end
  object qmext1: TADOQuery
    Connection = ado
    Parameters = <>
    Left = 80
  end
  object qssr: TADOQuery
    Connection = ado
    Parameters = <>
    Left = 112
  end
  object qssu: TADOQuery
    Connection = ado
    Parameters = <>
    Left = 144
  end
  object qtextu: TADOQuery
    Connection = ado
    Parameters = <>
    Left = 8
    Top = 56
  end
  object qtextu2: TADOQuery
    Connection = ado
    Parameters = <>
    Left = 48
    Top = 56
  end
end
