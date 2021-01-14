inherited LctjForm: TLctjForm
  Left = 120
  Top = 27
  Width = 650
  Height = 500
  Caption = #32479#35745
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 642
    inherited lblTitle: TLabel
      Left = 263
      Caption = #27004#23618#32479#35745
    end
    inherited Image1: TImage
      Left = 192
    end
  end
  inherited Panel2: TPanel
    Width = 642
    Height = 396
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 632
      Height = 386
      ActivePage = TabSheet1
      Align = alClient
      HotTrack = True
      TabHeight = 30
      TabIndex = 0
      TabOrder = 0
      TabWidth = 100
      object TabSheet1: TTabSheet
        Caption = #22270'  '#34920
        object Chart1: TChart
          Left = 0
          Top = 0
          Width = 624
          Height = 346
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Gradient.Direction = gdFromTopLeft
          Gradient.EndColor = 16744576
          LeftWall.Brush.Color = clWhite
          LeftWall.Brush.Style = bsClear
          Title.Color = clWhite
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Title.Frame.Visible = True
          Title.Text.Strings = (
            #27004#23618#20986#31199#29575)
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
          LeftAxis.LabelsFont.Charset = GB2312_CHARSET
          LeftAxis.LabelsFont.Color = clBlack
          LeftAxis.LabelsFont.Height = -12
          LeftAxis.LabelsFont.Name = #23435#20307
          LeftAxis.LabelsFont.Style = []
          LeftAxis.Title.Font.Charset = GB2312_CHARSET
          LeftAxis.Title.Font.Color = clBlack
          LeftAxis.Title.Font.Height = -12
          LeftAxis.Title.Font.Name = #23435#20307
          LeftAxis.Title.Font.Style = []
          Legend.Alignment = laLeft
          Legend.DividingLines.Visible = True
          Legend.Font.Charset = GB2312_CHARSET
          Legend.Font.Color = clBlack
          Legend.Font.Height = -12
          Legend.Font.Name = #23435#20307
          Legend.Font.Style = []
          View3D = False
          Align = alClient
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clWhite
          TabOrder = 0
          object Series1: TBarSeries
            Marks.ArrowLength = 20
            Marks.Clip = True
            Marks.Font.Charset = GB2312_CHARSET
            Marks.Font.Color = clBlack
            Marks.Font.Height = -12
            Marks.Font.Name = #23435#20307
            Marks.Font.Style = []
            Marks.Style = smsLabelValue
            Marks.Transparent = True
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
          Width = 624
          Height = 346
          Align = alClient
          Color = clMoneyGreen
          DataSource = dsLctj
          FixedColor = clSkyBlue
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'System'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'System'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'D_LCMC'
              Title.Alignment = taCenter
              Title.Caption = #27004#23618
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_FJS'
              Title.Alignment = taCenter
              Title.Caption = #25151#38388#25968
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_CZS'
              Title.Alignment = taCenter
              Title.Caption = #20986#31199#25968
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_BJS'
              Title.Alignment = taCenter
              Title.Caption = #21322#20215#25968
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_QJS'
              Title.Alignment = taCenter
              Title.Caption = #20840#20215#25968
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_JJFJ'
              Title.Alignment = taCenter
              Title.Caption = #25151#20215
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_RCZL'
              Title.Alignment = taCenter
              Title.Caption = #20986#31199#29575
              Visible = True
            end>
        end
      end
    end
  end
  inherited Panel3: TPanel
    Top = 438
    Width = 642
    inherited btnHelp: TBitBtn
      Left = 482
    end
    inherited btnClose: TBitBtn
      Left = 562
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
    object btnPrintTb: TBitBtn
      Left = 402
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360#22270#34920
      TabOrder = 3
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
    object btnPrint: TBitBtn
      Left = 322
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
  end
  object tblLctj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'LCTJ'
    Left = 24
    Top = 8
    object tblLctjD_LCMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_LCMC'
      LookupDataSet = HotelData.tblLCDM
      LookupKeyFields = 'D_LCBH'
      LookupResultField = 'D_LCMC'
      KeyFields = 'D_LCBH'
      Lookup = True
    end
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
      OnGetText = tblLctjD_RCZLGetText
    end
    object tblLctjD_YCZL: TFloatField
      FieldName = 'D_YCZL'
    end
  end
  object dsLctj: TDataSource
    DataSet = tblLctj
    Left = 56
    Top = 8
  end
end
