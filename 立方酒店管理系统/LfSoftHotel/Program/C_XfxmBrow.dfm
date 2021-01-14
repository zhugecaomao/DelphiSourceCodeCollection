inherited XfxmBrowForm: TXfxmBrowForm
  Left = 61
  Top = 50
  Width = 650
  Height = 500
  Caption = #25253#34920
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 642
    Height = 125
    inherited lblTitle: TLabel
      Left = 233
      Width = 187
      Caption = #28040#36153#39033#30446#32479#35745
    end
    inherited Image1: TImage
      Left = 177
    end
    object Bevel1: TBevel
      Left = 8
      Top = 44
      Width = 521
      Height = 76
      Shape = bsFrame
    end
    object Label1: TLabel
      Left = 16
      Top = 62
      Width = 72
      Height = 12
      Caption = #32479#35745#36215#22987#26085#26399
    end
    object Label2: TLabel
      Left = 232
      Top = 62
      Width = 72
      Height = 12
      Caption = #32479#35745#25130#27490#26085#26399
    end
    object Label3: TLabel
      Left = 16
      Top = 94
      Width = 72
      Height = 12
      Caption = #32479#35745#28040#36153#39033#30446
    end
    object lblXfhj: TLabel
      Left = 232
      Top = 92
      Width = 76
      Height = 14
      Caption = #28040#36153#21512#35745#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblYhhj: TLabel
      Left = 400
      Top = 92
      Width = 76
      Height = 14
      Caption = #20248#24800#21512#35745#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dtpBd: TDateTimePicker
      Left = 90
      Top = 57
      Width = 129
      Height = 20
      CalAlignment = dtaLeft
      Date = 37383.2415563657
      Time = 37383.2415563657
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object dtpEd: TDateTimePicker
      Left = 306
      Top = 57
      Width = 129
      Height = 20
      CalAlignment = dtaLeft
      Date = 37383.2415563657
      Time = 37383.2415563657
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
    end
    object btnTj: TBitBtn
      Left = 448
      Top = 53
      Width = 75
      Height = 25
      Caption = #32479'  '#35745
      TabOrder = 3
      OnClick = btnTjClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300030003
        0003333377737773777333333333333333333FFFFFFFFFFFFFFF770000000000
        0000777777777777777733039993BBB3CCC3337F737F737F737F37039993BBB3
        CCC3377F737F737F737F33039993BBB3CCC33F7F737F737F737F77079997BBB7
        CCC77777737773777377330399930003CCC3337F737F7773737F370399933333
        CCC3377F737F3333737F330399933333CCC33F7F737FFFFF737F770700077777
        CCC77777777777777377330333333333CCC3337F33333333737F370333333333
        0003377F33333333777333033333333333333F7FFFFFFFFFFFFF770777777777
        7777777777777777777733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object cmbXfxm: TComboBox
      Left = 90
      Top = 88
      Width = 129
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 0
    end
  end
  inherited Panel2: TPanel
    Top = 125
    Width = 642
    Height = 313
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 632
      Height = 303
      Align = alClient
      Color = clMoneyGreen
      DataSource = dsWork
      FixedColor = clSkyBlue
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
          Expanded = False
          FieldName = 'D_JZRQ'
          Title.Alignment = taCenter
          Title.Caption = #32467#24080#26085#26399
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JZSJ'
          Title.Alignment = taCenter
          Title.Caption = #32467#24080#26102#38388
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFJE'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#37329#39069
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_YHJE'
          Title.Alignment = taCenter
          Title.Caption = #20248#24800#37329#39069
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_CZYXM'
          Title.Alignment = taCenter
          Title.Caption = #25805#20316#21592
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_BZ'
          Title.Caption = #32467#24080#22791#27880
          Width = 200
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 438
    Width = 642
    inherited btnHelp: TBitBtn
      Left = 482
    end
    inherited btnClose: TBitBtn
      Left = 562
    end
    object btnPrint: TBitBtn
      Left = 402
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360'(&P)'
      TabOrder = 2
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
  inherited DosMove1: TDosMove
    Left = 8
  end
  object qryWork: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KRJZ')
    Left = 40
    Top = 8
    object qryWorkD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Origin = 'LFHOTELUSER.KRJZ.D_JZBH'
      Size = 12
    end
    object qryWorkD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER.KRJZ.D_HH'
    end
    object qryWorkD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.KRJZ.D_XMBH'
      Size = 5
    end
    object qryWorkD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
      Origin = 'LFHOTELUSER.KRJZ.D_XFDJ'
    end
    object qryWorkD_XFSL: TFloatField
      FieldName = 'D_XFSL'
      Origin = 'LFHOTELUSER.KRJZ.D_XFSL'
    end
    object qryWorkD_XFGG: TStringField
      FieldName = 'D_XFGG'
      Origin = 'LFHOTELUSER.KRJZ.D_XFGG'
      Size = 5
    end
    object qryWorkD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER.KRJZ.D_XFJE'
      DisplayFormat = '#.##'
    end
    object qryWorkD_YJJE: TFloatField
      FieldName = 'D_YJJE'
      Origin = 'LFHOTELUSER.KRJZ.D_YJJE'
      DisplayFormat = '#.##'
    end
    object qryWorkD_YHJE: TFloatField
      FieldName = 'D_YHJE'
      Origin = 'LFHOTELUSER.KRJZ.D_YHJE'
      DisplayFormat = '#.##'
    end
    object qryWorkD_JZFS: TStringField
      FieldName = 'D_JZFS'
      Origin = 'LFHOTELUSER.KRJZ.D_JZFS'
      Size = 10
    end
    object qryWorkD_JZLX: TStringField
      FieldName = 'D_JZLX'
      Origin = 'LFHOTELUSER.KRJZ.D_JZLX'
      FixedChar = True
      Size = 1
    end
    object qryWorkD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Origin = 'LFHOTELUSER.KRJZ.D_KHBH'
      Size = 5
    end
    object qryWorkD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Origin = 'LFHOTELUSER.KRJZ.D_XYKBH'
      Size = 5
    end
    object qryWorkD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
      Origin = 'LFHOTELUSER.KRJZ.D_JZRQ'
    end
    object qryWorkD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
      Origin = 'LFHOTELUSER.KRJZ.D_JZSJ'
      DisplayFormat = 'hh:nn:ss'
    end
    object qryWorkD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.KRJZ.D_CZYXM'
      Size = 8
    end
    object qryWorkD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.KRJZ.D_BZ'
      Size = 30
    end
    object qryWorkD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Origin = 'LFHOTELUSER.KRJZ.D_YSRQ'
      Size = 8
    end
  end
  object dsWork: TDataSource
    DataSet = qryWork
    Left = 72
    Top = 8
  end
end
