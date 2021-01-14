object F_KERENREPORT: TF_KERENREPORT
  Left = 314
  Top = 246
  Width = 382
  Height = 339
  Caption = #23458#20154#21512#35745#25253#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object tkerenreport: TfrxReport
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    ReportOptions.CreateDate = 38808.942811921300000000
    ReportOptions.LastChange = 39441.682998125000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 88
    Top = 112
    Datasets = <
      item
        DataSet = DM.frxKERENREPORT
        DataSetName = 'qryKERENREPORT'
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
      object PageHeader1: TfrxPageHeader
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Shape1: TfrxShapeView
          Top = 55.692950000000000000
          Width = 1046.929810000000000000
          Height = 39.236240000000000000
        end
        object Line1: TfrxLineView
          Left = 0.236240000000000000
          Top = 76.031540000000010000
          Width = 982.740880000000000000
          Frame.Typ = [ftTop]
        end
        object Memo1: TfrxMemoView
          Left = 21.559060000000000000
          Top = 56.692950000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25171#23383'('#24352')')
        end
        object Line2: TfrxLineView
          Left = 98.267780000000000000
          Top = 57.472480000000000000
          Height = 38.236240000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo2: TfrxMemoView
          Left = 6.000000000000000000
          Top = 77.590599999999990000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #20013#25991)
        end
        object Memo3: TfrxMemoView
          Left = 54.913420000000000000
          Top = 77.370130000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #33521#25991)
        end
        object Line3: TfrxLineView
          Left = 45.354360000000000000
          Top = 75.590599999999990000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo4: TfrxMemoView
          Left = 170.078850000000000000
          Top = 56.692950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #22797#21360'('#24352')')
        end
        object Line4: TfrxLineView
          Left = 132.283550000000000000
          Top = 75.590599999999990000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          Left = 166.299320000000000000
          Top = 75.590599999999990000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Left = 200.315090000000000000
          Top = 75.590599999999990000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          Left = 232.551330000000000000
          Top = 75.590599999999990000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line8: TfrxLineView
          Left = 295.803340000000000000
          Top = 57.252010000000000000
          Height = 38.015770000000000000
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          Left = 264.567100000000000000
          Top = 75.590599999999990000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo5: TfrxMemoView
          Left = 102.047310000000000000
          Top = 76.590599999999990000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            'B5')
        end
        object Memo6: TfrxMemoView
          Left = 133.283550000000000000
          Top = 76.590599999999990000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '16K')
        end
        object Memo7: TfrxMemoView
          Left = 170.078850000000000000
          Top = 76.590599999999990000
          Width = 20.897650000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            'A4')
        end
        object Memo8: TfrxMemoView
          Left = 204.094620000000000000
          Top = 76.590599999999990000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            'B4')
        end
        object Memo9: TfrxMemoView
          Left = 234.330860000000000000
          Top = 76.590599999999990000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '8K')
        end
        object Memo10: TfrxMemoView
          Left = 268.346630000000000000
          Top = 76.590599999999990000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            'A3')
        end
        object Memo11: TfrxMemoView
          Left = 317.480520000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25171#21360','#25195#25551)
        end
        object Line10: TfrxLineView
          Left = 350.937230000000000000
          Top = 75.590599999999990000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line12: TfrxLineView
          Left = 411.968770000000000000
          Top = 57.692950000000000000
          Height = 38.015770000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo12: TfrxMemoView
          Left = 302.362400000000000000
          Top = 77.370130000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25171#21360)
        end
        object Memo13: TfrxMemoView
          Left = 362.834880000000000000
          Top = 77.590599999999990000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25195#25551)
        end
        object Memo15: TfrxMemoView
          Left = 476.220780000000000000
          Top = 56.692950000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #38271#36884)
        end
        object Line13: TfrxLineView
          Left = 566.929500000000000000
          Top = 57.472480000000000000
          Height = 38.015770000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo16: TfrxMemoView
          Left = 419.527830000000000000
          Top = 78.590599999999990000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #22269#38469)
        end
        object Memo17: TfrxMemoView
          Left = 464.882190000000000000
          Top = 78.590599999999990000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #22269#20869)
        end
        object Memo18: TfrxMemoView
          Left = 510.236550000000000000
          Top = 78.590599999999990000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #28207','#28595','#21488)
        end
        object Line14: TfrxLineView
          Left = 460.323130000000000000
          Top = 75.590599999999990000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line15: TfrxLineView
          Left = 506.457020000000000000
          Top = 75.590599999999990000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo19: TfrxMemoView
          Left = 684.094930000000000000
          Top = 56.692950000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #20256#30495'('#24352')')
        end
        object Line16: TfrxLineView
          Left = 642.520100000000000000
          Top = 77.370130000000000000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line17: TfrxLineView
          Left = 718.110700000000000000
          Top = 75.590599999999990000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line18: TfrxLineView
          Left = 793.701300000000000000
          Top = 75.590599999999990000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line19: TfrxLineView
          Left = 869.291900000000000000
          Top = 57.692950000000000000
          Height = 38.015770000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo20: TfrxMemoView
          Left = 582.047620000000000000
          Top = 78.590599999999990000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #22269#38469)
        end
        object Memo21: TfrxMemoView
          Left = 661.417750000000000000
          Top = 78.590599999999990000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #22269#20869)
        end
        object Memo22: TfrxMemoView
          Left = 733.228820000000000000
          Top = 78.370130000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #24066#20869)
        end
        object Memo23: TfrxMemoView
          Left = 808.819420000000000000
          Top = 78.370130000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25910#25991)
        end
        object Line20: TfrxLineView
          Left = 982.677800000000000000
          Top = 56.692950000000000000
          Height = 38.015770000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo25: TfrxMemoView
          Left = 985.236860000000000000
          Top = 67.811070000000000000
          Width = 56.826840000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #20869#37096#20154#21592)
        end
        object Memo26: TfrxMemoView
          Left = 393.071120000000000000
          Top = 11.338590000000000000
          Width = 279.685220000000000000
          Height = 30.236240000000000000
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = #38582#20070
          Font.Style = []
          Memo.Strings = (
            #21830#21153#20013#24515#23458#20154#21512#35745#25253#34920)
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 15.118120000000000000
          Top = 34.015770000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #21046#34920#20154':')
        end
        object SysMemo1: TfrxSysMemoView
          Left = 854.173780000000000000
          Top = 34.015770000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[DATE]')
        end
        object Memo28: TfrxMemoView
          Left = 759.685530000000000000
          Top = 34.015770000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25171#21360#26102#38388#65306)
        end
        object Memo14: TfrxMemoView
          Left = 888.189550000000000000
          Top = 56.692950000000000000
          Width = 69.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #19978#32593','#31199#36161)
        end
        object Line11: TfrxLineView
          Left = 922.205320000000000000
          Top = 75.590599999999990000
          Height = 20.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo39: TfrxMemoView
          Left = 876.850960000000000000
          Top = 78.590599999999990000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #19978#32593)
        end
        object Memo48: TfrxMemoView
          Left = 933.543910000000000000
          Top = 78.590599999999990000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #31199#36161)
        end
        object Memo70: TfrxMemoView
          Left = 506.457020000000000000
          Top = 56.692950000000000000
          Width = 33.472480000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '( '#65509')')
        end
        object Memo71: TfrxMemoView
          Left = 952.441560000000000000
          Top = 56.692950000000000000
          Width = 33.472480000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '( '#65509')')
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 173.858380000000000000
        Width = 1046.929810000000000000
        DataSet = DM.frxKERENREPORT
        DataSetName = 'qryKERENREPORT'
        RowCount = 0
        object Shape2: TfrxShapeView
          Width = 1046.929810000000000000
          Height = 20.897650000000000000
        end
        object Memo29: TfrxMemoView
          Left = 11.811070000000000000
          Width = 26.236240000000000000
          Height = 18.897650000000000000
          DataField = 'chinsepage'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."chinsepage"]')
        end
        object Memo30: TfrxMemoView
          Left = 56.724490000000000000
          Top = 0.779529999999994100
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          DataField = 'englishpage'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."englishpage"]')
        end
        object Line21: TfrxLineView
          Left = 45.165430000000000000
          Top = 0.779529999999994100
          Height = 20.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line22: TfrxLineView
          Left = 98.078850000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo31: TfrxMemoView
          Left = 102.637910000000000000
          Top = 1.000000000000000000
          Width = 25.677180000000000000
          Height = 18.897650000000000000
          DataField = 'B5'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."B5"]')
        end
        object Line23: TfrxLineView
          Left = 132.094620000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo32: TfrxMemoView
          Left = 133.874150000000000000
          Top = 0.779529999999994100
          Width = 27.677180000000000000
          Height = 18.897650000000000000
          DataField = 'K16'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."K16"]')
        end
        object Line24: TfrxLineView
          Left = 166.110390000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo33: TfrxMemoView
          Left = 168.889920000000000000
          Top = 0.779529999999994100
          Width = 33.897650000000000000
          Height = 18.897650000000000000
          DataField = 'A4'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."A4"]')
        end
        object Line25: TfrxLineView
          Left = 198.126160000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo34: TfrxMemoView
          Left = 203.905690000000000000
          Top = 1.000000000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          DataField = 'B4'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."B4"]')
        end
        object Line26: TfrxLineView
          Left = 232.362400000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo35: TfrxMemoView
          Left = 232.921460000000000000
          Width = 27.677180000000000000
          Height = 18.897650000000000000
          DataField = 'K8'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."K8"]')
        end
        object Line27: TfrxLineView
          Left = 264.378170000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line28: TfrxLineView
          Left = 296.393940000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo36: TfrxMemoView
          Left = 267.378170000000000000
          Width = 33.236240000000000000
          Height = 18.897650000000000000
          DataField = 'A3'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."A3"]')
        end
        object Line29: TfrxLineView
          Left = 350.527830000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo37: TfrxMemoView
          Left = 306.953000000000000000
          Width = 37.236240000000000000
          Height = 18.897650000000000000
          DataField = 'print1'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."print1"]')
        end
        object Memo38: TfrxMemoView
          Left = 367.000310000000000000
          Top = 0.779529999999994100
          Width = 33.236240000000000000
          Height = 18.897650000000000000
          DataField = 'sacn'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."sacn"]')
        end
        object Line31: TfrxLineView
          Left = 411.779840000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line32: TfrxLineView
          Left = 459.913730000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line33: TfrxLineView
          Left = 506.268090000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line34: TfrxLineView
          Left = 566.740570000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo40: TfrxMemoView
          Left = 422.338900000000000000
          Top = 1.779529999999994000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DataField = 'nationcall'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."nationcall"]')
        end
        object Memo41: TfrxMemoView
          Left = 466.472790000000000000
          Top = 2.000000000000000000
          Width = 38.015770000000000000
          Height = 18.897650000000000000
          DataField = 'chinacall'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."chinacall"]')
        end
        object Memo42: TfrxMemoView
          Left = 518.827150000000000000
          Top = 1.779529999999994000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'hgcall'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."hgcall"]')
        end
        object Line35: TfrxLineView
          Left = 642.331170000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line36: TfrxLineView
          Left = 717.921770000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line37: TfrxLineView
          Left = 793.512370000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Line38: TfrxLineView
          Left = 869.102970000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo43: TfrxMemoView
          Left = 583.638220000000000000
          Top = 2.779529999999994000
          Width = 38.236240000000000000
          Height = 18.897650000000000000
          DataField = 'sendoutside'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."sendoutside"]')
        end
        object Memo44: TfrxMemoView
          Left = 665.449290000000000000
          Top = 3.000000000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'sendinside'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."sendinside"]')
        end
        object Memo45: TfrxMemoView
          Left = 737.819420000000000000
          Top = 2.000000000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'sendprive'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."sendprive"]')
        end
        object Memo46: TfrxMemoView
          Left = 819.969080000000000000
          Top = 4.000000000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'resivd'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."resivd"]')
        end
        object Line39: TfrxLineView
          Left = 982.488870000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo47: TfrxMemoView
          Left = 875.764380000000000000
          Top = 4.000000000000000000
          Width = 36.653680000000000000
          Height = 18.897650000000000000
          DataField = 'intenet'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."intenet"]')
        end
        object Line30: TfrxLineView
          Left = 922.205320000000000000
          Height = 21.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo24: TfrxMemoView
          Left = 933.543910000000000000
          Top = 2.000000000000000000
          Width = 36.653680000000000000
          Height = 18.897650000000000000
          DataField = 'land'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."land"]')
        end
        object Memo72: TfrxMemoView
          Left = 985.677800000000000000
          Top = 0.779529999999994100
          Width = 66.370130000000000000
          Height = 17.897650000000000000
          DataField = 'neibuje'
          DataSet = DM.frxKERENREPORT
          DataSetName = 'qryKERENREPORT'
          Memo.Strings = (
            '[qryKERENREPORT."neibuje"]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 257.008040000000000000
        Width = 1046.929810000000000000
        object Shape3: TfrxShapeView
          Left = 0.440940000000000000
          Width = 1046.929810000000000000
          Height = 21.897650000000000000
        end
        object Line40: TfrxLineView
          Left = 75.590600000000000000
          Top = 1.779530000000022000
          Height = 20.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo49: TfrxMemoView
          Left = 5.779530000000000000
          Top = 2.779530000000022000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #37329#39069#21512#35745';')
        end
        object Memo50: TfrxMemoView
          Left = 140.181200000000000000
          Top = 3.000000000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            
              '[SUM(<qryKERENREPORT."chinsepage">*20+<qryKERENREPORT."englishpa' +
              'ge">*30)]')
        end
        object Memo51: TfrxMemoView
          Left = 75.590600000000000000
          Top = 4.779530000000022000
          Width = 72.267780000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25171#23383#21512#35745#65306)
        end
        object Line42: TfrxLineView
          Left = 188.976500000000000000
          Top = 1.000000000000000000
          Height = 20.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo52: TfrxMemoView
          Left = 166.299320000000000000
          Top = 5.779530000000022000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #20803)
        end
        object Line41: TfrxLineView
          Left = 319.157700000000000000
          Top = 2.779530000000022000
          Height = 20.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo53: TfrxMemoView
          Left = 188.976500000000000000
          Top = 3.779530000000022000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #22797#21360#21512#35745#65306)
        end
        object Memo54: TfrxMemoView
          Left = 260.787570000000000000
          Top = 3.779530000000022000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            
              '[SUM(<qryKERENREPORT."B5">*3+<qryKERENREPORT."K16">*3+<qryKERENR' +
              'EPORT."A4">*3+<qryKERENREPORT."B4">*5+<qryKERENREPORT."K8">*5+<q' +
              'ryKERENREPORT."A3">*5)]')
        end
        object Memo55: TfrxMemoView
          Left = 291.023810000000000000
          Top = 5.779530000000022000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #20803)
        end
        object Memo56: TfrxMemoView
          Left = 321.260050000000000000
          Top = 3.779530000000022000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25171#21360','#25195#25551#21512#35745';')
        end
        object Memo57: TfrxMemoView
          Left = 419.527830000000000000
          Top = 3.779530000000022000
          Width = 36.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<qryKERENREPORT."print1">*10+<qryKERENREPORT."sacn">*3)]')
        end
        object Memo58: TfrxMemoView
          Left = 453.543600000000000000
          Top = 4.779530000000022000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #20803)
        end
        object Line43: TfrxLineView
          Left = 476.220780000000000000
          Top = 2.779530000000022000
          Height = 20.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo59: TfrxMemoView
          Left = 476.220780000000000000
          Top = 3.779530000000022000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #38271#36884#35805#36153#21512#35745#65306)
        end
        object Memo60: TfrxMemoView
          Left = 570.488560000000000000
          Top = 3.779530000000022000
          Width = 40.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            
              '[SUM(<qryKERENREPORT."nationcall">+<qryKERENREPORT."chinacall">+' +
              '<qryKERENREPORT."hgcall">)]')
        end
        object Memo61: TfrxMemoView
          Left = 608.504330000000000000
          Top = 3.779530000000022000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #20803)
        end
        object Line44: TfrxLineView
          Left = 642.520100000000000000
          Top = 2.779530000000022000
          Height = 20.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo62: TfrxMemoView
          Left = 642.520100000000000000
          Top = 3.779530000000022000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #20256#30495#37329#39069#21512#35745#65306)
        end
        object Memo63: TfrxMemoView
          Left = 740.787880000000000000
          Top = 3.779530000000022000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            
              '[SUM(<qryKERENREPORT."sendoutside">*20+<qryKERENREPORT."sendinsi' +
              'de">*10+<qryKERENREPORT."sendprive">*5+<qryKERENREPORT."resivd">' +
              '*2)]')
        end
        object Memo64: TfrxMemoView
          Left = 774.803650000000000000
          Top = 3.779530000000022000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #20803)
        end
        object Line45: TfrxLineView
          Left = 793.701300000000000000
          Top = 2.779530000000022000
          Height = 20.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo65: TfrxMemoView
          Left = 793.701300000000000000
          Top = 3.779530000000022000
          Width = 103.504020000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #19978#32593','#31199#36161#21512#35745#65306)
        end
        object Memo67: TfrxMemoView
          Left = 899.528140000000000000
          Top = 3.779530000000022000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[SUM(<qryKERENREPORT."intenet">+<qryKERENREPORT."land">)]')
        end
        object Memo66: TfrxMemoView
          Left = 933.543910000000000000
          Top = 3.779530000000022000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #20803)
        end
        object Line46: TfrxLineView
          Left = 956.221090000000000000
          Top = 2.779530000000022000
          Height = 20.118120000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo68: TfrxMemoView
          Left = 960.000620000000000000
          Top = 2.779530000000022000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #21512#35745';')
        end
        object Memo69: TfrxMemoView
          Left = 990.236860000000000000
          Top = 3.000000000000000000
          Width = 71.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            
              '[SUM(<qryKERENREPORT."chinsepage">)*20+sum(<qryKERENREPORT."engl' +
              'ishpage">)*30+sum(<qryKERENREPORT."B5">)*3+sum(<qryKERENREPORT."' +
              'K16">)*3+sum(<qryKERENREPORT."A4">)*3+sum(<qryKERENREPORT."B4">)' +
              '*5+sum(<qryKERENREPORT."K8">)*5+sum(<qryKERENREPORT."A3">)*5+sum' +
              '(<qryKERENREPORT."print1">)*10+sum(<qryKERENREPORT."sacn">)*3+su' +
              'm(<qryKERENREPORT."nationcall">)+sum(<qryKERENREPORT."chinacall"' +
              '>)+sum(<qryKERENREPORT."hgcall">)+sum(<qryKERENREPORT."sendoutsi' +
              'de">)*20+sum(<qryKERENREPORT."sendinside">)*10+sum(<qryKERENREPO' +
              'RT."sendprive">)*5+sum(<qryKERENREPORT."resivd">)*2+sum(<qryKERE' +
              'NREPORT."intenet">)+sum(<qryKERENREPORT."land">)+sum(<qryKERENRE' +
              'PORT."neibuje">)]')
        end
      end
    end
  end
end
