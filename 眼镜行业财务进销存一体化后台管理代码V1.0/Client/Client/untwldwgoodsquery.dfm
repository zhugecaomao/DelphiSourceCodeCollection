inherited fmwldwgoodsquery: Tfmwldwgoodsquery
  Left = 14
  Top = 38
  Caption = #20379#24212#21830#21830#21697#20837#24211#32479#35745
  ClientHeight = 455
  ClientWidth = 712
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 1
    Top = 2
    Width = 707
    Height = 33
  end
  object Label1: TLabel
    Left = 7
    Top = 6
    Width = 201
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = #20379#24212#21830#21830#21697#20837#24211#32479#35745
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -19
    Font.Name = #24188#22278
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 15
    Top = 40
    Width = 691
    Height = 73
    AutoSize = False
    Caption = 'Label2'
    Color = clBtnShadow
    ParentColor = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 414
    Width = 712
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Color = 16573127
    TabOrder = 0
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
  object Panel3: TPanel
    Left = 7
    Top = 37
    Width = 695
    Height = 73
    BevelInner = bvRaised
    BevelOuter = bvNone
    Color = clSkyBlue
    TabOrder = 1
    object SpeedButton10: TSpeedButton
      Left = 595
      Top = 43
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
    object Label5: TLabel
      Left = 30
      Top = 15
      Width = 78
      Height = 13
      Caption = #20379#24212#21830#21517#31216#65306
      Layout = tlCenter
    end
    object Label6: TLabel
      Left = 30
      Top = 46
      Width = 78
      Height = 13
      Caption = #20379#24212#21830#32534#21495#65306
      Layout = tlCenter
    end
    object mc: TComboBox
      Left = 109
      Top = 12
      Width = 465
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = mcChange
    end
    object bh: TComboBox
      Left = 109
      Top = 42
      Width = 228
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnChange = bhChange
    end
  end
  object DB: TDBGrid
    Left = 7
    Top = 112
    Width = 697
    Height = 303
    Color = clCream
    DataSource = dscheck
    FixedColor = clSkyBlue
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'goods_no'
        Title.Alignment = taCenter
        Title.Caption = #21830#21697#32534#21495
        Width = 178
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'goods_name'
        Title.Alignment = taCenter
        Title.Caption = #21830#21697#21517#31216
        Width = 225
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'money'
        Title.Alignment = taCenter
        Title.Caption = #37329#39069
        Width = 101
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'baseprice'
        Title.Alignment = taCenter
        Title.Caption = #21333#20215
        Width = 83
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'amount'
        Title.Alignment = taCenter
        Title.Caption = #25968#37327
        Width = 88
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'barcode'
        Title.Alignment = taCenter
        Title.Caption = #26465#24418#30721
        Width = 170
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'type'
        Title.Alignment = taCenter
        Title.Caption = #31867#22411
        Width = 143
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'brand'
        Title.Alignment = taCenter
        Title.Caption = #21697#29260
        Width = 133
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'breed'
        Title.Alignment = taCenter
        Title.Caption = #21697#31181
        Width = 164
        Visible = True
      end>
  end
  object dscheck: TDataSource
    DataSet = dmmain.CDSquery
    Left = 480
    Top = 16
  end
end
