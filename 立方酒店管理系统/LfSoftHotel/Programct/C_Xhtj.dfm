object XhtjForm: TXhtjForm
  Left = 192
  Top = 49
  Width = 544
  Height = 500
  Caption = #26597#35810#32479#35745
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 64
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 0
    object lblTitle: TLabel
      Left = 216
      Top = 5
      Width = 93
      Height = 21
      Caption = #28040#32791#32479#35745
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 45
      Width = 72
      Height = 12
      Caption = #26597#35810#36215#22987#26085#26399
    end
    object Label2: TLabel
      Left = 208
      Top = 45
      Width = 72
      Height = 12
      Caption = #26597#35810#32467#26463#26085#26399
    end
    object dtpBd: TDateTimePicker
      Left = 88
      Top = 37
      Width = 113
      Height = 20
      CalAlignment = dtaLeft
      Date = 37439.5352278935
      Time = 37439.5352278935
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object dtpEd: TDateTimePicker
      Left = 288
      Top = 37
      Width = 113
      Height = 20
      CalAlignment = dtaLeft
      Date = 37439.5352278935
      Time = 37439.5352278935
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object btnQuery: TBitBtn
      Left = 408
      Top = 34
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 2
      OnClick = btnQueryClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888800000888880000080F000888880F00080F000888880F
        0008000000080000000800F000000F00000800F000800F00000800F000800F00
        00088000000000000088880F00080F0008888800000800000888888000888000
        88888880F08880F0888888800088800088888888888888888888}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 64
    Width = 536
    Height = 374
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 526
      Height = 364
      Align = alClient
      Color = clMoneyGreen
      DataSource = dsXhtj
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
          Expanded = False
          FieldName = 'D_CDBH'
          Title.Caption = #33756#21333#32534#21495
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_CDMC'
          Title.Alignment = taCenter
          Title.Caption = #33756#21517
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUM'
          Title.Alignment = taCenter
          Title.Caption = #28040#32791#25968#37327
          Width = 200
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 438
    Width = 536
    Height = 35
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      536
      35)
    object btnClose: TBitBtn
      Left = 456
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
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
      NumGlyphs = 2
    end
    object btnPrint: TBitBtn
      Left = 377
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360'(&P)'
      TabOrder = 1
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
  object qryXhtj: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select D_CDBH,D_CDMC,sum(D_XFSL-D_THSL) from DCMXDA where (D_DEL' +
        '="F")and(D_XFRQ>=:BD)and(D_XFRQ<=:ED) group by D_CDBH,D_CDMC ord' +
        'er by D_CDBH')
    Left = 96
    Top = 128
    ParamData = <
      item
        DataType = ftDate
        Name = 'BD'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'ED'
        ParamType = ptInput
      end>
    object qryXhtjD_CDBH: TStringField
      FieldName = 'D_CDBH'
      Size = 5
    end
    object qryXhtjD_CDMC: TStringField
      FieldName = 'D_CDMC'
    end
    object qryXhtjSUM: TFloatField
      FieldName = 'SUM'
      DisplayFormat = '#.##'
    end
  end
  object dsXhtj: TDataSource
    DataSet = qryXhtj
    Left = 136
    Top = 128
  end
end
