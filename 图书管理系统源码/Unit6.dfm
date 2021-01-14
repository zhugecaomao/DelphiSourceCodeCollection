object Form6: TForm6
  Left = 202
  Top = 202
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 251
  ClientWidth = 570
  Color = 16628902
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 16
    Top = 16
    Width = 225
    Height = 217
  end
  object Panel1: TPanel
    Left = 16
    Top = 16
    Width = 225
    Height = 217
    BorderStyle = bsSingle
    Color = 16628902
    TabOrder = 0
    object Label5: TLabel
      Left = 24
      Top = 52
      Width = 48
      Height = 13
      Caption = #29992#25143#21517#65306
    end
    object Label6: TLabel
      Left = 24
      Top = 80
      Width = 60
      Height = 13
      Caption = #29992#25143#23494#30721#65306
    end
    object Label7: TLabel
      Left = 24
      Top = 108
      Width = 60
      Height = 13
      Caption = #30830#35748#23494#30721#65306
    end
    object Label8: TLabel
      Left = 24
      Top = 24
      Width = 60
      Height = 13
      Caption = #29992#25143#32534#21495#65306
    end
    object Label1: TLabel
      Left = 24
      Top = 136
      Width = 60
      Height = 13
      Caption = #21592#24037#32534#21495#65306
    end
    object Button1: TButton
      Left = 24
      Top = 168
      Width = 75
      Height = 25
      Caption = #21019#24314
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit4: TEdit
      Left = 88
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit4'
    end
    object Edit1: TEdit
      Left = 88
      Top = 44
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 88
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 88
      Top = 100
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'Edit3'
    end
    object ComboBox1: TComboBox
      Left = 88
      Top = 128
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Text = #35831#36873#25321#21592#24037#32534#21495
      OnKeyPress = ComboBox1KeyPress
    end
  end
  object Button2: TButton
    Left = 264
    Top = 208
    Width = 75
    Height = 25
    Caption = #25968#25454#27983#35272
    TabOrder = 1
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 256
    Top = 16
    Width = 297
    Height = 105
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Title.Caption = #29992#25143#32534#21495
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = #29992#25143#21517#31216
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = #26435#38480#32534#21495
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = #21592#24037#32534#21495' '
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 16
    Top = 16
    Width = 225
    Height = 217
    BorderStyle = bsSingle
    Color = 16628902
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 48
      Height = 13
      Caption = #29992#25143#21517#65306
    end
    object Label3: TLabel
      Left = 8
      Top = 104
      Width = 48
      Height = 13
      Caption = #26032#23494#30721#65306
    end
    object Label4: TLabel
      Left = 8
      Top = 144
      Width = 72
      Height = 13
      Caption = #30830#35748#26032#23494#30721#65306
    end
    object Label10: TLabel
      Left = 8
      Top = 64
      Width = 54
      Height = 13
      Caption = #26087#23494#30721#65306'  '
    end
    object Button5: TButton
      Left = 24
      Top = 176
      Width = 75
      Height = 25
      Caption = #20462#25913
      TabOrder = 0
      OnClick = Button5Click
    end
    object Edit5: TEdit
      Left = 88
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit5'
    end
    object Edit6: TEdit
      Left = 88
      Top = 96
      Width = 121
      Height = 21
      PasswordChar = '@'
      TabOrder = 2
      Text = 'Edit6'
    end
    object Edit7: TEdit
      Left = 88
      Top = 136
      Width = 121
      Height = 21
      PasswordChar = '@'
      TabOrder = 3
      Text = 'Edit7'
    end
    object Edit9: TEdit
      Left = 88
      Top = 56
      Width = 121
      Height = 21
      PasswordChar = '@'
      TabOrder = 4
      Text = 'Edit9'
    end
  end
  object Panel3: TPanel
    Left = 16
    Top = 16
    Width = 225
    Height = 217
    BorderStyle = bsSingle
    Color = 16628902
    TabOrder = 4
    object Label9: TLabel
      Left = 16
      Top = 32
      Width = 96
      Height = 13
      Caption = #35201#21024#38500#30340#29992#25143#21517#65306
    end
    object Edit8: TEdit
      Left = 16
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit8'
    end
    object Button7: TButton
      Left = 16
      Top = 112
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 1
      OnClick = Button7Click
    end
  end
  object Button8: TButton
    Left = 464
    Top = 208
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 5
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 364
    Top = 208
    Width = 75
    Height = 25
    Caption = #29992#25143#25480#26435
    TabOrder = 6
    OnClick = Button9Click
  end
  object CheckBox1: TCheckBox
    Left = 296
    Top = 144
    Width = 97
    Height = 17
    Caption = #25968#25454#26597#30475#26435#38480
    TabOrder = 7
  end
  object CheckBox2: TCheckBox
    Left = 296
    Top = 168
    Width = 97
    Height = 17
    Caption = #25968#25454#26356#26032#26435#38480
    TabOrder = 8
  end
  object CheckBox3: TCheckBox
    Left = 416
    Top = 144
    Width = 97
    Height = 17
    Caption = #25968#25454#28155#21152#26435#38480
    TabOrder = 9
  end
  object CheckBox4: TCheckBox
    Left = 416
    Top = 168
    Width = 97
    Height = 17
    Caption = #25968#25454#21024#38500#26435#38480
    TabOrder = 10
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
    XPControls = [xcMainMenu, xcPopupMenu, xcToolbar, xcControlbar, xcCombo, xcEdit, xcMaskEdit, xcMemo, xcRichEdit, xcCheckBox, xcRadioButton, xcButton, xcBitBtn, xcSpeedButton, xcGroupBox]
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
    Left = 248
    Top = 168
  end
end
