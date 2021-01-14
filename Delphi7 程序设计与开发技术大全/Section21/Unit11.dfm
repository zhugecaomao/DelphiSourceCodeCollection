object Form11: TForm11
  Left = 563
  Top = 371
  Width = 704
  Height = 480
  Caption = 'Form11'
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
  object GroupBox1: TGroupBox
    Left = 24
    Top = 16
    Width = 585
    Height = 121
    Caption = #20462#25913#23398#29983#35760#24405
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 40
      Width = 36
      Height = 13
      Caption = #23398#21495#65306
    end
    object Label2: TLabel
      Left = 16
      Top = 80
      Width = 36
      Height = 13
      Caption = #24180#40836#65306
    end
    object Label4: TLabel
      Left = 208
      Top = 76
      Width = 36
      Height = 13
      Caption = #24615#21035#65306
    end
    object Label3: TLabel
      Left = 208
      Top = 40
      Width = 36
      Height = 13
      Caption = #22995#21517#65306
    end
    object Label5: TLabel
      Left = 400
      Top = 40
      Width = 36
      Height = 13
      Caption = #31995#21035#65306
    end
    object Label6: TLabel
      Left = 400
      Top = 80
      Width = 36
      Height = 13
      Caption = #30005#35805#65306
    end
    object DBEdit1: TDBEdit
      Left = 64
      Top = 32
      Width = 121
      Height = 21
      DataField = 'StuNo'
      DataSource = DataModule2.StudentDS
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 64
      Top = 72
      Width = 121
      Height = 21
      DataField = 'Age'
      DataSource = DataModule2.StudentDS
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 256
      Top = 72
      Width = 121
      Height = 21
      DataField = 'Sex'
      DataSource = DataModule2.StudentDS
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 256
      Top = 32
      Width = 121
      Height = 21
      DataField = 'StuName'
      DataSource = DataModule2.StudentDS
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 440
      Top = 32
      Width = 121
      Height = 21
      DataField = 'Dep'
      DataSource = DataModule2.StudentDS
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 440
      Top = 72
      Width = 121
      Height = 21
      DataField = 'Tel'
      DataSource = DataModule2.StudentDS
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 544
    Top = 216
    Width = 121
    Height = 145
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 24
      Top = 32
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 24
      Top = 88
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = BitBtn2Click
      Kind = bkCancel
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 152
    Top = 152
    Width = 250
    Height = 33
    DataSource = DataModule2.StudentDS
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 192
    Width = 489
    Height = 209
    DataSource = DataModule2.StudentDS
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
end
