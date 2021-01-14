object FrmGZGL_XGCXZC: TFrmGZGL_XGCXZC
  Left = 203
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FrmGZGL_XGCXZC'
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
      Top = 20
      Width = 121
      Height = 14
      Caption = #32500#25252#36710#22411#24635#25104#20449#24687
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
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 71
    Width = 294
    Height = 294
    Align = alClient
    DataSource = dmd.Src_lb
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 365
    Width = 294
    Height = 25
    DataSource = dmd.Src_lb
    VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
    Align = alBottom
    TabOrder = 3
  end
end
