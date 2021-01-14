inherited fmBatchinput: TfmBatchinput
  Left = 104
  Top = 144
  Caption = #37197#36865#25910#36135#21333
  ClientWidth = 666
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 666
    Height = 59
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 12
      Width = 105
      Height = 19
      Caption = #37197#36865#25910#36135#21333
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = #38582#20070
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 270
      Top = 24
      Width = 78
      Height = 13
      Caption = #21333#25454#26085#26399#20174#65306
    end
    object Label3: TLabel
      Left = 456
      Top = 24
      Width = 26
      Height = 13
      Caption = #21040#65306
    end
    object btnSelect: TSpeedButton
      Left = 589
      Top = 19
      Width = 65
      Height = 21
      Caption = #26816#32034
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        333333773337777333333078F8F87033333337F3333337F33333778F8F8F8773
        333337333333373F333307F8F8F8F70333337F33FFFFF37F3333078999998703
        33337F377777337F333307F8F8F8F703333373F3333333733333778F8F8F8773
        333337F3333337F333333078F8F870333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      OnClick = btnSelectClick
    end
    object dtp1: TDateTimePicker
      Left = 344
      Top = 19
      Width = 104
      Height = 21
      CalAlignment = dtaLeft
      Date = 38128.6157616898
      Time = 38128.6157616898
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object dtp2: TDateTimePicker
      Left = 480
      Top = 19
      Width = 104
      Height = 21
      CalAlignment = dtaLeft
      Date = 38128.6157616898
      Time = 38128.6157616898
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object RDG: TRadioGroup
      Left = 120
      Top = 8
      Width = 147
      Height = 47
      Caption = #25910#36135#31867#22411
      ItemIndex = 0
      Items.Strings = (
        #27491#24120#25910#36135
        #39044#23450#25910#36135)
      TabOrder = 2
      OnClick = RDGClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 59
    Width = 666
    Height = 289
    Align = alClient
    DataSource = dsbatch
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'BillNo'
        Title.Alignment = taCenter
        Title.Caption = #21333#25454#32534#21495
        Width = 176
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'vcSendStockID'
        Title.Alignment = taCenter
        Title.Caption = #21457#36135#20179#24211
        Width = 197
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dtDrawDate'
        Title.Alignment = taCenter
        Title.Caption = #21457#36135#26085#26399
        Width = 173
        Visible = True
      end>
  end
  object dsbatch: TDataSource
    DataSet = dmmain.dsquery
    Left = 480
    Top = 16
  end
end
