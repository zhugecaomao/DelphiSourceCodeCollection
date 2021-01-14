object ztfm: Tztfm
  Left = 331
  Top = 244
  BorderStyle = bsNone
  Caption = 'ztfm'
  ClientHeight = 66
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 298
    Height = 66
    Align = alClient
    Caption = #25968#25454#20256#36755#20013#35831#31561#24453'...'
    TabOrder = 0
  end
  object NMFTP1: TNMFTP
    PORT = 21
    ReportLevel = 0
    Vendor = 2411
    ParseList = False
    ProxyPort = 0
    Passive = False
    FirewallType = FtOpen
    FWAuthenticate = False
    Left = 384
    Top = 176
  end
  object ftpado: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    Left = 280
    Top = 160
  end
end
