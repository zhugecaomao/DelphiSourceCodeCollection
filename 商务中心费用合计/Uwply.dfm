object F_wpxm: TF_wpxm
  Left = 433
  Top = 231
  Width = 313
  Height = 343
  BorderIcons = [biSystemMenu]
  Caption = #29289#21697#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 305
    Height = 316
    ActivePage = ts1
    Align = alClient
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #29289#21697
      object wwDBGrid1: TwwDBGrid
        Left = 0
        Top = 0
        Width = 297
        Height = 288
        DittoAttributes.ShortCutDittoField = 0
        DittoAttributes.ShortCutDittoRecord = 0
        DittoAttributes.Options = []
        DisableThemesInTitle = False
        Selected.Strings = (
          'mc'#9'20'#9#29289#21697#21517#31216#9'F'
          'danja'#9'20'#9#29289#21697#21333#20215#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Ctl3D = False
        DataSource = dswp
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentCtl3D = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        LineColors.FixedColor = 10675132
        OnDblClick = wwDBGrid1DblClick
        FooterCellColor = 10675132
      end
    end
  end
  object dswp: TDataSource
    DataSet = DM.Qwpsz
    Left = 332
    Top = 40
  end
end
