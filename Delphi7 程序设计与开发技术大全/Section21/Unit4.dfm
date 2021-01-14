object Form4: TForm4
  Left = 365
  Top = 231
  Width = 606
  Height = 449
  Caption = #20462#25913#22270#20070#35760#24405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 128
    Top = 144
    Width = 240
    Height = 33
    DataSource = DataModule2.BookDS
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 192
    Width = 553
    Height = 209
    DataSource = DataModule2.BookDS
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 440
    Top = 32
    Width = 137
    Height = 121
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 32
      Top = 16
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 32
      Top = 64
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = BitBtn2Click
      Kind = bkCancel
    end
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 16
    Width = 393
    Height = 121
    Caption = #20462#25913#22270#20070#35760#24405
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 40
      Width = 36
      Height = 13
      Caption = #20070#21495#65306
    end
    object Label2: TLabel
      Left = 16
      Top = 80
      Width = 36
      Height = 13
      Caption = #20070#21517#65306
    end
    object Label4: TLabel
      Left = 200
      Top = 76
      Width = 48
      Height = 13
      Caption = #20986#29256#31038#65306
    end
    object Label3: TLabel
      Left = 208
      Top = 40
      Width = 36
      Height = 13
      Caption = #20316#32773#65306
    end
    object DBEdit1: TDBEdit
      Left = 64
      Top = 32
      Width = 121
      Height = 21
      DataField = 'BookNo'
      DataSource = DataModule2.BookDS
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 64
      Top = 72
      Width = 121
      Height = 21
      DataField = 'BookName'
      DataSource = DataModule2.BookDS
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 256
      Top = 72
      Width = 121
      Height = 21
      DataField = 'Publish'
      DataSource = DataModule2.BookDS
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 256
      Top = 32
      Width = 121
      Height = 21
      DataField = 'Author'
      DataSource = DataModule2.BookDS
      TabOrder = 3
    end
  end
end
