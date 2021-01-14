object config_form: Tconfig_form
  Left = 359
  Top = 238
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #30028#38754#35774#32622
  ClientHeight = 247
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 8
    Width = 169
    Height = 13
    AutoSize = False
    Caption = #35831#35774#32622#20320#24819#35201#30340#30028#38754#21442#25968#65306
    Transparent = True
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 33
    Width = 143
    Height = 152
    Caption = #36873'  '#25321'  '#39033
    TabOrder = 0
    object CheckBox1: TCheckBox
      Left = 24
      Top = 24
      Width = 70
      Height = 17
      Caption = '   '#32972'     '#26223
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 24
      Top = 52
      Width = 70
      Height = 17
      Caption = '  '#24037#20855#26639
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 24
      Top = 81
      Width = 73
      Height = 17
      Caption = '  '#29366#24577#26639
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 155
    Top = 33
    Width = 158
    Height = 152
    Caption = #35774#32622#32972#26223
    TabOrder = 1
    object ComboBox1: TComboBox
      Left = 12
      Top = 16
      Width = 130
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox1Change
      Items.Strings = (
        #40664#35748#32972#26223
        #33258#28982#39749#21147
        #29233#20043#26053#31243
        #21345#36890#21160#28459
        #28216#25103#20808#38155)
    end
    object Panel1: TPanel
      Left = 12
      Top = 43
      Width = 130
      Height = 100
      BevelInner = bvLowered
      Caption = #39044#35272#32972#26223
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      object Image1: TImage
        Left = 2
        Top = 2
        Width = 126
        Height = 96
        Align = alClient
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 205
    Width = 75
    Height = 25
    Caption = #24212#29992'(&Y)'
    Default = True
    TabOrder = 2
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
    Left = 184
    Top = 205
    Width = 75
    Height = 25
    Caption = #21462#28040'(&N)'
    TabOrder = 3
    Kind = bkCancel
  end
end
