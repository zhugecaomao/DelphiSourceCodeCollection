object khcxfm: Tkhcxfm
  Left = 134
  Top = 254
  Width = 816
  Height = 480
  Caption = #25104#21697#23458#25143#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 808
    Height = 73
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 806
      Height = 80
      Align = alTop
      Caption = #26597#35810#26465#20214
      TabOrder = 0
      object Label3: TLabel
        Left = 136
        Top = 13
        Width = 65
        Height = 25
        AutoSize = False
        Caption = #23458#25143#21517#31216#65306
        Layout = tlCenter
      end
      object Label5: TLabel
        Left = 136
        Top = 45
        Width = 65
        Height = 25
        AutoSize = False
        Caption = #35746#36141#26102#38388#65306
        Layout = tlCenter
      end
      object Label1: TLabel
        Left = 256
        Top = 51
        Width = 17
        Height = 17
        AutoSize = False
        Caption = #20174
      end
      object Label2: TLabel
        Left = 363
        Top = 52
        Width = 22
        Height = 21
        AutoSize = False
        Caption = #21040
        Layout = tlCenter
      end
      object ms1box: TComboBox
        Left = 208
        Top = 48
        Width = 49
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          #24182#19988
          #25110#32773)
      end
      object rqbox: TDateTimePicker
        Left = 272
        Top = 48
        Width = 89
        Height = 21
        Date = 38492.858918773150000000
        Time = 38492.858918773150000000
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 1
      end
      object rq1box: TDateTimePicker
        Left = 384
        Top = 48
        Width = 89
        Height = 21
        Date = 38492.858918773150000000
        Time = 38492.858918773150000000
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 2
      end
      object cxbt: TBitBtn
        Left = 552
        Top = 16
        Width = 75
        Height = 25
        Caption = #26597#35810'F1'
        TabOrder = 3
        OnClick = cxbtClick
      end
      object qxbt: TBitBtn
        Left = 552
        Top = 42
        Width = 75
        Height = 25
        Caption = #21462#28040'F2'
        TabOrder = 4
        OnClick = qxbtClick
      end
      object BitBtn3: TBitBtn
        Left = 669
        Top = 16
        Width = 75
        Height = 25
        Caption = #21047#26032
        TabOrder = 5
        OnClick = FormCreate
      end
      object closebt: TBitBtn
        Left = 669
        Top = 42
        Width = 75
        Height = 25
        Caption = #20851#38381'F3'
        TabOrder = 6
        OnClick = closebtClick
      end
      object khmc: TComboBox
        Left = 208
        Top = 16
        Width = 145
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 7
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 808
    Height = 373
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 806
      Height = 371
      Align = alClient
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 806
      Height = 371
      Align = alClient
      TabOrder = 1
      object GroupBox2: TGroupBox
        Left = 1
        Top = 1
        Width = 804
        Height = 369
        Align = alClient
        TabOrder = 0
        object DBGrid2: TDBGrid
          Left = 2
          Top = 15
          Width = 800
          Height = 352
          Align = alClient
          DataSource = DataSource1
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
  end
  object ADOQuery: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    SQL.Strings = (
      'select * from ckb ')
    Left = 241
    Top = 256
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery
    Left = 169
    Top = 232
  end
  object ADOQuery1: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    Left = 249
    Top = 177
  end
end
