inherited ClassInfo: TClassInfo
  Left = 264
  Top = 117
  Caption = #29677#32423#20449#24687#32500#25252
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label3: TLabel
      Caption = #29677#32423#32534#21495
    end
    inherited Label4: TLabel
      Caption = #24180#32423
    end
    inherited Label5: TLabel
      Caption = #29677#32423#21517#31216
    end
  end
  inherited DBGrid1: TDBGrid
    Height = 225
    Columns = <
      item
        Expanded = False
        FieldName = #29677#32423#32534#21495
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24180#32423
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29677#32423#21517#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29677#32423#31616#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20154#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29677#20027#20219
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Top = 320
    Height = 170
    object Label6: TLabel
      Left = 88
      Top = 32
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #29677#32423#32534#21495
    end
    object Label7: TLabel
      Left = 272
      Top = 32
      Width = 41
      Height = 13
      AutoSize = False
      Caption = #24180#32423
    end
    object Label8: TLabel
      Left = 408
      Top = 32
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #29677#32423#21517#31216
    end
    object Label9: TLabel
      Left = 440
      Top = 96
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #29677#20027#20219
    end
    object Label10: TLabel
      Left = 312
      Top = 96
      Width = 41
      Height = 13
      AutoSize = False
      Caption = #20154#25968
    end
    object Label11: TLabel
      Left = 88
      Top = 96
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #29677#32423#31616#31216
    end
    object DBEdit1: TDBEdit
      Left = 88
      Top = 48
      Width = 161
      Height = 21
      DataField = #29677#32423#32534#21495
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 272
      Top = 48
      Width = 105
      Height = 21
      DataField = #24180#32423
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 408
      Top = 48
      Width = 161
      Height = 21
      DataField = #29677#32423#21517#31216
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 88
      Top = 112
      Width = 201
      Height = 21
      DataField = #29677#32423#31616#31216
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 312
      Top = 112
      Width = 105
      Height = 21
      DataField = #20154#25968
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 440
      Top = 112
      Width = 129
      Height = 21
      DataField = #29677#20027#20219
      DataSource = DataSource1
      TabOrder = 5
    end
  end
  inherited ADOTable1: TADOTable
    Active = True
    TableName = #29677#32423#20449#24687
  end
  inherited ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=eisbook;Use Procedure for Prepare=1;Aut' +
      'o Translate=True;Packet Size=4096;Workstation ID=ME109;Use Encry' +
      'ption for Data=False;Tag with column collation when possible=Fal' +
      'se'
  end
end
