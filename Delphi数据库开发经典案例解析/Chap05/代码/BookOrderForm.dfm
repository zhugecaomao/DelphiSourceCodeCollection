inherited BookOrder: TBookOrder
  Left = 200
  Top = 133
  Caption = #22270#20070#24449#35746
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label11: TLabel [0]
    Left = 336
    Top = 368
    Width = 57
    Height = 13
    AutoSize = False
    Caption = #22270#20070#21517#31216
  end
  inherited Panel1: TPanel
    inherited Label3: TLabel
      Caption = #24449#35746#32534#21495
    end
    inherited Label4: TLabel
      Caption = #22270#20070#32534#21495
    end
    inherited Label5: TLabel
      Visible = False
    end
    inherited Edit3: TEdit
      Visible = False
    end
  end
  inherited ToolBar1: TToolBar
    object BitBtn3: TBitBtn
      Left = 422
      Top = 0
      Width = 139
      Height = 36
      Caption = #25552#20132#24449#35746#65288#39564#25910#65289
      TabOrder = 0
      OnClick = BitBtn3Click
      Kind = bkOK
    end
  end
  inherited DBGrid1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = #24449#35746#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22270#20070#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35746#36141#32773
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35746#36141#32773#32852#31995#26041#24335
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35746#36141#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35746#36141#21333#20215
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35746#36141#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26159#21542#39564#25910
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39564#25910#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25805#20316#21592
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    object Label6: TLabel
      Left = 32
      Top = 24
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #24449#35746#32534#21495
    end
    object Label7: TLabel
      Left = 176
      Top = 24
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #22270#20070#32534#21495
    end
    object Label8: TLabel
      Left = 352
      Top = 24
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #22270#20070#21517#31216
    end
    object Label9: TLabel
      Left = 32
      Top = 72
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #35746#36141#32773
    end
    object Label10: TLabel
      Left = 176
      Top = 72
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #25805#20316#21592
    end
    object Label12: TLabel
      Left = 320
      Top = 72
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #35746#36141#25968#37327
    end
    object Label13: TLabel
      Left = 432
      Top = 72
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #35746#36141#21333#20215
    end
    object Label14: TLabel
      Left = 32
      Top = 120
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #35746#36141#26085#26399
    end
    object Label15: TLabel
      Left = 304
      Top = 120
      Width = 97
      Height = 13
      AutoSize = False
      Caption = #35746#36141#32773#32852#31995#26041#24335
    end
    object Label16: TLabel
      Left = 176
      Top = 120
      Width = 97
      Height = 13
      AutoSize = False
      Caption = #26159#21542#39564#25910
    end
    object DBEdit1: TDBEdit
      Left = 32
      Top = 40
      Width = 121
      Height = 21
      DataField = #24449#35746#32534#21495
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 176
      Top = 40
      Width = 121
      Height = 21
      DataField = #22270#20070#32534#21495
      DataSource = DataSource1
      TabOrder = 1
      OnChange = DBEdit2Change
    end
    object DBEdit4: TDBEdit
      Left = 32
      Top = 88
      Width = 121
      Height = 21
      DataField = #35746#36141#32773
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 176
      Top = 88
      Width = 121
      Height = 21
      DataField = #25805#20316#21592
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 320
      Top = 88
      Width = 89
      Height = 21
      DataField = #35746#36141#25968#37327
      DataSource = DataSource1
      TabOrder = 4
      OnKeyPress = DBEdit6KeyPress
    end
    object DBEdit7: TDBEdit
      Left = 432
      Top = 88
      Width = 105
      Height = 21
      DataField = #35746#36141#21333#20215
      DataSource = DataSource1
      TabOrder = 5
      OnKeyPress = DBEdit7KeyPress
    end
    object DBEdit8: TDBEdit
      Left = 32
      Top = 136
      Width = 121
      Height = 21
      DataField = #35746#36141#26085#26399
      DataSource = DataSource1
      TabOrder = 6
    end
    object DBEdit9: TDBEdit
      Left = 304
      Top = 136
      Width = 217
      Height = 21
      DataField = #35746#36141#32773#32852#31995#26041#24335
      DataSource = DataSource1
      TabOrder = 7
    end
    object Edit4: TEdit
      Left = 352
      Top = 40
      Width = 185
      Height = 21
      Enabled = False
      TabOrder = 8
    end
    object BitBtn2: TBitBtn
      Left = 303
      Top = 37
      Width = 25
      Height = 25
      TabOrder = 9
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888808888888888888800088888888888800088888888888800
        0888888800000000888888800BBB000888888800BBBBB0088888880BBBBBBB08
        8888880BBB0BBB088888880BB080BB0888888800BB0BB008888888800BBB0088
        8888888800000888888888888888888888888888888888888888}
    end
    object DBComboBox1: TDBComboBox
      Left = 176
      Top = 136
      Width = 105
      Height = 21
      DataField = #26159#21542#39564#25910
      DataSource = DataSource1
      Enabled = False
      ItemHeight = 13
      Items.Strings = (
        'True'
        'False')
      TabOrder = 10
    end
  end
  inherited ImageList1: TImageList
    Left = 600
  end
  inherited ADOTable1: TADOTable
    Active = True
    Filter = #26159#21542#39564#25910'='#39'false'#39
    Filtered = True
    TableName = #22270#20070#24449#35746
    Left = 624
  end
  inherited DataSource1: TDataSource
    Left = 568
  end
  inherited ADOQuery1: TADOQuery
    Left = 656
  end
  object ADOCommand1: TADOCommand
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=libbook'
    Parameters = <>
    Left = 656
    Top = 40
  end
end
