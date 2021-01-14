object frmserchls: Tfrmserchls
  Left = 18
  Top = 97
  Width = 1026
  Height = 731
  Align = alClient
  Caption = #21382#21490#26597#35810#31383#21475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 52
    Width = 1018
    Height = 652
    ActivePage = TabSheet2
    Align = alClient
    Images = ImageList1
    TabOrder = 1
    TabPosition = tpBottom
    object TabSheet1: TTabSheet
      Caption = #37096#38376#21382#21490#26126#32454
      object r2: TdxDBGrid
        Left = 0
        Top = 0
        Width = 1010
        Height = 625
        Bands = <
          item
            Caption = #25171#23383'('#24352')'
            Width = 78
          end
          item
            Caption = #22797'    '#21360' '#65288#24352#65289
            Width = 166
          end
          item
            Caption = #27833'     '#21360#65288#24352#65289
            Width = 85
          end
          item
            Caption = #20256#30495'('#24352')'
            Width = 184
          end
          item
            Caption = #38271#35805'('#20803')'
            Width = 141
          end
          item
            Width = 61
          end
          item
            Width = 64
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'id'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        TabOrder = 0
        DataSource = DSbuls
        Filter.Criteria = {00000000}
        OptionsBehavior = [edgoAnsiSort, edgoAutoCopySelectedToClipboard, edgoAutoSearch, edgoAutoSort, edgoDblClick, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoIndicator, edgoInvertSelect, edgoUseBitmap]
        ShowBands = True
        ShowRowFooter = True
        object personid2: TdxDBGridColumn
          Caption = #28608#20809
          Width = 39
          BandIndex = 0
          RowIndex = 0
          FieldName = 'npage'
          SummaryFooterType = cstSum
          SummaryField = 'npage'
        end
        object personid3: TdxDBGridColumn
          Caption = '16K'
          Color = clGradientActiveCaption
          Width = 30
          BandIndex = 1
          RowIndex = 0
          FieldName = 'k16'
          SummaryFooterType = cstSum
          SummaryField = 'k16'
        end
        object personid4: TdxDBGridColumn
          Color = clGradientActiveCaption
          Width = 20
          BandIndex = 1
          RowIndex = 0
          FieldName = 'B5'
          SummaryFooterType = cstSum
          SummaryField = 'B5'
        end
        object personid5: TdxDBGridColumn
          Color = clGradientActiveCaption
          Width = 20
          BandIndex = 1
          RowIndex = 0
          FieldName = 'A4'
          SummaryFooterType = cstSum
          SummaryField = 'A4'
        end
        object personid6: TdxDBGridColumn
          Color = clGradientActiveCaption
          Width = 20
          BandIndex = 1
          RowIndex = 0
          FieldName = 'B4'
          SummaryFooterType = cstSum
          SummaryField = 'B4'
        end
        object personid7: TdxDBGridColumn
          Caption = '8K'
          Color = clGradientActiveCaption
          Width = 20
          BandIndex = 1
          RowIndex = 0
          FieldName = 'K8'
          SummaryFooterType = cstSum
          SummaryField = 'K8'
        end
        object personid8: TdxDBGridColumn
          Color = clGradientActiveCaption
          Width = 20
          BandIndex = 1
          RowIndex = 0
          FieldName = 'A3'
          SummaryFooterType = cstSum
          SummaryField = 'A3'
        end
        object personid9: TdxDBGridColumn
          Caption = 'A4'
          Width = 25
          BandIndex = 2
          RowIndex = 0
          FieldName = 'A42'
          SummaryFooterType = cstSum
          SummaryField = 'A42'
        end
        object personid10: TdxDBGridColumn
          Caption = '8K'
          Width = 25
          BandIndex = 2
          RowIndex = 0
          FieldName = 'K82'
          SummaryFooterType = cstSum
          SummaryField = 'K82'
        end
        object personid11: TdxDBGridColumn
          Caption = #33098#29256
          Width = 35
          BandIndex = 2
          RowIndex = 0
          FieldName = 'LABAN'
          SummaryFooterType = cstSum
          SummaryField = 'LABAN'
        end
        object personid16: TdxDBGridColumn
          Caption = #22269#38469
          Color = clGradientActiveCaption
          Width = 49
          BandIndex = 3
          RowIndex = 0
          FieldName = 'SENDOUTSIDE'
          SummaryFooterType = cstSum
        end
        object personid17: TdxDBGridColumn
          Caption = #38024#24335
          Width = 39
          BandIndex = 0
          RowIndex = 0
          FieldName = 'wpage'
          SummaryFooterType = cstSum
          SummaryField = 'wpage'
        end
        object personidr2Column13: TdxDBGridColumn
          Caption = #22269#20869
          Color = clGradientActiveCaption
          Width = 45
          BandIndex = 3
          RowIndex = 0
          FieldName = 'sendinside'
          SummaryFooterType = cstSum
        end
        object personidr2Column14: TdxDBGridColumn
          Caption = #24066#20869
          Color = clGradientActiveCaption
          Width = 45
          BandIndex = 3
          RowIndex = 0
          FieldName = 'sendprive'
          SummaryFooterType = cstSum
        end
        object personidr2Column15: TdxDBGridColumn
          Caption = #25910#25991
          Color = clGradientActiveCaption
          Width = 45
          BandIndex = 3
          RowIndex = 0
          FieldName = 'resivdpage'
          SummaryFooterType = cstSum
        end
        object personidr2Column16: TdxDBGridColumn
          Caption = #22269#38469
          Width = 47
          BandIndex = 4
          RowIndex = 0
          FieldName = 'nationcall'
          SummaryFooterType = cstSum
        end
        object personidr2Column17: TdxDBGridColumn
          Caption = #22269#20869
          Width = 47
          BandIndex = 4
          RowIndex = 0
          FieldName = 'chinacall'
          SummaryFooterType = cstSum
        end
        object personidr2Column18: TdxDBGridColumn
          Caption = #28207','#28595','#21488
          Width = 47
          BandIndex = 4
          RowIndex = 0
          FieldName = 'hgcall'
          SummaryFooterType = cstSum
        end
        object personidr2Column20: TdxDBGridColumn
          Caption = #37096#38376
          Width = 61
          BandIndex = 5
          RowIndex = 0
          FieldName = 'department'
        end
        object personidr2Column21: TdxDBGridColumn
          Caption = #26102#38388
          Color = clRed
          BandIndex = 6
          RowIndex = 0
          FieldName = 't_time'
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #23458#20154#21382#21490#26126#32454
      ImageIndex = 1
      object r3: TdxDBGrid
        Left = 0
        Top = 0
        Width = 1010
        Height = 625
        Bands = <
          item
            Caption = #25171#23383
            Width = 196
          end
          item
            Caption = #22797#21360'('#24352')'
            Width = 177
          end
          item
            Caption = #25171#21360#65292#25195#25551
            Width = 75
          end
          item
            Caption = #20256#30495'('#24352')'
          end
          item
            Caption = #38271#35805'('#20803')'
            Width = 136
          end
          item
            Caption = #19978#32593','#31199#36161
            Width = 63
          end
          item
            Width = 89
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'id'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        TabOrder = 0
        DataSource = DSkrls
        Filter.Criteria = {00000000}
        OptionsBehavior = [edgoAnsiSort, edgoAutoCopySelectedToClipboard, edgoAutoSearch, edgoAutoSort, edgoDblClick, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoIndicator, edgoInvertSelect, edgoUseBitmap]
        ShowBands = True
        ShowRowFooter = True
        object personidr3Column1: TdxDBGridColumn
          Caption = #20013#25991
          Width = 98
          BandIndex = 0
          RowIndex = 0
          FieldName = 'chinsepage'
          SummaryFooterType = cstSum
        end
        object personidr3Column2: TdxDBGridColumn
          Caption = #33521#25991
          Width = 98
          BandIndex = 0
          RowIndex = 0
          FieldName = 'englishpage'
          SummaryFooterType = cstSum
        end
        object personidr3Column3: TdxDBGridColumn
          Color = clSkyBlue
          Width = 30
          BandIndex = 1
          RowIndex = 0
          FieldName = 'A3'
          SummaryFooterType = cstSum
        end
        object personidr3Column4: TdxDBGridColumn
          Color = clSkyBlue
          Width = 30
          BandIndex = 1
          RowIndex = 0
          FieldName = 'A4'
          SummaryFooterType = cstSum
        end
        object personidr3Column5: TdxDBGridColumn
          Color = clSkyBlue
          Width = 30
          BandIndex = 1
          RowIndex = 0
          FieldName = 'K8'
          SummaryFooterType = cstSum
        end
        object personidr3Column6: TdxDBGridColumn
          Color = clSkyBlue
          Width = 30
          BandIndex = 1
          RowIndex = 0
          FieldName = 'B4'
          SummaryFooterType = cstSum
        end
        object personidr3Column7: TdxDBGridColumn
          Color = clSkyBlue
          Width = 30
          BandIndex = 1
          RowIndex = 0
          FieldName = 'B5'
          SummaryFooterType = cstSum
        end
        object personidr3Column8: TdxDBGridColumn
          Caption = '16K'
          Color = clSkyBlue
          Width = 30
          BandIndex = 1
          RowIndex = 0
          FieldName = 'K16'
          SummaryFooterType = cstSum
        end
        object personidr3Column10: TdxDBGridColumn
          Caption = #22269#38469
          Color = clSkyBlue
          Width = 47
          BandIndex = 3
          RowIndex = 0
          FieldName = 'sendoutside'
          SummaryFooterType = cstSum
        end
        object personidr3Column12: TdxDBGridColumn
          Caption = #25171#21360
          Width = 38
          BandIndex = 2
          RowIndex = 0
          FieldName = 'print1'
          SummaryFooterType = cstSum
        end
        object personidr3Column11: TdxDBGridColumn
          Caption = #25195#25551
          Width = 38
          BandIndex = 2
          RowIndex = 0
          FieldName = 'sacn'
          SummaryFooterType = cstSum
        end
        object personidr3Column13: TdxDBGridColumn
          Caption = #22269#20869
          Color = clSkyBlue
          Width = 47
          BandIndex = 3
          RowIndex = 0
          FieldName = 'sendinside'
          SummaryFooterType = cstSum
        end
        object personidr3Column14: TdxDBGridColumn
          Caption = #24066#20869
          Color = clSkyBlue
          Width = 47
          BandIndex = 3
          RowIndex = 0
          FieldName = 'sendprive'
          SummaryFooterType = cstSum
        end
        object personidr3Column15: TdxDBGridColumn
          Caption = #25910#25991
          Color = clSkyBlue
          Width = 47
          BandIndex = 3
          RowIndex = 0
          FieldName = 'resivd'
          SummaryFooterType = cstSum
        end
        object personidr3Column16: TdxDBGridColumn
          Caption = #22269#38469
          Width = 45
          BandIndex = 4
          RowIndex = 0
          FieldName = 'nationcall'
          SummaryFooterType = cstSum
        end
        object personidr3Column17: TdxDBGridColumn
          Caption = #22269#20869
          Width = 45
          BandIndex = 4
          RowIndex = 0
          FieldName = 'chinacall'
          SummaryFooterType = cstSum
        end
        object personidr3Column18: TdxDBGridColumn
          Caption = #28207','#28595','#21488
          Width = 45
          BandIndex = 4
          RowIndex = 0
          FieldName = 'hgcall'
          SummaryFooterType = cstSum
        end
        object personidr3Column19: TdxDBGridColumn
          Caption = #19978#32593
          Width = 32
          BandIndex = 5
          RowIndex = 0
          FieldName = 'intenet'
          SummaryFooterType = cstSum
        end
        object personidr3Column20: TdxDBGridColumn
          Caption = #31199#36161
          Width = 32
          BandIndex = 5
          RowIndex = 0
          FieldName = 'land'
          SummaryFooterType = cstSum
        end
        object r3Column21: TdxDBGridColumn
          Caption = #20869#37096
          Width = 45
          BandIndex = 6
          RowIndex = 0
          FieldName = 'neibuje'
        end
        object personidr3Column21: TdxDBGridColumn
          Caption = #26085#26399
          Color = clTeal
          Width = 45
          BandIndex = 6
          RowIndex = 0
          FieldName = 'rq'
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1018
    Height = 52
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 48
      Top = 18
      Width = 36
      Height = 13
      Caption = #26085#26399#65306
    end
    object Label2: TLabel
      Left = 282
      Top = 18
      Width = 12
      Height = 13
      Caption = #33267
    end
    object DateTimePicker1: TDateTimePicker
      Left = 92
      Top = 15
      Width = 186
      Height = 21
      Date = 38889.000000000000000000
      Time = 38889.000000000000000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 299
      Top = 15
      Width = 186
      Height = 21
      Date = 38889.000000000000000000
      Time = 38889.000000000000000000
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 508
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333000003333333333F77777FFF333333009999900
        3333333777777777FF33330998FFF899033333777333F3777FF33099FFFCFFF9
        903337773337333777F3309FFFFFFFCF9033377333F3337377FF098FF0FFFFFF
        890377F3373F3333377F09FFFF0FFFFFF90377F3F373FFFFF77F09FCFFF90000
        F90377F733377777377F09FFFFFFFFFFF90377F333333333377F098FFFFFFFFF
        890377FF3F33333F3773309FCFFFFFCF9033377F7333F37377F33099FFFCFFF9
        90333777FF37F3377733330998FCF899033333777FF7FF777333333009999900
        3333333777777777333333333000003333333333377777333333}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 741
      Top = 13
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 3
      OnClick = BitBtn2Click
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
  end
  object DSkrls: TDataSource
    DataSet = DM.ADOkrls
    Left = 848
    Top = 60
  end
  object DSbuls: TDataSource
    DataSet = DM.ADObmls
    Left = 809
    Top = 60
  end
  object ImageList1: TImageList
    Left = 764
    Top = 63
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000CCCACC00CCCACC0004020400241A
      14002115120004020400CCCACC00CCCACC00CCCACC00CCCACC00CCCACC00CCCA
      CC00CCCACC00CCCACC00CCCACC00CCCACC000000000000000000000000000000
      0000000000000000000000000000101010000000000000000000303030000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCACC00CCCACC00040204007574
      74007576A400402C2C0004020400CCCACC00CCCACC00CCCACC00CCCACC00CCCA
      CC00CCCACC00CCCACC00CCCACC00CCCACC000000000000000000000000000000
      00000000000000000000202020000088F8000078E0000070E000000000004040
      4000505050000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000402040004020400040204005CC2
      FC002E8BF2007576A40044322C0004020400CCCACC00CCCACC00CCCACC00CCCA
      CC00CCCACC00CCCACC00CCCACC00CCCACC000000000000000000202020001010
      1000C84878006028400000B8FF002090F8000080F0000080E8008848D0000000
      0000484850006060600078787800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000501A0400B63C0C00D44E2C00E456
      3C005CC2FC002E8BF2007576A4006C3A2C000402040004020400CCCACC00CCCA
      CC00CCCACC00CCCACC00CCCACC00CCCACC000000000000000000C84878007038
      5000C84878006838480018C0FF0040A0F8000090F8000090F8008848D0002828
      D800484848005858600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0360400E4563400F5624C00FC70
      5C00FA765F005CC2FC003893F7007576A400AC422C006E23040021151200241A
      14000402040004020400CCCACC00CCCACC000000000000000000C84878007040
      5000C84878007040500030C8FF0058A8F8000098FF000098FF009048D8004040
      E800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000992F0400EE5C4600FA765F00FC85
      6C00FC8B6D00FCDCAB005CC2FC00A4AEB400AFACAC00D09E8C00FCECBE00FCFE
      D000E4D6BC004F35340004020400CCCACC000000000000000000D06088007848
      5800D05880007848580048C8FF0060B0F80038C8FF000050E0009048E8005050
      F000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004020400E4563C00FC826400FC94
      7400FAB08200FCD5A200FCD5A20094827C00FCD5A200FCF3C200FCFED000FCFE
      DF00FCFEEF00FCFEFC0037252100040204000000000000000000D87098007848
      6000D86890006060600060D0FF0058D0FF0050D0FF000098FF00303030006060
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B7B7B70004020400CC502400CC50
      2400341E6C00341E6C00FC9E7C00CB9C9800FCF3C200FCECBE00FCFEDF00FCFE
      EF00FCFEFC00FCFEEF00CCAE9C00040204000000000058585800E088A800E080
      A800D878A0007070700078D8FF0070D8FF0060D0FF0030A0FF00404040002828
      F800202020000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000402040004020400040204000402
      040014339900143399000C298C00F0CCAC00FCE4B200FCEAB400FCFED000FCFE
      DF00FCFEEF00FCFEDF00FCFED000040204000000000060606000E898B800E898
      B000E088A8007878780090E0FF0080D8FF0068D0FF0068B8FF00484848004040
      F800282828000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000040204000D0B0B000D0B0B001442
      AB001C4DB3001C4DB3001C4DB300F0CCAC00FCE4B200FCE4B200FCFAC400FCFE
      D000FCFED000FCFED000FCECBE00040204000000000070707000F0B0C800E8A8
      C000E898B0008888880090E0FF00FFFFFF0068D0FF0068D0FF00585858007070
      F800303030000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000141314001D1C1C00040204002462
      C4002467CC002467CC002462CC00BC8D8C00FCFEEF00FCFEFC00FCDCAB00FCEA
      B400FCEAB400FCFED000AC7D7400040204000000000078787800F0C0D800F0B0
      C800FFFFFF008888900068D0FF0000000000000000006868680068686800A0A0
      F800383838000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000242424002C2B2C000D0B0B002979
      DF002A7EE2002C84EA002979DF00306EC800D8BAAC00FCFEFC00FCF2D000FCE4
      B200FCFED000F0BE940004020400CCCACC000000000080808800FFFFFF00C888
      B000B8609000A018600010101000A8A0A00058585800000000009878D0007810
      A000383838000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001D1C1C003C3C3C00444444003893
      F700379CFC003CA2FC00379CFC002C86F40004020400996B6C00CCA89000E4C4
      A400BC8D8C0004020400CCCACC00CCCACC000000000000000000D0D0D0005858
      5800484848000000000010101000FFFFFF00A8A0A00000000000585858000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000402040044444400545554004D4C
      4B000D0B0B001432BC001842C40004162C00CCCACC00CCCACC00CCCACC00CCCA
      CC00CCCACC00CCCACC00CCCACC00CCCACC00000000000000000020202000E0E0
      E000C0C0C0004848480000000000E0E0E00048484800E0E0E000989898000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCACC0014131400646464007574
      7400AFACAC00969796005455540004020400CCCACC00B7B7B700CCCACC00CCCA
      CC00CCCACC00CCCACC00CCCACC00CCCACC00000000000000000020202000FFFF
      FF00E0E0E000484848000000000000000000E0E0E000FFFFFF00A8A0A0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCACC00CCCACC00040204008484
      84008C8C8C006464640004020400CCCACC00CCCACC00CCCACC00CCCACC00CCCA
      CC00CCCACC00CCCACC00CCCACC00CCCACC000000000000000000000000001010
      1000000000000000000000000000000000000000000000000000484848000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF000000FE1F000000000000FC0700000000
      0000C001000000000000C003000000000000C00F000000000000C00F00000000
      0000C00F00000000000080070000000000008007000000000000800700000000
      000080070000000000008007000000000000C01F000000000000C20F00000000
      0000C30F000000000000E79F0000000000000000000000000000000000000000
      000000000000}
  end
end
