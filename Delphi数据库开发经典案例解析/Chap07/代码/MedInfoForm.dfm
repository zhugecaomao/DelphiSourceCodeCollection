inherited MedInfo: TMedInfo
  Left = 170
  Top = 104
  Caption = #33647#21697#20449#24687
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
  inherited DBGrid1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = #32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21517#31216
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35268#26684
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25972#37327#21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25955#37327#21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20837#24211#21333#20215
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20986#24211#21333#20215
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25209#21457#20215
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25972#25955#27604
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20998#31867
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36153#29992#24402#31867
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25340#38899#30721
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25928#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #19978#38480
        Visible = True
      end
      item
        Expanded = False
        FieldName = #19979#38480
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    object Label6: TLabel
      Left = 40
      Top = 16
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #32534#21495
    end
    object Label7: TLabel
      Left = 176
      Top = 16
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #21517#31216
    end
    object Label8: TLabel
      Left = 312
      Top = 16
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #35268#26684
    end
    object Label9: TLabel
      Left = 448
      Top = 16
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #25972#37327#21333#20301
    end
    object Label10: TLabel
      Left = 40
      Top = 56
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #25955#37327#21333#20301
    end
    object Label11: TLabel
      Left = 176
      Top = 56
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #20837#24211#21333#20215
    end
    object Label12: TLabel
      Left = 312
      Top = 56
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #20986#24211#21333#20215
    end
    object Label13: TLabel
      Left = 448
      Top = 56
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #25209#21457#20215
    end
    object Label14: TLabel
      Left = 40
      Top = 104
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #25972#25955#27604
    end
    object Label15: TLabel
      Left = 176
      Top = 104
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #20998#31867
    end
    object Label16: TLabel
      Left = 336
      Top = 104
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #36153#29992#24402#31867
    end
    object Label17: TLabel
      Left = 464
      Top = 104
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #25340#38899#30721
    end
    object Label18: TLabel
      Left = 40
      Top = 152
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #36153#29992#24402#31867
    end
    object Label19: TLabel
      Left = 176
      Top = 152
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #19978#38480
    end
    object Label20: TLabel
      Left = 312
      Top = 152
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #19979#38480
    end
    object DBEdit1: TDBEdit
      Left = 40
      Top = 32
      Width = 121
      Height = 21
      DataField = #32534#21495
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 176
      Top = 32
      Width = 121
      Height = 21
      DataField = #21517#31216
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 312
      Top = 32
      Width = 121
      Height = 21
      DataField = #35268#26684
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 448
      Top = 32
      Width = 121
      Height = 21
      DataField = #25972#37327#21333#20301
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 40
      Top = 72
      Width = 121
      Height = 21
      DataField = #25955#37327#21333#20301
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 176
      Top = 72
      Width = 121
      Height = 21
      DataField = #20837#24211#21333#20215
      DataSource = DataSource1
      TabOrder = 5
      OnKeyPress = DBEdit6KeyPress
    end
    object DBEdit7: TDBEdit
      Left = 312
      Top = 72
      Width = 121
      Height = 21
      DataField = #20986#24211#21333#20215
      DataSource = DataSource1
      TabOrder = 6
      OnKeyPress = DBEdit7KeyPress
    end
    object DBEdit8: TDBEdit
      Left = 448
      Top = 72
      Width = 121
      Height = 21
      DataField = #25209#21457#20215
      DataSource = DataSource1
      TabOrder = 7
      OnKeyPress = DBEdit8KeyPress
    end
    object DBEdit9: TDBEdit
      Left = 40
      Top = 120
      Width = 121
      Height = 21
      DataField = #25972#25955#27604
      DataSource = DataSource1
      TabOrder = 8
      OnKeyPress = DBEdit9KeyPress
    end
    object DBEdit10: TDBEdit
      Left = 336
      Top = 120
      Width = 121
      Height = 21
      DataField = #36153#29992#24402#31867
      DataSource = DataSource1
      TabOrder = 9
    end
    object DBEdit11: TDBEdit
      Left = 472
      Top = 120
      Width = 97
      Height = 21
      DataField = #25340#38899#30721
      DataSource = DataSource1
      TabOrder = 10
    end
    object DBEdit12: TDBEdit
      Left = 40
      Top = 168
      Width = 121
      Height = 21
      DataField = #36153#29992#24402#31867
      DataSource = DataSource1
      TabOrder = 11
    end
    object DBEdit13: TDBEdit
      Left = 176
      Top = 168
      Width = 121
      Height = 21
      DataField = #19978#38480
      DataSource = DataSource1
      TabOrder = 12
      OnKeyPress = DBEdit13KeyPress
    end
    object DBComboBox1: TDBComboBox
      Left = 176
      Top = 120
      Width = 145
      Height = 21
      DataField = #20998#31867
      DataSource = DataSource1
      ItemHeight = 13
      TabOrder = 13
      OnDropDown = DBComboBox1DropDown
    end
    object DBEdit14: TDBEdit
      Left = 312
      Top = 168
      Width = 121
      Height = 21
      DataField = #19979#38480
      DataSource = DataSource1
      TabOrder = 14
      OnKeyPress = DBEdit14KeyPress
    end
  end
  inherited ADOTable1: TADOTable
    Active = True
    TableName = #33647#21697#36164#26009
  end
  inherited ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=hisbook'
  end
end
