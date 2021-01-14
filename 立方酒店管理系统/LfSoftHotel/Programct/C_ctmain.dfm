object CtmainForm: TCtmainForm
  Left = 30
  Top = 21
  Width = 800
  Height = 600
  ActiveControl = sgdCtzt
  Caption = #31435#26041#39184#39278#31649#29702#31995#32479
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 64
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 792
      Height = 64
      Align = alClient
      ButtonHeight = 58
      Caption = 'ToolBar1'
      TabOrder = 0
      object btnYd: TBitBtn
        Left = 0
        Top = 2
        Width = 75
        Height = 58
        Caption = #39044#23450'(F1)'
        TabOrder = 7
        OnClick = btnYdClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333FF3FF3333333333CC30003333333333773777333333333C33
          3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
          33003377333337F33377333333333C333300333F333337F33377339333333C33
          3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
          330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
          330077F377F337F33377993399333C33330077FF773337F33377399993333C33
          33333777733337F333FF333333333C33300033333333373FF7773333333333CC
          3000333333333377377733333333333333333333333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
      end
      object btnXt: TBitBtn
        Left = 75
        Top = 2
        Width = 75
        Height = 58
        Caption = #36873#21488'(F2)'
        TabOrder = 0
        OnClick = btnXtClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888488000080008000888888888888888884880000800080008888888888888
          8888488000080008000888888888888888884880000800080008888888888888
          8888488000080008000888888888888888884444444444444444888888888888
          8888888000080008000888888888888888888888888888888888}
        Layout = blGlyphTop
      end
      object btnKt: TBitBtn
        Left = 150
        Top = 2
        Width = 75
        Height = 58
        Caption = #24320#21488'(F3)'
        TabOrder = 1
        OnClick = sgdCtztDblClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888000000088888888807777708888888880777770888800000077
          777088880BFBF077777088880FBFB077777088880BFBF000000080000000BFBF
          088880777770FBFB088880777770BFBF088880777770FBFB0888807777700000
          0888807777708888888880000000888888888888888888888888}
        Layout = blGlyphTop
      end
      object btnZt: TBitBtn
        Left = 225
        Top = 2
        Width = 75
        Height = 58
        Caption = #36716#21488'(F4)'
        TabOrder = 2
        OnClick = btnZtClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
          FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
          00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
          F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
          00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
          F033777777777337F73309999990FFF0033377777777FFF77333099999000000
          3333777777777777333333399033333333333337773333333333333903333333
          3333333773333333333333303333333333333337333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
      end
      object btnBt: TBitBtn
        Left = 300
        Top = 2
        Width = 75
        Height = 58
        Caption = #24182#21488'(F5)'
        TabOrder = 3
        OnClick = btnBtClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888000888888888800000088444444440000008848888888000888884888888
          8848888884888888884884444488888888488488848888888848848884888888
          8848848884888888884884888444444444488488888884888888848888888488
          8888000888888488800000044444448880000008888888888000}
        Layout = blGlyphTop
      end
      object btnQt: TBitBtn
        Left = 375
        Top = 2
        Width = 75
        Height = 58
        Caption = #28165#21488'(F6)'
        TabOrder = 4
        OnClick = btnQtClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888808888888888088800088888888888880000888888
          8088888000888888088888880008888008888888800088008888888888000008
          8888888888800088888888888800000888888888800088008888888000088880
          0888880000888888008888000888888888088888888888888888}
        Layout = blGlyphTop
      end
      object btnJt: TBitBtn
        Left = 450
        Top = 2
        Width = 75
        Height = 58
        Caption = #21152#21488'(F7)'
        TabOrder = 8
        OnClick = btnJtClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888844444444448000004FFFFFFFF40737374F444444F40373734FFFFF
          FFF40737374F444F44440373734FFFFF4F480737374FFFFF4488037373444444
          408807373737373730880370000000077088077088888807308803730B00B073
          7088800000BB0000088888888000088888888888888888888888}
        Layout = blGlyphTop
      end
      object btnRefresh: TBitBtn
        Left = 525
        Top = 2
        Width = 75
        Height = 58
        Caption = #21047#26032'(F8)'
        TabOrder = 6
        OnClick = btnRefreshClick
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000F0000000000FF000F0FFFFFFFF0FF000F0FFFFFFFF0FFA5FF0FF4444FF0F
          F000F0FFFFFFFF0FF000F0FF4444FF0FF000F0FFFFFFFF0FF000F0FF444F000F
          F000F0FFFFFF080FF000F0FFFFFF00FFF000F00000000FFFF000FFFFFFFFFFFF
          F000}
        Layout = blGlyphTop
      end
      object btnQuit: TBitBtn
        Left = 600
        Top = 2
        Width = 75
        Height = 58
        Caption = #36864#20986
        TabOrder = 5
        OnClick = N18Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
          F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
          000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
          338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
          45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
          3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
          F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
          000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
          338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
          4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
          8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
          333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
          0000}
        Layout = blGlyphTop
        NumGlyphs = 2
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 64
    Width = 792
    Height = 490
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 0
      Top = 265
      Width = 792
      Height = 5
      Cursor = crVSplit
      Align = alTop
    end
    object Panel4: TPanel
      Left = 0
      Top = 270
      Width = 792
      Height = 220
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 560
        Height = 220
        Align = alLeft
        Color = clMoneyGreen
        DataSource = dsCtdc
        FixedColor = clSkyBlue
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'System'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'System'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'D_SJDM'
            Title.Alignment = taCenter
            Title.Caption = #26102#38388
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_CTMC'
            Title.Alignment = taCenter
            Title.Caption = #39184#21488
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_YCBZ'
            Title.Alignment = taCenter
            Title.Caption = #29992#39184#26631#20934
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_JZFS'
            Title.Alignment = taCenter
            Title.Caption = #32467#24080#26041#24335
            Width = 70
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'D_XFJE'
            Title.Alignment = taCenter
            Title.Caption = #32467#24080#37329#39069
            Width = 70
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'D_YHJE'
            Title.Alignment = taCenter
            Title.Caption = #20248#24800#37329#39069
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_BZ'
            Title.Caption = #32467#24080#22791#27880
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_KRXM'
            Title.Alignment = taCenter
            Title.Caption = #23458#20154#22995#21517
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_CZYXM'
            Title.Alignment = taCenter
            Title.Caption = #25805#20316#21592
            Width = 80
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 560
        Top = 0
        Width = 232
        Height = 220
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 3
        Color = clMoneyGreen
        TabOrder = 1
        object Chart1: TChart
          Left = 3
          Top = 145
          Width = 226
          Height = 72
          BackWall.Brush.Color = clWhite
          Gradient.EndColor = 16744576
          Title.Color = 4227327
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clYellow
          Title.Font.Height = -14
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Title.Frame.Visible = True
          Title.Text.Strings = (
            #39184#21488#20351#29992#29575)
          Title.Visible = False
          BottomAxis.LabelsFont.Charset = GB2312_CHARSET
          BottomAxis.LabelsFont.Color = clBlack
          BottomAxis.LabelsFont.Height = -12
          BottomAxis.LabelsFont.Name = #23435#20307
          BottomAxis.LabelsFont.Style = []
          LeftAxis.LabelsAngle = 90
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
          Legend.Visible = False
          View3D = False
          View3DOptions.Elevation = 315
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          Align = alBottom
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clWhite
          TabOrder = 0
          object Series1: THorizBarSeries
            ColorEachPoint = True
            Marks.ArrowLength = 8
            Marks.Font.Charset = GB2312_CHARSET
            Marks.Font.Color = clBlack
            Marks.Font.Height = -12
            Marks.Font.Name = #23435#20307
            Marks.Font.Style = []
            Marks.Style = smsLabelValue
            Marks.Visible = True
            SeriesColor = clRed
            XValues.DateTime = False
            XValues.Name = 'Bar'
            XValues.Multiplier = 1
            XValues.Order = loNone
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loAscending
          end
        end
        object GroupBox1: TGroupBox
          Left = 3
          Top = 3
          Width = 226
          Height = 142
          Align = alClient
          Caption = #32467#24080#21592
          TabOrder = 1
          object lblXfze: TLabel
            Left = 10
            Top = 18
            Width = 60
            Height = 12
            Caption = #28040#36153#24635#39069#65306
          end
          object lblJzze: TLabel
            Left = 10
            Top = 35
            Width = 60
            Height = 12
            Caption = #32467#24080#24635#39069#65306
          end
          object lblRmb: TLabel
            Left = 10
            Top = 54
            Width = 48
            Height = 12
            Caption = #20154#27665#24065#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lblXyk: TLabel
            Left = 10
            Top = 70
            Width = 48
            Height = 12
            Caption = #20449#29992#21345#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lblZp: TLabel
            Left = 10
            Top = 86
            Width = 48
            Height = 12
            Caption = #25903'  '#31080#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lblJzxj: TLabel
            Left = 10
            Top = 102
            Width = 60
            Height = 12
            Caption = #39184#21381#25910#22238#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lblQt: TLabel
            Left = 130
            Top = 54
            Width = 36
            Height = 12
            Caption = #20854#20182#65306
          end
          object Bevel1: TBevel
            Left = 9
            Top = 48
            Width = 216
            Height = 2
            Shape = bsBottomLine
          end
          object lblYdze: TLabel
            Left = 128
            Top = 18
            Width = 60
            Height = 12
            Caption = #39044#23450#24635#39069#65306
          end
        end
      end
    end
    object sgdCtzt: TStringGrid
      Left = 0
      Top = 0
      Width = 792
      Height = 265
      Align = alTop
      DefaultRowHeight = 48
      FixedCols = 0
      FixedRows = 0
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      GridLineWidth = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected]
      ParentFont = False
      TabOrder = 1
      OnDblClick = sgdCtztDblClick
      OnDrawCell = sgdCtztDrawCell
      OnKeyPress = sgdCtztKeyPress
      OnSelectCell = sgdCtztSelectCell
    end
  end
  object MainMenu1: TMainMenu
    Left = 96
    Top = 120
    object N1: TMenuItem
      Caption = #26085#24120#33829#19994
      object N28: TMenuItem
        Caption = #39044'  '#23450
        OnClick = btnYdClick
      end
      object N27: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Caption = #36873'  '#21488
        OnClick = btnXtClick
      end
      object N3: TMenuItem
        Caption = #24320'  '#21488
        OnClick = sgdCtztDblClick
      end
      object N4: TMenuItem
        Caption = #36716'  '#21488
        OnClick = btnZtClick
      end
      object N5: TMenuItem
        Caption = #24182'  '#21488
        OnClick = btnBtClick
      end
      object N6: TMenuItem
        Caption = #28165'  '#21488
        OnClick = btnQtClick
      end
      object N32: TMenuItem
        Caption = #21152'  '#21488
        OnClick = btnJtClick
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object N16: TMenuItem
        Caption = #38750#39184#36153#32467#24080
        OnClick = N16Click
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object N18: TMenuItem
        Caption = #31995#32479#36864#20986
        OnClick = N18Click
      end
    end
    object N7: TMenuItem
      Caption = #26597#35810#32479#35745
      object N8: TMenuItem
        Caption = #28040#32791#32479#35745
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #28857#33756#21464#21160
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = #33829#19994#26597#35810
        OnClick = N10Click
      end
      object N34: TMenuItem
        Caption = #26410#32467#24080#26597#35810
        OnClick = OnWjzcx
      end
      object N29: TMenuItem
        Caption = '-'
      end
      object N25: TMenuItem
        Caption = #33829#19994#32479#35745
        object N26: TMenuItem
          Caption = #25353#28040#36153#39033#30446#32479#35745
          OnClick = N26Click
        end
        object N30: TMenuItem
          Caption = #25353#32467#24080#26041#24335#32479#35745
          OnClick = N30Click
        end
        object N31: TMenuItem
          Caption = #25353#32467#24080#21592#24037#32479#35745
          OnClick = N31Click
        end
      end
    end
    object N11: TMenuItem
      Caption = #31995#32479#35774#32622
      object N12: TMenuItem
        Caption = #28040#36153#39033#30446#23450#20041
        OnClick = N12Click
      end
      object N13: TMenuItem
        Caption = #39184#21381#21488#21495#23450#20041
        OnClick = N13Click
      end
      object N14: TMenuItem
        Caption = #33756#21333#23450#20041
        OnClick = N14Click
      end
      object N19: TMenuItem
        Caption = '-'
      end
      object N33: TMenuItem
        AutoCheck = True
        Caption = #39044#23450#26174#31034
        ShortCut = 121
        OnClick = N33Click
      end
      object N24: TMenuItem
        Caption = #20018#21475#35774#32622
        OnClick = N24Click
      end
      object N20: TMenuItem
        Caption = #21475#20196#35774#32622
        OnClick = N20Click
      end
      object N21: TMenuItem
        Caption = #37325#26032#30331#24405
        OnClick = N21Click
      end
    end
    object N22: TMenuItem
      Caption = #24110#21161
      object N23: TMenuItem
        Caption = #20851#20110#26412#36719#20214
        OnClick = N23Click
      end
    end
  end
  object tblCtzt: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'CTZT'
    Left = 160
    Top = 120
    object tblCtztD_CTBH: TStringField
      FieldName = 'D_CTBH'
      Required = True
      Size = 5
    end
    object tblCtztD_CTMC: TStringField
      FieldName = 'D_CTMC'
      Required = True
      Size = 10
    end
    object tblCtztD_CTZT: TStringField
      FieldName = 'D_CTZT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tblCtztD_DCBH: TStringField
      FieldName = 'D_DCBH'
      Size = 12
    end
    object tblCtztD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Size = 30
    end
    object tblCtztD_KRSL: TIntegerField
      FieldName = 'D_KRSL'
    end
    object tblCtztD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
    end
    object tblCtztD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
    end
    object tblCtztD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
    end
    object tblCtztD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
    end
  end
  object ImageList1: TImageList
    Left = 128
    Top = 120
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FDE7B
      BD775A6BF75EF75EF75E18635A6BDE7B00000000000000000000000000000000
      0000D65A524AD431133ED65A000000000000F75E00000000000000000000F75E
      F75E0000F75EF75E0000F75EF75EF75E00000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FAD35
      3146AA197026F01DB315EC0CE71C5A6B00000000186318631863186318631863
      D4313A117C1D9F299F293A11F40C524A0000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75ECD18E91C84100000000000000000
      00000000000000000000000000000000000000000000000000000000DE7B5226
      2D09D232133F532AF519950D8804314600000000B952B952B952B952B952B952
      18097D21DF2DFF3158153A2ABF297D21524AF75EF75EF75EF75E0000F75EF75E
      F75EF75EF75EF75EF75E0000F75E0000F75EC818F03D524A0000000081346361
      267A667EC24000040000000000000000000000000000FF7FDE7B7B6F3967EC29
      D415343F76539332F31D7211AC008410000000009F675E639F675E635E633D5B
      7915BF2D1F361D2E7F537F531F369F29524AF75EF75EFF7F7B6FF75EF75EF75E
      F75EF75E0000F75EF75EF75EF75E0000F75E08213146F662CD7EA97EA46DE150
      425DA4690F7B2F7FA338000000000000000000000000DE7B521D2449057E633C
      D863143BD763D23EF01D2D0D32091042000000009F679F679F675E635E635E63
      3D5B9A193F367D3E3742FF4A3F3A160D0000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EAD35734E1867517F727FB37F937B
      D47FEB550000315ED37FA43C0000000000000000FF7F757B42795F377F4FFF63
      523EAC25B563CF46CC21C80C8C317B6F000000009F6B9F679F679F675E635E63
      5E6329250000813CA248603C6C2D00000000F75EF75EF75EFF7F7B6FF75EF75E
      F75EF75EF75EF75EF75E0000000000000000734EB556D65A7362D666D66A4949
      0000000000000000000000000000000000000000DE7BA07D5F377F5F7F57DF6F
      FF773B2A4F3A6A1D481920794E11D65A00000000BF736D259F676D256D256D25
      630C4208A134235523592355613400000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EFF7F7B6FF75EF75EF75EF75E0000000000000000000000000000
      00000000000000000000000000000000000000009C731142BF5B5F57DF6BFF7B
      DC4E953A27052F0DB000D65A407E6E2100000000DF73BF739F6B9F679F6B9F67
      630C84108461A465A4698465024D00000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000000000000000000000000000
      000000000000000000000000000000000000FF7FAC7E9F02FF7FDF73FF7FFF7F
      5D32E714133F742E960DC618001A6E4D00000000BF736D25BF6F6D256D256D25
      A514C6188459257A467E257A636100000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EFF7F7B6FF75EF75EF75E0000000000000000000000000000
      000000000000000000000000000000000000BD77807EB777FF7BDF73FF7F7D6F
      BD3A4A259653314FAE196B2D802AF75A00000000DF77BF73BF73BF6F9F679F67
      630C0821A514024DA46D467A625100000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000000000000000000000000000
      000000000000000000000000000000000000D77A206AFF7F9F63FF7FFF7F7C36
      5E4FDF6B8D31C6184A298A7EEC619C7300000000DF776D25DF736D256D256D25
      6D254A298C31524ACE39A514E71C00000000F75EF75EEF3D0000F75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000000000000000000000000000
      000000000000000000000000000000000000AA7EC802FF7FFF7BFF7FBC7BDF26
      BF63FF7FFF7FFF7FFF7F407EB552DE7B00000000FF7BDF77DF77DF77BF73BF73
      BF6F9F6F8C31524AAD35A514000000000000F75EF75EF75E0000F75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000000000000000000000000000
      0000000000000000000000000000000000004076FF57FF7F8E7ED376BD77147B
      F47AFF7FFF7FFF7F317F2C567B6FFF7F00000000FF7BDF7BDF77DF77DF73DF6F
      BF6FBF6FBF6F5F5F32420000000000000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000000000000000000000000000
      000000000000000000000000000000000000667E8E7ABD77FF7F000000000000
      FF7F6A7EFF7FFF7FA07E954EDE7B000000000000FF7FFF7BDF7BDF7BDF77BF77
      BF73DC4A5C1E1A1AD7560000000000000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EEF3D0000F75EF75EF75EF75E0000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7F00000000000000000000
      00000000DE7BC67E0D569C73FF7F000000000000FF7FFF7FFF7FDF7FDF7BDF7B
      DF731D57DF2A954E00000000000000000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FDF7B
      9C735D5B133E000000000000000000000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFF801FF077FDF1EFFF8018001BFEF
      101FF8018000FFFF000FC001800097AD0007C00180017FE7004780018003BFF7
      01FF80018003FFFFFFFF80018003FFFFFFFF000180039FE7FFFF00018003DFFF
      FFFF00018003FFFFFFFF00018007FFFFFFFF0001800F3CE7FFFF0E03800FFFFF
      FFFF3F83801F0000FFFFFFC7803F000000000000000000000000000000000000
      000000000000}
  end
  object tblCtdc: TTable
    DatabaseName = 'LfHotelUser'
    Filter = 'D_XMBH='#39'0'#39' and D_DCLB='#39'C'#39
    Filtered = True
    TableName = 'CTDC'
    Left = 200
    Top = 120
    object tblCtdcD_CTMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_CTMC'
      LookupDataSet = CtData.tblCtdm
      LookupKeyFields = 'D_CTBH'
      LookupResultField = 'D_CTMC'
      KeyFields = 'D_CTBH'
      Lookup = True
    end
    object tblCtdcD_DCBH: TStringField
      FieldName = 'D_DCBH'
      Required = True
      Size = 12
    end
    object tblCtdcD_CTBH: TStringField
      FieldName = 'D_CTBH'
      Required = True
      Size = 5
    end
    object tblCtdcD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Required = True
      Size = 5
    end
    object tblCtdcD_DCLB: TStringField
      FieldName = 'D_DCLB'
      FixedChar = True
      Size = 1
    end
    object tblCtdcD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
    end
    object tblCtdcD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
    end
    object tblCtdcD_SJDM: TStringField
      FieldName = 'D_SJDM'
      FixedChar = True
      Size = 4
    end
    object tblCtdcD_KRSL: TIntegerField
      FieldName = 'D_KRSL'
    end
    object tblCtdcD_YCBZ: TStringField
      FieldName = 'D_YCBZ'
      Size = 30
    end
    object tblCtdcD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Size = 30
    end
    object tblCtdcD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object tblCtdcD_JZFS: TStringField
      FieldName = 'D_JZFS'
      Size = 10
    end
    object tblCtdcD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Size = 5
    end
    object tblCtdcD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Size = 5
    end
    object tblCtdcD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      currency = True
    end
    object tblCtdcD_YHJE: TFloatField
      FieldName = 'D_YHJE'
      currency = True
    end
    object tblCtdcD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Size = 8
    end
    object tblCtdcD_YDBH: TStringField
      FieldName = 'D_YDBH'
      Size = 12
    end
    object tblCtdcD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
  end
  object dsCtdc: TDataSource
    DataSet = tblCtdc
    Left = 232
    Top = 120
  end
  object qryYdcy: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select * from YDCY where (D_SYRQ=:RQ)and(D_CTBH<>"0")and(D_RZBZ=' +
        '"T")and(D_KTBZ="F")')
    Left = 160
    Top = 168
    ParamData = <
      item
        DataType = ftDate
        Name = 'RQ'
        ParamType = ptInput
      end>
  end
end
