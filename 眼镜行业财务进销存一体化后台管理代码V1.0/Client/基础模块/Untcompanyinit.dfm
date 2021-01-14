inherited fm_company: Tfm_company
  Left = 132
  Top = 106
  Caption = #20844#21496#20449#24687
  ClientHeight = 301
  ClientWidth = 446
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 442
    Height = 271
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 20
      Width = 52
      Height = 13
      Caption = #20844#21496#20195#30721
    end
    object Label2: TLabel
      Left = 11
      Top = 45
      Width = 52
      Height = 13
      Caption = #20844#21496#21517#31216
    end
    object Label3: TLabel
      Left = 11
      Top = 69
      Width = 52
      Height = 13
      Caption = #20844#21496#31616#31216
    end
    object Label4: TLabel
      Left = 11
      Top = 94
      Width = 52
      Height = 13
      Caption = #20844#21496#27861#20154
    end
    object Label5: TLabel
      Left = 11
      Top = 116
      Width = 52
      Height = 13
      Caption = #20844#21496#32593#22336
    end
    object Label6: TLabel
      Left = 11
      Top = 138
      Width = 68
      Height = 13
      Caption = #20844#21496'E_Mail'
    end
    object Label7: TLabel
      Left = 11
      Top = 164
      Width = 59
      Height = 13
      Caption = #24320#25143#38134#34892'1'
    end
    object Label8: TLabel
      Left = 243
      Top = 164
      Width = 59
      Height = 13
      Caption = #24320#25143#38134#34892'2'
    end
    object Label9: TLabel
      Left = 12
      Top = 188
      Width = 52
      Height = 13
      Caption = #20844#21496#24080#25143
    end
    object Label10: TLabel
      Left = 12
      Top = 212
      Width = 52
      Height = 13
      Caption = #32852#31995#30005#35805
    end
    object Label11: TLabel
      Left = 14
      Top = 236
      Width = 52
      Height = 13
      Caption = #32852#31995#22320#22336
    end
    object DBEdit1: TDBEdit
      Left = 83
      Top = 16
      Width = 353
      Height = 21
      DataField = 'ComponyCode'
      DataSource = dmmain.Dscominfo
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 83
      Top = 40
      Width = 353
      Height = 21
      DataField = 'ComponyName'
      DataSource = dmmain.Dscominfo
      TabOrder = 1
      OnExit = E2Exit
    end
    object DBEdit3: TDBEdit
      Left = 83
      Top = 64
      Width = 353
      Height = 21
      Color = clInfoBk
      DataField = 'ComponyJc'
      DataSource = dmmain.Dscominfo
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 83
      Top = 88
      Width = 353
      Height = 21
      DataField = 'ComponyMAN'
      DataSource = dmmain.Dscominfo
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 83
      Top = 112
      Width = 353
      Height = 21
      DataField = 'COMPONYWWW'
      DataSource = dmmain.Dscominfo
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 83
      Top = 135
      Width = 353
      Height = 21
      DataField = 'Email'
      DataSource = dmmain.Dscominfo
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 83
      Top = 160
      Width = 121
      Height = 21
      DataField = 'BackId1'
      DataSource = dmmain.Dscominfo
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 313
      Top = 160
      Width = 123
      Height = 21
      DataField = 'BackID2'
      DataSource = dmmain.Dscominfo
      TabOrder = 7
    end
    object DBEdit9: TDBEdit
      Left = 83
      Top = 185
      Width = 352
      Height = 21
      DataField = 'ACCOUNTid'
      DataSource = dmmain.Dscominfo
      TabOrder = 8
    end
    object DBEdit10: TDBEdit
      Left = 83
      Top = 209
      Width = 351
      Height = 21
      DataField = 'Telphone'
      DataSource = dmmain.Dscominfo
      TabOrder = 9
    end
    object DBEdit11: TDBEdit
      Left = 83
      Top = 233
      Width = 350
      Height = 21
      DataField = 'Address'
      DataSource = dmmain.Dscominfo
      TabOrder = 10
    end
  end
  object btnOk: TBitBtn
    Left = 294
    Top = 274
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 1
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
    Left = 368
    Top = 274
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = btnCancelClick
    Kind = bkCancel
  end
end
