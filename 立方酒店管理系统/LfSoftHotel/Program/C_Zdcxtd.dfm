inherited ZdcxTdForm: TZdcxTdForm
  Left = 96
  Top = 14
  Width = 700
  Height = 550
  Caption = #26597#35810
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 692
    Height = 146
    object Bevel1: TBevel [0]
      Left = 8
      Top = 85
      Width = 681
      Height = 56
      Shape = bsFrame
    end
    inherited lblTitle: TLabel
      Left = 290
      Caption = #22242#24080#26597#35810
    end
    inherited Image1: TImage
      Left = 231
    end
    object Label1: TLabel
      Left = 16
      Top = 65
      Width = 48
      Height = 12
      Caption = #22242#38431#21517#31216
    end
    object lblYfje: TLabel
      Left = 448
      Top = 92
      Width = 111
      Height = 21
      Caption = #25276#37329#37329#39069#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblXfje: TLabel
      Left = 16
      Top = 92
      Width = 111
      Height = 21
      Caption = #28040#36153#37329#39069#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblYjje: TLabel
      Left = 264
      Top = 92
      Width = 111
      Height = 21
      Caption = #24050#32467#37329#39069#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblWjje: TLabel
      Left = 16
      Top = 117
      Width = 111
      Height = 21
      Caption = #26410#32467#37329#39069#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblYjye: TLabel
      Left = 448
      Top = 117
      Width = 111
      Height = 21
      Caption = #25276#37329#20313#39069#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 72
      Top = 60
      Width = 281
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 0
    end
    object btnQuery: TBitBtn
      Left = 368
      Top = 57
      Width = 100
      Height = 25
      Caption = #22242#24080#26597#35810'(&Q)'
      TabOrder = 1
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
  inherited Panel2: TPanel
    Top = 146
    Width = 692
    Height = 342
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 682
      Height = 120
      Align = alTop
      Color = clMoneyGreen
      DataSource = dsKryj
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
          FieldName = 'D_YFRQ'
          Title.Alignment = taCenter
          Title.Caption = #39044#20184#26085#26399
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_FKFS'
          Title.Alignment = taCenter
          Title.Caption = #25276#37329#26041#24335
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_YFJE'
          Title.Alignment = taCenter
          Title.Caption = #25276#37329#37329#39069
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_BZ'
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Width = 180
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 385
      Top = 125
      Width = 302
      Height = 212
      Align = alClient
      Color = clMoneyGreen
      DataSource = dsKrzdcx1
      FixedColor = clSkyBlue
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'D_XMMC'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#39033#30446
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUM'
          Title.Alignment = taCenter
          Title.Caption = #24050#32467#37329#39069
          Visible = True
        end>
    end
    object DBGrid3: TDBGrid
      Left = 5
      Top = 125
      Width = 380
      Height = 212
      Align = alLeft
      Color = clMoneyGreen
      DataSource = dsKrzd
      FixedColor = clSkyBlue
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 2
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
          Title.Caption = #28040#36153#39033#30446
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
  inherited Panel3: TPanel
    Top = 488
    Width = 692
    inherited btnHelp: TBitBtn
      Left = 532
    end
    inherited btnClose: TBitBtn
      Left = 612
    end
    object btnYjbj: TBitBtn
      Left = 89
      Top = 5
      Width = 75
      Height = 25
      Caption = #34917#20132#25276#37329'(&B)'
      TabOrder = 2
      OnClick = btnYjbjClick
    end
    object btnYfqk: TBitBtn
      Left = 8
      Top = 5
      Width = 75
      Height = 25
      Caption = #29992#25151#24773#20917
      TabOrder = 3
      OnClick = btnYfqkClick
    end
    object btnFjmx: TBitBtn
      Left = 168
      Top = 5
      Width = 75
      Height = 25
      Caption = #25151#37329#26126#32454'(&F)'
      TabOrder = 4
      OnClick = btnFjmxClick
    end
    object btnZdmx: TBitBtn
      Left = 248
      Top = 5
      Width = 75
      Height = 25
      Caption = #26434#21333#26126#32454'(&Z)'
      TabOrder = 5
      OnClick = btnZdmxClick
    end
    object btnPrint: TBitBtn
      Left = 328
      Top = 5
      Width = 75
      Height = 25
      Caption = #25171#21360'(&P)'
      TabOrder = 6
      OnClick = btnPrintClick
    end
  end
  object qryKrzdcx: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select D_XMBH,sum(D_XFJE),sum(D_YHJE) from KRZDCX where (D_ZDBH=' +
        ':ZDBH)and(D_HH<>0)and(D_JZBZ<>"3") group by D_XMBH')
    Left = 392
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'ZDBH'
        ParamType = ptInput
      end>
    object qryKrzdcxD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.KRZD.D_XMBH'
      Size = 5
    end
    object qryKrzdcxSUM: TFloatField
      FieldName = 'SUM'
      Origin = 'LFHOTELUSER.KRZD.D_XFJE'
      DisplayFormat = '#.##'
    end
    object qryKrzdcxSUM_1: TFloatField
      FieldName = 'SUM_1'
      Origin = 'LFHOTELUSER.KRZD.D_YHJE'
      DisplayFormat = '#.##'
    end
    object qryKrzdcxD_XMMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XMMC'
      LookupDataSet = HotelData.tblXMDM
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
  end
  object qryKryj: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KRYJ where D_YJBH=:YJBH')
    Left = 352
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'YJBH'
        ParamType = ptInput
      end>
    object qryKryjD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Origin = 'LFHOTELUSER.KRYJ.D_YJBH'
      Size = 12
    end
    object qryKryjD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER.KRYJ.D_HH'
    end
    object qryKryjD_FKFS: TStringField
      FieldName = 'D_FKFS'
      Origin = 'LFHOTELUSER.KRYJ.D_FKFS'
      Size = 10
    end
    object qryKryjD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Origin = 'LFHOTELUSER.KRYJ.D_XYKBH'
      Size = 5
    end
    object qryKryjD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Origin = 'LFHOTELUSER.KRYJ.D_KHBH'
      Size = 5
    end
    object qryKryjD_YFJE: TFloatField
      FieldName = 'D_YFJE'
      Origin = 'LFHOTELUSER.KRYJ.D_YFJE'
      DisplayFormat = '#.##'
    end
    object qryKryjD_YFRQ: TDateTimeField
      FieldName = 'D_YFRQ'
      Origin = 'LFHOTELUSER.KRYJ.D_YFRQ'
    end
    object qryKryjD_YFSJ: TDateTimeField
      FieldName = 'D_YFSJ'
      Origin = 'LFHOTELUSER.KRYJ.D_YFSJ'
    end
    object qryKryjD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.KRYJ.D_BZ'
      Size = 30
    end
  end
  object dsKryj: TDataSource
    DataSet = qryKryj
    Left = 320
    Top = 8
  end
  object qryKfzt: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KFZT where (D_KRBH=:KRBH)and(D_KFZT="T")')
    Left = 464
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'KRBH'
        ParamType = ptInput
      end>
  end
  object dsKrzd: TDataSource
    DataSet = qryKrzdcx
    Left = 424
    Top = 8
  end
  object qryKrzdcx1: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select D_XMBH,sum(D_XFJE) from KRZDCX where (D_ZDBH=:ZDBH)and(D_' +
        'HH<>0)and(D_JZBZ="3") group by D_XMBH')
    Left = 496
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'ZDBH'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.KRZD.D_XMBH'
      Size = 5
    end
    object qryKrzdcx1SUM: TFloatField
      FieldName = 'SUM'
      Origin = 'LFHOTELUSER.KRZDCX.D_XFJE'
      DisplayFormat = '#.##'
    end
    object StringField2: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XMMC'
      LookupDataSet = HotelData.tblXMDM
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
  end
  object dsKrzdcx1: TDataSource
    DataSet = qryKrzdcx1
    Left = 528
    Top = 8
  end
end
