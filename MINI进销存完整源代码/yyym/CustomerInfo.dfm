object CustomerForm: TCustomerForm
  Left = -35
  Top = 204
  Width = 698
  Height = 457
  Caption = #23458#25143#20449#24687
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
    Left = 0
    Top = 368
    Width = 75
    Height = 25
    Caption = #39318#32426#24405
    TabOrder = 0
    OnClick = BtnFirstClick
  end
  object BitBtn1: TBitBtn
    Left = 0
    Top = 400
    Width = 75
    Height = 25
    Caption = #26411#32426#24405
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 88
    Top = 368
    Width = 75
    Height = 25
    Caption = #19979#19968#26465
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 88
    Top = 400
    Width = 75
    Height = 25
    Caption = #19978#19968#26465
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 264
    Top = 368
    Width = 75
    Height = 25
    Caption = #21047#26032
    TabOrder = 6
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 176
    Top = 368
    Width = 75
    Height = 25
    Caption = #22686#21152
    TabOrder = 4
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 176
    Top = 400
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 5
    OnClick = BitBtn6Click
  end
  object BitBtn7: TBitBtn
    Left = 264
    Top = 400
    Width = 75
    Height = 25
    Caption = #25552#20132
    TabOrder = 7
    OnClick = BitBtn7Click
  end
  object BitBtn8: TBitBtn
    Left = 352
    Top = 400
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 9
    OnClick = BitBtn8Click
  end
  object BitBtn9: TBitBtn
    Left = 352
    Top = 368
    Width = 75
    Height = 25
    Caption = #25171#21360#39044#35272
    TabOrder = 8
    OnClick = BitBtn9Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 690
    Height = 361
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 10
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 688
      Height = 359
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
    TableName = #23458#25143'.db'
    Left = 128
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 88
    Top = 200
  end
end
