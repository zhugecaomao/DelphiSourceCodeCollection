object Fchangemx: TFchangemx
  Left = 244
  Top = 128
  Width = 523
  Height = 538
  BorderIcons = [biSystemMenu]
  Caption = #26085#25253#34920#26126#32454#20462#25913
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 73
    Width = 515
    Height = 438
    ActivePage = ts1
    Align = alClient
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #20462#25913#20449#24687
      object wwDBGrid1: TwwDBGrid
        Left = 0
        Top = 0
        Width = 507
        Height = 410
        DittoAttributes.ShortCutDittoField = 0
        DittoAttributes.ShortCutDittoRecord = 0
        DittoAttributes.Options = []
        DisableThemesInTitle = False
        Selected.Strings = (
          'namemx'#9'13'#9#39033#30446
          'shuliang'#9'16'#9#25968#37327
          'je'#9'15'#9#37329#39069
          'rq'#9'15'#9#26085#26399
          'lx'#9'13'#9#31867#22411)
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsXG
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnDblClick = wwDBGrid1DblClick
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 515
    Height = 73
    Align = alTop
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lbl1: TLabel
      Left = 6
      Top = 21
      Width = 60
      Height = 12
      Caption = #26085#25253#34920#26085#26399
    end
    object lbl2: TLabel
      Left = 26
      Top = 43
      Width = 24
      Height = 12
      Caption = #31867#22411
    end
    object dtp1: TDateTimePicker
      Left = 74
      Top = 16
      Width = 186
      Height = 20
      Date = 39428.000000000000000000
      Time = 39428.000000000000000000
      TabOrder = 0
    end
    object cbbry: TComboBox
      Left = 76
      Top = 40
      Width = 183
      Height = 20
      ItemHeight = 12
      TabOrder = 1
      Text = #23458#20154
      Items.Strings = (
        #23458#20154
        #37096#38376)
    end
    object btn1: TBitBtn
      Left = 291
      Top = 12
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 2
      OnClick = btn1Click
    end
    object btn2: TBitBtn
      Left = 375
      Top = 12
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 3
      OnClick = btn2Click
    end
    object btn3: TBitBtn
      Left = 290
      Top = 40
      Width = 75
      Height = 25
      Caption = #26356#26032
      TabOrder = 4
    end
    object btn4: TBitBtn
      Left = 375
      Top = 39
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 5
      OnClick = btn4Click
    end
  end
  object dsXG: TDataSource
    DataSet = DM.qrydatereport
    Left = 478
    Top = 54
  end
end
