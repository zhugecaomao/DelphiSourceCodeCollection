inherited CheckOut: TCheckOut
  Left = 207
  Top = 107
  Caption = #25910#38134#36864#25151
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label3: TLabel
      Caption = #20837#20303#21333#21495
    end
    inherited Label4: TLabel
      Caption = #23458#25151#32534#21495
    end
    inherited Label5: TLabel
      Visible = False
    end
    inherited Edit3: TEdit
      Visible = False
    end
  end
  inherited ToolBar1: TToolBar
    inherited ToolButton6: TToolButton
      Visible = False
    end
    inherited ToolButton7: TToolButton
      Visible = False
    end
    inherited ToolButton8: TToolButton
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited ToolButton11: TToolButton
      Visible = False
    end
  end
  inherited DBGrid1: TDBGrid
    Height = 137
    Columns = <
      item
        Expanded = False
        FieldName = #20837#20303#21333#21495
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23458#25151#31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23458#25151#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25269#24215#26102#38388
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31163#24215#26102#38388
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20837#20303#20215#26684
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21152#24202#20215#26684
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39044#25910#27454
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24212#25910#24080#27454
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32467#24080#37329#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26159#21542#32467#24080
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32467#24080#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20184#27454#26041#24335
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Top = 384
    Height = 106
    Enabled = True
    object Label6: TLabel
      Left = 176
      Top = 24
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #32467#24080#37329#39069
    end
    object Label7: TLabel
      Left = 280
      Top = 24
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #20184#27454#26041#24335
    end
    object BitBtn2: TBitBtn
      Left = 32
      Top = 40
      Width = 129
      Height = 25
      Cancel = True
      Caption = #35745#31639#24212#25910#36134#27454
      ModalResult = 7
      TabOrder = 0
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00887000000000
        7888880888888888088888080808999808888808888888880888880808080808
        0888880888888888088888080808080808888808888888880888880808080808
        0888880888888888088888080000000808888808000E0E080888880800000008
        0888880888888888088888088888888808888870000000007888}
    end
    object BitBtn3: TBitBtn
      Left = 416
      Top = 40
      Width = 129
      Height = 25
      Caption = #25910#38134#32467#24080#36864#25151
      TabOrder = 1
      OnClick = BitBtn3Click
      Kind = bkYes
    end
    object DBEdit1: TDBEdit
      Left = 176
      Top = 40
      Width = 81
      Height = 21
      DataField = #32467#24080#37329#39069
      DataSource = DataSource1
      TabOrder = 2
    end
    object ComboBox1: TComboBox
      Left = 280
      Top = 40
      Width = 113
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        #29616#37329
        #25903#31080
        #20449#29992#21345
        #20195#37329#21048
        #20854#20182)
    end
  end
  object DBGrid2: TDBGrid [4]
    Left = 0
    Top = 236
    Width = 689
    Height = 145
    DataSource = DataSource2
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
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
  inherited ImageList1: TImageList
    Left = 504
  end
  inherited ADOTable1: TADOTable
    Active = True
    AutoCalcFields = False
    TableName = #20837#20303#21333
    Left = 536
  end
  inherited DataSource1: TDataSource
    Left = 472
  end
  inherited ADOQuery1: TADOQuery
    Left = 568
  end
  object DataSource2: TDataSource
    DataSet = ADOTable2
    OnDataChange = DataSource2DataChange
    Left = 600
    Top = 8
  end
  object ADOTable2: TADOTable
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=hotelbook'
    CursorType = ctStatic
    TableName = #24080#21333#26126#32454
    Left = 632
    Top = 8
  end
  object ADOCommand1: TADOCommand
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=hotelbook'
    Parameters = <>
    Left = 664
    Top = 8
  end
end
