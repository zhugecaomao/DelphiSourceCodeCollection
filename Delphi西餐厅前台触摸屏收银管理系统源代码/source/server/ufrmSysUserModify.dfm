inherited frmSysUserModify: TfrmSysUserModify
  Width = 255
  Height = 210
  Caption = #29992#25143#36164#26009
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 36
    Top = 16
    Width = 65
    Height = 13
    Caption = #29992#25143#32534#21495#65306
  end
  object Label2: TLabel [1]
    Left = 36
    Top = 40
    Width = 65
    Height = 13
    Caption = #29992#25143#21517#31216#65306
  end
  object Label3: TLabel [2]
    Left = 36
    Top = 64
    Width = 65
    Height = 13
    Caption = #29992#25143#23494#30721#65306
  end
  object Label4: TLabel [3]
    Left = 36
    Top = 88
    Width = 65
    Height = 13
    Caption = #21019#24314#26102#38388#65306
  end
  object Label5: TLabel [4]
    Left = 10
    Top = 112
    Width = 91
    Height = 13
    Caption = #26368#21518#30331#38470#26102#38388#65306
  end
  inherited bbtnConfirm: TBitBtn
    Left = 68
    Top = 144
    OnClick = bbtnConfirmClick
  end
  inherited bbtnCancel: TBitBtn
    Left = 152
    Top = 144
  end
  object eUserId: TdxEdit [7]
    Left = 105
    Top = 13
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 2
  end
  object eUserName: TdxEdit [8]
    Left = 105
    Top = 37
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 3
  end
  object eUserPass: TdxEdit [9]
    Left = 105
    Top = 61
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 4
    PasswordChar = '*'
  end
  object eCreateTime: TdxDateEdit [10]
    Left = 105
    Top = 85
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 5
    Date = -700000
  end
  object eModifyTime: TdxDateEdit [11]
    Left = 105
    Top = 109
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 6
    Date = -700000
  end
end
