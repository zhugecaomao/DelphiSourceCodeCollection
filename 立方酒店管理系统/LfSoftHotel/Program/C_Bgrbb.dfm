inherited BgRbbForm: TBgRbbForm
  Left = 51
  Top = -12
  Width = 800
  Height = 600
  Caption = #32479#35745
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 792
    Height = 257
    inherited lblTitle: TLabel
      Left = 303
      Width = 218
      Caption = #23486#39302#26085#33829#19994#25253#34920
    end
    inherited Image1: TImage
      Left = 204
    end
    inherited cmbOption: TComboBox
      Top = 8
      Visible = False
    end
    inherited cmbExpress: TComboBox
      Top = 8
      Visible = False
    end
    inherited edtValue: TEdit
      Top = 8
      Visible = False
    end
    inherited btnLoca: TBitBtn
      Top = 5
      Visible = False
    end
    object PageControl1: TPageControl
      Left = 5
      Top = 43
      Width = 782
      Height = 209
      ActivePage = TabSheet2
      Align = alBottom
      TabIndex = 1
      TabOrder = 4
      object TabSheet1: TTabSheet
        BorderWidth = 6
        Caption = #20170#26085#22270#34920
        object Chart1: TChart
          Left = 0
          Top = 0
          Width = 762
          Height = 170
          AllowPanning = pmHorizontal
          AnimatedZoom = True
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Gradient.EndColor = 16744576
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Color = clWhite
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Title.Frame.Visible = True
          Title.Text.Strings = (
            'TChart')
          BottomAxis.LabelsFont.Charset = GB2312_CHARSET
          BottomAxis.LabelsFont.Color = clBlack
          BottomAxis.LabelsFont.Height = -12
          BottomAxis.LabelsFont.Name = #23435#20307
          BottomAxis.LabelsFont.Style = []
          LeftAxis.LabelsFont.Charset = GB2312_CHARSET
          LeftAxis.LabelsFont.Color = clBlack
          LeftAxis.LabelsFont.Height = -12
          LeftAxis.LabelsFont.Name = #23435#20307
          LeftAxis.LabelsFont.Style = []
          Legend.Alignment = laTop
          Legend.Font.Charset = GB2312_CHARSET
          Legend.Font.Color = clBlack
          Legend.Font.Height = -12
          Legend.Font.Name = #23435#20307
          Legend.Font.Style = []
          Legend.Frame.Color = clGreen
          View3D = False
          View3DWalls = False
          Align = alClient
          BorderStyle = bsSingle
          Color = clWhite
          TabOrder = 0
          object Series1: TBarSeries
            Marks.Arrow.Color = clRed
            Marks.ArrowLength = 20
            Marks.Font.Charset = GB2312_CHARSET
            Marks.Font.Color = clBlack
            Marks.Font.Height = -12
            Marks.Font.Name = #23435#20307
            Marks.Font.Style = []
            Marks.Style = smsLabelValue
            Marks.Visible = False
            SeriesColor = clRed
            BarWidthPercent = 50
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
          end
        end
      end
      object TabSheet2: TTabSheet
        BorderWidth = 6
        Caption = #20170#26085#33829#19994
        ImageIndex = 1
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 762
          Height = 170
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvNone
          Color = clMoneyGreen
          TabOrder = 0
          object Label2: TLabel
            Left = 4
            Top = 18
            Width = 211
            Height = 21
            Caption = #19978#26085#32047#35745#24212#25910#65288'+'#65289#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 48
            Top = 47
            Width = 167
            Height = 21
            Caption = #26412#26085#33829#19994#65288'+'#65289#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 48
            Top = 76
            Width = 167
            Height = 21
            Caption = #19978#20132#36130#21153#65288'-'#65289#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 60
            Top = 106
            Width = 155
            Height = 21
            Caption = #20170#26085#32047#35745#24212#25910#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 382
            Top = 18
            Width = 189
            Height = 21
            Caption = #38646#23458#24212#25910#27454#65288'+'#65289#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 382
            Top = 47
            Width = 189
            Height = 21
            Caption = #35760#24080#24212#25910#27454#65288'+'#65289#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 382
            Top = 76
            Width = 189
            Height = 21
            Caption = #26410#32467#21457#31080#39069#65288'+'#65289#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 416
            Top = 106
            Width = 155
            Height = 21
            Caption = #20170#26085#32047#35745#24212#25910#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblSrljys: TLabel
            Left = 202
            Top = 19
            Width = 109
            Height = 21
            Caption = 'lblSrljys'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblBryy: TLabel
            Left = 202
            Top = 48
            Width = 85
            Height = 21
            Caption = 'lblBryy'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblSjcw: TLabel
            Left = 202
            Top = 77
            Width = 85
            Height = 21
            Caption = 'lblSjcw'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblJrljys1: TLabel
            Left = 202
            Top = 106
            Width = 121
            Height = 21
            Caption = 'lblJrljys1'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblLkysk: TLabel
            Left = 560
            Top = 18
            Width = 97
            Height = 21
            Caption = 'lblLkysk'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblJzysk: TLabel
            Left = 560
            Top = 47
            Width = 97
            Height = 21
            Caption = 'lblJzysk'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblFpe: TLabel
            Left = 560
            Top = 76
            Width = 73
            Height = 21
            Caption = 'lblFpe'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblJrljys2: TLabel
            Left = 560
            Top = 106
            Width = 121
            Height = 21
            Caption = 'lblJrljys2'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 11
            Top = 133
            Width = 91
            Height = 14
            Caption = #19978#20132#39044#20132#27454#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblSjyjk: TLabel
            Left = 96
            Top = 133
            Width = 57
            Height = 14
            Caption = 'lblSjcw'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 11
            Top = 149
            Width = 91
            Height = 14
            Caption = #26410#32467#39044#20132#27454#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblWjyjk: TLabel
            Left = 96
            Top = 149
            Width = 49
            Height = 14
            Caption = 'lblFpe'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 231
            Top = 133
            Width = 61
            Height = 14
            Caption = #39044#20132#27454#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 203
            Top = 149
            Width = 91
            Height = 14
            Caption = #39044#20132#27454#25187#38500#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblYjk: TLabel
            Left = 288
            Top = 133
            Width = 49
            Height = 14
            Caption = 'lblYjk'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblYjkkc: TLabel
            Left = 288
            Top = 149
            Width = 65
            Height = 14
            Caption = 'lblYjkkc'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 387
            Top = 133
            Width = 91
            Height = 14
            Caption = #26085#24179#22343#25151#20215#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 387
            Top = 149
            Width = 91
            Height = 14
            Caption = #26376#24179#22343#25151#20215#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 589
            Top = 133
            Width = 106
            Height = 14
            Caption = #26085#24179#22343#20986#31199#29575#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 589
            Top = 149
            Width = 106
            Height = 14
            Caption = #26376#24179#22343#20986#31199#29575#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblRpjj: TLabel
            Left = 472
            Top = 133
            Width = 57
            Height = 14
            Caption = 'lblRpjj'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblYpjj: TLabel
            Left = 472
            Top = 149
            Width = 57
            Height = 14
            Caption = 'lblYpjj'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblRpjczl: TLabel
            Left = 688
            Top = 133
            Width = 73
            Height = 14
            Caption = 'lblRpjczl'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblYpjczl: TLabel
            Left = 688
            Top = 149
            Width = 73
            Height = 14
            Caption = 'lblYpjczl'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
  end
  inherited Panel2: TPanel
    Top = 257
    Width = 792
    Height = 281
    inherited DBGrid1: TDBGrid
      Width = 782
      Height = 271
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XFXM'
          Title.Alignment = taCenter
          Title.Caption = #33829#19994#39033#30446
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JRYY'
          Title.Alignment = taCenter
          Title.Caption = #20170#26085#33829#19994
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JRSH'
          Title.Alignment = taCenter
          Title.Caption = #20170#26085#25910#22238
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JRYH'
          Title.Alignment = taCenter
          Title.Caption = #20170#26085#20248#24800
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_BYYY'
          Title.Alignment = taCenter
          Title.Caption = #20170#26085#26412#26376#33829#19994
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_BYYH'
          Title.Alignment = taCenter
          Title.Caption = #20170#26085#26412#26376#20248#24800
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_LJYY'
          Title.Alignment = taCenter
          Title.Caption = #20170#26085#32047#35745#33829#19994
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_LJSH'
          Title.Alignment = taCenter
          Title.Caption = #20170#26085#32047#35745#25910#22238
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_LJYH'
          Title.Alignment = taCenter
          Title.Caption = #20170#26085#32047#35745#20248#24800
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_LJYS'
          Title.Alignment = taCenter
          Title.Caption = #20170#26085#32047#35745#24212#25910
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_ZRBYYY'
          Title.Alignment = taCenter
          Title.Caption = #26152#26085#26412#26376#33829#19994
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_ZRBYYH'
          Title.Alignment = taCenter
          Title.Caption = #26152#26085#26412#26376#20248#24800
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_ZRLJYY'
          Title.Alignment = taCenter
          Title.Caption = #26152#26085#32047#35745#33829#19994
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_ZRLJSH'
          Title.Alignment = taCenter
          Title.Caption = #26152#26085#32047#35745#25910#22238
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_ZRLJYH'
          Title.Alignment = taCenter
          Title.Caption = #26152#26085#32047#35745#20248#24800
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_ZRLJYS'
          Title.Alignment = taCenter
          Title.Caption = #26152#26085#32047#35745#24212#25910
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 538
    Width = 792
    object Label1: TLabel [0]
      Left = 64
      Top = 11
      Width = 48
      Height = 12
      Caption = #26597#35810#26085#26399
    end
    inherited btnHelp: TBitBtn
      Left = 632
    end
    inherited btnClose: TBitBtn
      Left = 712
    end
    inherited btnPrint: TBitBtn
      Left = 552
      OnClick = btnPrintClick
    end
    object btnChartPrint: TBitBtn
      Left = 447
      Top = 5
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360#22270#34920
      TabOrder = 3
      OnClick = btnChartPrintClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 8
      Width = 49
      Height = 17
      Caption = #19977#32500
      TabOrder = 4
      OnClick = CheckBox1Click
    end
    object DateTimePicker1: TDateTimePicker
      Left = 120
      Top = 7
      Width = 129
      Height = 20
      CalAlignment = dtaLeft
      Date = 37379.1300773148
      Time = 37379.1300773148
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 5
      OnChange = DateTimePicker1Change
    end
    object ComboBox1: TComboBox
      Left = 240
      Top = 7
      Width = 100
      Height = 20
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 6
      Text = #20840#37096
      OnChange = ComboBox1Change
      Items.Strings = (
        #20840#37096
        #33829#19994
        #20248#24800
        #25910#22238
        #24212#25910)
    end
  end
  inherited DosMove1: TDosMove
    Left = 96
  end
  inherited qryWork: TQuery
    OnCalcFields = qryWorkCalcFields
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from YYTJ')
    object qryWorkD_XFXM: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XFXM'
      LookupDataSet = HotelData.tblXMDM
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
    object qryWorkD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Origin = 'LFHOTELUSER.YYTJ.D_YSRQ'
      Size = 8
    end
    object qryWorkD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.YYTJ.D_XMBH'
      Size = 5
    end
    object qryWorkD_JRYY: TFloatField
      FieldName = 'D_JRYY'
      Origin = 'LFHOTELUSER.YYTJ.D_JRYY'
      DisplayFormat = '#.##'
    end
    object qryWorkD_JRSH: TFloatField
      FieldName = 'D_JRSH'
      Origin = 'LFHOTELUSER.YYTJ.D_JRSH'
      DisplayFormat = '#.##'
    end
    object qryWorkD_JRYH: TFloatField
      FieldName = 'D_JRYH'
      Origin = 'LFHOTELUSER.YYTJ.D_JRYH'
      DisplayFormat = '#.##'
    end
    object qryWorkD_BYYY: TFloatField
      FieldName = 'D_BYYY'
      Origin = 'LFHOTELUSER.YYTJ.D_BYYY'
      DisplayFormat = '#.##'
    end
    object qryWorkD_BYYH: TFloatField
      FieldName = 'D_BYYH'
      Origin = 'LFHOTELUSER.YYTJ.D_BYYH'
      DisplayFormat = '#.##'
    end
    object qryWorkD_LJYY: TFloatField
      FieldName = 'D_LJYY'
      Origin = 'LFHOTELUSER.YYTJ.D_LJYY'
      DisplayFormat = '#.##'
    end
    object qryWorkD_LJYH: TFloatField
      FieldName = 'D_LJYH'
      Origin = 'LFHOTELUSER.YYTJ.D_LJYH'
      DisplayFormat = '#.##'
    end
    object qryWorkD_LJSH: TFloatField
      FieldName = 'D_LJSH'
      Origin = 'LFHOTELUSER.YYTJ.D_LJSH'
      DisplayFormat = '#.##'
    end
    object qryWorkD_LJYS: TFloatField
      FieldName = 'D_LJYS'
      Origin = 'LFHOTELUSER.YYTJ.D_LJYS'
      DisplayFormat = '#.##'
    end
    object qryWorkD_ZRBYYY: TFloatField
      FieldName = 'D_ZRBYYY'
      Origin = 'LFHOTELUSER.YYTJ.D_ZRBYYY'
      DisplayFormat = '#.##'
    end
    object qryWorkD_ZRBYYH: TFloatField
      FieldName = 'D_ZRBYYH'
      Origin = 'LFHOTELUSER.YYTJ.D_ZRBYYH'
      DisplayFormat = '#.##'
    end
    object qryWorkD_ZRLJYY: TFloatField
      FieldName = 'D_ZRLJYY'
      Origin = 'LFHOTELUSER.YYTJ.D_ZRLJYY'
      DisplayFormat = '#.##'
    end
    object qryWorkD_ZRLJYH: TFloatField
      FieldName = 'D_ZRLJYH'
      Origin = 'LFHOTELUSER.YYTJ.D_ZRLJYH'
      DisplayFormat = '#.##'
    end
    object qryWorkD_ZRLJSH: TFloatField
      FieldName = 'D_ZRLJSH'
      Origin = 'LFHOTELUSER.YYTJ.D_ZRLJSH'
      DisplayFormat = '#.##'
    end
    object qryWorkD_ZRLJYS: TFloatField
      FieldName = 'D_ZRLJYS'
      Origin = 'LFHOTELUSER.YYTJ.D_ZRLJYS'
      DisplayFormat = '#.##'
    end
    object qryWorkD_SYTQB: TFloatField
      FieldName = 'D_SYTQB'
      Origin = 'LFHOTELUSER.YYTJ.D_SYTQB'
    end
    object qryWorkD_JRXJ: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'D_JRXJ'
      DisplayFormat = '#.##'
      Currency = False
      Calculated = True
    end
    object qryWorkD_BYXJ: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'D_BYXJ'
      DisplayFormat = '#.##'
      Currency = False
      Calculated = True
    end
    object qryWorkD_LJXJ: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'D_LJXJ'
      DisplayFormat = '#.##'
      Currency = False
      Calculated = True
    end
  end
  inherited dsWork: TDataSource
    OnDataChange = dsWorkDataChange
  end
end
