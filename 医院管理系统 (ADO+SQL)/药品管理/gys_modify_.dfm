object Fgys_modify: TFgys_modify
  Left = 222
  Top = 99
  Width = 482
  Height = 254
  Caption = #20379#24212#21830#20462#25913
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 474
    Height = 227
    Align = alClient
    Caption = #20462#25913#20379#24212#21830
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #20379#24212#21830#32534#21495
      FocusControl = DBEgysbh
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 248
      Top = 24
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #20379#24212#21830#21517#31216
      FocusControl = DBEgysmc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 144
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #32852#31995#20154#22995#21517
      FocusControl = DBElxrxm
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 48
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #32852#31995#20154#22836#34900
      FocusControl = DBElxrtx
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 248
      Top = 48
      Width = 81
      Height = 13
      AutoSize = False
      Caption = #22320'            '#22336
      FocusControl = DBEdz
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 120
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #22478'            '#24066
      FocusControl = DBEcs
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 72
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #22320'            '#21306
      FocusControl = DBEdq
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 248
      Top = 72
      Width = 81
      Height = 13
      AutoSize = False
      Caption = #37038'            '#32534
      FocusControl = DBEyp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 248
      Top = 120
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #22269'            '#23478
      FocusControl = DBEgj
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 16
      Top = 96
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #30005'            '#35805
      FocusControl = DBEdh
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 248
      Top = 96
      Width = 81
      Height = 13
      AutoSize = False
      Caption = #20256'            '#30495
      FocusControl = DBEcz
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBEgysbh: TDBEdit
      Left = 96
      Top = 24
      Width = 130
      Height = 21
      DataField = #20379#24212#21830#32534#21495
      DataSource = DMypgl.DSgys2
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 0
    end
    object DBEgysmc: TDBEdit
      Left = 328
      Top = 24
      Width = 130
      Height = 21
      DataField = #20379#24212#21830#21517#31216
      DataSource = DMypgl.DSgys2
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 1
    end
    object DBElxrxm: TDBEdit
      Left = 96
      Top = 144
      Width = 130
      Height = 21
      DataField = #32852#31995#20154#22995#21517
      DataSource = DMypgl.DSgys2
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 2
    end
    object DBElxrtx: TDBEdit
      Left = 96
      Top = 48
      Width = 130
      Height = 21
      DataField = #32852#31995#20154#22836#34900
      DataSource = DMypgl.DSgys2
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdz: TDBEdit
      Left = 328
      Top = 48
      Width = 130
      Height = 21
      DataField = #22320#22336
      DataSource = DMypgl.DSgys2
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 4
    end
    object DBEcs: TDBEdit
      Left = 96
      Top = 120
      Width = 130
      Height = 21
      DataField = #22478#24066
      DataSource = DMypgl.DSgys2
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdq: TDBEdit
      Left = 96
      Top = 72
      Width = 130
      Height = 21
      DataField = #22320#21306
      DataSource = DMypgl.DSgys2
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 6
    end
    object DBEyp: TDBEdit
      Left = 328
      Top = 72
      Width = 130
      Height = 21
      DataField = #37038#32534
      DataSource = DMypgl.DSgys2
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 7
    end
    object DBEgj: TDBEdit
      Left = 328
      Top = 120
      Width = 130
      Height = 21
      DataField = #22269#23478
      DataSource = DMypgl.DSgys2
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdh: TDBEdit
      Left = 96
      Top = 96
      Width = 130
      Height = 21
      DataField = #30005#35805
      DataSource = DMypgl.DSgys2
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 9
    end
    object DBEcz: TDBEdit
      Left = 328
      Top = 96
      Width = 130
      Height = 21
      DataField = #20256#30495
      DataSource = DMypgl.DSgys2
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 10
    end
    object BTgys_modify: TBitBtn
      Left = 88
      Top = 186
      Width = 75
      Height = 22
      Caption = #20462#25913
      TabOrder = 11
      OnClick = BTgys_modifyClick
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
    end
    object BTgys_YESmodify: TBitBtn
      Left = 192
      Top = 186
      Width = 81
      Height = 22
      Caption = #30830#23450#20462#25913
      TabOrder = 12
      OnClick = BTgys_YESmodifyClick
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
    end
    object BTgys_NOmodify: TBitBtn
      Left = 312
      Top = 186
      Width = 89
      Height = 22
      Caption = #21462#28040#20462#25913
      TabOrder = 13
      OnClick = BTgys_NOmodifyClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
    end
  end
  object XPMenu1: TXPMenu
    DimLevel = 30
    GrayLevel = 10
    Font.Charset = GB2312_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = clBtnFace
    IconBackColor = clBtnFace
    MenuBarColor = clBtnFace
    SelectColor = clHighlight
    SelectBorderColor = clHighlight
    SelectFontColor = clMenuText
    DisabledColor = clInactiveCaption
    SeparatorColor = clBtnFace
    CheckedColor = clHighlight
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = True
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = False
    Active = True
    Left = 416
    Top = 160
  end
end
