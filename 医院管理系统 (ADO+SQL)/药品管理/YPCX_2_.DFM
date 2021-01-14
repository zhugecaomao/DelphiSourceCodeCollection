object Formypcx_2: TFormypcx_2
  Left = 153
  Top = 141
  Width = 544
  Height = 362
  Caption = #33647#21697#26597#35810
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
    Width = 536
    Height = 335
    Align = alClient
    Caption = #33647#21697#26597#35810#32467#26524
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 48
      Width = 532
      Height = 285
      Align = alBottom
      DataSource = DMypgl.DSypcx
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object DBNavigator1: TDBNavigator
      Left = 10
      Top = 15
      Width = 355
      Height = 25
      DataSource = DMypgl.DSypcx
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Flat = True
      TabOrder = 1
    end
    object BitBtn_Formypcx_2print: TBitBtn
      Left = 416
      Top = 16
      Width = 75
      Height = 25
      Caption = #25171#21360
      TabOrder = 2
      OnClick = BitBtn_Formypcx_2printClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
end
