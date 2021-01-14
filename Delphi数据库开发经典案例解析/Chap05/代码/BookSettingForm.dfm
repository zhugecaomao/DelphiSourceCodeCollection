inherited BookSetting: TBookSetting
  Left = 225
  Top = 171
  Caption = #22270#20070#31867#21035#35774#32622
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label3: TLabel
      Caption = #31867#22411#32534#21495
    end
    inherited Label4: TLabel
      Caption = #31867#22411#21517#31216
    end
    inherited Label5: TLabel
      Visible = False
    end
    inherited Edit3: TEdit
      Visible = False
    end
  end
  inherited Panel2: TPanel
    object Label6: TLabel
      Left = 56
      Top = 48
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #31867#22411#32534#21495
    end
    object Label7: TLabel
      Left = 56
      Top = 80
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #31867#22411#21517#31216
    end
    object Label8: TLabel
      Left = 280
      Top = 48
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #21487#20511#22825#25968
    end
    object DBEdit1: TDBEdit
      Left = 131
      Top = 44
      Width = 121
      Height = 21
      DataField = #31867#22411#32534#21495
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 339
      Top = 44
      Width = 121
      Height = 21
      DataField = #21487#20511#22825#25968
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 131
      Top = 76
      Width = 326
      Height = 21
      DataField = #31867#22411#21517#31216
      DataSource = DataSource1
      TabOrder = 2
    end
  end
  inherited ADOTable1: TADOTable
    Active = True
    TableName = #22270#20070#31867#22411
  end
  object ADOQuery2: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=libbook'
    Parameters = <>
    Left = 568
    Top = 8
  end
end
