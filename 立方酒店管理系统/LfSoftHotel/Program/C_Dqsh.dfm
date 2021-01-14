inherited DqshForm: TDqshForm
  Left = 38
  Top = 38
  Width = 750
  Height = 500
  Caption = #32479#35745
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 742
    Height = 143
    object Bevel1: TBevel [0]
      Left = 5
      Top = 41
      Width = 732
      Height = 97
      Align = alBottom
      Shape = bsFrame
    end
    inherited lblTitle: TLabel
      Left = 315
      Caption = #24403#21069#25910#22238
    end
    inherited Image1: TImage
      Left = 250
    end
    object Label1: TLabel [3]
      Left = 220
      Top = 51
      Width = 67
      Height = 19
      Caption = 'Label1'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel [4]
      Left = 604
      Top = 51
      Width = 67
      Height = 19
      Caption = 'Label2'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel [5]
      Left = 220
      Top = 81
      Width = 67
      Height = 19
      Caption = 'Label3'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel [6]
      Left = 604
      Top = 81
      Width = 67
      Height = 19
      Caption = 'Label4'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel [7]
      Left = 220
      Top = 112
      Width = 67
      Height = 19
      Caption = 'Label5'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel [8]
      Left = 604
      Top = 112
      Width = 67
      Height = 19
      Caption = 'Label6'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel [9]
      Left = 24
      Top = 51
      Width = 185
      Height = 19
      Caption = #26152#26085#26410#32467#21457#31080#39069'(+):'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel [10]
      Left = 432
      Top = 51
      Width = 165
      Height = 19
      Caption = #20170#26085#25910#22238#37329#39069'(+):'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel [11]
      Left = 20
      Top = 81
      Width = 189
      Height = 19
      Caption = '    '#19978#20132#36130#21153#39069'(-):'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel [12]
      Left = 430
      Top = 81
      Width = 167
      Height = 19
      Caption = '  '#39184#21381#25910#22238#39069'(-):'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel [13]
      Left = 24
      Top = 112
      Width = 185
      Height = 19
      Caption = #39184#21381#19978#20132#24635#21488#39069'(+):'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel [14]
      Left = 445
      Top = 112
      Width = 152
      Height = 19
      Caption = #24403#21069#26410#32467#21457#31080#39069':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited cmbOption: TComboBox
      Top = 16
      Visible = False
    end
    inherited cmbExpress: TComboBox
      Top = 16
      Visible = False
    end
    inherited edtValue: TEdit
      Top = 16
      Visible = False
    end
    inherited btnLoca: TBitBtn
      Top = 13
      Visible = False
    end
  end
  inherited Panel2: TPanel
    Top = 143
    Width = 742
    Height = 295
    inherited DBGrid1: TDBGrid
      Width = 732
      Height = 285
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnDblClick = btnDetailClick
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'D_JZSJ'
          Title.Alignment = taCenter
          Title.Caption = #32467#24080#26102#38388
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XMMC'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#39033#30446
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JZFS'
          Title.Caption = #32467#24080#26041#24335
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFJE'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#37329#39069
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_YJJE'
          Title.Alignment = taCenter
          Title.Caption = #24050#32467#37329#39069
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_YHJE'
          Title.Alignment = taCenter
          Title.Caption = #20248#24800#37329#39069
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_SHJE'
          Title.Alignment = taCenter
          Title.Caption = #25910#22238#37329#39069
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_BZ'
          Title.Alignment = taCenter
          Title.Caption = #32467#24080#22791#27880
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JZLX'
          Title.Alignment = taCenter
          Title.Caption = #25910#22238#31867#22411
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_CZYXM'
          Title.Caption = #25805#20316#21592
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 438
    Width = 742
    inherited btnHelp: TBitBtn
      Left = 582
    end
    inherited btnClose: TBitBtn
      Left = 662
    end
    inherited btnPrint: TBitBtn
      Left = 502
      OnClick = btnPrintClick
    end
    object btnDetail: TBitBtn
      Left = 422
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #26126#32454'(&D)'
      TabOrder = 3
      OnClick = btnDetailClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
        333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
        300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
        333337F373F773333333303330033333333337F3377333333333303333333333
        333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
        333337777F337F33333330330BB00333333337F373F773333333303330033333
        333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
        333377777F77377733330BBB0333333333337F337F33333333330BB003333333
        333373F773333333333330033333333333333773333333333333}
      NumGlyphs = 2
    end
    object RadioButton1: TRadioButton
      Left = 8
      Top = 8
      Width = 49
      Height = 17
      Caption = #24635#24080
      Checked = True
      TabOrder = 4
      TabStop = True
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 64
      Top = 8
      Width = 57
      Height = 17
      Caption = #26126#32454#24080
      TabOrder = 5
      OnClick = RadioButton2Click
    end
  end
  inherited qryWork: TQuery
    OnCalcFields = qryWorkCalcFields
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KRJZ where (D_HH=0) order by D_JZRQ,D_JZSJ')
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
      OnGetText = qryWorkD_JZLXGetText
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
    object qryWorkD_BMBH: TStringField
      FieldName = 'D_BMBH'
      Origin = 'LFHOTELUSER.KRJZ.D_BMBH'
      Size = 5
    end
    object qryWorkD_XMMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XMMC'
      LookupDataSet = HotelData.tblXMDM
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
    object qryWorkD_SHJE: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'D_SHJE'
      DisplayFormat = '#.##'
      Currency = False
      Calculated = True
    end
  end
  object tblSjtj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'SJTJ'
    Left = 96
    Top = 8
  end
end
