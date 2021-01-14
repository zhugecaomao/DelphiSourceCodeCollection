inherited YdkftdForm: TYdkftdForm
  Left = 162
  Top = 99
  Caption = #39044#23450
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 64
    inherited lblTitile: TLabel
      Width = 187
      Caption = #22242#38431#39044#23450#23458#25151
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
      Left = 240
      Top = 47
      Width = 60
      Height = 12
      Caption = #21333#20301#21517#31216#65306
    end
    object lblDwmc: TLabel
      Left = 304
      Top = 47
      Width = 42
      Height = 12
      Caption = 'lblDwmc'
    end
    object lblState: TStaticText
      Left = 435
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
    Top = 64
    Height = 249
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    inherited Bevel1: TBevel
      Width = 275
      Height = 239
    end
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 64
      Height = 16
      Caption = #39044#23450#26085#26399
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 64
      Height = 16
      Caption = #21040#24215#26085#26399
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 144
      Top = 56
      Width = 64
      Height = 16
      Caption = #21040#24215#26102#38388
      FocusControl = DBEdit3
    end
    object Label7: TLabel
      Left = 16
      Top = 96
      Width = 64
      Height = 16
      Caption = #31163#24215#26085#26399
      FocusControl = DBEdit7
    end
    object Label8: TLabel
      Left = 144
      Top = 96
      Width = 64
      Height = 16
      Caption = #31163#24215#26102#38388
      FocusControl = DBEdit8
    end
    object Label6: TLabel
      Left = 16
      Top = 136
      Width = 32
      Height = 16
      Caption = #22791#27880
      FocusControl = DBEdit6
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 32
      Width = 122
      Height = 24
      DataField = 'D_YDRQ'
      DataSource = dsYdkf
      MaxLength = 10
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 72
      Width = 122
      Height = 24
      DataField = 'D_DDRQ'
      DataSource = dsYdkf
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 144
      Top = 72
      Width = 122
      Height = 24
      DataField = 'D_DDSJ'
      DataSource = dsYdkf
      TabOrder = 2
    end
    object DBEdit7: TDBEdit
      Left = 16
      Top = 112
      Width = 122
      Height = 24
      DataField = 'D_LDRQ'
      DataSource = dsYdkf
      TabOrder = 3
    end
    object DBEdit8: TDBEdit
      Left = 144
      Top = 112
      Width = 122
      Height = 24
      DataField = 'D_LDSJ'
      DataSource = dsYdkf
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 16
      Top = 152
      Width = 249
      Height = 24
      DataField = 'D_BZ'
      DataSource = dsYdkf
      TabOrder = 5
    end
    object lblBfh: TLabeledEdit
      Left = 16
      Top = 198
      Width = 50
      Height = 24
      EditLabel.Width = 32
      EditLabel.Height = 16
      EditLabel.Caption = #36215#22987
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 6
    end
    object lblEfh: TLabeledEdit
      Left = 66
      Top = 198
      Width = 50
      Height = 24
      EditLabel.Width = 32
      EditLabel.Height = 16
      EditLabel.Caption = #32456#27490
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 7
    end
    object lblFj: TLabeledEdit
      Left = 120
      Top = 198
      Width = 60
      Height = 24
      EditLabel.Width = 32
      EditLabel.Height = 16
      EditLabel.Caption = #25151#20215
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 8
    end
    object btnInsert: TBitBtn
      Left = 182
      Top = 198
      Width = 75
      Height = 25
      Caption = #28155#21152
      TabOrder = 9
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
    object vleKf: TValueListEditor
      Left = 280
      Top = 5
      Width = 251
      Height = 239
      Align = alRight
      DefaultColWidth = 120
      KeyOptions = [keyDelete, keyUnique]
      TabOrder = 10
      TitleCaptions.Strings = (
        #25151#38388#21495
        #25151#20215)
      ColWidths = (
        120
        125)
    end
  end
  inherited Panel3: TPanel
    inherited btnOK: TBitBtn
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      OnClick = btnCancClick
    end
    object btnYdqr: TBitBtn
      Left = 8
      Top = 5
      Width = 100
      Height = 25
      Caption = #39044#23450#30830#35748
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
      Left = 112
      Top = 5
      Width = 100
      Height = 25
      Caption = #39044#23450#21462#28040
      TabOrder = 3
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
    object btnTdjd: TBitBtn
      Left = 216
      Top = 5
      Width = 100
      Height = 25
      Caption = #22242#38431#25509#24453
      TabOrder = 4
      OnClick = btnTdjdClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object tblYdkf: TTable
    BeforePost = tblYdkfBeforePost
    OnNewRecord = tblYdkfNewRecord
    DatabaseName = 'LfHotelUser'
    TableName = 'YDKF'
    Left = 424
    Top = 16
    object tblYdkfD_YDBH: TStringField
      FieldName = 'D_YDBH'
      Required = True
      Size = 12
    end
    object tblYdkfD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Required = True
      Size = 5
    end
    object tblYdkfD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Size = 12
    end
    object tblYdkfD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Size = 30
    end
    object tblYdkfD_YDRQ: TDateTimeField
      FieldName = 'D_YDRQ'
    end
    object tblYdkfD_DDRQ: TDateTimeField
      FieldName = 'D_DDRQ'
    end
    object tblYdkfD_DDSJ: TDateTimeField
      FieldName = 'D_DDSJ'
      DisplayFormat = 'hh:nn'
      EditMask = '!90:00;1; '
    end
    object tblYdkfD_LDRQ: TDateTimeField
      FieldName = 'D_LDRQ'
    end
    object tblYdkfD_LDSJ: TDateTimeField
      FieldName = 'D_LDSJ'
      DisplayFormat = 'hh:nn'
      EditMask = '!90:00;1; '
    end
    object tblYdkfD_XFJE: TFloatField
      FieldName = 'D_XFJE'
    end
    object tblYdkfD_YDBZ: TStringField
      FieldName = 'D_YDBZ'
      FixedChar = True
      Size = 1
    end
    object tblYdkfD_RZBZ: TStringField
      FieldName = 'D_RZBZ'
      FixedChar = True
      Size = 1
    end
    object tblYdkfD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object tblYdkfD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Size = 8
    end
    object tblYdkfD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
  end
  object dsYdkf: TDataSource
    DataSet = tblYdkf
    Left = 456
    Top = 16
  end
end
