object main: Tmain
  Left = 169
  Top = 102
  Width = 760
  Height = 600
  Caption = #36130#21153#31649#29702#31995#32479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 535
    Width = 752
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Text = #25968#25454#24211#24320#21457#32463#20856#26696#20363#35299#26512'   '#28165#21326#22823#23398#20986#29256#31038'   '#29992#25143#30331#24405#21450#26435#38480#31649#29702#37096#20998#21442#35265#36827#38144#23384#23454#20363
        Width = 50
      end>
  end
  object MainMenu1: TMainMenu
    Left = 424
    Top = 24
    object N1: TMenuItem
      Caption = #22522#30784#25968#25454#31649#29702
      object N2: TMenuItem
        Caption = #31185#30446#35774#32622
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #24080#25143#35774#32622
        OnClick = N3Click
      end
    end
    object N4: TMenuItem
      Caption = #20973#35777#31649#29702
      object N5: TMenuItem
        Caption = #20973#35777#36755#20837
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #20973#35777#36807#24080
        OnClick = N6Click
      end
    end
    object N7: TMenuItem
      Caption = #24080#31807#26597#35810
      object N8: TMenuItem
        Caption = #24635#20998#31867#24080
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #26126#32454#24080
        OnClick = N9Click
      end
    end
    object N10: TMenuItem
      Caption = #32467#24080#21450#25253#34920
      object N11: TMenuItem
        Caption = #35797#31639#24179#34913#34920
        OnClick = N11Click
      end
      object N12: TMenuItem
        Caption = #26399#26411#32467#24080
        OnClick = N12Click
      end
      object N13: TMenuItem
        Caption = #36164#20135#36127#20538#34920
        OnClick = N13Click
      end
    end
    object N15: TMenuItem
      Caption = #36864#20986#31995#32479
      OnClick = N15Click
    end
  end
  object ADOQuery3: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=caiwubook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from '#31995#32479#21442#25968#34920)
    Left = 456
    Top = 24
  end
  object ADOCommand1: TADOCommand
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=caiwubook'
    Parameters = <>
    Left = 488
    Top = 24
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=caiwubook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select count(distinct '#20973#35777#32534#21495') '#20973#35777#25968',sum('#20511#26041') '#20511#26041#37329#39069',sum('#36151#26041') '#36151#26041#37329#39069' from '#20998 +
        #24405#34920)
    Left = 528
    Top = 24
  end
end
