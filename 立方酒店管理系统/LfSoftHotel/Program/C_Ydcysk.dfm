inherited YdcyskForm: TYdcyskForm
  Left = 109
  Top = 23
  Width = 640
  Height = 521
  ActiveControl = DBEdit2
  Caption = #39044#23450
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 632
    Height = 68
    inherited lblTitile: TLabel
      Left = 219
      Width = 187
      Caption = #25955#23458#39184#39278#39044#23450
    end
    inherited Image1: TImage
      Left = 165
    end
    object Label10: TLabel
      Left = 16
      Top = 51
      Width = 72
      Height = 12
      Caption = #39044#23450#20154#22995#21517#65306
    end
    object lblKrxm: TLabel
      Left = 88
      Top = 51
      Width = 42
      Height = 12
      Caption = 'lblKrxm'
    end
    object Label12: TLabel
      Left = 216
      Top = 51
      Width = 48
      Height = 12
      Caption = #32852#31995#20154#65306
    end
    object lblLxr: TLabel
      Left = 264
      Top = 51
      Width = 36
      Height = 12
      Caption = 'lblLxr'
    end
    object Label8: TLabel
      Left = 368
      Top = 51
      Width = 60
      Height = 12
      Caption = #32852#31995#30005#35805#65306
    end
    object lblLxdh: TLabel
      Left = 428
      Top = 51
      Width = 42
      Height = 12
      Caption = 'lblLxdh'
    end
    object lblState: TStaticText
      Left = 535
      Top = 7
      Width = 93
      Height = 28
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      BevelKind = bkFlat
      BorderStyle = sbsSingle
      Caption = #26410#30830#35748
      Font.Charset = GB2312_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  inherited Panel2: TPanel
    Top = 68
    Width = 632
    Height = 391
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    inherited Bevel1: TBevel
      Width = 622
      Height = 190
      Anchors = [akLeft, akTop, akRight]
    end
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 64
      Height = 16
      Caption = #29992#39184#26085#26399
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 96
      Top = 16
      Width = 64
      Height = 16
      Caption = #29992#39184#26102#38388
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 176
      Top = 16
      Width = 64
      Height = 16
      Caption = #29992#39184#26102#27573
    end
    object Label11: TLabel
      Left = 88
      Top = 120
      Width = 16
      Height = 16
      Caption = #26700
    end
    object Label13: TLabel
      Left = 176
      Top = 120
      Width = 16
      Height = 16
      Caption = #20803
    end
    object Label6: TLabel
      Left = 264
      Top = 16
      Width = 32
      Height = 16
      Caption = #22791#27880
      FocusControl = DBMemo1
    end
    object Label7: TLabel
      Left = 16
      Top = 141
      Width = 432
      Height = 16
      Caption = #36873#25321#39184#21381#65288#21487#20197#36830#32493#36755#20837#39184#21381#32534#21495#65292#22312#27599#20010#32534#21495#21518#38754#21152#31354#26684#65289
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 32
      Width = 80
      Height = 24
      DataField = 'D_SYRQ'
      DataSource = dsYdcy
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 96
      Top = 32
      Width = 80
      Height = 24
      DataField = 'D_SYSJ'
      DataSource = dsYdcy
      TabOrder = 1
      OnExit = DBEdit3Exit
    end
    object DBComboBox1: TDBComboBox
      Left = 176
      Top = 32
      Width = 80
      Height = 24
      Style = csDropDownList
      DataField = 'D_SJDM'
      DataSource = dsYdcy
      ItemHeight = 16
      Items.Strings = (
        #26089#19978
        #20013#21320
        #26202#19978)
      TabOrder = 2
    end
    object ListView1: TListView
      Left = 5
      Top = 195
      Width = 622
      Height = 191
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      Checkboxes = True
      Columns = <>
      MultiSelect = True
      ReadOnly = True
      TabOrder = 9
      ViewStyle = vsList
      OnSelectItem = ListView1SelectItem
    end
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 64
      Width = 241
      Height = 41
      Caption = ' '#29992' '#39184' '#26631' '#20934' '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #20803'/'#27599#26700
        #20803'/'#20154
        #28857#33756)
      TabOrder = 3
      OnClick = RadioGroup1Click
    end
    object DBMemo1: TDBMemo
      Left = 264
      Top = 32
      Width = 241
      Height = 97
      DataField = 'D_BZ'
      DataSource = dsYdcy
      TabOrder = 6
    end
    object DBEdit5: TDBEdit
      Left = 16
      Top = 112
      Width = 65
      Height = 24
      DataField = 'D_XFSL'
      DataSource = dsYdcy
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 104
      Top = 112
      Width = 65
      Height = 24
      DataField = 'D_DJ'
      DataSource = dsYdcy
      TabOrder = 5
    end
    object edtCtbh: TEdit
      Left = 16
      Top = 157
      Width = 465
      Height = 24
      TabOrder = 7
    end
    object btnSelect: TBitBtn
      Left = 480
      Top = 155
      Width = 75
      Height = 25
      Caption = #36873#25321
      TabOrder = 8
      OnClick = btnSelectClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
    end
  end
  inherited Panel3: TPanel
    Top = 459
    Width = 632
    inherited btnOK: TBitBtn
      Left = 472
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 552
      OnClick = btnCancClick
    end
    object btnYdqr: TBitBtn
      Left = 5
      Top = 5
      Width = 100
      Height = 25
      Caption = #39044#23450#30830#35748'(&Q)'
      TabOrder = 2
      OnClick = btnYdqrClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000000000088880FFFFFFFFFF088880F00F00000F088880FFFFFFFFFF0
        88880F00F00000F088880FFFFFFFFFF088880FFFFFFF0FF088880F00FFF080F0
        88880F080F08080008440FF08080808880440000080808888844888880808888
        8844888888088888804488888880000008448888888888888888}
    end
    object btnYdqx: TBitBtn
      Left = 109
      Top = 5
      Width = 100
      Height = 25
      Caption = #21462#28040#30830#35748'(&X)'
      TabOrder = 3
      OnClick = btnYdqxClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888478888888888888748888844444888848888888444488884888888884
        4488884888888848448888748888448884888887444488888888888888888888
        8888888888888888888888888888888888888888888888888888}
    end
    object btnPrint: TBitBtn
      Left = 393
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360'(&P)'
      TabOrder = 4
      OnClick = btnPrintClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888F8800000000000888808888888880808800000000000008080888888BBB88
        0008088888877788080800000000000008800888888888808080800000000008
        0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
        088888880FFFFFFFF08888888000000000888888888888888888}
    end
  end
  object tblYdcy: TTable
    BeforePost = tblYdcyBeforePost
    OnNewRecord = tblYdcyNewRecord
    DatabaseName = 'LfHotelUser'
    IndexFieldNames = 'D_YDBH;D_CTBH'
    TableName = 'YDCY'
    Left = 392
    Top = 8
    object tblYdcyD_YDBH: TStringField
      FieldName = 'D_YDBH'
      Required = True
      Size = 12
    end
    object tblYdcyD_CTBH: TStringField
      FieldName = 'D_CTBH'
      Required = True
      Size = 5
    end
    object tblYdcyD_CTMC: TStringField
      FieldName = 'D_CTMC'
      Size = 10
    end
    object tblYdcyD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Size = 12
    end
    object tblYdcyD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Size = 30
    end
    object tblYdcyD_YDRQ: TDateTimeField
      FieldName = 'D_YDRQ'
    end
    object tblYdcyD_SYRQ: TDateTimeField
      FieldName = 'D_SYRQ'
      DisplayFormat = 'yyyy-mm-dd'
      EditMask = '!0000/00/99;1; '
    end
    object tblYdcyD_SYSJ: TDateTimeField
      FieldName = 'D_SYSJ'
      DisplayFormat = 'hh:nn'
      EditMask = '!90:00;1; '
    end
    object tblYdcyD_SJDM: TStringField
      FieldName = 'D_SJDM'
      FixedChar = True
      Size = 4
    end
    object tblYdcyD_YCBZ: TStringField
      FieldName = 'D_YCBZ'
      Size = 30
    end
    object tblYdcyD_YCLX: TIntegerField
      FieldName = 'D_YCLX'
    end
    object tblYdcyD_RS: TIntegerField
      FieldName = 'D_RS'
    end
    object tblYdcyD_DJ: TFloatField
      FieldName = 'D_DJ'
    end
    object tblYdcyD_XFSL: TFloatField
      FieldName = 'D_XFSL'
    end
    object tblYdcyD_XFJE: TFloatField
      FieldName = 'D_XFJE'
    end
    object tblYdcyD_YDBZ: TStringField
      FieldName = 'D_YDBZ'
      FixedChar = True
      Size = 1
    end
    object tblYdcyD_RZBZ: TStringField
      FieldName = 'D_RZBZ'
      FixedChar = True
      Size = 1
    end
    object tblYdcyD_KTBZ: TStringField
      FieldName = 'D_KTBZ'
      FixedChar = True
      Size = 1
    end
    object tblYdcyD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object tblYdcyD_BZ: TBlobField
      FieldName = 'D_BZ'
      Size = 1
    end
    object tblYdcyD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Size = 8
    end
  end
  object dsYdcy: TDataSource
    DataSet = tblYdcy
    Left = 424
    Top = 8
  end
  object tblCtzt: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'CTZT'
    Left = 456
    Top = 8
  end
end
