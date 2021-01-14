inherited Debt: TDebt
  Left = 196
  Top = 130
  Caption = #28040#36153#35760#24080
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label3: TLabel
      Caption = #20837#20303#21333#21495
    end
    inherited Label4: TLabel
      Caption = #28040#36153#20869#23481
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
        FieldName = #24080#21333#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20837#20303#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #28040#36153#20869#23481
        Visible = True
      end
      item
        Expanded = False
        FieldName = #28040#36153#37329#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = #28040#36153#26102#38388
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22791#27880
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    object Label6: TLabel
      Left = 32
      Top = 48
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #20837#20303#21333#21495
    end
    object Label7: TLabel
      Left = 280
      Top = 80
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #28040#36153#20869#23481
    end
    object Label8: TLabel
      Left = 32
      Top = 80
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #28040#36153#37329#39069
    end
    object Label9: TLabel
      Left = 280
      Top = 48
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #28040#36153#26102#38388
    end
    object Label10: TLabel
      Left = 32
      Top = 112
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #22791#27880
    end
    object DBEdit1: TDBEdit
      Left = 102
      Top = 43
      Width = 121
      Height = 21
      DataField = #20837#20303#21333#21495
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 102
      Top = 77
      Width = 121
      Height = 21
      DataField = #28040#36153#37329#39069
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBComboBox1: TDBComboBox
      Left = 350
      Top = 74
      Width = 123
      Height = 21
      DataField = #28040#36153#20869#23481
      DataSource = DataSource1
      ItemHeight = 13
      Items.Strings = (
        #21152#25910#25151#36153
        #21152#25910#27700#30005#36153
        #35270#39057#28857#25773#36153
        #23485#24102#19978#32593#36153
        #21830#21697#20351#29992#36153
        #20854#20182#36153#29992)
      TabOrder = 2
    end
    object DBComboBox2: TDBComboBox
      Left = 350
      Top = 43
      Width = 123
      Height = 21
      DataField = #28040#36153#26102#38388
      DataSource = DataSource1
      ItemHeight = 13
      TabOrder = 3
      OnDropDown = DBComboBox2DropDown
      OnExit = DBComboBox2Exit
    end
    object BitBtn2: TBitBtn
      Left = 230
      Top = 42
      Width = 25
      Height = 21
      TabOrder = 4
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
    object DBEdit3: TDBEdit
      Left = 102
      Top = 109
      Width = 371
      Height = 21
      DataField = #22791#27880
      DataSource = DataSource1
      TabOrder = 5
    end
  end
  object MonthCalendar1: TMonthCalendar [4]
    Left = 368
    Top = 168
    Width = 309
    Height = 154
    Date = 38115.840782719900000000
    TabOrder = 4
    Visible = False
    OnDblClick = MonthCalendar1DblClick
  end
  inherited ImageList1: TImageList
    Left = 536
  end
  inherited ADOTable1: TADOTable
    Active = True
    TableName = #24080#21333#26126#32454
    Left = 568
  end
  inherited DataSource1: TDataSource
    Left = 504
  end
  inherited ADOQuery1: TADOQuery
    Left = 600
  end
end
