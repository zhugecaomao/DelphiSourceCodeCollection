inherited StoreSearch: TStoreSearch
  Left = 202
  Top = 101
  Caption = #33647#21697#24211#23384#26597#35810
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label3: TLabel
      Left = 118
      Width = 35
      Caption = #24211#25151
    end
    inherited Label4: TLabel
      Caption = #33647#21697#32534#21495
    end
    inherited Label5: TLabel
      Caption = #21517#31216
    end
  end
  inherited ToolBar1: TToolBar
    inherited ToolButton5: TToolButton
      Visible = False
    end
    inherited ToolButton6: TToolButton
      Visible = False
    end
    inherited ToolButton7: TToolButton
      Visible = False
    end
    inherited ToolButton8: TToolButton
      Visible = False
    end
    inherited ToolButton9: TToolButton
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
    Height = 393
    Columns = <
      item
        Expanded = False
        FieldName = #32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21517#31216
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24211#25151
        Visible = True
      end
      item
        Expanded = False
        FieldName = #33647#21697#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #33647#21697#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22791#27880
        Width = 256
        Visible = True
      end>
  end
  inherited Panel2: TPanel
    Top = 490
    Height = 6
    Visible = False
  end
  inherited ADOTable1: TADOTable
    Filtered = True
  end
  inherited ADOQuery1: TADOQuery
    CursorType = ctStatic
    SQL.Strings = (
      '')
  end
  inherited ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=hisbook'
  end
end
