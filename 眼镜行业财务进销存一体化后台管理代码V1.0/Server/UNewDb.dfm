object FmNewDb: TFmNewDb
  Left = 234
  Top = 175
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #26032#22686#24080#22871
  ClientHeight = 146
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = -1
    Top = 0
    Width = 291
    Height = 116
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 43
      Width = 52
      Height = 13
      Caption = #24080#22871#35828#26126
    end
    object edtname: TLabeledEdit
      Left = 68
      Top = 13
      Width = 208
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #24080#22871#21517#31216
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 0
    end
    object Mremark: TMemo
      Left = 68
      Top = 39
      Width = 208
      Height = 70
      TabOrder = 1
    end
  end
  object btnok: TBitBtn
    Left = 140
    Top = 118
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = btnokClick
    Kind = bkOK
  end
  object btncancel: TBitBtn
    Left = 215
    Top = 118
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = btncancelClick
    Kind = bkCancel
  end
end
