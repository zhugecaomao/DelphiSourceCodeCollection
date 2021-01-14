object frmSoftReg: TfrmSoftReg
  Left = 409
  Top = 339
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #36719#20214#27880#20876
  ClientHeight = 199
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 169
    Width = 281
    Height = 30
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object spbtnReg: TSpeedButton
      Left = 56
      Top = 4
      Width = 75
      Height = 22
      Caption = #27880#20876
      Enabled = False
      Flat = True
      OnClick = spbtnRegClick
    end
    object spbtnClose: TSpeedButton
      Left = 136
      Top = 4
      Width = 75
      Height = 22
      Caption = #20851#38381
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADAAD77777777777777D000000000000007A0FBFBFBFB00FB0770BFBFBFBF08
        0F0710FBFBFBFB0B800711BFBF71BF000007717BF717FBFBFB07D117B11FBFBF
        BF07A71111FBFBFBFB07D7111FBFBFBFBF07711117000000000D117A117ADADA
        DADAADADA117ADADADADDADADA117ADADADAADADADADADADADAD}
      OnClick = spbtnCloseClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 281
    Height = 100
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object memRemark: TMemo
      Left = 2
      Top = 2
      Width = 277
      Height = 96
      Cursor = crNo
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      WantReturns = False
    end
  end
  object pRegInput: TPanel
    Left = 0
    Top = 100
    Width = 281
    Height = 69
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 25
      Top = 41
      Width = 84
      Height = 13
      Caption = #36755#20837#27880#20876#30721#65306'    '
    end
    object Label2: TLabel
      Left = 39
      Top = 13
      Width = 72
      Height = 13
      Caption = #23458#25143#26426#30721#65306'    '
    end
    object eRegCode: TEdit
      Left = 101
      Top = 37
      Width = 152
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
      OnChange = eRegCodeChange
    end
    object eCode: TEdit
      Left = 101
      Top = 9
      Width = 152
      Height = 21
      TabOrder = 1
      OnChange = eRegCodeChange
    end
  end
end
