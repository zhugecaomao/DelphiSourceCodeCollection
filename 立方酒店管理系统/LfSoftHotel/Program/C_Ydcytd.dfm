inherited YdcytdForm: TYdcytdForm
  Left = 107
  Top = 40
  Width = 680
  Height = 515
  Caption = #39044#23450
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 672
    Height = 120
    inherited lblTitile: TLabel
      Left = 240
      Width = 187
      Caption = #22242#38431#39044#23450#39184#39278
    end
    inherited Image1: TImage
      Left = 195
    end
    object Label10: TLabel
      Left = 16
      Top = 47
      Width = 72
      Height = 12
      Caption = #39044#23450#20154#22995#21517#65306
    end
    object lblKrxm: TLabel
      Left = 88
      Top = 47
      Width = 42
      Height = 12
      Caption = 'lblKrxm'
    end
    object Label12: TLabel
      Left = 248
      Top = 47
      Width = 48
      Height = 12
      Caption = #32852#31995#20154#65306
    end
    object lblDwmc: TLabel
      Left = 312
      Top = 47
      Width = 42
      Height = 12
      Caption = 'lblDwmc'
    end
    object Label1: TLabel
      Left = 16
      Top = 71
      Width = 78
      Height = 12
      Caption = #29992#39184#26102#38388#65306' '#20174
    end
    object Label2: TLabel
      Left = 226
      Top = 71
      Width = 12
      Height = 12
      Caption = #21040
    end
    object Label3: TLabel
      Left = 16
      Top = 99
      Width = 60
      Height = 12
      Caption = #22791'    '#27880#65306
    end
    object Label4: TLabel
      Left = 472
      Top = 47
      Width = 60
      Height = 12
      Caption = #32852#31995#30005#35805#65306
    end
    object lblLxdh: TLabel
      Left = 531
      Top = 47
      Width = 42
      Height = 12
      Caption = 'lblLxdh'
    end
    object dtpBd: TDateTimePicker
      Left = 104
      Top = 63
      Width = 113
      Height = 20
      CalAlignment = dtaLeft
      Date = 37408.4134306713
      Time = 37408.4134306713
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
      OnChange = dtpBdChange
    end
    object dtpEd: TDateTimePicker
      Left = 248
      Top = 63
      Width = 113
      Height = 20
      CalAlignment = dtaLeft
      Date = 37408.4139931713
      Time = 37408.4139931713
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      OnChange = dtpEdChange
    end
    object btnInsert: TBitBtn
      Left = 368
      Top = 60
      Width = 75
      Height = 25
      Caption = #22686#21152
      TabOrder = 2
      OnClick = btnInsertClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
    end
    object lblState: TStaticText
      Left = 571
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
      TabOrder = 3
    end
    object edtBz: TEdit
      Left = 80
      Top = 95
      Width = 465
      Height = 20
      TabOrder = 4
    end
  end
  inherited Panel2: TPanel
    Top = 120
    Width = 672
    Height = 333
    inherited Bevel1: TBevel
      Width = 662
      Height = 323
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 662
      Height = 323
      Align = alClient
      DataSource = dsYdcy
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Alignment = taRightJustify
          Color = clMoneyGreen
          Expanded = False
          FieldName = 'D_SYRQ'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #29992#39184#26085#26399
          Width = 100
          Visible = True
        end
        item
          Alignment = taRightJustify
          Color = clMoneyGreen
          Expanded = False
          FieldName = 'D_SJDM'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #29992#39184#26102#27573
          Width = 90
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_SYSJ'
          Title.Alignment = taCenter
          Title.Caption = #29992#39184#26102#38388
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFSL'
          Title.Alignment = taCenter
          Title.Caption = #29992#39184#21488#25968
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_DJ'
          Title.Alignment = taCenter
          Title.Caption = #29992#39184#26631#20934
          Visible = True
        end
        item
          Color = clMoneyGreen
          Expanded = False
          FieldName = 'D_XFZE'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #21512#35745
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 453
    Width = 672
    inherited btnOK: TBitBtn
      Left = 512
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 592
      OnClick = btnCancClick
    end
    object btnYdqr: TBitBtn
      Left = 8
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
      Left = 120
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
      Left = 433
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
    CachedUpdates = True
    BeforeInsert = tblYdcyBeforeInsert
    OnCalcFields = tblYdcyCalcFields
    OnNewRecord = tblYdcyNewRecord
    DatabaseName = 'LfHotelUser'
    TableName = 'YDCY'
    Left = 424
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
      EditMask = '!0000/99/99;1; '
    end
    object tblYdcyD_SYSJ: TDateTimeField
      FieldName = 'D_SYSJ'
      DisplayFormat = 'hh:nn:ss'
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
    object tblYdcyD_XFZE: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'D_XFZE'
      Calculated = True
    end
  end
  object dsYdcy: TDataSource
    DataSet = tblYdcy
    Left = 464
    Top = 8
  end
  object tblYdcytd: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'YDCY'
    Left = 496
    Top = 8
  end
end
