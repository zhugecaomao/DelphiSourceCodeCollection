inherited RoomInfo: TRoomInfo
  Left = 195
  Top = 75
  Caption = #23458#25151#20449#24687#35774#32622
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label3: TLabel
      Caption = #23458#25151#32534#21495
    end
    inherited Label4: TLabel
      Caption = #31867#22411#32534#21495
    end
    inherited Label5: TLabel
      Caption = #27004#23618#32534#21495
    end
  end
  inherited DBGrid1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = #23458#25151#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31867#22411#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #27004#23618#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39069#23450#20154#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24202#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23458#25151#25551#36848
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29366#24577
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26159#21542#21487#25340#25151
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22791#27880
        Width = 90
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    object Label6: TLabel
      Left = 40
      Top = 32
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #23458#25151#32534#21495
    end
    object Label7: TLabel
      Left = 136
      Top = 32
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #31867#22411#32534#21495
    end
    object Label8: TLabel
      Left = 256
      Top = 32
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #27004#23618#32534#21495
    end
    object Label9: TLabel
      Left = 376
      Top = 32
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #39069#23450#20154#25968
    end
    object Label10: TLabel
      Left = 488
      Top = 32
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #24202#25968
    end
    object Label11: TLabel
      Left = 40
      Top = 80
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #23458#25151#25551#36848
    end
    object Label12: TLabel
      Left = 488
      Top = 80
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #29366#24577
    end
    object Label13: TLabel
      Left = 40
      Top = 128
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #22791#27880
    end
    object DBEdit1: TDBEdit
      Left = 40
      Top = 48
      Width = 65
      Height = 21
      DataField = #23458#25151#32534#21495
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 136
      Top = 72
      Width = 89
      Height = 21
      DataField = #31867#22411#32534#21495
      DataSource = DataSource1
      TabOrder = 1
      Visible = False
    end
    object DBEdit3: TDBEdit
      Left = 256
      Top = 72
      Width = 89
      Height = 21
      DataField = #27004#23618#32534#21495
      DataSource = DataSource1
      TabOrder = 2
      Visible = False
    end
    object DBEdit4: TDBEdit
      Left = 376
      Top = 48
      Width = 81
      Height = 21
      DataField = #39069#23450#20154#25968
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 488
      Top = 48
      Width = 81
      Height = 21
      DataField = #24202#25968
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 40
      Top = 96
      Width = 417
      Height = 21
      DataField = #23458#25151#25551#36848
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 488
      Top = 96
      Width = 89
      Height = 21
      DataField = #29366#24577
      DataSource = DataSource1
      Enabled = False
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 40
      Top = 144
      Width = 417
      Height = 21
      DataField = #22791#27880
      DataSource = DataSource1
      TabOrder = 7
    end
    object DBCheckBox1: TDBCheckBox
      Left = 488
      Top = 147
      Width = 97
      Height = 17
      Caption = #26159#21542#21487#25340#25151
      DataField = #26159#21542#21487#25340#25151
      DataSource = DataSource1
      TabOrder = 8
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object ComboBox1: TComboBox
      Left = 136
      Top = 48
      Width = 89
      Height = 21
      ItemHeight = 13
      TabOrder = 9
      OnSelect = ComboBox1Select
    end
    object ComboBox2: TComboBox
      Left = 256
      Top = 48
      Width = 89
      Height = 21
      ItemHeight = 13
      TabOrder = 10
      OnSelect = ComboBox2Select
    end
  end
  inherited ADOTable1: TADOTable
    Active = True
    TableName = #23458#25151#20449#24687
  end
end
