object YytjForm: TYytjForm
  Left = 166
  Top = 82
  Width = 500
  Height = 450
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
    Width = 492
    Height = 122
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object lblTitle: TLabel
      Left = 184
      Top = 6
      Width = 93
      Height = 21
      Caption = #33829#19994#32479#35745
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 74
      Width = 66
      Height = 12
      Caption = #32479#35745#26085#26399' '#20174
    end
    object Label2: TLabel
      Left = 208
      Top = 74
      Width = 12
      Height = 12
      Caption = #21040
    end
    object lblSh: TLabel
      Left = 336
      Top = 104
      Width = 60
      Height = 12
      Caption = #25910#22238#21512#35745#65306
    end
    object lblYh: TLabel
      Left = 172
      Top = 104
      Width = 60
      Height = 12
      Caption = #20248#24800#21512#35745#65306
    end
    object lblYy: TLabel
      Left = 8
      Top = 104
      Width = 60
      Height = 12
      Caption = #33829#19994#21512#35745#65306
    end
    object dtpBd: TDateTimePicker
      Left = 80
      Top = 69
      Width = 120
      Height = 20
      CalAlignment = dtaLeft
      Date = 37460.575568287
      Time = 37460.575568287
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object dtpEd: TDateTimePicker
      Left = 224
      Top = 69
      Width = 120
      Height = 20
      CalAlignment = dtaLeft
      Date = 37460.575659838
      Time = 37460.575659838
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object btnQuery: TBitBtn
      Left = 352
      Top = 67
      Width = 75
      Height = 25
      Caption = #32479#35745'(&T)'
      TabOrder = 2
      OnClick = btnQueryClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337333733373
        3373337F3F7F3F7F3F7F33737373737373733F7F7F7F7F7F7F7F770000000000
        000077777777777777773303333333333333337FF333333F33333709333333C3
        333337773F3FF373F333330393993C3C33333F7F7F77F7F7FFFF77079797977C
        77777777777777777777330339339333C333337FF73373F37F33370C333C3933
        933337773F3737F37FF33303C3C33939C9333F7F7F7FF7F777FF7707C7C77797
        7C97777777777777777733033C3333333C33337F37F33333373F37033C333333
        33C3377F37333333337333033333333333333F7FFFFFFFFFFFFF770777777777
        7777777777777777777733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 32
      Width = 473
      Height = 33
      Caption = ' '#32479' '#35745' '#20998' '#31867' '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #28040#36153#39033#30446
        #32467#24080#26041#24335
        #32467#24080#21592#24037)
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 122
    Width = 492
    Height = 264
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 1
    object dbgWork: TDBGrid
      Left = 6
      Top = 6
      Width = 480
      Height = 252
      Align = alClient
      Color = clMoneyGreen
      DataSource = dsXfxm
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
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 386
    Width = 492
    Height = 37
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 2
    DesignSize = (
      492
      37)
    object btnPrint: TBitBtn
      Left = 332
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360'(&P)'
      TabOrder = 0
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
    object btnClose: TBitBtn
      Left = 413
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 1
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
  end
  object qryXfxm: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select a.D_XMBH as XMBH,b.D_XMMC as XMMC,sum(a.D_XFJE) as XFJE,s' +
        'um(a.D_YHJE) as YHJE,sum(a.D_XFJE-a.D_YHJE) as SHJE'
      ' from CTDC a,CTXM b'
      ' where (a.D_XMBH=b.D_XMBH)and(a.D_CTBH = "0") '
      ' group by a.D_XMBH,b.D_XMMC')
    Left = 24
    Top = 160
    object qryXfxmXMBH: TStringField
      FieldName = 'XMBH'
      Size = 5
    end
    object qryXfxmXMMC: TStringField
      FieldName = 'XMMC'
      Size = 10
    end
    object qryXfxmXFJE: TFloatField
      FieldName = 'XFJE'
      DisplayFormat = '#.##'
    end
    object qryXfxmYHJE: TFloatField
      FieldName = 'YHJE'
      DisplayFormat = '#.##'
    end
    object qryXfxmSHJE: TFloatField
      FieldName = 'SHJE'
      DisplayFormat = '#.##'
    end
  end
  object dsXfxm: TDataSource
    DataSet = qryXfxm
    Left = 56
    Top = 160
  end
  object qryJzfs: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select a.D_JZFS as JZFS,count(*) as JZBS,sum(a.D_XFJE) as XFJE,s' +
        'um(a.D_YHJE) as YHJE,sum(a.D_XFJE-a.D_YHJE) as SHJE '
      '  from CTDC a'
      '  where (a.D_CTBH = "0") group by a.D_JZFS')
    Left = 104
    Top = 160
    object qryJzfsJZFS: TStringField
      FieldName = 'JZFS'
      Size = 10
    end
    object qryJzfsXFJE: TFloatField
      FieldName = 'XFJE'
      DisplayFormat = '#.##'
    end
    object qryJzfsYHJE: TFloatField
      FieldName = 'YHJE'
      DisplayFormat = '#.##'
    end
    object qryJzfsSHJE: TFloatField
      FieldName = 'SHJE'
      DisplayFormat = '#.##'
    end
    object qryJzfsJZBS: TIntegerField
      FieldName = 'JZBS'
    end
  end
  object qryJzyg: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select a.D_CZYXM as CZYXM,a.D_JZFS as JZFS,sum(a.D_XFJE) as XFJE' +
        ',sum(a.D_YHJE) as YHJE,sum(a.D_XFJE-a.D_YHJE) as SHJE'
      ' from CTDC a'
      ' where (a.D_CTBH = "0") group by a.D_CZYXM,a.D_JZFS')
    Left = 176
    Top = 160
    object qryJzygCZYXM: TStringField
      FieldName = 'CZYXM'
      Size = 8
    end
    object qryJzygJZFS: TStringField
      FieldName = 'JZFS'
      Size = 10
    end
    object qryJzygXFJE: TFloatField
      FieldName = 'XFJE'
      DisplayFormat = '#.##'
    end
    object qryJzygYHJE: TFloatField
      FieldName = 'YHJE'
      DisplayFormat = '#.##'
    end
    object qryJzygSHJE: TFloatField
      FieldName = 'SHJE'
      DisplayFormat = '#.##'
    end
  end
  object dsJzfs: TDataSource
    DataSet = qryJzfs
    Left = 136
    Top = 160
  end
  object dsJzyg: TDataSource
    DataSet = qryJzyg
    Left = 208
    Top = 160
  end
end
