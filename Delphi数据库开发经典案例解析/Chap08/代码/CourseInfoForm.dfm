inherited CourseInfo: TCourseInfo
  Left = 206
  Top = 113
  Width = 705
  Caption = #35838#31243#20449#24687#32500#25252
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label3: TLabel
      Caption = #35838#31243#32534#21495
    end
    inherited Label4: TLabel
      Caption = #35838#31243#21517#31216
    end
    inherited Label5: TLabel
      Caption = #25340#38899#30721
    end
  end
  inherited ToolBar1: TToolBar
    Width = 697
  end
  inherited DBGrid1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = #35838#31243#32534#21495
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35838#31243#21517#31216
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35838#31243#31616#31216
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25340#38899#30721
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26412#23398#26399#35838#31243
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25945#24072
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24320#35838#31995#21035
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23398#20998
        Width = 32
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    object Label9: TLabel
      Left = 344
      Top = 88
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #24320#35838#31995#21035
    end
    object Label8: TLabel
      Left = 400
      Top = 32
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #35838#31243#31616#31216
    end
    object Label7: TLabel
      Left = 192
      Top = 32
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #35838#31243#21517#31216
    end
    object Label6: TLabel
      Left = 88
      Top = 32
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #35838#31243#32534#21495
    end
    object Label11: TLabel
      Left = 88
      Top = 88
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #25340#38899#30721
    end
    object Label10: TLabel
      Left = 216
      Top = 88
      Width = 41
      Height = 13
      AutoSize = False
      Caption = #25945#24072
    end
    object Label12: TLabel
      Left = 496
      Top = 88
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #23398#20998
    end
    object DBEdit6: TDBEdit
      Left = 344
      Top = 104
      Width = 129
      Height = 21
      DataField = #24320#35838#31995#21035
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit5: TDBEdit
      Left = 216
      Top = 104
      Width = 105
      Height = 21
      DataField = #25945#24072
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 88
      Top = 104
      Width = 105
      Height = 21
      DataField = #25340#38899#30721
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 400
      Top = 48
      Width = 169
      Height = 21
      DataField = #35838#31243#31616#31216
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 192
      Top = 48
      Width = 185
      Height = 21
      DataField = #35838#31243#21517#31216
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit1: TDBEdit
      Left = 88
      Top = 48
      Width = 81
      Height = 21
      DataField = #35838#31243#32534#21495
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 496
      Top = 104
      Width = 73
      Height = 21
      DataField = #23398#20998
      DataSource = DataSource1
      TabOrder = 6
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 88
      Top = 144
      Width = 209
      Height = 41
      Caption = #26412#23398#26399#35838#31243
      Columns = 2
      DataField = #26412#23398#26399#35838#31243
      DataSource = DataSource1
      Items.Strings = (
        #26159
        #21542)
      TabOrder = 7
      Values.Strings = (
        'Y '
        'N ')
    end
  end
  inherited ADOTable1: TADOTable
    Active = True
    TableName = #35838#31243#20449#24687
  end
  inherited ADOConnection1: TADOConnection
    Connected = True
  end
end
