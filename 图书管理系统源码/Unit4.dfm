object Form4: TForm4
  Left = 300
  Top = 240
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #29992#25143#30331#38470
  ClientHeight = 146
  ClientWidth = 328
  Color = 16628902
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 105
    Height = 146
  end
  object Button1: TButton
    Left = 112
    Top = 112
    Width = 75
    Height = 25
    Caption = #30331#38470
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 232
    Top = 112
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 104
    Top = 0
    Width = 209
    Height = 105
    TabOrder = 4
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 48
      Height = 13
      Caption = #29992#25143#21517#65306
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 48
      Height = 13
      Caption = #23494'    '#30721#65306
    end
  end
  object Edit1: TEdit
    Left = 184
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Admin'
  end
  object Edit2: TEdit
    Left = 184
    Top = 48
    Width = 121
    Height = 21
    PasswordChar = '@'
    TabOrder = 1
    Text = '123'
  end
  object XPMenu1: TXPMenu
    DimLevel = 30
    GrayLevel = 10
    Font.Charset = GB2312_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = clBtnFace
    IconBackColor = clBtnFace
    MenuBarColor = clBtnFace
    SelectColor = clHighlight
    SelectBorderColor = clHighlight
    SelectFontColor = clMenuText
    DisabledColor = clInactiveCaption
    SeparatorColor = clBtnFace
    CheckedColor = clHighlight
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = True
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = False
    XPContainers = [xccForm, xccFrame, xccToolbar, xccCoolbar, xccControlbar, xccScrollBox, xccTabSheet, xccPageScroller]
    XPControls = [xcMainMenu, xcPopupMenu, xcToolbar, xcControlbar, xcCombo, xcEdit, xcMaskEdit, xcMemo, xcRichEdit, xcCheckBox, xcRadioButton, xcButton, xcBitBtn, xcSpeedButton]
    Active = True
    ControlUseTrueXPStyle = True
    BtnRoundArc = 5
    BtnOutLineBorderColor = 7552000
    BtnInnerBorderMoveColor = 3257087
    BtnInnerBorderFocusColor = 15183500
    BtnSurfaceNormalColor = 16251903
    BtnSurfaceDownColor = 14608359
    BtnSurfaceBottomLineColor = 14608359
    BtnSurfaceDownBottomLineColor = 15199215
    RdoChkControlChkColor = 41472
    ComboBoxChkColor = 9201994
    ComboboxSurfaceMoveColor = 16771030
    ControlDisabledBorderColor = 11913158
    Left = 64
    Top = 48
  end
end
