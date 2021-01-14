object fhdyfm: Tfhdyfm
  Left = 106
  Top = 159
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21457#36135#25171#21360
  ClientHeight = 296
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 382
    Top = 0
    Width = 229
    Height = 296
    Align = alRight
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 56
      Top = 136
      Width = 121
      Height = 25
      Caption = #25171#21360
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 56
      Top = 40
      Width = 123
      Height = 25
      Caption = #26174#31034#21382#21490#25171#21360#35760#24405
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 56
      Top = 72
      Width = 121
      Height = 25
      Caption = #26174#31034#26410#25171#21360#35760#24405
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 56
      Top = 104
      Width = 121
      Height = 25
      Caption = #26174#31034#25152#26377#35760#24405
      TabOrder = 3
      OnClick = BitBtn4Click
    end
    object bh: TEdit
      Left = 56
      Top = 8
      Width = 121
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      TabOrder = 4
      Visible = False
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 184
      Width = 227
      Height = 111
      Align = alBottom
      TabOrder = 5
      object BitBtn6: TBitBtn
        Left = 56
        Top = 14
        Width = 121
        Height = 25
        Caption = #31227#38500
        TabOrder = 0
        OnClick = BitBtn6Click
      end
      object BitBtn5: TBitBtn
        Left = 56
        Top = 78
        Width = 121
        Height = 25
        Caption = #20851#38381
        TabOrder = 1
        OnClick = BitBtn5Click
      end
      object BitBtn8: TBitBtn
        Left = 56
        Top = 48
        Width = 121
        Height = 25
        Caption = #21047#26032
        TabOrder = 2
        OnClick = BitBtn8Click
      end
    end
    object BitBtn7: TBitBtn
      Left = 56
      Top = 8
      Width = 123
      Height = 25
      Caption = #28155#21152#25171#21360#35760#24405
      TabOrder = 6
      OnClick = BitBtn7Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 161
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 390
      Height = 159
      Align = alClient
      DataSource = DataSource1
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 184
    Width = 393
    Height = 112
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 1
      Top = 1
      Width = 391
      Height = 110
      Align = alClient
      DataSource = DataSource2
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid2CellClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 160
    Width = 393
    Height = 25
    Caption = #25171#21360#30340#21457#36135#35760#24405
    TabOrder = 3
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = ADOQuery
    Left = 200
    Top = 136
  end
  object ADOQuery: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    Left = 176
    Top = 112
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 288
    Top = 216
  end
  object ADOQuery1: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    Left = 248
    Top = 200
  end
  object ADOQuery2: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    Left = 152
    Top = 88
  end
end
