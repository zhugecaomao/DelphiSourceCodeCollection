inherited YjshForm: TYjshForm
  Left = 241
  Top = 48
  Width = 372
  Height = 341
  Caption = #22812#23457
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 364
    inherited lblTitile: TLabel
      Left = 121
      Width = 125
      Caption = #22812#38388#23457#26680
    end
    inherited Image1: TImage
      Left = 88
    end
  end
  inherited Panel2: TPanel
    Width = 364
    Height = 237
    inherited Bevel1: TBevel
      Width = 354
      Height = 227
    end
    object Label1: TLabel
      Left = 144
      Top = 32
      Width = 85
      Height = 19
      Caption = #36807#31243#25552#31034
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 56
      Top = 72
      Width = 240
      Height = 12
      Caption = #23457#26680#24320#22987#20043#21069#65292#35831#20808#26680#26597#19979#21015#24037#20316#23436#25104#24773#20917#65281
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 56
      Top = 96
      Width = 252
      Height = 12
      Caption = #9352#26202#38388#21040#24215#23458#20154#30340#24320#25151#30331#35760#21333#24050#20840#37096#24405#20837#23436#27605#12290
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 56
      Top = 120
      Width = 228
      Height = 12
      Caption = #9353#25276#37329#12289#35746#37329#12289#29616#37329#25910#20837#24050#20840#37096#20837#24080#26080#35823#12290
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 56
      Top = 144
      Width = 216
      Height = 12
      Caption = #9354#20303#24215#23458#20154#30340#31614#21333#28040#36153#24050#20840#37096#20934#30830#20837#24080#12290
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 56
      Top = 168
      Width = 288
      Height = 12
      Caption = #9355#22812#23457#23558#28165#29702#35813#26085#25968#25454#65292#24403#26085#25805#20316#35760#24405#26126#32454#24212#20808#25171#21360#65281
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Panel3: TPanel
    Top = 279
    Width = 364
    inherited btnOK: TBitBtn
      Left = 204
      Caption = #24320'  '#22987
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 284
      Caption = #21462'  '#28040
    end
    object ProgressBar1: TProgressBar
      Left = 8
      Top = 9
      Width = 185
      Height = 18
      Min = 0
      Max = 100
      TabOrder = 2
    end
  end
  inherited DosMove1: TDosMove
    Left = 48
  end
  object qryKfztsk: TQuery
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from KFZT where D_KFZT="F"')
    Left = 320
    Top = 32
  end
  object qryKfzttd: TQuery
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from KFZT where D_KFZT="T"')
    Left = 320
    Top = 64
  end
  object qryKrxxtd: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KRXX where D_KRLX="T"')
    Left = 352
    Top = 32
  end
  object tblKrzd: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRZD'
    Left = 256
  end
  object qryZd: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select D_XMBH,sum(D_XFJE) from KRZD where (D_HH<>0)and(D_XMBH<>"' +
        '00001")and(D_XMBH<>"00005")and(D_YSRQ is null) group by D_XMBH')
    Left = 288
    Top = 32
  end
  object tblYytj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'YYTJ'
    Left = 160
  end
  object qryJz: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select D_XMBH,sum(D_XFJE),sum(D_YHJE) from KRJZ where(D_HH<>0) g' +
        'roup by D_XMBH')
    Left = 256
    Top = 64
  end
  object tblYytjda: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'YYTJDA'
    Left = 128
  end
  object tblKrjz: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRJZ'
    Left = 288
  end
  object tblKrjzda: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRJZDA'
    Left = 256
    Top = 32
  end
  object tblXmdm: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'XMDM'
    Left = 192
  end
  object tblLkyskz: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'LKYSKZ'
    Left = 128
    Top = 32
  end
  object tblLkyskzda: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'LKYSKZDA'
    Left = 160
    Top = 32
  end
  object qryLkyskz: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select D_XMBH,sum(D_XFJE-D_YHJE) from KRZD where (D_HH<>0)and(D_' +
        'JSBZ<>"2") group by D_XMBH')
    Left = 192
    Top = 32
  end
  object tblSjtj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'SJTJ'
    Left = 224
  end
  object qryUser: TQuery
    DatabaseName = 'LfHotelUser'
    Left = 320
  end
  object tblJzfltj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'JZFLTJ'
    Left = 352
  end
  object tblYssj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'YSSJ'
    Left = 96
    Top = 40
  end
end
