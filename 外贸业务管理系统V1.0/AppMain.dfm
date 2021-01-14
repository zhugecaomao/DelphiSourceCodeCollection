object AppMain_frm: TAppMain_frm
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'AppMain_frm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 88
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 280
    Top = 104
    object N1: TMenuItem
      Caption = #31995#32479#31649#29702
      object N2: TMenuItem
        Caption = #34920#20449#24687#31649#29702
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #34920#27169#26495#31649#29702
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #34920#32500#25252
        OnClick = N4Click
      end
    end
  end
end
