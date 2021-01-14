object main: Tmain
  Left = 69
  Top = 313
  Width = 820
  Height = 660
  Caption = #25945#21153#31649#29702#31995#32479
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
    Top = 595
    Width = 812
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
    Left = 120
    Top = 88
    object N1: TMenuItem
      Caption = #22522#30784#32500#25252
      object N2: TMenuItem
        Caption = #29677#32423#20449#24687#32500#25252
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #23398#29983#20449#24687#32500#25252
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #35838#31243#20449#24687#32500#25252
        OnClick = N4Click
      end
    end
    object N5: TMenuItem
      Caption = #25945#23398#31649#29702
      object N6: TMenuItem
        Caption = #23398#29983#36873#35838
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #35838#34920#26597#35810
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #25104#32489#36755#20837
        OnClick = N8Click
      end
    end
    object N9: TMenuItem
      Caption = #25253#34920#32479#35745
      object N10: TMenuItem
        Caption = #25171#21360#25104#32489#21333
        OnClick = N10Click
      end
    end
    object N11: TMenuItem
      Caption = #36864#20986
    end
  end
end
