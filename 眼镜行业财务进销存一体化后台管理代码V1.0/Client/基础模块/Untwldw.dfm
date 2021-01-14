inherited fmwldw: Tfmwldw
  Left = 53
  Top = 65
  Caption = #24448#26469#21333#20301
  ClientHeight = 372
  ClientWidth = 688
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel21: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 372
    Align = alClient
    BevelOuter = bvNone
    Color = cl3DLight
    TabOrder = 0
    object Label1: TLabel
      Left = 23
      Top = 56
      Width = 78
      Height = 13
      Caption = #24448#26469#21333#20301#21517#31216
    end
    object Label2: TLabel
      Left = 75
      Top = 80
      Width = 26
      Height = 13
      Caption = #31616#31216
    end
    object Label3: TLabel
      Left = 383
      Top = 80
      Width = 78
      Height = 13
      Caption = #24448#26469#21333#20301#32534#21495
    end
    object Label4: TLabel
      Left = 49
      Top = 104
      Width = 52
      Height = 13
      Caption = #35814#32454#22320#22336
    end
    object Label5: TLabel
      Left = 49
      Top = 128
      Width = 52
      Height = 13
      Caption = #37038#25919#32534#30721
    end
    object Label6: TLabel
      Left = 409
      Top = 126
      Width = 52
      Height = 13
      Caption = #32852#31995#20154#21592
    end
    object Label7: TLabel
      Left = 49
      Top = 152
      Width = 52
      Height = 13
      Caption = #32852#31995#30005#35805
    end
    object Label8: TLabel
      Left = 409
      Top = 152
      Width = 52
      Height = 13
      Caption = #20256#30495#21495#30721
    end
    object Label9: TLabel
      Left = 59
      Top = 174
      Width = 42
      Height = 13
      Caption = 'E_MAIL'
    end
    object Label10: TLabel
      Left = 396
      Top = 174
      Width = 65
      Height = 13
      Caption = #31246#21153#30331#35760#21495
    end
    object Label11: TLabel
      Left = 49
      Top = 198
      Width = 52
      Height = 13
      Caption = #24320#25143#38134#34892
    end
    object Label12: TLabel
      Left = 409
      Top = 198
      Width = 52
      Height = 13
      Caption = #38134#34892#24080#21495
    end
    object Label13: TLabel
      Left = 23
      Top = 244
      Width = 78
      Height = 13
      Caption = #36215#21021#24212#25910#24080#27454
    end
    object Label14: TLabel
      Left = 382
      Top = 244
      Width = 78
      Height = 13
      Caption = #36215#21021#24212#20184#24080#27454
    end
    object Label15: TLabel
      Left = 49
      Top = 268
      Width = 52
      Height = 13
      Caption = #27861#20154#20195#34920
    end
    object Label16: TLabel
      Left = 409
      Top = 268
      Width = 52
      Height = 13
      Caption = #20449#29992#39069#24230
    end
    object Label17: TLabel
      Left = 49
      Top = 287
      Width = 52
      Height = 13
      Caption = #22791#27880#35828#26126
    end
    object Label18: TLabel
      Left = 23
      Top = 220
      Width = 78
      Height = 13
      Caption = #32047#35745#24212#25910#24080#27454
    end
    object Label19: TLabel
      Left = 382
      Top = 220
      Width = 78
      Height = 13
      Caption = #32047#35745#24212#20184#24080#27454
    end
    object Panel22: TPanel
      Left = 0
      Top = 0
      Width = 688
      Height = 44
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvSpace
      Color = cl3DLight
      TabOrder = 0
      object btnSelect: TSpeedButton
        Left = 376
        Top = 14
        Width = 65
        Height = 22
        Caption = #26816#32034
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          333333773337777333333078F8F87033333337F3333337F33333778F8F8F8773
          333337333333373F333307F8F8F8F70333337F33FFFFF37F3333078999998703
          33337F377777337F333307F8F8F8F703333373F3333333733333778F8F8F8773
          333337F3333337F333333078F8F870333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        NumGlyphs = 2
        OnClick = btnSelectClick
      end
      object edtcode: TLabeledEdit
        Left = 119
        Top = 14
        Width = 250
        Height = 21
        EditLabel.Width = 91
        EditLabel.Height = 13
        EditLabel.Caption = #24448#26469#21333#20301#21517#31216#65306
        LabelPosition = lpLeft
        LabelSpacing = 3
        TabOrder = 0
        OnKeyPress = edtcodeKeyPress
      end
    end
    object btnExit: TBitBtn
      Left = 600
      Top = 345
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 1
      OnClick = btnExitClick
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
    object btnAdd: TBitBtn
      Left = 17
      Top = 345
      Width = 75
      Height = 25
      Caption = #26032#22686
      TabOrder = 2
      OnClick = btnAddClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
        0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
        0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
        5555557FFFFF7755555555500000005555555577777775555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
    end
    object btnEdit: TBitBtn
      Left = 95
      Top = 345
      Width = 75
      Height = 25
      Caption = #20462#25913
      TabOrder = 3
      OnClick = btnEditClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADA000000000000000D088888888888880A080808080808080D000000000000
        000AA0EEEEEEEE0DADADD0E0000EE0DADADAA0E0A0EE00ADADADD0E00EE0D00A
        DADAA0E0EE0DA000ADADD0EEE0DAD0B70ADAA0EE0DADA0B80DADD0E0DADADA0B
        70DAA00DADADAD0B00ADD0DADADADAD0110AADADADADADA000AD}
    end
    object btnSave: TBitBtn
      Left = 173
      Top = 345
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 4
      OnClick = btnSaveClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADAAD0000000000000DD03300000088030AA03300000088030DD03300000088
        030AA03300000000030DD03333333333330AA03300000000330DD03088888888
        030AA03088888888030DD03088888888030AA03088888888030DD03088888888
        000AA03088888888080DD00000000000000AADADADADADADADAD}
    end
    object btnCancel: TBitBtn
      Left = 251
      Top = 345
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 5
      OnClick = btnCancelClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
        4FFFFF44444FFFFF48FFFF4444FFFFFFF4FFFF444FFFFFFFF4FFFF44F4FFFFFF
        F4FFFF4FFF44FFFF48FFFFFFFFFF44448FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object btnDelete: TBitBtn
      Left = 329
      Top = 345
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 6
      OnClick = btnDeleteClick
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888881F88881F8888888888888991F8888889F8888191F888881
        F888888199F88891F8888888191F819F88888888819199F88888888888919F88
        88888888891911F888888888191F89F88888889191F88819F88881919F888881
        9F88891F8888888819F88888888888888888}
    end
    object DBEdit1: TDBEdit
      Left = 103
      Top = 52
      Width = 553
      Height = 21
      DataField = 'supply_name'
      DataSource = dmmain.dscompany
      TabOrder = 7
      OnExit = DBEdit1Exit
    end
    object DBEdit2: TDBEdit
      Left = 103
      Top = 76
      Width = 199
      Height = 21
      DataField = 'abbreviation'
      DataSource = dmmain.dscompany
      TabOrder = 8
    end
    object DBEdit3: TDBEdit
      Left = 463
      Top = 75
      Width = 191
      Height = 21
      DataField = 'supply_NO'
      DataSource = dmmain.dscompany
      TabOrder = 9
    end
    object DBEdit4: TDBEdit
      Left = 103
      Top = 99
      Width = 553
      Height = 21
      DataField = 'address'
      DataSource = dmmain.dscompany
      TabOrder = 10
    end
    object DBEdit5: TDBEdit
      Left = 103
      Top = 122
      Width = 200
      Height = 21
      DataField = 'Zip'
      DataSource = dmmain.dscompany
      TabOrder = 11
    end
    object DBEdit6: TDBEdit
      Left = 463
      Top = 120
      Width = 193
      Height = 21
      DataField = 'Link_person'
      DataSource = dmmain.dscompany
      TabOrder = 12
    end
    object DBEdit7: TDBEdit
      Left = 103
      Top = 144
      Width = 121
      Height = 21
      DataField = 'Telphone'
      DataSource = dmmain.dscompany
      TabOrder = 13
    end
    object DBEdit8: TDBEdit
      Left = 463
      Top = 144
      Width = 193
      Height = 21
      DataField = 'Fax'
      DataSource = dmmain.dscompany
      TabOrder = 14
    end
    object DBEdit9: TDBEdit
      Left = 103
      Top = 168
      Width = 121
      Height = 21
      DataField = 'Email'
      DataSource = dmmain.dscompany
      TabOrder = 15
    end
    object DBEdit10: TDBEdit
      Left = 463
      Top = 168
      Width = 193
      Height = 21
      DataField = 'tax_No'
      DataSource = dmmain.dscompany
      TabOrder = 16
    end
    object DBEdit11: TDBEdit
      Left = 103
      Top = 192
      Width = 121
      Height = 21
      DataField = 'bank'
      DataSource = dmmain.dscompany
      TabOrder = 17
    end
    object DBEdit12: TDBEdit
      Left = 463
      Top = 192
      Width = 193
      Height = 21
      DataField = 'bill'
      DataSource = dmmain.dscompany
      TabOrder = 18
    end
    object DBEdit13: TDBEdit
      Left = 103
      Top = 238
      Width = 121
      Height = 21
      DataField = 'Must_gather'
      DataSource = dmmain.dscompany
      TabOrder = 19
    end
    object DBEdit14: TDBEdit
      Left = 463
      Top = 238
      Width = 193
      Height = 21
      DataField = 'Pay_gather'
      DataSource = dmmain.dscompany
      TabOrder = 20
    end
    object DBEdit15: TDBEdit
      Left = 103
      Top = 262
      Width = 121
      Height = 21
      DataField = 'legal_person'
      DataSource = dmmain.dscompany
      TabOrder = 21
    end
    object DBEdit16: TDBEdit
      Left = 463
      Top = 262
      Width = 193
      Height = 21
      DataField = 'contact'
      DataSource = dmmain.dscompany
      TabOrder = 22
    end
    object DBMemo1: TDBMemo
      Left = 103
      Top = 286
      Width = 553
      Height = 54
      DataField = 'remark'
      DataSource = dmmain.dscompany
      TabOrder = 23
    end
    object DBEdit17: TDBEdit
      Left = 103
      Top = 214
      Width = 121
      Height = 21
      DataField = 'receivables'
      DataSource = dmmain.dscompany
      TabOrder = 24
    end
    object DBEdit18: TDBEdit
      Left = 463
      Top = 214
      Width = 193
      Height = 21
      DataField = 'totalrise'
      DataSource = dmmain.dscompany
      TabOrder = 25
    end
  end
end
