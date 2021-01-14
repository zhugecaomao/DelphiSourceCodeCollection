inherited XtdyForm: TXtdyForm
  Left = 176
  Top = 45
  Width = 550
  Height = 500
  ActiveControl = dbgXtdy
  Caption = #31995#32479#23450#20041
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 542
    Height = 80
    DesignSize = (
      542
      80)
    inherited lblTitle: TLabel
      Left = 207
    end
    object cmbOption: TComboBox
      Left = 6
      Top = 53
      Width = 100
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 0
      Text = #32534#21495
      Items.Strings = (
        #32534#21495
        #21517#31216)
    end
    object cmbExpress: TComboBox
      Left = 106
      Top = 53
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
      Left = 206
      Top = 53
      Width = 150
      Height = 20
      TabOrder = 2
    end
    object btnLoca: TBitBtn
      Left = 359
      Top = 50
      Width = 75
      Height = 25
      Caption = #26597#25214'(&L)'
      TabOrder = 3
      OnClick = btnLocaClick
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
    object lblState: TStaticText
      Left = 470
      Top = 9
      Width = 64
      Height = 28
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      BevelKind = bkFlat
      BorderStyle = sbsSingle
      Caption = #27983#35272
      Font.Charset = GB2312_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
  end
  inherited Panel2: TPanel
    Top = 80
    Width = 542
    Height = 358
    object dbgXtdy: TDBGrid
      Left = 5
      Top = 5
      Width = 532
      Height = 348
      Align = alClient
      Color = clMoneyGreen
      DataSource = dsXtdy
      FixedColor = clGradientActiveCaption
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
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
    Top = 438
    Width = 542
    DesignSize = (
      542
      35)
    inherited btnHelp: TBitBtn
      Left = 383
    end
    inherited btnClose: TBitBtn
      Left = 462
    end
    object btnPrint: TBitBtn
      Left = 304
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360'(&P)'
      TabOrder = 2
      OnClick = btnPrintClick
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
  inherited DosMove1: TDosMove
    Left = 88
  end
  object tblXtdy: TTable
    BeforePost = tblXtdyBeforePost
    BeforeDelete = tblXtdyBeforeDelete
    OnPostError = tblXtdyPostError
    DatabaseName = 'LfHotelUser'
    Left = 24
    Top = 8
  end
  object dsXtdy: TDataSource
    DataSet = tblXtdy
    OnStateChange = dsXtdyStateChange
    Left = 56
    Top = 8
  end
end
