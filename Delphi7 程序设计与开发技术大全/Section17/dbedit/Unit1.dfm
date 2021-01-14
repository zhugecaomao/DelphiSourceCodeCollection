object Form1: TForm1
  Left = 259
  Top = 197
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
    Left = 160
    Top = 24
    Width = 200
    Height = 25
    DataSource = DataSource1
    TabOrder = 0
    OnClick = DBNavigator1Click
  end
  object Panel1: TPanel
    Left = 280
    Top = 104
    Width = 185
    Height = 97
    TabOrder = 1
    object Label6: TLabel
      Left = 48
      Top = 72
      Width = 3
      Height = 13
    end
    object Button1: TButton
      Left = 54
      Top = 24
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 24
    Top = 88
    Width = 209
    Height = 217
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 2
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #22269#23478
    end
    object Label2: TLabel
      Left = 32
      Top = 64
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #39318#37117
    end
    object Label3: TLabel
      Left = 24
      Top = 96
      Width = 41
      Height = 13
      AutoSize = False
      Caption = #25152#22312#27954
    end
    object Label4: TLabel
      Left = 32
      Top = 132
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #38754#31215
    end
    object Label5: TLabel
      Left = 32
      Top = 164
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #20154#21475
    end
    object Edit1: TEdit
      Left = 120
      Top = 24
      Width = 65
      Height = 21
      TabOrder = 0
      OnClick = Edit1Click
    end
    object DBEdit1: TDBEdit
      Left = 112
      Top = 64
      Width = 81
      Height = 21
      DataField = 'Capital'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 112
      Top = 96
      Width = 81
      Height = 21
      DataField = 'Continent'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 112
      Top = 128
      Width = 81
      Height = 21
      DataField = 'Area'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 112
      Top = 160
      Width = 81
      Height = 21
      DataField = 'Population'
      DataSource = DataSource1
      TabOrder = 4
    end
  end
  object BitBtn1: TBitBtn
    Left = 344
    Top = 248
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkClose
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 48
    Top = 24
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'country.db'
    Left = 104
    Top = 24
  end
end
