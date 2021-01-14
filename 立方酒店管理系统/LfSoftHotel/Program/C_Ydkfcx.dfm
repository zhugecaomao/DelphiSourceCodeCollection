inherited YdkfcxForm: TYdkfcxForm
  Left = 11
  Top = 45
  Width = 780
  Height = 500
  Caption = #26597#35810
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 772
    Height = 72
    inherited lblTitle: TLabel
      Left = 289
      Width = 187
      Caption = #39044#23450#23458#25151#26597#35810
    end
    inherited Image1: TImage
      Left = 237
    end
    inherited cmbOption: TComboBox
      Top = 14
      Visible = False
    end
    inherited cmbExpress: TComboBox
      Top = 14
      Visible = False
    end
    inherited edtValue: TEdit
      Top = 14
      Visible = False
    end
    inherited btnLoca: TBitBtn
      Top = 11
      Visible = False
    end
    object dtpDate: TDateTimePicker
      Left = 8
      Top = 44
      Width = 113
      Height = 20
      CalAlignment = dtaLeft
      Date = 37583.8438373843
      Time = 37583.8438373843
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 4
    end
    object btnQuery: TBitBtn
      Left = 128
      Top = 42
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 5
      OnClick = btnQueryClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333FF3FF3333333333CC30003333333333773777333333333C33
        3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
        33003377333337F33377333333333C333300333F333337F33377339333333C33
        3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
        330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
        330077F377F337F33377993399333C33330077FF773337F33377399993333C33
        33333777733337F333FF333333333C33300033333333373FF7773333333333CC
        3000333333333377377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object btnAll: TBitBtn
      Left = 560
      Top = 42
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25152#26377#39044#23450
      TabOrder = 6
      OnClick = btnAllClick
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
    object btnYdxg: TBitBtn
      Left = 666
      Top = 42
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #39044#23450#20462#25913
      TabOrder = 7
      OnClick = DBGrid1DblClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
  end
  inherited Panel2: TPanel
    Top = 72
    Width = 772
    Height = 366
    inherited DBGrid1: TDBGrid
      Width = 762
      Height = 356
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'D_RZBZ'
          Title.Alignment = taCenter
          Title.Caption = #26159#21542#30830#35748
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_YDBZ'
          Title.Alignment = taCenter
          Title.Caption = #39044#23450#31867#22411
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_KFBH'
          Title.Alignment = taCenter
          Title.Caption = #23458#25151#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFJE'
          Title.Alignment = taCenter
          Title.Caption = #25151#20215
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_KRXM'
          Title.Alignment = taCenter
          Title.Caption = #23458#20154#22995#21517
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_DDRQ'
          Title.Alignment = taCenter
          Title.Caption = #21040#24215#26085#26399
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_DDSJ'
          Title.Alignment = taCenter
          Title.Caption = #21040#24215#26102#38388
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_LDRQ'
          Title.Alignment = taCenter
          Title.Caption = #31163#24215#26085#26399
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_LDSJ'
          Title.Alignment = taCenter
          Title.Caption = #31163#24215#26102#38388
          Width = 65
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 438
    Width = 772
    inherited btnHelp: TBitBtn
      Left = 612
    end
    inherited btnClose: TBitBtn
      Left = 692
    end
    inherited btnPrint: TBitBtn
      Left = 532
      OnClick = btnPrintClick
    end
  end
  inherited qryWork: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from YDKF where D_KFBH<>"0"')
    object qryWorkD_YDBH: TStringField
      FieldName = 'D_YDBH'
      Origin = 'LFHOTELUSER.YDKF.D_YDBH'
      Size = 12
    end
    object qryWorkD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Origin = 'LFHOTELUSER.YDKF.D_KFBH'
      Size = 5
    end
    object qryWorkD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER.YDKF.D_KRBH'
      Size = 12
    end
    object qryWorkD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Origin = 'LFHOTELUSER.YDKF.D_KRXM'
      Size = 30
    end
    object qryWorkD_YDRQ: TDateTimeField
      FieldName = 'D_YDRQ'
      Origin = 'LFHOTELUSER.YDKF.D_YDRQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object qryWorkD_DDRQ: TDateTimeField
      FieldName = 'D_DDRQ'
      Origin = 'LFHOTELUSER.YDKF.D_DDRQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object qryWorkD_DDSJ: TDateTimeField
      FieldName = 'D_DDSJ'
      Origin = 'LFHOTELUSER.YDKF.D_DDSJ'
      DisplayFormat = 'hh:nn'
    end
    object qryWorkD_LDRQ: TDateTimeField
      FieldName = 'D_LDRQ'
      Origin = 'LFHOTELUSER.YDKF.D_LDRQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object qryWorkD_LDSJ: TDateTimeField
      FieldName = 'D_LDSJ'
      Origin = 'LFHOTELUSER.YDKF.D_LDSJ'
      DisplayFormat = 'hh:nn'
    end
    object qryWorkD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER.YDKF.D_XFJE'
    end
    object qryWorkD_YDBZ: TStringField
      FieldName = 'D_YDBZ'
      Origin = 'LFHOTELUSER.YDKF.D_YDBZ'
      OnGetText = qryWorkD_YDBZGetText
      FixedChar = True
      Size = 1
    end
    object qryWorkD_RZBZ: TStringField
      FieldName = 'D_RZBZ'
      Origin = 'LFHOTELUSER.YDKF.D_RZBZ'
      OnGetText = qryWorkD_RZBZGetText
      FixedChar = True
      Size = 1
    end
    object qryWorkD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      Origin = 'LFHOTELUSER.YDKF.D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object qryWorkD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.YDKF.D_CZYXM'
      Size = 8
    end
    object qryWorkD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.YDKF.D_BZ'
      Size = 30
    end
  end
end
