object Formgysjtcx: TFormgysjtcx
  Left = 113
  Top = 115
  Width = 612
  Height = 385
  Caption = #20379#24212#21830#20855#20307#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 604
    Height = 358
    Align = alClient
    Caption = #20379#24212#21830#20855#20307#26597#35810
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 40
      Width = 600
      Height = 316
      Align = alBottom
      DataSource = DMypgl.DSjtcx
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object BitBtn1: TBitBtn
      Left = 496
      Top = 11
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
end
