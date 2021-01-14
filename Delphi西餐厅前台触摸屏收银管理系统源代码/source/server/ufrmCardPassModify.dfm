inherited frmCardPassModify: TfrmCardPassModify
  Width = 346
  Height = 186
  ActiveControl = eCardId
  Caption = #20462#25913#23494#30721
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 36
    Top = 12
    Width = 65
    Height = 13
    Caption = #20250#21592#21345#21495#65306
  end
  object Label2: TLabel [1]
    Left = 23
    Top = 60
    Width = 78
    Height = 13
    Caption = #20250#21592#26087#23494#30721#65306
  end
  object Label3: TLabel [2]
    Left = 23
    Top = 84
    Width = 78
    Height = 13
    Caption = #20250#21592#26032#23494#30721#65306
  end
  object Label4: TLabel [3]
    Left = 36
    Top = 36
    Width = 65
    Height = 13
    Caption = #20250#21592#22995#21517#65306
  end
  inherited bbtnConfirm: TBitBtn
    Left = 164
    Top = 124
    OnClick = bbtnConfirmClick
  end
  inherited bbtnCancel: TBitBtn
    Left = 248
    Top = 124
  end
  object eCardId: TdxEdit [6]
    Left = 108
    Top = 8
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 2
    OnKeyDown = eCardIdKeyDown
    MaxLength = 10
    StoredValues = 2
  end
  object eCmName: TdxEdit [7]
    Left = 108
    Top = 32
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 3
  end
  object eOldPass: TdxEdit [8]
    Left = 108
    Top = 56
    Width = 121
    Hint = #21021#22987#23494#30721#20026#65306'888888'
    Style.BorderStyle = xbsSingle
    TabOrder = 4
    MaxLength = 6
    PasswordChar = '*'
    StoredValues = 2
  end
  object eNewPass: TdxEdit [9]
    Left = 108
    Top = 80
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 5
    OnKeyDown = eNewPassKeyDown
    MaxLength = 6
    PasswordChar = '*'
    StoredValues = 2
  end
  object bbtnFindCard: TBitBtn [10]
    Left = 240
    Top = 7
    Width = 85
    Height = 22
    Caption = #26597#25214#20250#21592
    TabOrder = 6
    OnClick = bbtnFindCardClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADAADADADADAD00ADAD000000000910000A0FFFF0FF9F10FF0D0FF00009F10F
      FF0A0F0787701088FF0D0078E7F70FFFFF0A008E878F08888F0D00EFE7E80FFF
      FF0A007FF78708888F0D0F07E770FFFFFF0A0F8000088888FF0D0FFFF0FFFFFF
      FF0A444444444444444D444444444444444A444444444444444D}
  end
  object MSComm: TMSComm [11]
    Left = 156
    Top = 76
    Width = 32
    Height = 32
    ControlData = {
      2143341208000000ED030000ED03000001568A64000006000000010000040000
      00020000802500000000080000000000000000003F00000001000000}
  end
  object CardInfoq: TCSADOQuery
    Parameters = <>
    Left = 240
    Top = 40
    object CardInfoqcard_id: TStringField
      FieldName = 'card_id'
      Size = 10
    end
    object CardInfoqcm_id: TStringField
      FieldName = 'cm_id'
      Size = 10
    end
    object CardInfoqcm_name: TStringField
      FieldName = 'cm_name'
      Size = 30
    end
    object CardInfoqcard_pass: TStringField
      FieldName = 'card_pass'
      Size = 6
    end
  end
end
