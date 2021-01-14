object frmMain: TfrmMain
  Left = 155
  Top = 170
  Width = 798
  Height = 568
  Caption = #31649#29702#31995#32479
  Color = clGradientActiveCaption
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 511
    Width = 790
    Height = 30
    Panels = <
      item
        Width = 300
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object MainMenu: TMainMenu
    AutoHotkeys = maManual
    Left = 336
    Top = 228
  end
  object ParentMenuq: TCSADOQuery
    Parameters = <>
    Left = 368
    Top = 228
  end
  object ChildMenuq: TCSADOQuery
    Parameters = <>
    Left = 396
    Top = 228
  end
  object frDesigner1: TfrDesigner
    Left = 424
    Top = 228
  end
end
