object backup_From: Tbackup_From
  Left = 292
  Top = 234
  Width = 574
  Height = 310
  Caption = #25968#25454#24211#22791#20221
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 72
    Top = 64
    Width = 431
    Height = 41
    ForeColor = 15445590
    Progress = 0
  end
  object Label1: TLabel
    Left = 128
    Top = 24
    Width = 336
    Height = 13
    Caption = #20026#20102#20445#35777#25968#25454#23433#20840#65292#24314#35758#24744#32463#24120#23545#25968#25454#24211#36827#34892#22791#20221#25805#20316
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 80
    Top = 144
    Width = 417
    Height = 105
    Caption = #25805#20316#21306
    TabOrder = 0
    object Button1: TButton
      Left = 40
      Top = 40
      Width = 81
      Height = 25
      Caption = #25968#25454#24211#22791#20221
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 168
      Top = 40
      Width = 75
      Height = 25
      Caption = #25968#25454#24211#36824#21407
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 296
      Top = 40
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Microsoft Access(*.mdb)|*.mdb|All Files (*.*)|*.*'
    Title = #25968#25454#24211#22791#20221
    Left = 24
    Top = 152
  end
  object OpenDialog1: TOpenDialog
    FileName = 'C:\Documents and Settings\wangjie\My Documents\'#24335'.mdb'
    Filter = 'Microsoft Access(*.mdb)|*.mdb|All Files(*.*)|*.*'
    Title = #25968#25454#24211#36824#21407
    Left = 24
    Top = 120
  end
end
