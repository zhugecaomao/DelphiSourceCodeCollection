object Form7: TForm7
  Left = 384
  Top = 265
  BorderStyle = bsDialog
  Caption = #31995#32479#27880#20876
  ClientHeight = 160
  ClientWidth = 359
  Color = 16628902
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 102
    Height = 13
    Caption = #29992#25143#27880#20876#20449#24687#65306'      '
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 87
    Height = 13
    Caption = #36719#20214#27880#20876#30721#65306'     '
  end
  object Label3: TLabel
    Left = 88
    Top = 77
    Width = 10
    Height = 37
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 160
    Top = 77
    Width = 10
    Height = 37
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 256
    Top = 77
    Width = 10
    Height = 37
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 24
    Top = 32
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 240
    Top = 32
    Width = 75
    Height = 25
    Caption = #33719#21462#20449#24687
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 24
    Top = 88
    Width = 57
    Height = 21
    TabOrder = 2
    OnChange = Edit2Change
  end
  object Edit3: TEdit
    Left = 104
    Top = 88
    Width = 49
    Height = 21
    TabOrder = 3
    OnChange = Edit3Change
  end
  object Edit4: TEdit
    Left = 176
    Top = 88
    Width = 73
    Height = 21
    TabOrder = 4
    OnChange = Edit4Change
  end
  object Edit5: TEdit
    Left = 272
    Top = 88
    Width = 65
    Height = 21
    TabOrder = 5
    OnKeyPress = Edit5KeyPress
  end
  object Button2: TButton
    Left = 56
    Top = 120
    Width = 75
    Height = 25
    Caption = #27880#20876
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 240
    Top = 120
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 7
    OnClick = Button3Click
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
    Left = 200
    Top = 8
  end
end
