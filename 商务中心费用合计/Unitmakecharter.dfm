object F_makecharter: TF_makecharter
  Left = 379
  Top = 275
  Width = 276
  Height = 223
  BorderIcons = [biSystemMenu]
  Caption = #25171#23383#31383#21475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TBitBtn
    Left = 158
    Top = 165
    Width = 105
    Height = 25
    Caption = #36864#20986
    TabOrder = 0
    OnClick = btn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
      0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
      0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
      0333337F777FFFFF7F3333000000000003333377777777777333}
    NumGlyphs = 2
  end
  object btn2: TBitBtn
    Left = 51
    Top = 165
    Width = 102
    Height = 25
    Caption = #20445#23384
    TabOrder = 1
    OnClick = btn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
      055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
      88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
      F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
      F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
      0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
      00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
      0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
      05555575FF777777755555500055555555555557775555555555}
    NumGlyphs = 2
  end
  object grp1: TGroupBox
    Left = 3
    Top = 8
    Width = 259
    Height = 105
    Caption = #25805#20316#21592
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object lbl1: TLabel
      Left = 4
      Top = 33
      Width = 60
      Height = 12
      Caption = #25805#20316#21592#20195#30721
    end
    object lbl2: TLabel
      Left = 4
      Top = 71
      Width = 60
      Height = 12
      Caption = #25805#20316#21592#22995#21517
    end
    object dbedt1: TDBEdit
      Left = 65
      Top = 28
      Width = 190
      Height = 20
      DataField = 'czydm'
      DataSource = DataSource1
      TabOrder = 0
      OnKeyDown = dbedt1KeyDown
      OnKeyPress = dbedt1KeyPress
    end
    object dbedt2: TDBEdit
      Left = 67
      Top = 68
      Width = 190
      Height = 20
      DataField = 'czyxm'
      DataSource = DataSource1
      TabOrder = 1
      OnKeyDown = dbedt2KeyDown
    end
  end
  object grp2: TGroupBox
    Left = 3
    Top = 117
    Width = 261
    Height = 42
    Caption = #21475#20196
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object lbl4: TLabel
      Left = 4
      Top = 16
      Width = 60
      Height = 12
      Caption = #25805#20316#21592#23494#30721
    end
    object dbedt3: TDBEdit
      Left = 66
      Top = 11
      Width = 190
      Height = 20
      DataField = 'czykl'
      DataSource = DataSource1
      PasswordChar = '*'
      TabOrder = 0
      OnKeyDown = dbedt3KeyDown
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.qrypsw
    Left = 192
    Top = 8
  end
end
