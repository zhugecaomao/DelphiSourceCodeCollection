object Form3: TForm3
  Left = 412
  Top = 287
  BorderStyle = bsNone
  Caption = 'Form3'
  ClientHeight = 113
  ClientWidth = 303
  Color = 16628902
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 303
    Height = 113
    Align = alClient
    BorderStyle = bsSingle
    Color = 16628902
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = -3
      Top = 48
      Width = 302
      Height = 17
      Shape = bsBottomLine
    end
    object ProgressBar1: TProgressBar
      Left = 16
      Top = 80
      Width = 273
      Height = 16
      Min = 0
      Max = 100
      Smooth = True
      TabOrder = 0
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 256
    Top = 8
  end
end
