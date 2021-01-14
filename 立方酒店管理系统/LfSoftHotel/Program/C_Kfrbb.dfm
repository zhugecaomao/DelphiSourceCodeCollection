inherited KfrbbForm: TKfrbbForm
  Left = 145
  Top = 48
  Width = 700
  Height = 500
  Caption = #25253#34920
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 692
    Height = 85
    object Bevel1: TBevel [0]
      Left = 8
      Top = 39
      Width = 673
      Height = 41
      Shape = bsFrame
    end
    inherited lblTitle: TLabel
      Left = 294
      Width = 156
      Caption = #23458#25151#26085#25253#34920
    end
    inherited Image1: TImage
      Left = 256
    end
    object Label1: TLabel
      Left = 16
      Top = 54
      Width = 48
      Height = 12
      Caption = #26597#35810#26085#26399
    end
    object DateTimePicker1: TDateTimePicker
      Left = 72
      Top = 48
      Width = 129
      Height = 20
      CalAlignment = dtaLeft
      Date = 37379.2193173611
      Time = 37379.2193173611
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
      OnChange = DateTimePicker1Change
    end
    object ComboBox1: TComboBox
      Left = 575
      Top = 48
      Width = 100
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 1
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
  inherited Panel2: TPanel
    Top = 85
    Width = 692
    Height = 353
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 682
      Height = 343
      ActivePage = TabSheet2
      Align = alClient
      HotTrack = True
      TabIndex = 1
      TabOrder = 0
      object TabSheet1: TTabSheet
        BorderWidth = 10
        Caption = #22270#34920
        object Chart1: TChart
          Left = 0
          Top = 0
          Width = 654
          Height = 296
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
            #23458#25151)
          BottomAxis.LabelsFont.Charset = GB2312_CHARSET
          BottomAxis.LabelsFont.Color = clBlack
          BottomAxis.LabelsFont.Height = -12
          BottomAxis.LabelsFont.Name = #23435#20307
          BottomAxis.LabelsFont.Style = []
          BottomAxis.LabelsMultiLine = True
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
          object BarSeries1: TBarSeries
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
        BorderWidth = 10
        Caption = #25968#25454
        ImageIndex = 1
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 654
          Height = 296
          Align = alClient
          BevelInner = bvLowered
          Color = clMoneyGreen
          TabOrder = 0
          object lblSrzbyyye: TLabel
            Left = 352
            Top = 16
            Width = 144
            Height = 16
            Caption = #19978#26085#27490#26412#26376#33829#19994#39069#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'System'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblSrzljyye: TLabel
            Left = 352
            Top = 42
            Width = 144
            Height = 16
            Caption = #19978#26085#27490#32047#35745#33829#19994#39069#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'System'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblSrzljysk: TLabel
            Left = 352
            Top = 68
            Width = 144
            Height = 16
            Caption = #19978#26085#27490#32047#35745#24212#25910#27454#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'System'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblJryye: TLabel
            Left = 16
            Top = 24
            Width = 133
            Height = 21
            Caption = #20170#26085#33829#19994#39069#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblNbff: TLabel
            Left = 16
            Top = 68
            Width = 155
            Height = 21
            Caption = #20170#26085#20869#23486#25151#36153#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblWbff: TLabel
            Left = 16
            Top = 113
            Width = 155
            Height = 21
            Caption = #20170#26085#22806#23486#25151#36153#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblDbf: TLabel
            Left = 16
            Top = 158
            Width = 133
            Height = 21
            Caption = #20170#26085#20195#20445#36153#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblYh: TLabel
            Left = 16
            Top = 203
            Width = 111
            Height = 21
            Caption = #20170#26085#20248#24800#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblJrsjyye: TLabel
            Left = 16
            Top = 248
            Width = 177
            Height = 21
            Caption = #20170#26085#23454#38469#33829#19994#39069#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblJrshhj: TLabel
            Left = 352
            Top = 100
            Width = 112
            Height = 16
            Caption = #20170#26085#25910#22238#21512#35745#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'System'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblSrzshhj: TLabel
            Left = 352
            Top = 122
            Width = 128
            Height = 16
            Caption = #19978#26085#27490#25910#22238#21512#35745#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'System'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblJrzshhj: TLabel
            Left = 352
            Top = 145
            Width = 128
            Height = 16
            Caption = #20170#26085#27490#25910#22238#21512#35745#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'System'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblJrzbyyye: TLabel
            Left = 352
            Top = 181
            Width = 144
            Height = 16
            Caption = #20170#26085#27490#26412#26376#33829#19994#39069#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'System'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblJrzbysyy: TLabel
            Left = 352
            Top = 208
            Width = 144
            Height = 16
            Caption = #20170#26085#27490#26412#26376#23454#33829#19994#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'System'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblJrzljyye: TLabel
            Left = 352
            Top = 236
            Width = 144
            Height = 16
            Caption = #20170#26085#27490#32047#35745#33829#19994#39069#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'System'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblJrzljysk: TLabel
            Left = 352
            Top = 264
            Width = 144
            Height = 16
            Caption = #20170#26085#27490#32047#35745#24212#25910#27454#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'System'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
  end
  inherited Panel3: TPanel
    Top = 438
    Width = 692
    inherited btnHelp: TBitBtn
      Left = 532
    end
    inherited btnClose: TBitBtn
      Left = 612
    end
    object btnPrintTb: TBitBtn
      Left = 452
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360#22270#34920
      TabOrder = 2
      OnClick = btnPrintTbClick
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
    object CheckBox1: TCheckBox
      Left = 8
      Top = 13
      Width = 49
      Height = 17
      Caption = #19977#32500
      TabOrder = 3
      OnClick = CheckBox1Click
    end
    object btnPrint: TBitBtn
      Left = 372
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360'(&P)'
      TabOrder = 4
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
    object btnCzl: TBitBtn
      Left = 292
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #20986#31199#29575
      TabOrder = 5
      OnClick = btnCzlClick
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
  end
  inherited DosMove1: TDosMove
    Left = 16
  end
  object qryWork: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from YYTJ')
    Left = 48
    Top = 8
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
    end
    object qryWorkD_JRSH: TFloatField
      FieldName = 'D_JRSH'
      Origin = 'LFHOTELUSER.YYTJ.D_JRSH'
    end
    object qryWorkD_JRYH: TFloatField
      FieldName = 'D_JRYH'
      Origin = 'LFHOTELUSER.YYTJ.D_JRYH'
    end
    object qryWorkD_BYYY: TFloatField
      FieldName = 'D_BYYY'
      Origin = 'LFHOTELUSER.YYTJ.D_BYYY'
    end
    object qryWorkD_BYYH: TFloatField
      FieldName = 'D_BYYH'
      Origin = 'LFHOTELUSER.YYTJ.D_BYYH'
    end
    object qryWorkD_LJYY: TFloatField
      FieldName = 'D_LJYY'
      Origin = 'LFHOTELUSER.YYTJ.D_LJYY'
    end
    object qryWorkD_LJYH: TFloatField
      FieldName = 'D_LJYH'
      Origin = 'LFHOTELUSER.YYTJ.D_LJYH'
    end
    object qryWorkD_LJSH: TFloatField
      FieldName = 'D_LJSH'
      Origin = 'LFHOTELUSER.YYTJ.D_LJSH'
    end
    object qryWorkD_LJYS: TFloatField
      FieldName = 'D_LJYS'
      Origin = 'LFHOTELUSER.YYTJ.D_LJYS'
    end
    object qryWorkD_ZRBYYY: TFloatField
      FieldName = 'D_ZRBYYY'
      Origin = 'LFHOTELUSER.YYTJ.D_ZRBYYY'
    end
    object qryWorkD_ZRBYYH: TFloatField
      FieldName = 'D_ZRBYYH'
      Origin = 'LFHOTELUSER.YYTJ.D_ZRBYYH'
    end
    object qryWorkD_ZRLJYY: TFloatField
      FieldName = 'D_ZRLJYY'
      Origin = 'LFHOTELUSER.YYTJ.D_ZRLJYY'
    end
    object qryWorkD_ZRLJYH: TFloatField
      FieldName = 'D_ZRLJYH'
      Origin = 'LFHOTELUSER.YYTJ.D_ZRLJYH'
    end
    object qryWorkD_ZRLJSH: TFloatField
      FieldName = 'D_ZRLJSH'
      Origin = 'LFHOTELUSER.YYTJ.D_ZRLJSH'
    end
    object qryWorkD_ZRLJYS: TFloatField
      FieldName = 'D_ZRLJYS'
      Origin = 'LFHOTELUSER.YYTJ.D_ZRLJYS'
    end
  end
  object tblSjtj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'SJTJ'
    Left = 80
    Top = 8
  end
  object tblLctj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'LCTJ'
    Left = 112
    Top = 8
    object tblLctjD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Required = True
      Size = 8
    end
    object tblLctjD_LCBH: TStringField
      FieldName = 'D_LCBH'
      Required = True
      Size = 5
    end
    object tblLctjD_FJS: TIntegerField
      FieldName = 'D_FJS'
    end
    object tblLctjD_CZS: TFloatField
      FieldName = 'D_CZS'
    end
    object tblLctjD_QJS: TIntegerField
      FieldName = 'D_QJS'
    end
    object tblLctjD_BJS: TIntegerField
      FieldName = 'D_BJS'
    end
    object tblLctjD_JJFJ: TFloatField
      FieldName = 'D_JJFJ'
      DisplayFormat = '#.##'
    end
    object tblLctjD_RCZL: TFloatField
      FieldName = 'D_RCZL'
    end
    object tblLctjD_YCZL: TFloatField
      FieldName = 'D_YCZL'
    end
    object tblLctjD_LCMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_LCMC'
      LookupDataSet = HotelData.tblLCDM
      LookupKeyFields = 'D_LCBH'
      LookupResultField = 'D_LCMC'
      KeyFields = 'D_LCBH'
      Lookup = True
    end
  end
end
