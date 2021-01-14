object FrmGZGL_ZLGZ: TFrmGZGL_ZLGZ
  Left = 48
  Top = 95
  Width = 670
  Height = 377
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'FrmGZGL_ZLGZ'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object DBGrid1: TDBGrid
    Left = 0
    Top = 71
    Width = 662
    Height = 279
    Align = alClient
    DataSource = dmd.Src_GZ
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
  end
  object Pnl1: TPanel
    Left = 0
    Top = 48
    Width = 662
    Height = 23
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = #20849#26377#24037#35013#65305#65305#65305#65305#22871
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 662
    Height = 48
    Align = alTop
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 2
    object Label16: TLabel
      Left = 28
      Top = 12
      Width = 91
      Height = 14
      Caption = #24635#35272#24037#35013#20449#24687
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Image1: TImage
      Left = 511
      Top = 1
      Width = 150
      Height = 46
      Align = alRight
      AutoSize = True
      Stretch = True
    end
    object Label18: TLabel
      Left = 60
      Top = 30
      Width = 120
      Height = 12
      Caption = #26597#30475#24403#21069#25152#26377#24037#35013#20449#24687
    end
  end
end
