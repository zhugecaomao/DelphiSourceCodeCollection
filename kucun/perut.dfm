object ryglfm: Tryglfm
  Left = 269
  Top = 202
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20154#21592#31649#29702
  ClientHeight = 300
  ClientWidth = 499
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
    Left = 0
    Top = 0
    Width = 499
    Height = 300
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 257
      Height = 289
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 2
        Top = 15
        Width = 253
        Height = 272
        Align = alClient
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 272
      Top = 8
      Width = 225
      Height = 281
      Caption = #20449#24687#36755#20837
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 32
        Width = 97
        Height = 25
        AutoSize = False
        Caption = #22995#21517#65306
      end
      object Label2: TLabel
        Left = 8
        Top = 88
        Width = 65
        Height = 25
        AutoSize = False
        Caption = #32844#21153#65306
      end
      object tjbt: TSpeedButton
        Left = 8
        Top = 192
        Width = 73
        Height = 25
        Caption = #28155#21152
        OnClick = tjbtClick
      end
      object xgedit: TSpeedButton
        Left = 104
        Top = 192
        Width = 65
        Height = 25
        Caption = #20462#25913
        OnClick = xgeditClick
      end
      object scedit: TSpeedButton
        Left = 8
        Top = 232
        Width = 73
        Height = 25
        Caption = #21024#38500
        OnClick = sceditClick
      end
      object closebt: TSpeedButton
        Left = 104
        Top = 232
        Width = 65
        Height = 25
        Caption = #20851#38381
        OnClick = closebtClick
      end
      object xmedit: TEdit
        Left = 8
        Top = 56
        Width = 137
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 0
      end
      object zwedit: TComboBox
        Left = 8
        Top = 128
        Width = 145
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          #37319#36141#21592
          #24211#23384#31649#29702#21592
          #26816#39564#21592
          #39046#36135#21592)
      end
    end
  end
  object ADOQuery: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    SQL.Strings = (
      'select * from gzyb')
    Left = 136
    Top = 104
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery
    Left = 80
    Top = 144
  end
end
