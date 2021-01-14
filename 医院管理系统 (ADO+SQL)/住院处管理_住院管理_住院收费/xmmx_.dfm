object xmmx: Txmmx
  Left = 248
  Top = 213
  BorderStyle = bsNone
  Caption = #39033#30446#26126#32454
  ClientHeight = 144
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 325
    Height = 144
    Align = alClient
    Color = clInfoBk
    DataSource = DMzygl.DSxmfymxbQ
    FixedColor = clActiveBorder
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = #39033#30446'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39033#30446#36153#29992#21517#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39033#30446#36153#29992
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22791#27880
        Visible = True
      end>
  end
  object DBExmid: TDBEdit
    Left = 16
    Top = 72
    Width = 33
    Height = 21
    DataField = #39033#30446'id'
    DataSource = DMzygl.DSxmfymxbQ
    TabOrder = 1
    Visible = False
  end
  object DBExmfymc: TDBEdit
    Left = 56
    Top = 72
    Width = 49
    Height = 21
    DataField = #39033#30446#36153#29992#21517#31216
    DataSource = DMzygl.DSxmfymxbQ
    TabOrder = 2
    Visible = False
  end
  object DBEfy: TDBEdit
    Left = 112
    Top = 72
    Width = 33
    Height = 21
    DataField = #39033#30446#36153#29992
    DataSource = DMzygl.DSxmfymxbQ
    TabOrder = 3
    Visible = False
  end
  object DBEdw: TDBEdit
    Left = 160
    Top = 72
    Width = 25
    Height = 21
    DataField = #21333#20301
    DataSource = DMzygl.DSxmfymxbQ
    TabOrder = 4
    Visible = False
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
    Left = 240
    Top = 56
  end
end
