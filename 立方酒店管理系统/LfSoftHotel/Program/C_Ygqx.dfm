inherited YgqxForm: TYgqxForm
  Left = 144
  Top = 25
  Width = 490
  Height = 500
  Caption = #31995#32479
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 482
    Height = 64
    inherited lblTitile: TLabel
      Left = 181
      Width = 125
      Caption = #21592#24037#26435#38480
    end
    inherited Image1: TImage
      Left = 144
    end
    object lblYg: TLabel
      Left = 8
      Top = 47
      Width = 36
      Height = 12
      Caption = #21592#24037#65306
    end
  end
  inherited Panel2: TPanel
    Top = 64
    Width = 482
    Height = 374
    inherited Bevel1: TBevel
      Width = 472
      Height = 364
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 472
      Height = 364
      Align = alClient
      DataSource = dsYgqx
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'D_CZXM'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #25805#20316#39033#30446
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_QX'
          Title.Alignment = taCenter
          Title.Caption = #21592#24037#26435#38480
          Width = 100
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 438
    Width = 482
    inherited btnOK: TBitBtn
      Left = 322
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 402
      OnClick = btnCancClick
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 5
      Width = 75
      Height = 25
      Caption = #20840#37096#36873#20013
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888000888888888800000088444444440000008848888888000888884888888
        8848888884888888884884444488888888488488848888888848848884888888
        8848848884888888884884888444444444488488888884888888848888888488
        8888000888888488800000044444448880000008888888888000}
    end
    object BitBtn2: TBitBtn
      Left = 88
      Top = 5
      Width = 75
      Height = 25
      Caption = #20840#37096#21462#28040
      TabOrder = 3
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888800088888800088880004444440008888000888888000888884888888
        8848000884888888884800044488888888480008848888888848848884888888
        8848848800088888800084880004444440008488000884888000848888888488
        8888000888880008888800044444000888880008888800088888}
    end
  end
  inherited DosMove1: TDosMove
    Left = 272
  end
  object qryYgqx: TQuery
    CachedUpdates = True
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from YGQX where D_YGBH=:YGBH')
    Left = 144
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'YGBH'
        ParamType = ptInput
      end>
    object qryYgqxD_YGBH: TStringField
      FieldName = 'D_YGBH'
      Origin = 'LFHOTELUSER.YGQX.D_YGBH'
      Size = 5
    end
    object qryYgqxD_CZBH: TStringField
      FieldName = 'D_CZBH'
      Origin = 'LFHOTELUSER.YGQX.D_CZBH'
      Size = 5
    end
    object qryYgqxD_CZXM: TStringField
      FieldName = 'D_CZXM'
      Origin = 'LFHOTELUSER.YGQX.D_CZXM'
    end
    object qryYgqxD_QX: TStringField
      FieldName = 'D_QX'
      Origin = 'LFHOTELUSER.YGQX.D_QX'
      FixedChar = True
      Size = 1
    end
  end
  object dsYgqx: TDataSource
    DataSet = qryYgqx
    Left = 176
    Top = 48
  end
  object tblCzxm: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'CZXM'
    Left = 208
    Top = 48
  end
end
