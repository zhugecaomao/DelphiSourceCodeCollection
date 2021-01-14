object frmLogin: TfrmLogin
  Left = 178
  Top = 62
  BorderStyle = bsNone
  Caption = #30331#24405#31383#21475
  ClientHeight = 194
  ClientWidth = 295
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 14
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 295
    Height = 194
    Align = alClient
    BorderWidth = 8
    TabOrder = 0
    object Panel1: TPanel
      Left = 9
      Top = 9
      Width = 277
      Height = 137
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 30
        Top = 18
        Width = 49
        Height = 14
        Caption = #24037#21495'(&C)'
      end
      object Label2: TLabel
        Left = 30
        Top = 48
        Width = 49
        Height = 14
        Caption = #23494#30721'(&P)'
      end
      object Label3: TLabel
        Left = 24
        Top = 78
        Width = 63
        Height = 14
        Caption = #29992#25143#21517'(&N)'
      end
      object Label4: TLabel
        Left = 25
        Top = 108
        Width = 63
        Height = 14
        Caption = #24037#20316#32452'(&G)'
      end
      object edtCode: TEdit
        Left = 88
        Top = 15
        Width = 158
        Height = 22
        TabOrder = 0
        OnExit = edtCodeExit
        OnKeyPress = edtCodeKeyPress
      end
      object edtName: TEdit
        Left = 88
        Top = 75
        Width = 158
        Height = 22
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
      object edtTheGroup: TEdit
        Left = 88
        Top = 105
        Width = 158
        Height = 22
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
      end
      object edtPw: TEdit
        Left = 88
        Top = 45
        Width = 158
        Height = 22
        PasswordChar = '*'
        TabOrder = 1
        OnKeyPress = edtPwKeyPress
      end
    end
    object btnCancel: TBitBtn
      Left = 168
      Top = 154
      Width = 89
      Height = 26
      Caption = #36864#20986'(&N)'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object btnOk: TBitBtn
      Left = 26
      Top = 154
      Width = 89
      Height = 26
      Caption = #30830#23450'(&Y)'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnOkClick
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F0000000120B0000120B00001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777777776D7077777777777777777777500077777777887777777777A6007777
        777CC887777777777470777777C22C8877777777504177777A2222C887777777
        A6007777A222222C88777777A6007777A222A222C887777765347777A22C8A22
        2C877777342E7777A22C87A22C88777700F077777A2C777A22C887771D777777
        77AA7777A22C88776D707777777777777A22C887500077777777777777A22C87
        9700777777777777777A2C8774767777777777777777AC774945777777777777
        7777777700F0777777777777777777772C7777777777777777777777626D7777
        7777777777777777424D}
    end
  end
end
