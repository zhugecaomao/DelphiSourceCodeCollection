object F_summoneyreport: TF_summoneyreport
  Left = 314
  Top = 273
  Width = 529
  Height = 450
  Caption = #21830#21153#20013#24515#37329#39069#21512#35745#25253#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object t1: TfrxReport
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    ReportOptions.CreateDate = 38803.016491064800000000
    ReportOptions.LastChange = 38848.920100312500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 88
    Top = 80
    Datasets = <
      item
        DataSet = DM.MONEYREPORT
        DataSetName = 'MONEYREPORT'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 32.354360000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 400.630180000000000000
          Width = 226.771800000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #21830#21153#20013#24515#36153#29992#21512#35745)
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 884.410020000000000000
          Top = 15.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[TIME]')
        end
        object SysMemo2: TfrxSysMemoView
          Left = 820.158010000000000000
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[DATE]')
        end
        object Memo2: TfrxMemoView
          Left = 752.126470000000000000
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25171#21360#26102#38388#65306)
        end
        object Memo48: TfrxMemoView
          Left = 15.118120000000000000
          Top = 11.338590000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #21046#34920#20154#65306)
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 39.574830000000000000
        Top = 75.590599999999990000
        Width = 1046.929810000000000000
        object Shape1: TfrxShapeView
          Width = 1046.929810000000000000
          Height = 39.236240000000000000
        end
        object Line1: TfrxLineView
          Left = 0.236240000000000000
          Top = 19.338590000000000000
          Width = 869.354980000000000000
          Frame.Typ = [ftTop]
        end
        object Memo3: TfrxMemoView
          Left = 21.559060000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25171#23383'('#24352')')
        end
        object Line2: TfrxLineView
          Left = 98.267780000000000000
          Top = 0.779529999999994100
          Height = 38.236240000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo4: TfrxMemoView
          Left = 6.000000000000000000
          Top = 20.897650000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #28608#20809)
        end
        object Memo5: TfrxMemoView
          Left = 54.913420000000000000
          Top = 20.677180000000010000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #38024#24335)
        end
        object Line3: TfrxLineView
          Left = 45.354360000000000000
          Top = 18.897650000000000000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo8: TfrxMemoView
          Left = 170.078850000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #22797#21360'('#24352')')
        end
        object Line4: TfrxLineView
          Left = 132.283550000000000000
          Top = 18.897650000000000000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          Left = 166.299320000000000000
          Top = 18.897650000000000000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Left = 200.315090000000000000
          Top = 18.897650000000000000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          Left = 232.551330000000000000
          Top = 18.897650000000000000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          Left = 295.803340000000000000
          Top = 0.559060000000002300
          Height = 38.015770000000000000
          Frame.Typ = [ftLeft]
        end
        object Line8: TfrxLineView
          Left = 264.567100000000000000
          Top = 18.897650000000000000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo9: TfrxMemoView
          Left = 101.047310000000000000
          Top = 19.897650000000000000
          Width = 29.677180000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            'B5')
        end
        object Memo10: TfrxMemoView
          Left = 133.283550000000000000
          Top = 19.897650000000000000
          Width = 33.236240000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '16K')
        end
        object Memo11: TfrxMemoView
          Left = 170.078850000000000000
          Top = 19.897650000000000000
          Width = 27.897650000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            'A4')
        end
        object Memo12: TfrxMemoView
          Left = 204.094620000000000000
          Top = 19.897650000000000000
          Width = 26.677180000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            'B4')
        end
        object Memo13: TfrxMemoView
          Left = 234.330860000000000000
          Top = 19.897650000000000000
          Width = 27.677180000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '8K')
        end
        object Memo14: TfrxMemoView
          Left = 268.346630000000000000
          Top = 19.897650000000000000
          Width = 26.677180000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            'A3')
        end
        object Memo21: TfrxMemoView
          Left = 325.039580000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #27833#21360'('#24352')')
        end
        object Line18: TfrxLineView
          Left = 330.819110000000000000
          Top = 18.897650000000000000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line19: TfrxLineView
          Left = 371.393940000000000000
          Top = 18.897650000000000000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line20: TfrxLineView
          Left = 411.968770000000000000
          Top = 1.000000000000000000
          Height = 38.015770000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo22: TfrxMemoView
          Left = 298.582870000000000000
          Top = 20.677180000000010000
          Width = 30.456710000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            'A4')
        end
        object Memo23: TfrxMemoView
          Left = 340.157700000000000000
          Top = 20.897650000000000000
          Width = 26.677180000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '8K')
        end
        object Memo24: TfrxMemoView
          Left = 375.953000000000000000
          Top = 20.897650000000000000
          Width = 37.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #34593#29256)
        end
        object Memo28: TfrxMemoView
          Left = 476.220780000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #38271#36884)
        end
        object Line24: TfrxLineView
          Left = 566.929500000000000000
          Top = 0.779529999999994100
          Height = 38.015770000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo29: TfrxMemoView
          Left = 419.527830000000000000
          Top = 21.897650000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #22269#38469)
        end
        object Memo30: TfrxMemoView
          Left = 464.882190000000000000
          Top = 21.897650000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #22269#20869)
        end
        object Memo31: TfrxMemoView
          Left = 510.236550000000000000
          Top = 21.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #28207','#28595','#21488)
        end
        object Line25: TfrxLineView
          Left = 460.323130000000000000
          Top = 18.897650000000000000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line26: TfrxLineView
          Left = 506.457020000000000000
          Top = 18.897650000000000000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo35: TfrxMemoView
          Left = 684.094930000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #20256#30495'('#24352')')
        end
        object Line30: TfrxLineView
          Left = 642.520100000000000000
          Top = 20.677180000000010000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line31: TfrxLineView
          Left = 718.110700000000000000
          Top = 18.897650000000000000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line32: TfrxLineView
          Left = 793.701300000000000000
          Top = 18.897650000000000000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line33: TfrxLineView
          Left = 869.291900000000000000
          Top = 1.000000000000000000
          Height = 38.015770000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo37: TfrxMemoView
          Left = 582.047620000000000000
          Top = 21.897650000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #22269#38469)
        end
        object Memo38: TfrxMemoView
          Left = 661.417750000000000000
          Top = 21.897650000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #22269#20869)
        end
        object Memo39: TfrxMemoView
          Left = 733.228820000000000000
          Top = 21.677180000000010000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #24066#20869)
        end
        object Memo40: TfrxMemoView
          Left = 808.819420000000000000
          Top = 21.677180000000010000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25910#25991)
        end
        object Line38: TfrxLineView
          Left = 982.677800000000000000
          Height = 38.015770000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo44: TfrxMemoView
          Left = 907.087200000000000000
          Top = 12.897650000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #37096#38376)
        end
        object Memo46: TfrxMemoView
          Left = 997.795920000000000000
          Top = 12.118120000000000000
          Width = 37.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #21512#35745)
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 177.637910000000000000
        Width = 1046.929810000000000000
        DataSet = DM.MONEYREPORT
        DataSetName = 'MONEYREPORT'
        RowCount = 0
        object Shape2: TfrxShapeView
          Left = 0.188930000000000000
          Width = 1047.929810000000000000
          Height = 20.897650000000000000
        end
        object Memo6: TfrxMemoView
          Left = 5.000000000000000000
          Width = 35.236240000000000000
          Height = 18.897650000000000000
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."npage"]')
        end
        object Memo7: TfrxMemoView
          Left = 53.913420000000000000
          Top = 0.779529999999994100
          Width = 36.456710000000000000
          Height = 18.897650000000000000
          DataField = 'wpage'
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."wpage"]')
        end
        object Line10: TfrxLineView
          Left = 45.354360000000000000
          Top = 0.779529999999994100
          Height = 20.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          Left = 98.267780000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo15: TfrxMemoView
          Left = 103.826840000000000000
          Top = 1.000000000000000000
          Width = 29.677180000000000000
          Height = 18.897650000000000000
          DataField = 'B5'
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."B5"]')
        end
        object Line12: TfrxLineView
          Left = 132.283550000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo16: TfrxMemoView
          Left = 136.063080000000000000
          Top = 0.779529999999994100
          Width = 30.677180000000000000
          Height = 18.897650000000000000
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."k16"]')
        end
        object Line13: TfrxLineView
          Left = 166.299320000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo17: TfrxMemoView
          Left = 172.078850000000000000
          Top = 0.779529999999994100
          Width = 26.897650000000000000
          Height = 18.897650000000000000
          DataField = 'A4'
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."A4"]')
        end
        object Line14: TfrxLineView
          Left = 200.315090000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo18: TfrxMemoView
          Left = 204.094620000000000000
          Top = 1.000000000000000000
          Width = 29.677180000000000000
          Height = 18.897650000000000000
          DataField = 'B4'
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."B4"]')
        end
        object Line15: TfrxLineView
          Left = 232.551330000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo19: TfrxMemoView
          Left = 236.110390000000000000
          Width = 29.677180000000000000
          Height = 18.897650000000000000
          DataField = 'K8'
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."K8"]')
        end
        object Line16: TfrxLineView
          Left = 264.567100000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line17: TfrxLineView
          Left = 296.582870000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo20: TfrxMemoView
          Left = 269.567100000000000000
          Width = 33.236240000000000000
          Height = 18.897650000000000000
          DataField = 'A3'
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."A3"]')
        end
        object Line21: TfrxLineView
          Left = 330.819110000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo25: TfrxMemoView
          Left = 299.582870000000000000
          Width = 33.236240000000000000
          Height = 18.897650000000000000
          DataField = 'A42'
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."A42"]')
        end
        object Line22: TfrxLineView
          Left = 371.173470000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo26: TfrxMemoView
          Left = 339.953000000000000000
          Top = 0.779529999999994100
          Width = 34.236240000000000000
          Height = 18.897650000000000000
          DataField = 'K82'
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."K82"]')
        end
        object Line23: TfrxLineView
          Left = 411.968770000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo27: TfrxMemoView
          Left = 380.173470000000000000
          Top = 1.000000000000000000
          Width = 38.015770000000000000
          Height = 18.897650000000000000
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."LABAN"]')
        end
        object Line27: TfrxLineView
          Left = 460.102660000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line28: TfrxLineView
          Left = 506.457020000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line29: TfrxLineView
          Left = 566.929500000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo32: TfrxMemoView
          Left = 422.527830000000000000
          Top = 0.779529999999994100
          Width = 38.015770000000000000
          Height = 18.897650000000000000
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."nationcall"]')
        end
        object Memo33: TfrxMemoView
          Left = 469.661720000000000000
          Top = 1.000000000000000000
          Width = 39.015770000000000000
          Height = 18.897650000000000000
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."chinacall"]')
        end
        object Memo34: TfrxMemoView
          Left = 519.016080000000000000
          Top = 1.779529999999994000
          Width = 44.574830000000000000
          Height = 18.897650000000000000
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."hgcall"]')
        end
        object Line34: TfrxLineView
          Left = 642.520100000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line35: TfrxLineView
          Left = 718.110700000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line36: TfrxLineView
          Left = 793.701300000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line37: TfrxLineView
          Left = 869.291900000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo36: TfrxMemoView
          Left = 587.827150000000000000
          Top = 2.779529999999994000
          Width = 50.236240000000000000
          Height = 18.897650000000000000
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."SENDOUTSIDE"]')
        end
        object Memo41: TfrxMemoView
          Left = 665.638220000000000000
          Top = 3.000000000000000000
          Width = 53.574830000000000000
          Height = 18.897650000000000000
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."sendinside"]')
        end
        object Memo42: TfrxMemoView
          Left = 738.008350000000000000
          Top = 2.000000000000000000
          Width = 50.795300000000000000
          Height = 18.897650000000000000
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."sendprive"]')
        end
        object Memo43: TfrxMemoView
          Left = 820.158010000000000000
          Top = 4.000000000000000000
          Width = 51.795300000000000000
          Height = 18.897650000000000000
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."resivdpage"]')
        end
        object Line39: TfrxLineView
          Left = 982.677800000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo45: TfrxMemoView
          Left = 902.410020000000000000
          Top = 4.000000000000000000
          Width = 63.110390000000000000
          Height = 18.897650000000000000
          DataField = 'department'
          DataSet = DM.MONEYREPORT
          DataSetName = 'MONEYREPORT'
          Memo.Strings = (
            '[MONEYREPORT."department"]')
        end
        object Memo47: TfrxMemoView
          Left = 989.339210000000000000
          Top = 1.000000000000000000
          Width = 62.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            
              '[<MONEYREPORT."npage">*0.3+<MONEYREPORT."wpage">*0.2+<MONEYREPOR' +
              'T."B5">*0.15+<MONEYREPORT."k16">*0.15+<MONEYREPORT."A4">*0.15+<M' +
              'ONEYREPORT."B4">*0.2+<MONEYREPORT."K8">*0.2+<MONEYREPORT."A3">*0' +
              '.2+<MONEYREPORT."A42">*0.13+<MONEYREPORT."K82">*0.13+<MONEYREPOR' +
              'T."LABAN">*2.5+<MONEYREPORT."chinacall">+<MONEYREPORT."hgcall">+' +
              '<MONEYREPORT."nationcall">+<MONEYREPORT."SENDOUTSIDE">*8.4+<MONE' +
              'YREPORT."sendinside">*1.1+<MONEYREPORT."sendprive">*0.55+<MONEYR' +
              'EPORT."resivdpage">*0.4]')
        end
      end
      object Footer1: TfrxFooter
        Height = 43.590600000000000000
        Top = 222.992270000000000000
        Width = 1046.929810000000000000
        object Shape3: TfrxShapeView
          Left = 869.850960000000000000
          Top = 22.133890000000010000
          Width = 175.519790000000000000
          Height = 21.456710000000000000
        end
        object Line58: TfrxLineView
          Left = 983.677800000000000000
          Top = 21.559059999999990000
          Height = 20.236240000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo69: TfrxMemoView
          Left = 987.709340000000000000
          Top = 23.118120000000000000
          Width = 89.417440000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            
              '[SUM(<MONEYREPORT."npage">*0.3+<MONEYREPORT."Wpage">*0.2+<MONEYR' +
              'EPORT."B5">*0.15+<MONEYREPORT."K16">*0.15+<MONEYREPORT."A4">*0.1' +
              '5+<MONEYREPORT."B4">*0.2+<MONEYREPORT."K8">*0.2+<MONEYREPORT."A3' +
              '">*0.2+<MONEYREPORT."A42">*0.13+<MONEYREPORT."K82">*0.13+<MONEYR' +
              'EPORT."LABAN">*2.5+<MONEYREPORT."CHINACALL">+<MONEYREPORT."HGCAL' +
              'L">+<MONEYREPORT."NATIONCALL">+<MONEYREPORT."SENDOUTSIDE">*8.4+<' +
              'MONEYREPORT."SENDINSIDE">*1.1+<MONEYREPORT."SENDPRIVE">*0.55+<MO' +
              'NEYREPORT."RESIVDPAGE">*0.4)]')
        end
        object Memo50: TfrxMemoView
          Left = 881.630490000000000000
          Top = 22.559059999999990000
          Width = 96.165430000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #37329#39069#24635#35745#65306)
        end
        object Shape4: TfrxShapeView
          Width = 1047.008660000000000000
          Height = 20.897650000000000000
        end
        object Line40: TfrxLineView
          Left = 45.385900000000000000
          Top = 0.779529999999994100
          Height = 20.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line41: TfrxLineView
          Left = 98.299320000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line42: TfrxLineView
          Left = 132.315090000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line43: TfrxLineView
          Left = 166.330860000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line44: TfrxLineView
          Left = 200.346630000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line45: TfrxLineView
          Left = 232.582870000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line46: TfrxLineView
          Left = 264.598640000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line47: TfrxLineView
          Left = 296.614410000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line48: TfrxLineView
          Left = 330.850650000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line49: TfrxLineView
          Left = 371.205010000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line50: TfrxLineView
          Left = 412.000310000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line51: TfrxLineView
          Left = 460.134200000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line52: TfrxLineView
          Left = 506.488560000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line53: TfrxLineView
          Left = 566.961040000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line54: TfrxLineView
          Left = 642.551640000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line55: TfrxLineView
          Left = 718.142240000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line56: TfrxLineView
          Left = 793.732840000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line57: TfrxLineView
          Left = 869.291900000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo49: TfrxMemoView
          Left = 5.220470000000000000
          Top = 1.000000000000000000
          Width = 37.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."npage">,MasterData1)]')
        end
        object Memo51: TfrxMemoView
          Left = 54.133890000000000000
          Top = 1.000000000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."wpage">,MasterData1)]')
        end
        object Memo52: TfrxMemoView
          Left = 101.488250000000000000
          Top = 1.000000000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."B5">,MasterData1)]')
        end
        object Memo53: TfrxMemoView
          Left = 136.504020000000000000
          Top = 1.000000000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."K16">,MasterData1)]')
        end
        object Memo54: TfrxMemoView
          Left = 170.519790000000000000
          Top = 1.000000000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."A4">,MasterData1)]')
        end
        object Memo55: TfrxMemoView
          Left = 204.756030000000000000
          Top = 2.000000000000000000
          Width = 35.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."B4">,MasterData1)]')
        end
        object Memo56: TfrxMemoView
          Left = 234.771800000000000000
          Top = 1.000000000000000000
          Width = 35.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."K8">,MasterData1)]')
        end
        object Memo57: TfrxMemoView
          Left = 267.787570000000000000
          Top = 1.000000000000000000
          Width = 35.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."A3">,MasterData1)]')
        end
        object Memo58: TfrxMemoView
          Left = 299.803340000000000000
          Top = 2.000000000000000000
          Width = 35.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."A42">,MasterData1)]')
        end
        object Memo59: TfrxMemoView
          Left = 341.378170000000000000
          Top = 2.000000000000000000
          Width = 35.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."K82">,MasterData1)]')
        end
        object Memo60: TfrxMemoView
          Left = 380.173470000000000000
          Top = 2.000000000000000000
          Width = 35.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."LABAN">,MasterData1)]')
        end
        object Memo61: TfrxMemoView
          Left = 424.527830000000000000
          Top = 2.000000000000000000
          Width = 35.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."nationcall">,MasterData1)]')
        end
        object Memo62: TfrxMemoView
          Left = 470.882190000000000000
          Top = 2.000000000000000000
          Width = 35.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."chinacall">,MasterData1)]')
        end
        object Memo63: TfrxMemoView
          Left = 519.795610000000000000
          Top = 2.000000000000000000
          Width = 35.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."hgcall">,MasterData1)]')
        end
        object Memo64: TfrxMemoView
          Left = 591.386210000000000000
          Top = 1.000000000000000000
          Width = 35.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."SENDOUTSIDE">,MasterData1)]')
        end
        object Memo65: TfrxMemoView
          Left = 666.197280000000000000
          Top = 1.000000000000000000
          Width = 35.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."sendinside">,MasterData1)]')
        end
        object Memo66: TfrxMemoView
          Left = 742.567410000000000000
          Top = 1.000000000000000000
          Width = 35.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."sendprive">,MasterData1)]')
        end
        object Memo67: TfrxMemoView
          Left = 819.378480000000000000
          Top = 1.000000000000000000
          Width = 35.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<MONEYREPORT."resivdpage">,MasterData1)]')
        end
        object Memo68: TfrxMemoView
          Left = 922.205320000000000000
          Top = 3.779529999999994000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #21508#39033#32440#24352#23567#35745)
        end
      end
    end
  end
end
