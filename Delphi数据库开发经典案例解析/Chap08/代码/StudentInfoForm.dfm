inherited StudentInfo: TStudentInfo
  Left = 227
  Top = 91
  Caption = #23398#29983#20449#24687#32500#25252
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label3: TLabel
      Caption = #23398#21495
    end
    inherited Label4: TLabel
      Caption = #22995#21517
    end
    inherited Label5: TLabel
      Caption = #24180#32423
    end
  end
  inherited ToolBar1: TToolBar
    ButtonWidth = 49
    inherited ToolButton2: TToolButton
      Left = 53
    end
    inherited ToolButton3: TToolButton
      Left = 106
    end
    inherited ToolButton4: TToolButton
      Left = 159
    end
    inherited ToolButton5: TToolButton
      Left = 212
    end
    inherited ToolButton6: TToolButton
      Left = 220
    end
    inherited ToolButton7: TToolButton
      Left = 259
    end
    inherited ToolButton8: TToolButton
      Left = 298
    end
    inherited ToolButton9: TToolButton
      Left = 337
    end
    inherited ToolButton10: TToolButton
      Left = 345
    end
    inherited ToolButton11: TToolButton
      Left = 384
    end
    inherited ToolButton12: TToolButton
      Left = 423
    end
    inherited ToolButton13: TToolButton
      Left = 431
    end
  end
  inherited Panel2: TPanel
    object Label9: TLabel
      Left = 48
      Top = 80
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #36523#20221#35777#21495
    end
    object Label8: TLabel
      Left = 408
      Top = 32
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #24180#32423
    end
    object Label7: TLabel
      Left = 184
      Top = 32
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #22995#21517
    end
    object Label6: TLabel
      Left = 48
      Top = 32
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #23398#21495
    end
    object Label15: TLabel
      Left = 184
      Top = 136
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #23398#31821
    end
    object Label14: TLabel
      Left = 48
      Top = 136
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #31821#36143
    end
    object Label13: TLabel
      Left = 440
      Top = 80
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #27665#26063
    end
    object Label12: TLabel
      Left = 320
      Top = 80
      Width = 81
      Height = 13
      AutoSize = False
      Caption = #25919#27835#38754#35980
    end
    object Label11: TLabel
      Left = 320
      Top = 32
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #24615#21035
    end
    object Label10: TLabel
      Left = 184
      Top = 80
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #29677#32423
    end
    object DBEdit4: TDBEdit
      Left = 48
      Top = 96
      Width = 121
      Height = 21
      DataField = #36523#20221#35777#21495
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 184
      Top = 48
      Width = 121
      Height = 21
      DataField = #22995#21517
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 48
      Top = 48
      Width = 121
      Height = 21
      DataField = #23398#21495
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBComboBox1: TDBComboBox
      Left = 320
      Top = 48
      Width = 73
      Height = 21
      DataField = #24615#21035
      DataSource = DataSource1
      ItemHeight = 13
      Items.Strings = (
        #30007
        #22899)
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 408
      Top = 48
      Width = 121
      Height = 21
      DataField = #24180#32423
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit5: TDBEdit
      Left = 184
      Top = 96
      Width = 121
      Height = 21
      DataField = #29677#32423#32534#21495
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBEdit6: TDBEdit
      Left = 320
      Top = 96
      Width = 105
      Height = 21
      DataField = #25919#27835#38754#35980#32534#21495
      DataSource = DataSource1
      TabOrder = 6
    end
    object DBEdit7: TDBEdit
      Left = 440
      Top = 96
      Width = 89
      Height = 21
      DataField = #27665#26063#32534#21495
      DataSource = DataSource1
      TabOrder = 7
    end
    object DBEdit8: TDBEdit
      Left = 48
      Top = 152
      Width = 121
      Height = 21
      DataField = #31821#36143#32534#21495
      DataSource = DataSource1
      TabOrder = 8
    end
    object DBEdit9: TDBEdit
      Left = 184
      Top = 152
      Width = 89
      Height = 21
      DataField = #23398#31821#32534#21495
      DataSource = DataSource1
      TabOrder = 9
    end
    object ComboBox1: TComboBox
      Left = 184
      Top = 96
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 10
      OnSelect = ComboBox1Select
    end
    object ComboBox2: TComboBox
      Left = 320
      Top = 96
      Width = 105
      Height = 21
      ItemHeight = 13
      TabOrder = 11
      OnSelect = ComboBox2Select
    end
    object ComboBox3: TComboBox
      Left = 440
      Top = 96
      Width = 89
      Height = 21
      ItemHeight = 13
      TabOrder = 12
      OnSelect = ComboBox3Select
    end
    object ComboBox4: TComboBox
      Left = 48
      Top = 152
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 13
      OnSelect = ComboBox4Select
    end
    object ComboBox5: TComboBox
      Left = 184
      Top = 152
      Width = 89
      Height = 21
      ItemHeight = 13
      TabOrder = 14
      OnSelect = ComboBox5Select
    end
  end
  inherited ADOTable1: TADOTable
    Active = True
    TableName = #23398#29983#20449#24687
  end
  inherited ADOConnection1: TADOConnection
    Connected = True
  end
end
