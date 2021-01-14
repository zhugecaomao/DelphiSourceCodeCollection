object Fpersonal: TFpersonal
  Left = -4
  Top = -4
  Width = 1032
  Height = 748
  Caption = #20010#20154#19994#32489#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 69
    Width = 1024
    Height = 633
    ActivePage = ts1
    Align = alClient
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #37096#38376#19994#32489#26597#35810
      object r2: TdxDBGrid
        Left = 0
        Top = 0
        Width = 1016
        Height = 605
        Bands = <
          item
            Caption = #25171#23383'('#24352')'
            Width = 99
          end
          item
            Caption = #22797'    '#21360' '#65288#24352#65289
            Width = 194
          end
          item
            Caption = #27833'     '#21360#65288#24352#65289
            Width = 122
          end
          item
            Caption = #20256#30495'('#24352')'
            Width = 201
          end
          item
            Caption = #38271#35805'('#20803')'
            Width = 159
          end
          item
            Width = 80
          end
          item
            Width = 68
          end
          item
            Width = 66
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'id'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        TabOrder = 0
        BandColor = 10675132
        DataSource = dsbmyj
        Filter.Criteria = {00000000}
        HeaderColor = 10675132
        LookAndFeel = lfFlat
        OptionsBehavior = [edgoAnsiSort, edgoAutoCopySelectedToClipboard, edgoAutoSearch, edgoAutoSort, edgoDblClick, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        ShowBands = True
        ShowRowFooter = True
        object personid2: TdxDBGridColumn
          Caption = #28608#20809
          Width = 42
          BandIndex = 0
          RowIndex = 0
          FieldName = 'npage'
          SummaryFooterType = cstSum
          SummaryField = 'npage'
        end
        object personid3: TdxDBGridColumn
          Caption = '16K'
          Color = clGradientActiveCaption
          Width = 43
          BandIndex = 1
          RowIndex = 0
          FieldName = 'k16'
          SummaryFooterType = cstSum
          SummaryField = 'k16'
        end
        object personid4: TdxDBGridColumn
          Color = clGradientActiveCaption
          Width = 30
          BandIndex = 1
          RowIndex = 0
          FieldName = 'B5'
          SummaryFooterType = cstSum
          SummaryField = 'B5'
        end
        object personid5: TdxDBGridColumn
          Color = clGradientActiveCaption
          Width = 30
          BandIndex = 1
          RowIndex = 0
          FieldName = 'A4'
          SummaryFooterType = cstSum
          SummaryField = 'A4'
        end
        object personid6: TdxDBGridColumn
          Color = clGradientActiveCaption
          Width = 30
          BandIndex = 1
          RowIndex = 0
          FieldName = 'B4'
          SummaryFooterType = cstSum
          SummaryField = 'B4'
        end
        object personid7: TdxDBGridColumn
          Caption = '8K'
          Color = clGradientActiveCaption
          Width = 30
          BandIndex = 1
          RowIndex = 0
          FieldName = 'K8'
          SummaryFooterType = cstSum
          SummaryField = 'K8'
        end
        object personid8: TdxDBGridColumn
          Color = clGradientActiveCaption
          Width = 30
          BandIndex = 1
          RowIndex = 0
          FieldName = 'A3'
          SummaryFooterType = cstSum
          SummaryField = 'A3'
        end
        object personid9: TdxDBGridColumn
          Caption = 'A4'
          Width = 41
          BandIndex = 2
          RowIndex = 0
          FieldName = 'A42'
          SummaryFooterType = cstSum
          SummaryField = 'A42'
        end
        object personid10: TdxDBGridColumn
          Caption = '8K'
          Width = 45
          BandIndex = 2
          RowIndex = 0
          FieldName = 'K82'
          SummaryFooterType = cstSum
          SummaryField = 'K82'
        end
        object personid11: TdxDBGridColumn
          Caption = #33098#29256
          Width = 50
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
          Width = 50
          BandIndex = 0
          RowIndex = 0
          FieldName = 'wpage'
          SummaryFooterType = cstSum
          SummaryField = 'wpage'
        end
        object personidr2Column13: TdxDBGridColumn
          Caption = #22269#20869
          Color = clGradientActiveCaption
          Width = 51
          BandIndex = 3
          RowIndex = 0
          FieldName = 'sendinside'
          SummaryFooterType = cstSum
        end
        object personidr2Column14: TdxDBGridColumn
          Caption = #24066#20869
          Color = clGradientActiveCaption
          Width = 51
          BandIndex = 3
          RowIndex = 0
          FieldName = 'sendprive'
          SummaryFooterType = cstSum
        end
        object personidr2Column15: TdxDBGridColumn
          Caption = #25910#25991
          Color = clGradientActiveCaption
          Width = 51
          BandIndex = 3
          RowIndex = 0
          FieldName = 'resivdpage'
          SummaryFooterType = cstSum
        end
        object personidr2Column16: TdxDBGridColumn
          Caption = #22269#38469
          Width = 53
          BandIndex = 4
          RowIndex = 0
          FieldName = 'nationcall'
          SummaryFooterType = cstSum
        end
        object personidr2Column17: TdxDBGridColumn
          Caption = #22269#20869
          Width = 53
          BandIndex = 4
          RowIndex = 0
          FieldName = 'chinacall'
          SummaryFooterType = cstSum
        end
        object personidr2Column18: TdxDBGridColumn
          Caption = #28207','#28595','#21488
          Width = 53
          BandIndex = 4
          RowIndex = 0
          FieldName = 'hgcall'
          SummaryFooterType = cstSum
        end
        object personidr2Column20: TdxDBGridColumn
          Caption = #37096#38376
          Width = 80
          BandIndex = 5
          RowIndex = 0
          FieldName = 'department'
        end
        object personidr2Column21: TdxDBGridColumn
          Caption = #26102#38388
          Color = clMoneyGreen
          Width = 68
          BandIndex = 6
          RowIndex = 0
          FieldName = 't_time'
        end
        object r2Column21: TdxDBGridColumn
          Caption = #24405#20837#26102#38388
          Width = 66
          BandIndex = 7
          RowIndex = 0
          FieldName = 'XTSJ'
        end
        object r2Column22: TdxDBGridColumn
          Caption = #25805#20316#21592
          BandIndex = 7
          RowIndex = 0
          FieldName = 'czy'
        end
      end
    end
    object ts2: TTabSheet
      Caption = #23458#20154#19994#32489#26597#35810
      ImageIndex = 1
      object r3: TdxDBGrid
        Left = 0
        Top = 0
        Width = 1016
        Height = 605
        Bands = <
          item
            Caption = #25171#23383
            Width = 81
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
            Width = 244
          end
          item
            Caption = #38271#35805'('#20803')'
            Width = 146
          end
          item
            Caption = #19978#32593','#31199#36161
            Width = 63
          end
          item
            Width = 107
          end
          item
            Width = 95
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'id'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        TabOrder = 0
        BandColor = 10675132
        DataSource = dsforpepole
        Filter.Criteria = {00000000}
        HeaderColor = 10675132
        LookAndFeel = lfFlat
        OptionsBehavior = [edgoAnsiSort, edgoAutoCopySelectedToClipboard, edgoAutoSearch, edgoAutoSort, edgoDblClick, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        ShowBands = True
        ShowRowFooter = True
        object personidr3Column1: TdxDBGridColumn
          Caption = #20013#25991
          Width = 39
          BandIndex = 0
          RowIndex = 0
          FieldName = 'chinsepage'
          SummaryFooterType = cstSum
        end
        object personidr3Column2: TdxDBGridColumn
          Caption = #33521#25991
          Width = 42
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
          Width = 61
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
          Width = 61
          BandIndex = 3
          RowIndex = 0
          FieldName = 'sendinside'
          SummaryFooterType = cstSum
        end
        object personidr3Column14: TdxDBGridColumn
          Caption = #24066#20869
          Color = clSkyBlue
          Width = 61
          BandIndex = 3
          RowIndex = 0
          FieldName = 'sendprive'
          SummaryFooterType = cstSum
        end
        object personidr3Column15: TdxDBGridColumn
          Caption = #25910#25991
          Color = clSkyBlue
          Width = 61
          BandIndex = 3
          RowIndex = 0
          FieldName = 'resivd'
          SummaryFooterType = cstSum
        end
        object personidr3Column16: TdxDBGridColumn
          Caption = #22269#38469
          Width = 49
          BandIndex = 4
          RowIndex = 0
          FieldName = 'nationcall'
          SummaryFooterType = cstSum
        end
        object personidr3Column17: TdxDBGridColumn
          Caption = #22269#20869
          Width = 49
          BandIndex = 4
          RowIndex = 0
          FieldName = 'chinacall'
          SummaryFooterType = cstSum
        end
        object personidr3Column18: TdxDBGridColumn
          Caption = #28207','#28595','#21488
          Width = 49
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
        object personidr3Column21: TdxDBGridColumn
          Caption = #26085#26399
          Color = clMoneyGreen
          Width = 53
          BandIndex = 6
          RowIndex = 0
          FieldName = 'rq'
        end
        object r3Column21: TdxDBGridColumn
          Caption = #24405#20837#26102#38388
          Width = 67
          BandIndex = 7
          RowIndex = 0
          FieldName = 'XTSJ'
        end
        object r3Column22: TdxDBGridColumn
          Caption = #20869#37096
          Sorted = csUp
          Width = 54
          BandIndex = 6
          RowIndex = 0
          FieldName = 'neibuje'
        end
        object r3Column23: TdxDBGridColumn
          Caption = #25805#20316#21592
          Width = 42
          BandIndex = 7
          RowIndex = 0
          FieldName = 'czy'
        end
      end
    end
  end
  object stat1: TStatusBar
    Left = 0
    Top = 702
    Width = 1024
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object grp1: TGroupBox
    Left = 0
    Top = 0
    Width = 1024
    Height = 69
    Align = alTop
    TabOrder = 2
    object grp2: TGroupBox
      Left = 12
      Top = 12
      Width = 229
      Height = 43
      Caption = #35831#36873#25321#24744#35201#26597#35810#30340#20154#21517
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object chk1: TCheckBox
        Left = 4
        Top = 16
        Width = 59
        Height = 17
        Caption = #36154#33395#33459
        TabOrder = 0
      end
      object chk2: TCheckBox
        Left = 62
        Top = 15
        Width = 59
        Height = 17
        Caption = #21016#33729#26757
        TabOrder = 1
      end
      object chk3: TCheckBox
        Left = 123
        Top = 16
        Width = 47
        Height = 17
        Caption = #24120#26149
        TabOrder = 2
      end
      object CByl: TCheckBox
        Left = 171
        Top = 16
        Width = 51
        Height = 17
        Caption = #26472#38706
        TabOrder = 3
      end
    end
    object grp3: TGroupBox
      Left = 249
      Top = 14
      Width = 514
      Height = 41
      Caption = #36873#25321#20320#35201#26597#35810#30340#26102#38388
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lbl1: TLabel
        Left = 11
        Top = 16
        Width = 48
        Height = 12
        Caption = #24320#22987#26085#26399
      end
      object lbl2: TLabel
        Left = 265
        Top = 16
        Width = 48
        Height = 12
        Caption = #32467#26463#26085#26399
      end
      object dtp1: TDateTimePicker
        Left = 321
        Top = 12
        Width = 186
        Height = 20
        Date = 39403.000000000000000000
        Time = 39403.000000000000000000
        TabOrder = 0
      end
      object dtp2: TDateTimePicker
        Left = 64
        Top = 12
        Width = 186
        Height = 20
        Date = 39403.000000000000000000
        Time = 39403.000000000000000000
        TabOrder = 1
      end
    end
    object btn1: TBitBtn
      Left = 769
      Top = 24
      Width = 93
      Height = 25
      Caption = #26597#35810
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btn1Click
    end
    object btn2: TBitBtn
      Left = 891
      Top = 24
      Width = 94
      Height = 25
      Caption = #36864#20986
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btn2Click
    end
  end
  object dsbmyj: TDataSource
    DataSet = DM.qrybmyj
    Left = 636
    Top = 141
  end
  object dsforpepole: TDataSource
    DataSet = DM.qryforpepole
    Left = 607
    Top = 141
  end
end
