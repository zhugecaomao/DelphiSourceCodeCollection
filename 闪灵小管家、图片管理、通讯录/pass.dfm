object repass: Trepass
  Left = 380
  Top = 242
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #23494#30721#20462#25913
  ClientHeight = 166
  ClientWidth = 244
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
  object GroupBox1: TGroupBox
    Left = 6
    Top = 6
    Width = 232
    Height = 105
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 17
      Width = 80
      Height = 13
      AutoSize = False
      Caption = #26087#23494#30721'(&P) '#65306
      FocusControl = Edit1
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 80
      Height = 13
      AutoSize = False
      Caption = #26032#23494#30721'(&N) '#65306
      FocusControl = Edit2
    end
    object Label3: TLabel
      Left = 8
      Top = 77
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #30830#35748#26032#23494#30721
      FocusControl = Edit3
    end
    object Edit1: TEdit
      Left = 100
      Top = 16
      Width = 121
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      PasswordChar = '*'
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 100
      Top = 44
      Width = 121
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      PasswordChar = '*'
      TabOrder = 1
      OnChange = Edit2Change
    end
    object Edit3: TEdit
      Left = 100
      Top = 72
      Width = 121
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      PasswordChar = '*'
      TabOrder = 2
    end
  end
  object BitBtn2: TBitBtn
    Left = 131
    Top = 127
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object BitBtn1: TBitBtn
    Left = 36
    Top = 127
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
end
