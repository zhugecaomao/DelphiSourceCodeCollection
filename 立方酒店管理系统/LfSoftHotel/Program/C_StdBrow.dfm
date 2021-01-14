inherited StdBrowForm: TStdBrowForm
  Caption = 'StdBrowForm'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 74
    DesignSize = (
      536
      74)
    object cmbOption: TComboBox
      Left = 11
      Top = 47
      Width = 100
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 0
    end
    object cmbExpress: TComboBox
      Left = 111
      Top = 47
      Width = 100
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 1
      Text = #31561#20110
      Items.Strings = (
        #31561#20110)
    end
    object edtValue: TEdit
      Left = 211
      Top = 47
      Width = 150
      Height = 20
      TabOrder = 2
    end
    object btnLoca: TBitBtn
      Left = 365
      Top = 44
      Width = 75
      Height = 25
      Caption = #26597#25214'(&L)'
      TabOrder = 3
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888800000888880000080F000888880F00080F000888880F
        0008000000080000000800F000000F00000800F000800F00000800F000800F00
        00088000000000000088880F00080F0008888800000800000888888000888000
        88888880F08880F0888888800088800088888888888888888888}
    end
  end
  inherited Panel2: TPanel
    Top = 74
    Height = 239
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 526
      Height = 229
      Align = alClient
      Color = clMoneyGreen
      DataSource = dsWork
      FixedColor = clSkyBlue
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
    end
  end
  inherited Panel3: TPanel
    object btnPrint: TBitBtn
      Left = 296
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360'(&P)'
      TabOrder = 2
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888F8800000000000888808888888880808800000000000008080888888BBB88
        0008088888877788080800000000000008800888888888808080800000000008
        0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
        088888880FFFFFFFF08888888000000000888888888888888888}
    end
  end
  object qryWork: TQuery
    Left = 16
    Top = 8
  end
  object dsWork: TDataSource
    DataSet = qryWork
    Left = 56
    Top = 8
  end
end
