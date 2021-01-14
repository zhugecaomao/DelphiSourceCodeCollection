inherited YgkfForm: TYgkfForm
  Left = 106
  Top = 48
  Width = 650
  Height = 500
  Caption = #25253#34920
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 642
    Height = 73
    inherited lblTitle: TLabel
      Left = 267
      Width = 156
      Caption = #21592#24037#24320#25151#34920
    end
    inherited Image1: TImage
      Left = 214
    end
    object Label1: TLabel
      Left = 10
      Top = 49
      Width = 66
      Height = 12
      Caption = #26597#35810#26085#26399' '#20174
    end
    object Label2: TLabel
      Left = 218
      Top = 49
      Width = 12
      Height = 12
      Caption = #33267
    end
    object dtpBd: TDateTimePicker
      Left = 80
      Top = 45
      Width = 121
      Height = 20
      CalAlignment = dtaLeft
      Date = 37383.3733280093
      Time = 37383.3733280093
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object dtpEd: TDateTimePicker
      Left = 232
      Top = 45
      Width = 121
      Height = 20
      CalAlignment = dtaLeft
      Date = 37383.3733280093
      Time = 37383.3733280093
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object btnQuery: TBitBtn
      Left = 360
      Top = 43
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
  inherited Panel2: TPanel
    Top = 73
    Width = 642
    Height = 365
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 632
      Height = 180
      Align = alTop
      Color = clMoneyGreen
      DataSource = dsYgkf
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
          FieldName = 'D_CZYXM'
          Title.Alignment = taCenter
          Title.Caption = #21592#24037#22995#21517
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_KFRQ'
          Title.Alignment = taCenter
          Title.Caption = #24320#25151#26085#26399
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_KFSJ'
          Title.Alignment = taCenter
          Title.Caption = #24320#25151#26102#38388
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_KFBH'
          Title.Alignment = taCenter
          Title.Caption = #23458#25151#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_SJFJ'
          Title.Alignment = taCenter
          Title.Caption = #23454#38469#25151#20215
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_KRXM'
          Title.Alignment = taCenter
          Title.Caption = #23458#20154#22995#21517
          Width = 200
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 5
      Top = 185
      Width = 632
      Height = 175
      Align = alClient
      Color = clMoneyGreen
      DataSource = dsTj
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
          FieldName = 'D_CZYXM'
          Title.Alignment = taCenter
          Title.Caption = #21592#24037#22995#21517
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COUNT'
          Title.Alignment = taCenter
          Title.Caption = #24320#25151#25968#37327
          Visible = True
        end
        item
          Color = clYellow
          Expanded = False
          FieldName = 'D_KFBL'
          Title.Alignment = taCenter
          Title.Caption = #24320#25151#27604#20363
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUM'
          Title.Alignment = taCenter
          Title.Caption = #24320#25151#37329#39069
          Visible = True
        end
        item
          Color = clYellow
          Expanded = False
          FieldName = 'D_JEBL'
          Title.Alignment = taCenter
          Title.Caption = #37329#39069#27604#20363
          Visible = True
        end>
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
    object btnPrintDetail: TBitBtn
      Left = 112
      Top = 5
      Width = 100
      Height = 25
      Caption = #25171#21360#26126#32454
      TabOrder = 2
      OnClick = btnPrintDetailClick
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
    object btnPrintHz: TBitBtn
      Left = 8
      Top = 5
      Width = 100
      Height = 25
      Caption = #25171#21360#27719#24635
      TabOrder = 3
      OnClick = btnPrintHzClick
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
  object qryYgkf: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select distinct D_CZYXM,D_KFRQ,D_KFSJ,D_KFBH,D_KRXM,D_SJFJ from ' +
        'YGKF where (D_KFRQ>=:BD)and(D_KFRQ<=:ED)')
    Left = 376
    Top = 16
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
    object qryYgkfD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.YGKF.D_CZYXM'
      Size = 8
    end
    object qryYgkfD_KFRQ: TDateTimeField
      FieldName = 'D_KFRQ'
      Origin = 'LFHOTELUSER.YGKF.D_KFRQ'
    end
    object qryYgkfD_KFSJ: TDateTimeField
      FieldName = 'D_KFSJ'
      Origin = 'LFHOTELUSER.YGKF.D_KFSJ'
      DisplayFormat = 'hh:nn:ss'
    end
    object qryYgkfD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Origin = 'LFHOTELUSER.YGKF.D_KFBH'
      Size = 5
    end
    object qryYgkfD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Origin = 'LFHOTELUSER.YGKF.D_KRXM'
      Size = 30
    end
    object qryYgkfD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
      Origin = 'LFHOTELUSER.YGKF.D_SJFJ'
    end
  end
  object qryTj: TQuery
    OnCalcFields = qryTjCalcFields
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select D_CZYXM,count(*),sum(D_SJFJ) from YGKF where (D_KFRQ>=:BD' +
        ')and(D_KFRQ<=:ED) group by D_CZYXM')
    Left = 408
    Top = 16
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
    object qryTjD_KFBL: TStringField
      FieldKind = fkCalculated
      FieldName = 'D_KFBL'
      Calculated = True
    end
    object qryTjD_JEBL: TStringField
      FieldKind = fkCalculated
      FieldName = 'D_JEBL'
      Calculated = True
    end
    object qryTjD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Size = 8
    end
    object qryTjCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
    object qryTjSUM: TFloatField
      FieldName = 'SUM'
    end
  end
  object dsYgkf: TDataSource
    DataSet = qryYgkf
    Left = 440
    Top = 16
  end
  object dsTj: TDataSource
    DataSet = qryTj
    Left = 472
    Top = 16
  end
  object Query1: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select count(*),sum(D_SJFJ) from YGKF where (D_KFRQ>=:BD)and(D_K' +
        'FRQ<=:ED)')
    Left = 328
    Top = 16
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
  end
end
