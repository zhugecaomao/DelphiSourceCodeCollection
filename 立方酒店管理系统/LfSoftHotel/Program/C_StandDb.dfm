inherited StandDbForm: TStandDbForm
  Left = 169
  Top = 96
  Width = 550
  Height = 400
  Caption = 'StandDbForm'
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 542
    Height = 119
    DesignSize = (
      542
      119)
    inherited lblTitle: TLabel
      Left = 209
    end
    inherited Image1: TImage
      Left = 172
    end
    object DBNavPlus1: TDBNavPlus
      Left = 11
      Top = 74
      Width = 200
      Height = 40
      DataSource = dsWork
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      ConfirmDelete = False
      TabOrder = 0
      Captions.Strings = (
        #31532#19968#20010
        #21069#19968#20010
        #21518#19968#20010
        #26411#19968#20010
        #28155#21152
        #21024#38500
        #20462#25913
        #20445#23384
        #21462#28040
        #21047#26032)
      Margin = -1
    end
    object cmbOption: TComboBox
      Left = 11
      Top = 48
      Width = 100
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 1
    end
    object cmbExpress: TComboBox
      Left = 111
      Top = 48
      Width = 100
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 2
      Text = #31561#20110
      Items.Strings = (
        #31561#20110)
    end
    object edtValue: TEdit
      Left = 211
      Top = 48
      Width = 150
      Height = 20
      TabOrder = 3
    end
    object btnLoca: TBitBtn
      Left = 365
      Top = 45
      Width = 75
      Height = 25
      Caption = #26597#25214'(&L)'
      TabOrder = 4
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
    object DBNavPlus2: TDBNavPlus
      Left = 211
      Top = 74
      Width = 300
      Height = 40
      DataSource = dsWork
      VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      ConfirmDelete = False
      TabOrder = 5
      Captions.Strings = (
        #31532#19968#20010
        #21069#19968#20010
        #21518#19968#20010
        #26411#19968#20010
        #28155#21152
        #21024#38500
        #20462#25913
        #20445#23384
        #21462#28040
        #21047#26032)
      Margin = -1
    end
    object lblState: TStaticText
      Left = 468
      Top = 8
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
      TabOrder = 6
    end
  end
  inherited Panel2: TPanel
    Top = 119
    Width = 542
    Height = 219
    BorderWidth = 10
    object Bevel1: TBevel
      Left = 10
      Top = 10
      Width = 522
      Height = 199
      Align = alClient
      Shape = bsFrame
    end
  end
  inherited Panel3: TPanel
    Top = 338
    Width = 542
    DesignSize = (
      542
      35)
    inherited btnHelp: TBitBtn
      Left = 378
    end
    object btnPrint: TBitBtn
      Left = 300
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
  object qryWork: TQuery [3]
    BeforeDelete = qryWorkBeforeDelete
    OnPostError = qryWorkPostError
    Left = 16
    Top = 8
  end
  object dsWork: TDataSource [4]
    DataSet = qryWork
    OnStateChange = dsWorkStateChange
    Left = 56
    Top = 8
  end
end
