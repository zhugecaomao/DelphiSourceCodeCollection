inherited RoomType: TRoomType
  Left = 205
  Top = 131
  Caption = #23458#25151#31867#22411#35774#32622
  OldCreateOrder = True
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
  inherited DBGrid1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = #31867#22411#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31867#22411#21517#31216
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20215#26684
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25340#25151#20215#26684
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21487#36229#39044#23450#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26159#21542#21487#25340#25151
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    object Label6: TLabel
      Left = 56
      Top = 64
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #31867#22411#32534#21495
    end
    object Label7: TLabel
      Left = 216
      Top = 64
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #31867#22411#21517#31216
    end
    object Label8: TLabel
      Left = 376
      Top = 64
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #20215#26684
    end
    object DBEdit1: TDBEdit
      Left = 56
      Top = 80
      Width = 121
      Height = 21
      DataField = #31867#22411#32534#21495
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 216
      Top = 80
      Width = 121
      Height = 21
      DataField = #31867#22411#21517#31216
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 376
      Top = 80
      Width = 121
      Height = 21
      DataField = #20215#26684
      DataSource = DataSource1
      TabOrder = 2
    end
  end
  inherited ADOTable1: TADOTable
    Active = True
    TableName = #23458#25151#31867#22411
  end
end
