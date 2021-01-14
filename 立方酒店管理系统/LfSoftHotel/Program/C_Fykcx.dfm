inherited FykcxForm: TFykcxForm
  Left = 147
  Top = 42
  Height = 500
  Caption = #25253#34920
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 142
    object Bevel1: TBevel [0]
      Left = 8
      Top = 47
      Width = 521
      Height = 90
      Shape = bsFrame
    end
    inherited Image1: TImage [1]
    end
    object Label1: TLabel [2]
      Left = 14
      Top = 66
      Width = 72
      Height = 12
      Caption = #32479#35745#36215#22987#26085#26399
    end
    object Label2: TLabel [3]
      Left = 230
      Top = 66
      Width = 72
      Height = 12
      Caption = #32479#35745#25130#27490#26085#26399
    end
    inherited lblTitle: TLabel [4]
      Width = 156
      Caption = #38750#23507#23458#28040#36153
    end
    object lblXfhj: TLabel [5]
      Left = 232
      Top = 106
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
    object lblYhhj: TLabel [6]
      Left = 384
      Top = 106
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
    inherited btnLoca: TBitBtn [7]
      Top = 29
      Visible = False
    end
    inherited edtValue: TEdit [8]
      Top = 32
      Visible = False
    end
    inherited cmbExpress: TComboBox [9]
      Top = 32
      Visible = False
    end
    inherited cmbOption: TComboBox [10]
      Top = 32
      Visible = False
    end
    object dtpBd: TDateTimePicker
      Left = 90
      Top = 60
      Width = 129
      Height = 20
      CalAlignment = dtaLeft
      Date = 37383.2415563657
      Time = 37383.2415563657
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 4
    end
    object dtpEd: TDateTimePicker
      Left = 306
      Top = 60
      Width = 129
      Height = 20
      CalAlignment = dtaLeft
      Date = 37383.2415563657
      Time = 37383.2415563657
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 5
    end
    object btnTj: TBitBtn
      Left = 448
      Top = 58
      Width = 75
      Height = 25
      Caption = #32479'  '#35745
      TabOrder = 6
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
    object RadioGroup1: TRadioGroup
      Left = 14
      Top = 88
      Width = 209
      Height = 41
      Caption = #32479#35745#31867#21035
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #25353#28040#36153#26126#32454
        #25353#28040#36153#39033#30446)
      TabOrder = 7
    end
  end
  inherited Panel2: TPanel
    Top = 142
    Height = 296
    inherited DBGrid1: TDBGrid
      Height = 286
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    end
  end
  inherited Panel3: TPanel
    Top = 438
    inherited btnPrint: TBitBtn
      OnClick = btnPrintClick
    end
  end
  inherited qryWork: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select KRJZ.D_JZRQ as JZRQ,'
      '       KRJZ.D_JZSJ as JZSJ,'
      '       XMDM.D_XMMC as XFXM,'
      '       KRJZ.D_XFJE as XFJE,'
      '       KRJZ.D_YHJE as YHJE'
      ' from KRJZ KRJZ,XMDM XMDM')
    object qryWorkJZRQ: TDateTimeField
      FieldName = 'JZRQ'
      Origin = 'LFHOTELUSER.KRJZ.D_JZRQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object qryWorkJZSJ: TDateTimeField
      FieldName = 'JZSJ'
      Origin = 'LFHOTELUSER.KRJZ.D_JZSJ'
      DisplayFormat = 'hh:nn:ss'
    end
    object qryWorkXFXM: TStringField
      FieldName = 'XFXM'
      Origin = 'LFHOTELUSER.XMDM.D_XMMC'
      Size = 10
    end
    object qryWorkXFJE: TFloatField
      FieldName = 'XFJE'
      Origin = 'LFHOTELUSER.KRJZ.D_XFJE'
      DisplayFormat = '#.##'
    end
    object qryWorkYHJE: TFloatField
      FieldName = 'YHJE'
      Origin = 'LFHOTELUSER.KRJZ.D_YHJE'
      DisplayFormat = '#.##'
    end
  end
  object qryWork1: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select b.D_XMMC as XFXM,sum(a.D_XFJE) as XFJE,sum(a.D_YHJE) as Y' +
        'HJE from KRJZ a,XMDM b')
    Left = 96
    Top = 8
    object qryWork1XFXM: TStringField
      FieldName = 'XFXM'
    end
    object qryWork1XFJE: TCurrencyField
      FieldName = 'XFJE'
      DisplayFormat = '#.##'
      Currency = False
    end
    object qryWork1YHJE: TCurrencyField
      FieldName = 'YHJE'
      DisplayFormat = '#.##'
      Currency = False
    end
  end
end
