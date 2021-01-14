object frmLjsz: TfrmLjsz
  Left = 378
  Top = 118
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #36830#25509#35774#32622
  ClientHeight = 153
  ClientWidth = 231
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 231
    Height = 101
    Align = alClient
    BevelInner = bvLowered
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 13
      Width = 78
      Height = 12
      Caption = #24212#29992#26381#21153#22120#21517':'
    end
    object Label2: TLabel
      Left = 13
      Top = 42
      Width = 78
      Height = 12
      Caption = #24212#29992#26381#21153#22120'IP:'
    end
    object Label3: TLabel
      Left = 13
      Top = 71
      Width = 78
      Height = 12
      Caption = #31471'    '#21475'  '#21495':'
    end
    object edtAppHost: TEdit
      Left = 95
      Top = 9
      Width = 121
      Height = 20
      TabOrder = 0
      OnExit = edtAppHostExit
      OnKeyPress = edtAppHostKeyPress
    end
    object edtAppIP: TEdit
      Left = 95
      Top = 38
      Width = 121
      Height = 20
      TabOrder = 1
      OnExit = edtAppIPExit
      OnKeyPress = edtAppIPKeyPress
    end
    object btnAppName: TBitBtn
      Left = 200
      Top = 11
      Width = 15
      Height = 15
      Caption = #8230
      TabOrder = 2
      OnClick = btnAppNameClick
    end
    object edtPort: TEdit
      Left = 95
      Top = 68
      Width = 121
      Height = 20
      TabOrder = 3
      Text = '211'
      OnKeyPress = edtPortKeyPress
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 134
    Width = 231
    Height = 19
    Panels = <
      item
        Width = 150
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 101
    Width = 231
    Height = 33
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object btnOK: TSpeedButton
      Left = 33
      Top = 4
      Width = 76
      Height = 24
      Caption = #30830'  '#23450
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
      OnClick = btnOKClick
    end
    object btnCancel: TSpeedButton
      Left = 128
      Top = 4
      Width = 76
      Height = 24
      Caption = #21462'  '#28040
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
      OnClick = btnCancelClick
    end
  end
end
