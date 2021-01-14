object MainForm: TMainForm
  Left = 383
  Top = 300
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #33258#21160#21319#32423#27979#35797
  ClientHeight = 180
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 84
    Height = 12
    Caption = #36825#26159#26032#29256#31243#24207#65281
    Visible = False
  end
  object UpgradeButton: TButton
    Left = 88
    Top = 72
    Width = 75
    Height = 25
    Caption = #24320#22987#21319#32423
    TabOrder = 0
    OnClick = UpgradeButtonClick
  end
end
