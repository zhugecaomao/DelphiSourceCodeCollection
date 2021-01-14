object FrmTaskMana: TFrmTaskMana
  Left = 226
  Top = 319
  Width = 270
  Height = 420
  BorderIcons = [biSystemMenu, biMaximize]
  BorderWidth = 10
  Caption = #36855#20320#20219#21153#31649#29702#22120
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object ListBox1: TListBox
    Left = 0
    Top = 0
    Width = 242
    Height = 366
    Align = alClient
    Color = clWhite
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnMouseMove = ListBox1MouseMove
  end
  object btnClose: TButton
    Left = 40
    Top = 110
    Width = 1
    Height = 1
    Cancel = True
    Caption = 'btnClose'
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    OwnerDraw = True
    OnPopup = PopupMenu1Popup
    Left = 40
    Top = 40
    object N1: TMenuItem
      Caption = #21047#26032'        '
      ShortCut = 116
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #32467#26463#36827#31243
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #20851#38381
      OnClick = N5Click
    end
  end
  object RzMenuController1: TRzMenuController
    GradientColorDefault = False
    GradientColorStart = clWhite
    GradientColorStop = 16442579
    FrameColor = 16761221
    Left = 80
    Top = 40
  end
end
