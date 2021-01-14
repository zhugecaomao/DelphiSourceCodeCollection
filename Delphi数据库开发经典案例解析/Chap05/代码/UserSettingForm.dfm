inherited UserSetting: TUserSetting
  Left = 229
  Top = 120
  Caption = #35835#32773#31867#21035#35774#32622
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label3: TLabel
      Caption = #31867#22411
    end
    inherited Label4: TLabel
      Visible = False
    end
    inherited Label5: TLabel
      Visible = False
    end
    inherited Edit2: TEdit
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
      Caption = #35835#32773#31867#22411
    end
    object Label7: TLabel
      Left = 56
      Top = 80
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #26399#21002#20876#20070
    end
    object Label8: TLabel
      Left = 264
      Top = 48
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #22270#20070#20876#20070
    end
    object Label9: TLabel
      Left = 264
      Top = 80
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #32493#20511#27425#25968
    end
    object DBEdit1: TDBEdit
      Left = 131
      Top = 44
      Width = 121
      Height = 21
      DataField = #31867#22411
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 131
      Top = 76
      Width = 121
      Height = 21
      DataField = #26399#21002#20876#20070
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 339
      Top = 44
      Width = 121
      Height = 21
      DataField = #22270#20070#20876#20070
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 339
      Top = 76
      Width = 121
      Height = 21
      DataField = #32493#20511#27425#25968
      DataSource = DataSource1
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 56
      Top = 112
      Width = 401
      Height = 49
      Caption = #20511#38405#33539#22260
      TabOrder = 4
      object DBCheckBox2: TDBCheckBox
        Left = 208
        Top = 24
        Width = 97
        Height = 17
        Caption = #38480#21046#26399#21002
        DataField = #38480#21046#26399#21002
        DataSource = DataSource1
        TabOrder = 0
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object DBCheckBox1: TDBCheckBox
        Left = 80
        Top = 24
        Width = 97
        Height = 17
        Caption = #38480#21046#22270#20070
        DataField = #38480#21046#22270#20070
        DataSource = DataSource1
        TabOrder = 1
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
    end
  end
  inherited ADOTable1: TADOTable
    Active = True
    TableName = #35835#32773#31867#22411
  end
end
