inherited BookDocu: TBookDocu
  Left = 214
  Top = 216
  Caption = #22270#20070#26723#26696#31649#29702
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label3: TLabel
      Caption = #26465#24418#30721
    end
    inherited Label4: TLabel
      Caption = #32534#21495
    end
    inherited Label5: TLabel
      Caption = #20070#21517
    end
  end
  inherited DBGrid1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = #26465#24418#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20070#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20316#32773
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35793#32773
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ISBN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20986#29256#31038
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20215#26684
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39029#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20070#26550#21517#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29616#23384#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24211#23384#24635#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20837#24211#26102#38388
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25805#20316#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31616#20171
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20511#20986#27425#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26159#21542#27880#38144
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    object Label6: TLabel
      Left = 32
      Top = 24
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #26465#24418#30721
    end
    object Label7: TLabel
      Left = 176
      Top = 24
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #32534#21495
    end
    object Label8: TLabel
      Left = 280
      Top = 24
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #20070#21517
    end
    object Label9: TLabel
      Left = 32
      Top = 64
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #20316#32773
    end
    object Label10: TLabel
      Left = 176
      Top = 64
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #35793#32773
    end
    object Label11: TLabel
      Left = 280
      Top = 64
      Width = 49
      Height = 13
      AutoSize = False
      Caption = 'ISBN'
    end
    object Label12: TLabel
      Left = 480
      Top = 24
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #31867#22411
    end
    object Label13: TLabel
      Left = 376
      Top = 104
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #25805#20316#21592
    end
    object Label14: TLabel
      Left = 176
      Top = 104
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #39029#30721
    end
    object Label15: TLabel
      Left = 32
      Top = 104
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #20316#32773
    end
    object Label16: TLabel
      Left = 480
      Top = 64
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #20986#29256#31038
    end
    object Label17: TLabel
      Left = 128
      Top = 155
      Width = 41
      Height = 13
      AutoSize = False
      Caption = #31616#20171
    end
    object Label18: TLabel
      Left = 480
      Top = 104
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #20070#26550#21517#31216
    end
    object Label19: TLabel
      Left = 280
      Top = 104
      Width = 49
      Height = 13
      AutoSize = False
      Caption = #20215#26684
    end
    object DBEdit3: TDBEdit
      Left = 280
      Top = 40
      Width = 177
      Height = 21
      DataField = #20070#21517
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 176
      Top = 40
      Width = 81
      Height = 21
      DataField = #32534#21495
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 32
      Top = 40
      Width = 121
      Height = 21
      DataField = #26465#24418#30721
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 32
      Top = 80
      Width = 121
      Height = 21
      DataField = #20316#32773
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 176
      Top = 80
      Width = 81
      Height = 21
      DataField = #35793#32773
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 280
      Top = 80
      Width = 177
      Height = 21
      DataField = 'ISBN'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBComboBox1: TDBComboBox
      Left = 480
      Top = 40
      Width = 137
      Height = 21
      DataField = #31867#22411
      DataSource = DataSource1
      ItemHeight = 13
      TabOrder = 6
    end
    object DBEdit7: TDBEdit
      Left = 32
      Top = 120
      Width = 121
      Height = 21
      DataField = #20215#26684
      DataSource = DataSource1
      TabOrder = 7
    end
    object DBEdit8: TDBEdit
      Left = 176
      Top = 120
      Width = 81
      Height = 21
      DataField = #39029#30721
      DataSource = DataSource1
      TabOrder = 8
      OnKeyPress = DBEdit8KeyPress
    end
    object DBEdit9: TDBEdit
      Left = 376
      Top = 120
      Width = 81
      Height = 21
      DataField = #25805#20316#21592
      DataSource = DataSource1
      TabOrder = 9
    end
    object DBComboBox2: TDBComboBox
      Left = 480
      Top = 80
      Width = 137
      Height = 21
      DataField = #20986#29256#31038
      DataSource = DataSource1
      ItemHeight = 13
      TabOrder = 10
    end
    object DBEdit10: TDBEdit
      Left = 176
      Top = 152
      Width = 425
      Height = 21
      DataField = #31616#20171
      DataSource = DataSource1
      TabOrder = 11
    end
    object DBComboBox3: TDBComboBox
      Left = 480
      Top = 120
      Width = 137
      Height = 21
      DataField = #20070#26550#21517#31216
      DataSource = DataSource1
      ItemHeight = 13
      TabOrder = 12
    end
    object DBCheckBox1: TDBCheckBox
      Left = 31
      Top = 155
      Width = 97
      Height = 17
      Caption = #26159#21542#27880#38144
      DataField = #26159#21542#27880#38144
      DataSource = DataSource1
      TabOrder = 13
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = DBCheckBox1Click
    end
    object DBEdit11: TDBEdit
      Left = 280
      Top = 120
      Width = 73
      Height = 21
      DataField = #20215#26684
      DataSource = DataSource1
      TabOrder = 14
      OnKeyPress = DBEdit11KeyPress
    end
  end
  inherited ADOTable1: TADOTable
    Active = True
    TableName = #22270#20070#20449#24687
  end
  object ADOQuery2: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=libbook'
    Parameters = <>
    Left = 560
    Top = 8
  end
end
