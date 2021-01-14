object Form1: TForm1
  Left = 266
  Top = 179
  Width = 501
  Height = 357
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 272
    Top = 48
    Width = 184
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 0
    OnClick = DBNavigator1Click
  end
  object Panel1: TPanel
    Left = 32
    Top = 8
    Width = 185
    Height = 113
    TabOrder = 1
    object Label6: TLabel
      Left = 56
      Top = 88
      Width = 57
      Height = 13
    end
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'Species No'
    end
    object Button1: TButton
      Left = 46
      Top = 56
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 80
      Top = 24
      Width = 65
      Height = 21
      TabOrder = 1
      OnClick = Edit1Click
    end
  end
  object Panel2: TPanel
    Left = 24
    Top = 128
    Width = 209
    Height = 177
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 2
    object Label2: TLabel
      Left = 40
      Top = 16
      Width = 49
      Height = 13
      AutoSize = False
      Caption = 'Category:'
    end
    object Label3: TLabel
      Left = 16
      Top = 48
      Width = 89
      Height = 13
      AutoSize = False
      Caption = 'Common_Name:'
    end
    object Label4: TLabel
      Left = 24
      Top = 84
      Width = 73
      Height = 13
      AutoSize = False
      Caption = 'Species Name:'
    end
    object Label5: TLabel
      Left = 32
      Top = 116
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'Length (cm):'
    end
    object DBText1: TDBText
      Left = 112
      Top = 16
      Width = 89
      Height = 17
      DataField = 'Category'
      DataSource = DataSource1
    end
    object DBText2: TDBText
      Left = 112
      Top = 48
      Width = 81
      Height = 17
      DataField = 'Common_Name'
      DataSource = DataSource1
    end
    object DBText3: TDBText
      Left = 112
      Top = 80
      Width = 89
      Height = 17
      DataField = 'Species Name'
      DataSource = DataSource1
    end
    object DBText4: TDBText
      Left = 112
      Top = 112
      Width = 89
      Height = 17
      DataField = 'Length (cm)'
      DataSource = DataSource1
    end
    object DBText5: TDBText
      Left = 112
      Top = 144
      Width = 89
      Height = 17
      DataField = 'Length_In'
      DataSource = DataSource1
    end
    object Label7: TLabel
      Left = 40
      Top = 144
      Width = 57
      Height = 13
      AutoSize = False
      Caption = 'Length_In:'
    end
  end
  object BitBtn1: TBitBtn
    Left = 312
    Top = 280
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkClose
  end
  object DBMemo1: TDBMemo
    Left = 264
    Top = 112
    Width = 201
    Height = 153
    DataField = 'Notes'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 288
    Top = 16
  end
  object Table1: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'biolife.db'
    Left = 248
    Top = 16
  end
end
