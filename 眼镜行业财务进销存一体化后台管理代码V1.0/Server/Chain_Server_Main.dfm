object frm_Chain_Server_Main: Tfrm_Chain_Server_Main
  Left = 280
  Top = 250
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26381#21153#22120
  ClientHeight = 80
  ClientWidth = 277
  Color = cl3DLight
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMinimized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 277
    Height = 80
    BevelOuter = bvNone
    Caption = #24212#29992#26381#21153#22120
    Color = clCream
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = #21326#25991#34892#26999
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object PopupMenu1: TPopupMenu
    Left = 248
    object Show1: TMenuItem
      Caption = #26174#31034#30028#38754
      Default = True
      ImageIndex = 2
      OnClick = Show1Click
    end
    object N3: TMenuItem
      Caption = #36830#25509#25968#25454#24211
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #36873#25321#24080#22871
      OnClick = N4Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object About1: TMenuItem
      Caption = #20851#20110
      ShortCut = 32845
      OnClick = About1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Close1: TMenuItem
      Caption = #36864#20986
      ImageIndex = 0
      ShortCut = 32856
      OnClick = Close1Click
    end
  end
end
