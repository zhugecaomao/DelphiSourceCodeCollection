object MainForm: TMainForm
  Left = 276
  Top = 117
  Width = 421
  Height = 310
  Caption = 'MDI'#31243#24207#31034#20363
  Color = clAppWorkSpace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowMenu = WindowM
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 144
    Top = 168
    object FileM: TMenuItem
      Caption = #25991#20214'(&F)'
      object O1: TMenuItem
        Caption = #26032#24314'(&N)'
        OnClick = O1Click
      end
      object O2: TMenuItem
        Caption = #25171#24320'(&O)'
      end
      object S1: TMenuItem
        Caption = #20445#23384'(&S)'
      end
      object A1: TMenuItem
        Caption = #21478#23384#20026'(&A)'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object X1: TMenuItem
        Caption = #36864#20986'(&X)'
      end
    end
    object WindowM: TMenuItem
      Caption = #31383#21475'(&W)'
      GroupIndex = 2
      object N3: TMenuItem
        Caption = #26368#22823#21270
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #26368#23567#21270
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #36824#21407
        OnClick = N5Click
      end
    end
    object HelpM: TMenuItem
      Caption = #24110#21161'(&H)'
      GroupIndex = 2
      object A2: TMenuItem
        Caption = #20851#20110'(&A)'
      end
    end
  end
end
