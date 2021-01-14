object pub_search: Tpub_search
  Left = 444
  Top = 325
  Width = 426
  Height = 249
  Caption = #25945#32451#36710#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 41
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 67
      Top = 13
      Width = 14
      Height = 13
      Caption = #65306
    end
    object Edit1: TEdit
      Left = 73
      Top = 10
      Width = 105
      Height = 21
      TabOrder = 0
    end
    object search_Btn: TBitBtn
      Left = 247
      Top = 8
      Width = 49
      Height = 25
      Caption = #26597#35810'(&S)'
      TabOrder = 1
      OnClick = search_BtnClick
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 10
      Width = 57
      Height = 21
      ItemHeight = 13
      TabOrder = 2
    end
    object ok_Btn: TBitBtn
      Left = 303
      Top = 8
      Width = 49
      Height = 25
      Caption = #30830#23450'(&O)'
      TabOrder = 3
      OnClick = ok_BtnClick
    end
    object exit_Btn: TBitBtn
      Left = 359
      Top = 8
      Width = 49
      Height = 25
      Caption = #36864#20986'(&X)'
      TabOrder = 4
      OnClick = exit_BtnClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 48
    Width = 417
    Height = 169
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 200
    Top = 112
  end
  object Database1: TDatabase
    LoginPrompt = False
    SessionName = 'Default'
    Left = 264
    Top = 112
  end
  object Query1: TQuery
    DatabaseName = 'jx'
    Left = 232
    Top = 112
  end
end
