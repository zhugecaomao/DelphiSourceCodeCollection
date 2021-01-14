inherited TdtfForm: TTdtfForm
  Left = 181
  Top = 88
  Width = 518
  Height = 438
  Caption = #32467#24080
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 510
    Height = 101
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    object Bevel2: TBevel [0]
      Left = 8
      Top = 40
      Width = 497
      Height = 56
      Shape = bsFrame
    end
    inherited lblTitile: TLabel
      Left = 194
      Width = 125
      Caption = #22242#38431#36864#25151
    end
    inherited Image1: TImage
      Left = 160
    end
    object Label2: TLabel
      Left = 294
      Top = 48
      Width = 64
      Height = 16
      Caption = #36864#25151#26085#26399
    end
    object Label3: TLabel
      Left = 395
      Top = 48
      Width = 64
      Height = 16
      Caption = #36864#25151#26102#38388
    end
    object edtJzrq: TMaskEdit
      Left = 294
      Top = 64
      Width = 99
      Height = 24
      EditMask = '!0000/99/99;1; '
      MaxLength = 10
      TabOrder = 0
      Text = '    -  -  '
      OnExit = edtJzrqExit
    end
    object edtJzsj: TMaskEdit
      Left = 395
      Top = 64
      Width = 100
      Height = 24
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
      OnExit = edtJzsjExit
    end
    object edtTdmc: TLabeledEdit
      Left = 14
      Top = 64
      Width = 267
      Height = 24
      EditLabel.Width = 64
      EditLabel.Height = 16
      EditLabel.Caption = #22242#38431#21517#31216
      LabelPosition = lpAbove
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 2
    end
  end
  inherited Panel2: TPanel
    Top = 101
    Width = 510
    Height = 275
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    inherited Bevel1: TBevel
      Width = 500
      Height = 265
    end
    object ListView1: TListView
      Left = 5
      Top = 5
      Width = 500
      Height = 265
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          AutoSize = True
          Caption = #25151#38388#21495
        end>
      ReadOnly = True
      SortType = stText
      TabOrder = 0
      ViewStyle = vsList
    end
  end
  inherited Panel3: TPanel
    Top = 376
    Width = 510
    inherited btnOK: TBitBtn
      Left = 350
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 430
    end
    object btnSelAll: TBitBtn
      Left = 8
      Top = 5
      Width = 100
      Height = 25
      Caption = #20840#37096#36873#25321
      TabOrder = 2
      OnClick = btnSelAllClick
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
    object btnSelCanc: TBitBtn
      Left = 112
      Top = 5
      Width = 100
      Height = 25
      Caption = #20840#37096#21462#28040
      TabOrder = 3
      OnClick = btnSelCancClick
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
    Left = 56
  end
  object qryKfzt: TQuery
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from KFZT where D_KRBH=:KRBH')
    Left = 352
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'KRBH'
        ParamType = ptInput
      end>
  end
  object qryKrzd: TQuery
    OnNewRecord = qryKrzdNewRecord
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from KRZD')
    Left = 320
    Top = 8
  end
  object qryKrzdKf: TQuery
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from KRZD')
    Left = 392
    Top = 8
  end
  object tblBqj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'BQJ'
    Left = 128
    Top = 16
  end
end
