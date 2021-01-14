inherited fmBatchGuest: TfmBatchGuest
  Left = 94
  Top = 128
  Caption = #25209#37327#39038#23458#36164#26009#24405#20837#32534#36753
  ClientHeight = 376
  ClientWidth = 615
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 335
    Width = 615
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Color = 16573127
    TabOrder = 0
    object btnExit: TBitBtn
      Left = 536
      Top = 8
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
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
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = #26032#22686
      TabOrder = 1
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
      Left = 94
      Top = 8
      Width = 75
      Height = 25
      Caption = #20462#25913
      TabOrder = 2
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
      Left = 172
      Top = 8
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 3
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
      Left = 250
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 4
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
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 5
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
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 47
    Width = 615
    Height = 288
    Align = alBottom
    Caption = #25209#37327#39038#23458#36164#26009
    TabOrder = 1
    object Label1: TLabel
      Left = 31
      Top = 25
      Width = 52
      Height = 13
      Caption = #39038#23458#32534#21495
    end
    object Label2: TLabel
      Left = 30
      Top = 48
      Width = 52
      Height = 13
      Caption = #39038#23458#21517#31216
    end
    object Label3: TLabel
      Left = 433
      Top = 25
      Width = 39
      Height = 13
      Caption = #19994#21153#21592
    end
    object Bevel1: TBevel
      Left = 24
      Top = 79
      Width = 585
      Height = 2
    end
    object Label9: TLabel
      Left = 41
      Top = 123
      Width = 39
      Height = 13
      Caption = #32852#31995#20154
    end
    object Label10: TLabel
      Left = 15
      Top = 262
      Width = 52
      Height = 13
      Caption = #32047#35745#27425#25968
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 317
      Top = 99
      Width = 26
      Height = 13
      Caption = #20256#30495
    end
    object Label12: TLabel
      Left = 225
      Top = 123
      Width = 52
      Height = 13
      Caption = #32852#31995#30005#35805
    end
    object Label14: TLabel
      Left = 41
      Top = 147
      Width = 39
      Height = 13
      Caption = #24320#25143#34892
    end
    object Label15: TLabel
      Left = 443
      Top = 124
      Width = 26
      Height = 13
      Caption = #25163#26426
    end
    object Label16: TLabel
      Left = 29
      Top = 99
      Width = 52
      Height = 13
      Caption = #32852#31995#22320#22336
    end
    object Label17: TLabel
      Left = 460
      Top = 99
      Width = 52
      Height = 13
      Caption = #37038#25919#32534#30721
    end
    object Label18: TLabel
      Left = 29
      Top = 195
      Width = 52
      Height = 13
      Caption = #25152#22312#22320#21306
    end
    object Label19: TLabel
      Left = 235
      Top = 194
      Width = 39
      Height = 13
      Caption = #25152#22312#30465
    end
    object Label20: TLabel
      Left = 53
      Top = 171
      Width = 26
      Height = 13
      Caption = #31246#21495
    end
    object Label21: TLabel
      Left = 419
      Top = 194
      Width = 52
      Height = 13
      Caption = #25152#22312#22478#24066
    end
    object Label22: TLabel
      Left = 434
      Top = 261
      Width = 52
      Height = 13
      Caption = #24314#26723#26085#26399
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 53
      Top = 220
      Width = 26
      Height = 13
      Caption = #22791#27880
    end
    object Bevel2: TBevel
      Left = 19
      Top = 247
      Width = 585
      Height = 2
    end
    object Label24: TLabel
      Left = 156
      Top = 262
      Width = 52
      Height = 13
      Caption = #32047#31215#37329#39069
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 293
      Top = 262
      Width = 52
      Height = 13
      Caption = #31215#20998#28857#25968
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 421
      Top = 48
      Width = 52
      Height = 13
      Caption = #39038#23458#31616#31216
    end
    object Label5: TLabel
      Left = 331
      Top = 147
      Width = 26
      Height = 13
      Caption = #24080#21495
    end
    object Label6: TLabel
      Left = 306
      Top = 170
      Width = 52
      Height = 13
      Caption = #20449#29992#39069#24230
    end
    object DBText1: TDBText
      Left = 86
      Top = 262
      Width = 65
      Height = 17
      Color = clBtnFace
      DataField = 'BG_Times'
      ParentColor = False
    end
    object DBText2: TDBText
      Left = 224
      Top = 262
      Width = 65
      Height = 17
      Color = clBtnFace
      DataField = 'BG_Money'
      ParentColor = False
    end
    object DBText3: TDBText
      Left = 362
      Top = 262
      Width = 65
      Height = 17
      Color = clBtnFace
      DataField = 'BG_Point'
      ParentColor = False
    end
    object DBText4: TDBText
      Left = 505
      Top = 261
      Width = 65
      Height = 17
      Color = clBtnFace
      DataField = 'BG_NewDate'
      ParentColor = False
    end
    object DBEdit1: TDBEdit
      Left = 82
      Top = 21
      Width = 300
      Height = 21
      DataField = 'BG_Code'
      DataSource = DSBATCHGUEST
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 472
      Top = 21
      Width = 121
      Height = 21
      DataField = 'BG_Operater'
      DataSource = DSBATCHGUEST
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 82
      Top = 45
      Width = 300
      Height = 21
      DataField = 'BG_Name'
      DataSource = DSBATCHGUEST
      TabOrder = 2
      OnExit = DBEdit3Exit
    end
    object DBEdit5: TDBEdit
      Left = 81
      Top = 95
      Width = 216
      Height = 21
      DataField = 'BG_Address'
      DataSource = DSBATCHGUEST
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 276
      Top = 119
      Width = 121
      Height = 21
      DataField = 'BG_Tel'
      DataSource = DSBATCHGUEST
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 357
      Top = 143
      Width = 235
      Height = 21
      DataField = 'BG_Account'
      DataSource = DSBATCHGUEST
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 470
      Top = 119
      Width = 121
      Height = 21
      DataField = 'BG_HandSet'
      DataSource = DSBATCHGUEST
      TabOrder = 6
    end
    object DBEdit9: TDBEdit
      Left = 81
      Top = 119
      Width = 121
      Height = 21
      DataField = 'BG_LinkMan'
      DataSource = DSBATCHGUEST
      TabOrder = 7
    end
    object DBEdit10: TDBEdit
      Left = 511
      Top = 95
      Width = 80
      Height = 21
      DataField = 'BG_PostCode'
      DataSource = DSBATCHGUEST
      TabOrder = 8
    end
    object DBEdit11: TDBEdit
      Left = 344
      Top = 95
      Width = 105
      Height = 21
      DataField = 'BG_Fax'
      DataSource = DSBATCHGUEST
      TabOrder = 9
    end
    object DBEdit12: TDBEdit
      Left = 81
      Top = 191
      Width = 121
      Height = 21
      DataField = 'BG_Area'
      DataSource = DSBATCHGUEST
      TabOrder = 10
    end
    object DBEdit14: TDBEdit
      Left = 472
      Top = 191
      Width = 121
      Height = 21
      DataField = 'BG_City'
      DataSource = DSBATCHGUEST
      TabOrder = 11
    end
    object DBEdit15: TDBEdit
      Left = 81
      Top = 167
      Width = 216
      Height = 21
      DataField = 'BG_TexCode'
      DataSource = DSBATCHGUEST
      TabOrder = 12
    end
    object DBComboBox2: TDBComboBox
      Left = 276
      Top = 191
      Width = 121
      Height = 21
      DataField = 'BG_Province'
      DataSource = DSBATCHGUEST
      ItemHeight = 13
      TabOrder = 13
    end
    object DBEdit16: TDBEdit
      Left = 80
      Top = 215
      Width = 513
      Height = 21
      DataField = 'BG_Remark'
      DataSource = DSBATCHGUEST
      TabOrder = 14
    end
    object DBEdit4: TDBEdit
      Left = 472
      Top = 44
      Width = 121
      Height = 21
      DataField = 'BG_ShortName'
      DataSource = DSBATCHGUEST
      ReadOnly = True
      TabOrder = 15
    end
    object DBEdit20: TDBEdit
      Left = 81
      Top = 143
      Width = 216
      Height = 21
      DataField = 'BG_Bank'
      DataSource = DSBATCHGUEST
      TabOrder = 16
    end
    object DBEdit21: TDBEdit
      Left = 357
      Top = 167
      Width = 235
      Height = 21
      DataField = 'BG_Credit'
      DataSource = DSBATCHGUEST
      TabOrder = 17
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 615
    Height = 46
    Align = alTop
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    object btnSelect: TSpeedButton
      Left = 380
      Top = 16
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
    object edtCode: TLabeledEdit
      Left = 79
      Top = 17
      Width = 300
      Height = 21
      Color = 16573127
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #39038#23458#32534#21495
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 0
      OnKeyPress = edtCodeKeyPress
    end
  end
  object DSBATCHGUEST: TDataSource
    DataSet = dmmain.cdsBatchGuest
    Left = 584
    Top = 8
  end
end
