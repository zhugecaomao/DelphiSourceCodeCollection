object kcyjfm: Tkcyjfm
  Left = 204
  Top = 148
  Width = 732
  Height = 491
  Caption = #24211#23384#39044#35686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 724
    Height = 457
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24211#23384#25968#37327#39044#35686
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 716
        Height = 429
        Align = alClient
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = #24211#23384#22825#25968#39044#35686
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 716
        Height = 429
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
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery
    Left = 208
    Top = 224
  end
  object ADOQuery: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    Left = 280
    Top = 216
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 164
    Top = 152
  end
  object ADOQuery1: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    Left = 196
    Top = 144
  end
end
