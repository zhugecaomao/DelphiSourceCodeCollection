inherited fmbaseprice: Tfmbaseprice
  Left = 230
  Top = 165
  Caption = #20215#26684#25311#23450
  ClientHeight = 234
  ClientWidth = 418
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object edtbase: TLabeledEdit
    Left = 71
    Top = 16
    Width = 121
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = #25104#26412#22343#20215
    Enabled = False
    LabelPosition = lpLeft
    LabelSpacing = 3
    ReadOnly = True
    TabOrder = 0
  end
  object edtsingle: TLabeledEdit
    Left = 268
    Top = 16
    Width = 121
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = #38646#21806#21333#20215
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 1
  end
  object edtbatch: TLabeledEdit
    Left = 71
    Top = 48
    Width = 121
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = #25209#21457#21333#20215
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 2
  end
  object edtagio: TLabeledEdit
    Left = 268
    Top = 48
    Width = 121
    Height = 21
    Hint = #25240#25187#29575
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = #21830#21697#25240#25187#29575
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 3
  end
  object edtprice1: TLabeledEdit
    Left = 71
    Top = 80
    Width = 121
    Height = 21
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = #39044#23450#20215#26684'1'
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 4
  end
  object edtprice2: TLabeledEdit
    Left = 268
    Top = 80
    Width = 121
    Height = 21
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = #39044#23450#20215#26684'2'
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 5
  end
  object edtprice3: TLabeledEdit
    Left = 71
    Top = 112
    Width = 121
    Height = 21
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = #39044#23450#20215#26684'3'
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 6
  end
  object edtprice4: TLabeledEdit
    Left = 268
    Top = 112
    Width = 121
    Height = 21
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = #39044#23450#20215#26684'4'
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 7
  end
  object edtprice5: TLabeledEdit
    Left = 71
    Top = 144
    Width = 121
    Height = 21
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = #39044#23450#20215#26684'5'
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 8
  end
  object edtprice6: TLabeledEdit
    Left = 268
    Top = 144
    Width = 121
    Height = 21
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = #39044#23450#20215#26684'6'
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 9
  end
  object edtprice7: TLabeledEdit
    Left = 71
    Top = 176
    Width = 121
    Height = 21
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = #39044#23450#20215#26684'7'
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 10
  end
  object edtprice8: TLabeledEdit
    Left = 268
    Top = 176
    Width = 121
    Height = 21
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = #39044#23450#20215#26684'8'
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 11
  end
  object btnOk: TBitBtn
    Left = 262
    Top = 206
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 12
    OnClick = btnOkClick
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
  object btnCancel: TBitBtn
    Left = 336
    Top = 206
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 13
    OnClick = btnCancelClick
    Kind = bkCancel
  end
  object BitBtn1: TBitBtn
    Left = 187
    Top = 206
    Width = 75
    Height = 25
    Caption = #20215#26684#19968#33268
    TabOrder = 14
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
      33333333333F8888883F33330000324334222222443333388F3833333388F333
      000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
      F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
      223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
      3338888300003AAAAAAA33333333333888888833333333330000333333333333
      333333333333333333FFFFFF000033333333333344444433FFFF333333888888
      00003A444333333A22222438888F333338F3333800003A2243333333A2222438
      F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
      22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
      33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
end
