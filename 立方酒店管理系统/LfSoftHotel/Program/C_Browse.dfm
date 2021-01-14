inherited BrowseForm: TBrowseForm
  Left = 148
  Top = 53
  Width = 600
  Height = 500
  Caption = #27983#35272
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 592
    Height = 81
    DesignSize = (
      592
      81)
    inherited lblTitle: TLabel
      Left = 228
    end
    object cmbOption: TComboBox
      Left = 6
      Top = 54
      Width = 100
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 0
      Text = #22995#21517
      Items.Strings = (
        #22995#21517
        #21333#20301#21517#31216)
    end
    object cmbExpress: TComboBox
      Left = 106
      Top = 54
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
      Left = 207
      Top = 54
      Width = 150
      Height = 20
      TabOrder = 2
    end
    object btnLoca: TBitBtn
      Left = 361
      Top = 51
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
    Top = 81
    Width = 592
    Height = 357
    object dbgMaster: TDBGrid
      Left = 5
      Top = 5
      Width = 582
      Height = 172
      Align = alTop
      DataSource = dsMaster
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
    end
    object dbgDetail: TDBGrid
      Left = 5
      Top = 177
      Width = 582
      Height = 175
      Align = alClient
      DataSource = dsDetail
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
    end
  end
  inherited Panel3: TPanel
    Top = 438
    Width = 592
    DesignSize = (
      592
      35)
    inherited btnHelp: TBitBtn
      Left = 433
    end
    inherited btnClose: TBitBtn
      Left = 512
    end
  end
  object qryMaster: TQuery
    Left = 352
    Top = 8
  end
  object qryDetail: TQuery
    DataSource = dsMaster
    Left = 424
    Top = 8
  end
  object dsMaster: TDataSource
    DataSet = qryMaster
    Left = 384
    Top = 8
  end
  object dsDetail: TDataSource
    DataSet = qryDetail
    Left = 456
    Top = 8
  end
end
