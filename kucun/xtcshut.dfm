object xtcshfm: Txtcshfm
  Left = 300
  Top = 208
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #31995#32479#21021#22987#21270
  ClientHeight = 301
  ClientWidth = 479
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 479
    Height = 301
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #31995#32479#21021#22987#21270
      object BitBtn1: TBitBtn
        Left = 40
        Top = 24
        Width = 153
        Height = 33
        Caption = #28165#31354#20837#24211#34920
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 224
        Top = 24
        Width = 153
        Height = 33
        Caption = #28165#31354#20986#24211#34920
        TabOrder = 1
        OnClick = BitBtn2Click
      end
      object BitBtn3: TBitBtn
        Left = 40
        Top = 80
        Width = 153
        Height = 33
        Caption = #28165#31354#24211#23384#34920
        TabOrder = 2
        OnClick = BitBtn3Click
      end
      object BitBtn4: TBitBtn
        Left = 224
        Top = 80
        Width = 153
        Height = 33
        Caption = #28165#31354#27719#24635#34920
        TabOrder = 3
        OnClick = BitBtn4Click
      end
      object BitBtn5: TBitBtn
        Left = 40
        Top = 135
        Width = 153
        Height = 33
        Caption = #28165#31354#32534#21495#34920
        TabOrder = 4
        OnClick = BitBtn5Click
      end
      object BitBtn6: TBitBtn
        Left = 224
        Top = 135
        Width = 153
        Height = 33
        Caption = #28165#31354#20154#21592#34920
        TabOrder = 5
        OnClick = BitBtn6Click
      end
      object BitBtn7: TBitBtn
        Left = 40
        Top = 216
        Width = 337
        Height = 33
        Caption = #28165#31354#20379#36135#21830#34920
        TabOrder = 6
        OnClick = BitBtn7Click
      end
      object BitBtn8: TBitBtn
        Left = 40
        Top = 184
        Width = 153
        Height = 33
        Caption = #28165#31354#36864#26009#34920
        TabOrder = 7
        OnClick = BitBtn8Click
      end
      object BitBtn9: TBitBtn
        Left = 224
        Top = 184
        Width = 153
        Height = 33
        Caption = #28165#31354#36864#36135#34920
        TabOrder = 8
        OnClick = BitBtn9Click
      end
    end
  end
  object ADOQuery: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    Left = 168
    Top = 24
  end
  object OpenDialog1: TOpenDialog
    Left = 200
    Top = 96
  end
  object ftpado: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    Left = 217
    Top = 104
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 3000
    Left = 201
    Top = 64
  end
end
