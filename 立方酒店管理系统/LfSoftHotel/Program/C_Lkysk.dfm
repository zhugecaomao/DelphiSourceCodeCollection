inherited LkyskForm: TLkyskForm
  Left = 138
  Top = 22
  Width = 600
  Height = 500
  Caption = #32479#35745
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 592
    inherited lblTitle: TLabel
      Left = 240
      Width = 156
      Caption = #38646#23458#24212#25910#27454
    end
    inherited Image1: TImage
      Left = 200
    end
  end
  inherited Panel2: TPanel
    Width = 592
    Height = 396
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 582
      Height = 386
      ActivePage = TabSheet2
      Align = alClient
      TabHeight = 30
      TabIndex = 1
      TabOrder = 0
      TabWidth = 100
      object TabSheet1: TTabSheet
        Caption = #22270'  '#34920
        object Chart1: TChart
          Left = 0
          Top = 0
          Width = 574
          Height = 346
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Gradient.EndColor = 16744576
          Title.Color = clWhite
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Title.Frame.Visible = True
          Title.Text.Strings = (
            #38646#23458#24212#25910#27454)
          BottomAxis.LabelsAngle = 90
          BottomAxis.LabelsFont.Charset = GB2312_CHARSET
          BottomAxis.LabelsFont.Color = clBlack
          BottomAxis.LabelsFont.Height = -12
          BottomAxis.LabelsFont.Name = #23435#20307
          BottomAxis.LabelsFont.Style = []
          BottomAxis.Title.Font.Charset = GB2312_CHARSET
          BottomAxis.Title.Font.Color = clBlack
          BottomAxis.Title.Font.Height = -12
          BottomAxis.Title.Font.Name = #23435#20307
          BottomAxis.Title.Font.Style = []
          Legend.Font.Charset = GB2312_CHARSET
          Legend.Font.Color = clBlack
          Legend.Font.Height = -12
          Legend.Font.Name = #23435#20307
          Legend.Font.Style = []
          View3D = False
          Align = alClient
          BorderStyle = bsSingle
          Color = clWhite
          TabOrder = 0
          object Series1: TBarSeries
            ColorEachPoint = True
            Marks.ArrowLength = 20
            Marks.Font.Charset = GB2312_CHARSET
            Marks.Font.Color = clBlack
            Marks.Font.Height = -12
            Marks.Font.Name = #23435#20307
            Marks.Font.Style = []
            Marks.Style = smsLabelValue
            Marks.Visible = False
            SeriesColor = clRed
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
        Caption = #25968'  '#25454
        ImageIndex = 1
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 574
          Height = 346
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
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'System'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'D_XFXM'
              Title.Caption = #28040#36153#39033#30446
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_XFJE'
              Title.Caption = #24212#25910#37329#39069
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_YJJE'
              Title.Caption = #24050#32467#37329#39069
              Visible = True
            end>
        end
      end
    end
  end
  inherited Panel3: TPanel
    Top = 438
    Width = 592
    inherited btnHelp: TBitBtn
      Left = 432
    end
    inherited btnClose: TBitBtn
      Left = 512
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 13
      Width = 97
      Height = 17
      Caption = #19977#32500
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object BitBtn1: TBitBtn
      Left = 272
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = #25171#21360#24635#24080
      TabOrder = 3
      OnClick = PrintZZ
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
    object BitBtn2: TBitBtn
      Left = 352
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = #25171#21360#22270#34920
      TabOrder = 4
      OnClick = PrintTb
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
    object BitBtn3: TBitBtn
      Left = 193
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = #25171#21360#26126#32454
      TabOrder = 5
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
    object DateTimePicker1: TDateTimePicker
      Left = 64
      Top = 8
      Width = 121
      Height = 20
      CalAlignment = dtaLeft
      Date = 37752.443028125
      Time = 37752.443028125
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 6
      OnCloseUp = DateTimePicker1CloseUp
    end
  end
  inherited DosMove1: TDosMove
    Left = 40
  end
  object tblLkyskz: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'LKYSKZ'
    Left = 8
    Top = 8
    object tblLkyskzD_XFXM: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XFXM'
      LookupDataSet = HotelData.tblXMDM
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
    object tblLkyskzD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Required = True
      Size = 8
    end
    object tblLkyskzD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Required = True
      Size = 5
    end
    object tblLkyskzD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      DisplayFormat = '#.##'
    end
    object tblLkyskzD_YJJE: TFloatField
      FieldName = 'D_YJJE'
      DisplayFormat = '#.##'
    end
  end
  object dsWork: TDataSource
    DataSet = tblLkyskz
    Left = 72
    Top = 8
  end
end
