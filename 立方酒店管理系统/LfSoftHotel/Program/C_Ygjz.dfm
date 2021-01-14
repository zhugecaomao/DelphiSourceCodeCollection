inherited YgjzForm: TYgjzForm
  Left = 196
  Top = 58
  Width = 600
  Height = 450
  Caption = #26597#35810
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 592
    inherited lblTitle: TLabel
      Left = 240
      Width = 156
      Caption = #21592#24037#32467#24080#34920
    end
    inherited Image1: TImage
      Left = 196
    end
  end
  inherited Panel2: TPanel
    Width = 592
    Height = 346
    object Panel4: TPanel
      Left = 5
      Top = 5
      Width = 582
      Height = 52
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 0
        Top = 5
        Width = 48
        Height = 12
        Caption = #21592#24037#22995#21517
      end
      object Label2: TLabel
        Left = 0
        Top = 32
        Width = 128
        Height = 16
        Caption = #25353#28040#36153#39033#30446#21512#35745#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'System'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 296
        Top = 32
        Width = 128
        Height = 16
        Caption = #25353#32467#24080#26041#24335#21512#35745#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'System'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblXfxm: TLabel
        Left = 224
        Top = 32
        Width = 24
        Height = 16
        Caption = '0'#20803
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'System'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblJzfs: TLabel
        Left = 520
        Top = 32
        Width = 24
        Height = 16
        Caption = '0'#20803
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'System'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cmbYgxm: TComboBox
        Left = 48
        Top = 0
        Width = 129
        Height = 20
        ItemHeight = 12
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 5
      Top = 57
      Width = 582
      Height = 284
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 289
        Top = 0
        Width = 8
        Height = 284
        Cursor = crHSplit
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 289
        Height = 284
        Align = alLeft
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
            FieldName = 'D_XMMC'
            Title.Alignment = taCenter
            Title.Caption = #39033#30446#21517#31216
            Width = 80
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
      object DBGrid2: TDBGrid
        Left = 297
        Top = 0
        Width = 285
        Height = 284
        Align = alClient
        Color = clMoneyGreen
        DataSource = dsJzfs
        FixedColor = clSkyBlue
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'System'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
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
    object btnQuery: TBitBtn
      Left = 184
      Top = 2
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
  inherited Panel3: TPanel
    Top = 388
    Width = 592
    inherited btnHelp: TBitBtn
      Left = 432
    end
    inherited btnClose: TBitBtn
      Left = 512
    end
    object btnPrint: TBitBtn
      Left = 352
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360
      TabOrder = 2
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
  object qryXfxm: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select D_XMBH,sum(D_XFJE),sum(D_YHJE) from KRJZ where (D_CZYXM=:' +
        'CZYXM)and(D_HH<>0) group by D_XMBH')
    Left = 8
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CZYXM'
        ParamType = ptInput
      end>
    object qryXfxmD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.KRJZ.D_XMBH'
      Size = 5
    end
    object qryXfxmSUM: TFloatField
      FieldName = 'SUM'
      Origin = 'LFHOTELUSER.KRJZ.D_XFJE'
      DisplayFormat = '#.##'
    end
    object qryXfxmSUM_1: TFloatField
      FieldName = 'SUM_1'
      Origin = 'LFHOTELUSER.KRJZ.D_YHJE'
      DisplayFormat = '#.##'
    end
    object qryXfxmD_XMMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XMMC'
      LookupDataSet = HotelData.tblXMDM
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
  end
  object dsXfxm: TDataSource
    DataSet = qryXfxm
    Left = 40
    Top = 8
  end
  object qryJzfs: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select D_JZFS,sum(D_XFJE),sum(D_YHJE) from KRJZ where (D_CZYXM=:' +
        'CZYXM)and(D_HH<>0) group by D_JZFS')
    Left = 368
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CZYXM'
        ParamType = ptInput
      end>
    object qryJzfsD_JZFS: TStringField
      FieldName = 'D_JZFS'
      Origin = 'LFHOTELUSER.KRJZ.D_JZFS'
      Size = 10
    end
    object qryJzfsSUM: TFloatField
      FieldName = 'SUM'
      Origin = 'LFHOTELUSER.KRJZ.D_XFJE'
      currency = True
    end
    object qryJzfsSUM_1: TFloatField
      FieldName = 'SUM_1'
      Origin = 'LFHOTELUSER.KRJZ.D_YHJE'
      currency = True
    end
  end
  object dsJzfs: TDataSource
    DataSet = qryJzfs
    Left = 400
    Top = 8
  end
end
