object frmBmlldDjsh: TfrmBmlldDjsh
  Left = 429
  Top = 229
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #21333#25454#23457#26680#21345#29255
  ClientHeight = 110
  ClientWidth = 237
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #26999#20307'_GB2312'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 237
    Height = 76
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 44
      Width = 77
      Height = 16
      Caption = #23457#26680#26085#26399':'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 12
      Top = 12
      Width = 78
      Height = 16
      Caption = #23457' '#26680' '#20154':'
      FocusControl = DBEdit2
    end
    object DBEdit1: TDBEdit
      Left = 93
      Top = 44
      Width = 124
      Height = 24
      DataField = 'AuditingDate'
      DataSource = frmBmlld.DataSource4
      MaxLength = 10
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 93
      Top = 9
      Width = 124
      Height = 24
      DataField = 'AuditingPerson'
      DataSource = frmBmlld.DataSource4
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 196
      Top = 11
      Width = 19
      Height = 16
      Caption = #8230
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 76
    Width = 237
    Height = 34
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 34
      Top = 6
      Width = 79
      Height = 22
      Caption = #30830' '#23450
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 144
      Top = 6
      Width = 74
      Height = 22
      Caption = #21462' '#28040
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      OnClick = SpeedButton2Click
    end
  end
  object aqKC: TADOQuery
    Active = True
    Connection = dmWarehouse.ACWarehouse
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from KCQKB')
    Left = 200
    Top = 24
  end
end
