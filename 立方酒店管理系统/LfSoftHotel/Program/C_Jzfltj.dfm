inherited JzfltjForm: TJzfltjForm
  Left = 178
  Top = 44
  Width = 550
  Height = 500
  Caption = #25253#34920
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 542
    Height = 90
    object Bevel1: TBevel [0]
      Left = 8
      Top = 44
      Width = 521
      Height = 41
      Shape = bsFrame
    end
    inherited lblTitle: TLabel
      Left = 181
      Width = 187
      Caption = #32467#24080#20998#31867#32479#35745
    end
    inherited Image1: TImage
      Left = 130
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
    object dtpBd: TDateTimePicker
      Left = 90
      Top = 56
      Width = 129
      Height = 20
      CalAlignment = dtaLeft
      Date = 37383.2415563657
      Time = 37383.2415563657
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object dtpEd: TDateTimePicker
      Left = 306
      Top = 56
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
    object btnTj: TBitBtn
      Left = 448
      Top = 52
      Width = 75
      Height = 25
      Caption = #32479'  '#35745
      TabOrder = 2
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
  end
  inherited Panel2: TPanel
    Top = 90
    Width = 542
    Height = 347
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 532
      Height = 337
      ActivePage = TabSheet1
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #22270#34920
        object Chart1: TChart
          Left = 0
          Top = 0
          Width = 524
          Height = 310
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
            #32467#24080#26041#24335#20998#31867#32479#35745)
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
        Caption = #25968#25454
        ImageIndex = 1
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 524
          Height = 310
          Align = alClient
          Color = clMoneyGreen
          DataSource = dsJzfltj
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
              FieldName = 'D_JZFS'
              Title.Alignment = taCenter
              Title.Caption = #32467#24080#26041#24335
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUM'
              Title.Alignment = taCenter
              Title.Caption = #28040#36153#37329#39069
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUM_1'
              Title.Alignment = taCenter
              Title.Caption = #20248#24800#37329#39069
              Visible = True
            end>
        end
      end
    end
  end
  inherited Panel3: TPanel
    Top = 437
    Width = 542
    Height = 36
    inherited btnHelp: TBitBtn
      Left = 382
    end
    inherited btnClose: TBitBtn
      Left = 462
    end
    object btnPrintTb: TBitBtn
      Left = 302
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
      Width = 57
      Height = 17
      Caption = #19977#32500
      TabOrder = 3
      OnClick = CheckBox1Click
    end
    object btnPrint: TBitBtn
      Left = 222
      Top = 6
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
  end
  inherited DosMove1: TDosMove
    Left = 56
  end
  object qryJzfltj: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select D_JZFS,sum(D_SH),sum(D_YH) from JZFLTJ where (D_YSRQ>=:BD' +
        ')and(D_YSRQ<=:ED) group by D_JZFS')
    Left = 24
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'BD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ED'
        ParamType = ptInput
      end>
    object qryJzfltjD_JZFS: TStringField
      FieldName = 'D_JZFS'
      Origin = 'LFHOTELUSER.JZFLTJ.D_JZFS'
      Size = 10
    end
    object qryJzfltjSUM: TFloatField
      FieldName = 'SUM'
      Origin = 'LFHOTELUSER.JZFLTJ.D_SH'
      DisplayFormat = '#.##'
    end
    object qryJzfltjSUM_1: TFloatField
      FieldName = 'SUM_1'
      Origin = 'LFHOTELUSER.JZFLTJ.D_YH'
      DisplayFormat = '#.##'
    end
  end
  object dsJzfltj: TDataSource
    DataSet = qryJzfltj
    Left = 88
    Top = 8
  end
end
