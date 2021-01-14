object ProductInfo: TProductInfo
  Left = 199
  Top = 303
  Width = 689
  Height = 481
  Caption = #21830#21697#20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object BtnFirst: TBitBtn
    Left = 16
    Top = 384
    Width = 75
    Height = 25
    Caption = #39318#32426#24405
    TabOrder = 0
    OnClick = BtnFirstClick
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 416
    Width = 75
    Height = 25
    Caption = #26411#32426#24405
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 104
    Top = 416
    Width = 75
    Height = 25
    Caption = #19979#19968#26465
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 104
    Top = 384
    Width = 75
    Height = 25
    Caption = #19978#19968#26465
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 280
    Top = 384
    Width = 75
    Height = 25
    Caption = #21047#26032
    TabOrder = 6
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 192
    Top = 384
    Width = 75
    Height = 25
    Caption = #22686#21152
    TabOrder = 4
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 192
    Top = 416
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 5
    OnClick = BitBtn6Click
  end
  object BitBtn7: TBitBtn
    Left = 280
    Top = 416
    Width = 75
    Height = 25
    Caption = #25552#20132
    TabOrder = 7
    OnClick = BitBtn7Click
  end
  object BitBtn8: TBitBtn
    Left = 368
    Top = 416
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 9
    OnClick = BitBtn8Click
  end
  object BitBtn9: TBitBtn
    Left = 368
    Top = 384
    Width = 75
    Height = 25
    Caption = #25171#21360#39044#35272
    TabOrder = 8
    OnClick = BitBtn9Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 372
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 10
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 679
      Height = 370
      Align = alClient
      DataSource = DataSource1
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DRESS'
    TableName = #21830#21697'.db'
    Left = 104
    Top = 248
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 144
    Top = 264
  end
end
