object Main: TMain
  Left = 326
  Top = 327
  Width = 760
  Height = 620
  Caption = #22270#20070#39302#31649#29702#31995#32479
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
    Top = 555
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
    Left = 80
    Top = 56
    object N1: TMenuItem
      Caption = #35835#32773#31649#29702
      object N2: TMenuItem
        Caption = #35835#32773#31867#21035#35774#32622
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #35835#32773#26723#26696#31649#29702
        OnClick = N3Click
      end
    end
    object N4: TMenuItem
      Caption = #22270#20070#31649#29702
      object N5: TMenuItem
        Caption = #22270#20070#31867#21035#35774#32622
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #22270#20070#26723#26696#31649#29702
        OnClick = N6Click
      end
    end
    object N7: TMenuItem
      Caption = #27969#36890#31649#29702
      object N8: TMenuItem
        Caption = #22270#20070#24449#35746
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #22270#20070#20511#38405
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = #22270#20070#24402#36824
        OnClick = N10Click
      end
      object N11: TMenuItem
        Caption = #36926#26399#28165#21333
        OnClick = N11Click
      end
      object N12: TMenuItem
        Caption = #22270#20070#32602#27454
        OnClick = N12Click
      end
    end
    object N13: TMenuItem
      Caption = #36864#20986#31995#32479
      OnClick = N13Click
    end
  end
end
