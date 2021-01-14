object denglu: Tdenglu
  Left = 288
  Top = 232
  Width = 307
  Height = 216
  Caption = #30331#38470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 16
    Top = 8
    Width = 265
    Height = 161
    Caption = #35831#36755#20837#29992#25143#21517#21644#23494#30721
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 40
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #21592#24037#32534#21495
    end
    object Label2: TLabel
      Left = 48
      Top = 80
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #23494#30721
    end
    object Eygbh: TEdit
      Left = 96
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Emm: TEdit
      Left = 96
      Top = 72
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 24
      Top = 112
      Width = 75
      Height = 25
      Caption = #30331#38470
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 144
      Top = 112
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object DBEmm: TDBEdit
      Left = 8
      Top = 136
      Width = 49
      Height = 21
      DataField = #23494#30721
      DataSource = DMzygl.DSdenglu
      TabOrder = 4
      Visible = False
    end
    object DBEszzw: TDBEdit
      Left = 56
      Top = 136
      Width = 81
      Height = 21
      DataField = #25152#22312#32844#20301
      DataSource = DMzygl.DSdenglu
      TabOrder = 5
      Visible = False
    end
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
    Left = 232
    Top = 64
  end
end
