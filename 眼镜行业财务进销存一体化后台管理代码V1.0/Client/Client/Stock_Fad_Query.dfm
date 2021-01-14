object frmStock_Fad_Query: TfrmStock_Fad_Query
  Left = 50
  Top = 72
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmStock_Fad_Query'
  ClientHeight = 463
  ClientWidth = 712
  Color = clSkyBlue
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
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
    Width = 164
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = #37319#36141#36864#36135#21333#27983#35272
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
    Top = 422
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
    object Label12: TLabel
      Left = 374
      Top = 45
      Width = 68
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #21046' '#21333' '#20154#65306
      Layout = tlCenter
    end
    object Label7: TLabel
      Left = 7
      Top = 47
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
      Left = 192
      Top = 15
      Width = 74
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
      Left = 7
      Top = 15
      Width = 77
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #36864#36135#20179#24211#65306
      Layout = tlCenter
    end
    object jsr: TComboBox
      Left = 256
      Top = 41
      Width = 111
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object zdr: TComboBox
      Left = 444
      Top = 41
      Width = 110
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
    object djbh: TComboBox
      Left = 74
      Top = 41
      Width = 111
      Height = 21
      ItemHeight = 13
      TabOrder = 2
    end
    object rq1: TMaskEdit
      Left = 256
      Top = 11
      Width = 80
      Height = 21
      EditMask = '!9999/99/00;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '    -  -  '
    end
    object rq2: TMaskEdit
      Left = 364
      Top = 11
      Width = 80
      Height = 21
      EditMask = '!9999/99/00;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '    -  -  '
    end
    object thck: TComboBox
      Left = 74
      Top = 11
      Width = 111
      Height = 21
      ItemHeight = 13
      TabOrder = 5
    end
  end
  object DB: TDBGrid
    Left = -1
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
    OnDblClick = DBDblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Stock_No'
        Title.Alignment = taCenter
        Title.Caption = #21333#25454#32534#21495
        Width = 173
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Stock_Name'
        Title.Alignment = taCenter
        Title.Caption = #21333#25454#21517#31216
        Width = 164
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Copy_Date'
        Title.Alignment = taCenter
        Title.Caption = #24405#21333#26085#26399
        Width = 114
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Contract_NO'
        Title.Alignment = taCenter
        Title.Caption = #21512#21516#32534#21495
        Width = 121
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'WLDW'
        Title.Alignment = taCenter
        Title.Caption = #25910#36135#21333#20301
        Width = 289
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Storage_NO'
        Title.Alignment = taCenter
        Title.Caption = #36864#36135#20179#24211
        Width = 158
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Shop_NO'
        Title.Alignment = taCenter
        Title.Caption = #24215#38754#32534#21495
        Width = 115
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Transactor'
        Title.Alignment = taCenter
        Title.Caption = #32463#25163#20154
        Width = 88
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Proposer'
        Title.Alignment = taCenter
        Title.Caption = #21046#21333#20154
        Width = 84
        Visible = True
      end>
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 112
    Width = 697
    Height = 305
    DataSource = dsdetail
    FixedColor = clSkyBlue
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 3
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
        FieldName = 'Stock_NO'
        Title.Caption = #21333#25454#32534#21495
        Width = 151
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Goods_NO'
        Title.Alignment = taCenter
        Title.Caption = #21830#21697#32534#21495
        Width = 182
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Total_Money'
        Title.Alignment = taCenter
        Title.Caption = #36864#36135#37329#39069
        Width = 146
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'amount'
        Title.Caption = #36864#36135#25968#37327
        Width = 141
        Visible = True
      end>
  end
  object dscheck: TDataSource
    DataSet = dmmain.CDSquery
    Left = 552
    Top = 72
  end
  object dsdetail: TDataSource
    DataSet = dmmain.CDSquery2
    Left = 592
    Top = 72
  end
end
