object ChildForm: TChildForm
  Left = 230
  Top = 145
  Width = 398
  Height = 274
  Caption = 'ChildForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 390
    Height = 228
    Align = alClient
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 128
    Top = 48
    object EditM: TMenuItem
      Caption = #32534#36753'(&E)'
      GroupIndex = 1
      object X1: TMenuItem
        Caption = #21098#20999'(&X)'
      end
      object C1: TMenuItem
        Caption = #22797#21046'(&C)'
      end
      object P1: TMenuItem
        Caption = #31896#36148'(&P)'
      end
    end
  end
end
