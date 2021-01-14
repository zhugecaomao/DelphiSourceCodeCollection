object CardForm: TCardForm
  Left = 151
  Top = 107
  Width = 585
  Height = 388
  Caption = #20250#21592#21345#31649#29702#31383#21475
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    577
    361)
  PixelsPerInch = 96
  TextHeight = 12
  object DBGrid1: TDBGrid
    Left = 12
    Top = 12
    Width = 554
    Height = 301
    Anchors = [akLeft, akTop, akRight, akBottom]
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 12
    Top = 326
    Width = 125
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = #26032#22686#20250#21592#21345'(&A)'
    TabOrder = 1
  end
  object Button2: TButton
    Left = 492
    Top = 326
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #36864#20986'(&X)'
    ModalResult = 2
    TabOrder = 2
  end
  object Button3: TButton
    Left = 144
    Top = 326
    Width = 75
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = #30830#23450'(&O)'
    TabOrder = 3
  end
end
