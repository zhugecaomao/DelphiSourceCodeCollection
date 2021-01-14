object add_user: Tadd_user
  Left = 387
  Top = 228
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #28155#21152#29992#25143
  ClientHeight = 206
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 39
    Top = 170
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 134
    Top = 170
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 4
    Width = 233
    Height = 153
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 19
      Width = 80
      Height = 13
      AutoSize = False
      Caption = #29992'  '#25143'  '#21517'(&U) '#65306
      FocusControl = Edit1
    end
    object Label2: TLabel
      Left = 14
      Top = 54
      Width = 80
      Height = 13
      AutoSize = False
      Caption = #23494'         '#30721'(&P) '#65306
      FocusControl = Edit2
    end
    object Label3: TLabel
      Left = 14
      Top = 86
      Width = 80
      Height = 13
      AutoSize = False
      Caption = #30830#35748#23494#30721'(&Q) '#65306
      FocusControl = Edit3
    end
    object Label4: TLabel
      Left = 12
      Top = 117
      Width = 82
      Height = 13
      AutoSize = False
      Caption = #29992#25143#32423#21035' (&L) '#65306
    end
    object ComboBox1: TComboBox
      Left = 96
      Top = 113
      Width = 125
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 3
      Text = #26222#36890#29992#25143
      Items.Strings = (
        #36229#32423#29992#25143
        #26222#36890#29992#25143)
    end
    object Edit3: TEdit
      Left = 97
      Top = 82
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
    end
    object Edit2: TEdit
      Left = 97
      Top = 50
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      OnChange = Edit2Change
    end
    object Edit1: TEdit
      Left = 97
      Top = 18
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
end
