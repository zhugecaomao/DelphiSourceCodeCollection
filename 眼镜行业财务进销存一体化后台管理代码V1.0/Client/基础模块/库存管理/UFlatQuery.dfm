inherited fmFlatQuery: TfmFlatQuery
  Left = 57
  Top = 90
  Caption = #22871#39184#23450#20041#27983#35272
  ClientHeight = 440
  ClientWidth = 703
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 10
    Top = 40
    Width = 691
    Height = 73
    AutoSize = False
    Caption = 'Label2'
    Color = clBtnShadow
    ParentColor = False
  end
  object Label1: TLabel
    Left = 7
    Top = 6
    Width = 164
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = #22871#39184#23450#20041#27983#35272
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -19
    Font.Name = #24188#22278
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Layout = tlCenter
  end
  object Bevel1: TBevel
    Left = 2
    Top = 2
    Width = 707
    Height = 33
  end
  object Panel3: TPanel
    Left = 2
    Top = 37
    Width = 695
    Height = 73
    BevelInner = bvRaised
    BevelOuter = bvNone
    Color = clSkyBlue
    TabOrder = 0
    object js: TLabel
      Left = 191
      Top = 45
      Width = 70
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = #32463' '#25163' '#20154#65306
      Layout = tlCenter
    end
    object Label7: TLabel
      Left = 7
      Top = 15
      Width = 77
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #21333#25454#32534#21495#65306
      Layout = tlCenter
    end
    object SpeedButton10: TSpeedButton
      Left = 611
      Top = 39
      Width = 76
      Height = 23
      Caption = #26597'  '#35810
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = SpeedButton10Click
    end
    object Label3: TLabel
      Left = 190
      Top = 15
      Width = 75
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #24405#21333#26085#26399#65306
      Layout = tlCenter
    end
    object Label4: TLabel
      Left = 336
      Top = 15
      Width = 27
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #33267
      Layout = tlCenter
    end
    object Label5: TLabel
      Left = 9
      Top = 45
      Width = 77
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #21046' '#21333' '#20154#65306
      Layout = tlCenter
    end
    object BtnSelPayComponey: TSpeedButton
      Left = 643
      Top = 12
      Width = 21
      Height = 20
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333333333333333333333333333333333FF333333333333
        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
        000033333373FF77777733333330003333333333333777333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = BtnSelPayComponeyClick
    end
    object jsr: TComboBox
      Left = 256
      Top = 41
      Width = 111
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object rq1: TMaskEdit
      Left = 256
      Top = 11
      Width = 80
      Height = 21
      EditMask = '!9999/99/00;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '    -  -  '
    end
    object rq2: TMaskEdit
      Left = 364
      Top = 11
      Width = 80
      Height = 21
      EditMask = '!9999/99/00;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '    -  -  '
    end
    object edtshr: TComboBox
      Left = 74
      Top = 41
      Width = 111
      Height = 21
      ItemHeight = 13
      TabOrder = 3
    end
    object edtpart: TLabeledEdit
      Left = 517
      Top = 11
      Width = 121
      Height = 21
      EditLabel.Width = 65
      EditLabel.Height = 13
      EditLabel.Caption = #21046#21333#37096#38376#65306
      LabelPosition = lpLeft
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 4
    end
    object edtcode: TEdit
      Left = 72
      Top = 10
      Width = 112
      Height = 21
      TabOrder = 5
    end
    object edtprice: TLabeledEditint
      Left = 440
      Top = 40
      Width = 121
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #22871#39184#21333#20215
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 399
    Width = 703
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Color = 16573127
    TabOrder = 1
    object BtnClose: TBitBtn
      Left = 629
      Top = 8
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = BtnCloseClick
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
  object DBGrid1: TDBGrid
    Left = 3
    Top = 112
    Width = 697
    Height = 288
    DataSource = dsdetail
    FixedColor = clSkyBlue
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'stock_no'
        Title.Alignment = taCenter
        Title.Caption = #21333#25454#32534#21495
        Width = 202
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'goods_no'
        Title.Alignment = taCenter
        Title.Caption = #21830#21697#32534#21495
        Width = 158
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'goods_name'
        Title.Alignment = taCenter
        Title.Caption = #21830#21697#21517#31216
        Width = 210
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'amount'
        Title.Alignment = taCenter
        Title.Caption = #21830#21697#25968#37327
        Width = 105
        Visible = True
      end>
  end
  object DB: TDBGrid
    Left = 3
    Top = 114
    Width = 697
    Height = 288
    Color = clCream
    DataSource = dscheck
    FixedColor = clSkyBlue
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBDblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'stock_no'
        Title.Alignment = taCenter
        Title.Caption = #21333#25454#32534#21495
        Width = 248
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'copy_date'
        Title.Alignment = taCenter
        Title.Caption = #24405#21333#26085#26399
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'goods_no'
        Title.Alignment = taCenter
        Title.Caption = #22871#39184#21830#21697#32534#21495
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'goods_name'
        Title.Alignment = taCenter
        Title.Caption = #22871#39184#21830#21697#21517#31216
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'price'
        Title.Alignment = taCenter
        Title.Caption = #22871#39184#21333#20215
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Title.Alignment = taCenter
        Title.Caption = #20837#24211#25968#37327
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'totalmoney'
        Title.Alignment = taCenter
        Title.Caption = #24635#37329#39069
        Width = 70
        Visible = True
      end>
  end
  object dsdetail: TDataSource
    DataSet = dmmain.CDSquery2
    Left = 584
    Top = 72
  end
  object dscheck: TDataSource
    DataSet = dmmain.CDSquery
    Left = 552
    Top = 72
  end
end
