inherited ChargeItm: TChargeItm
  Left = 214
  Top = 152
  Caption = #25910#36153#39033#30446
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label3: TLabel
      Caption = #25340#38899#30721
    end
    inherited Label4: TLabel
      Caption = #32534#21495
    end
    inherited Label5: TLabel
      Caption = #21517#31216
    end
  end
  inherited Panel2: TPanel
    object Label6: TLabel
      Left = 40
      Top = 40
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #32534#21495
    end
    object Label7: TLabel
      Left = 176
      Top = 40
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #21517#31216
    end
    object Label8: TLabel
      Left = 312
      Top = 40
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #25340#38899#30721
    end
    object Label9: TLabel
      Left = 448
      Top = 40
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #36153#29992
    end
    object Label10: TLabel
      Left = 40
      Top = 96
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #30149#31181#20998#31867
    end
    object Label11: TLabel
      Left = 312
      Top = 96
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #22791#27880
    end
    object Label15: TLabel
      Left = 176
      Top = 96
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #36153#29992#20998#31867
    end
    object DBEdit1: TDBEdit
      Left = 40
      Top = 56
      Width = 121
      Height = 21
      DataField = #32534#21495
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 176
      Top = 56
      Width = 121
      Height = 21
      DataField = #21517#31216
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 312
      Top = 56
      Width = 121
      Height = 21
      DataField = #25340#38899#30721
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 448
      Top = 56
      Width = 121
      Height = 21
      DataField = #36153#29992
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 40
      Top = 112
      Width = 121
      Height = 21
      DataField = #30149#31181#20998#31867
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 312
      Top = 112
      Width = 121
      Height = 21
      DataField = #22791#27880
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBComboBox1: TDBComboBox
      Left = 176
      Top = 112
      Width = 113
      Height = 21
      DataField = #36153#29992#20998#31867
      DataSource = DataSource1
      ItemHeight = 13
      Items.Strings = (
        #21270#39564#36153
        #26816#26597#36153
        #35786#26029#36153
        #27835#30103#36153
        #20854#20182)
      TabOrder = 6
    end
  end
  inherited ADOTable1: TADOTable
    Active = True
    TableName = #38376#35786#25910#36153#39033#30446
  end
  inherited ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=hisbook'
  end
end
