object FrmGZGL_ZLCXZC: TFrmGZGL_ZLCXZC
  Left = 237
  Top = 136
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FrmGZGL_ZLCXZC'
  ClientHeight = 390
  ClientWidth = 294
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 294
    Height = 48
    Align = alTop
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 0
    object Label16: TLabel
      Left = 10
      Top = 12
      Width = 91
      Height = 14
      Caption = #26597#30475#21333#20301#20449#24687
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Image1: TImage
      Left = 143
      Top = 1
      Width = 150
      Height = 46
      Align = alRight
      AutoSize = True
      Stretch = True
    end
    object Label18: TLabel
      Left = 30
      Top = 30
      Width = 120
      Height = 12
      Caption = #26597#30475#24403#21069#25152#26377#21333#20301#20449#24687
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 71
    Width = 294
    Height = 319
    Align = alClient
    DataSource = dmd.Src_lb
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
  end
  object Pnl1: TPanel
    Left = 0
    Top = 48
    Width = 294
    Height = 23
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = ' '#24403#21069#21333#20301#20849#26377' 99 '#20010
    TabOrder = 2
  end
end
