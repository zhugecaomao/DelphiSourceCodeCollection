inherited BookOverdue: TBookOverdue
  Left = 250
  Top = 141
  Height = 430
  Caption = #36926#26399#28165#21333
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar [0]
    Visible = False
  end
  inherited DBGrid1: TDBGrid [1]
    Top = 56
    Height = 329
    Columns = <
      item
        Expanded = False
        FieldName = #20511#38405#32534#21495
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22270#20070#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20070#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20511#38405#26102#38388
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24212#36824#26102#38388
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22995#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35835#32773#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32493#20511#27425#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25805#20316#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29366#24577
        Visible = True
      end>
  end
  inherited Panel2: TPanel [2]
    Top = 392
    Height = 9
    Enabled = True
  end
  inherited Panel1: TPanel [3]
    Top = 0
    inherited Label3: TLabel
      Caption = #35835#32773#32534#21495
    end
    inherited Label4: TLabel
      Caption = #22270#20070#32534#21495
    end
    inherited Label5: TLabel
      Caption = #35835#32773#22995#21517
    end
  end
  object ADOQuery2: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=libbook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select a.*,b.*,c.* from '#22270#20070#20511#38405' a,'#22270#20070#20449#24687' b,'#35835#32773#20449#24687' c '
      'where (a.'#22270#20070#32534#21495'=b.'#32534#21495')and(a.'#35835#32773#32534#21495'=c.'#32534#21495')and('#29366#24577'='#39#26410#36824#39')'
      'and(a.'#24212#36824#26102#38388'-getdate()<0)')
    Left = 560
    Top = 8
  end
  object ADOCommand1: TADOCommand
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=libbook'
    Parameters = <>
    Left = 656
    Top = 8
  end
end
