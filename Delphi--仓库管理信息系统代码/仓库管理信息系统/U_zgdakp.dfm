object frmZgda_Kp: TfrmZgda_Kp
  Left = 458
  Top = 163
  Width = 365
  Height = 422
  BorderIcons = [biSystemMenu]
  Caption = #32844#24037#26723#26696#21345#29255
  Color = 4013343
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = #26999#20307'_GB2312'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 19
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 357
    Height = 357
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 50
      Top = 16
      Width = 95
      Height = 19
      Caption = #32844#24037#32534#21495':'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 50
      Top = 76
      Width = 95
      Height = 19
      Caption = #32844#24037#22995#21517':'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 50
      Top = 174
      Width = 95
      Height = 19
      Caption = #20986#29983#24180#26376':'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 50
      Top = 202
      Width = 95
      Height = 19
      Caption = #25919#27835#38754#35980':'
      FocusControl = DBEdit4
    end
    object Label6: TLabel
      Left = 50
      Top = 231
      Width = 97
      Height = 19
      Caption = #32844'    '#31216':'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 50
      Top = 260
      Width = 97
      Height = 19
      Caption = #32844'    '#21153':'
      FocusControl = DBEdit7
    end
    object Label8: TLabel
      Left = 50
      Top = 145
      Width = 95
      Height = 19
      Caption = #32844#24037#23646#24615':'
      FocusControl = DBEdit8
    end
    object Label9: TLabel
      Left = 50
      Top = 305
      Width = 97
      Height = 19
      Caption = #22791'    '#27880':'
    end
    object Label5: TLabel
      Left = 58
      Top = 113
      Width = 86
      Height = 19
      Caption = #24615'   '#21035':'
    end
    object Label10: TLabel
      Left = 286
      Top = 17
      Width = 56
      Height = 14
      Caption = 'XXXXXXX'
      Color = clBtnFace
      Font.Charset = GB2312_CHARSET
      Font.Color = clGreen
      Font.Height = -14
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label12: TLabel
      Left = 10
      Top = 48
      Width = 137
      Height = 19
      Caption = #25152#23646#37096#38376#32534#30721':'
      FocusControl = DBEdit5
    end
    object DBEdit1: TDBEdit
      Left = 155
      Top = 13
      Width = 126
      Height = 27
      DataField = 'EmpID'
      DataSource = frmZgda.dsZGDA
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 155
      Top = 73
      Width = 124
      Height = 27
      DataField = 'EmpName'
      DataSource = frmZgda.dsZGDA
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 155
      Top = 170
      Width = 126
      Height = 27
      DataField = 'BirthDate'
      DataSource = frmZgda.dsZGDA
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 155
      Top = 199
      Width = 124
      Height = 27
      DataField = 'Politics'
      DataSource = frmZgda.dsZGDA
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 155
      Top = 227
      Width = 124
      Height = 27
      DataField = 'Level'
      DataSource = frmZgda.dsZGDA
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 155
      Top = 256
      Width = 124
      Height = 27
      DataField = 'Caption'
      DataSource = frmZgda.dsZGDA
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 155
      Top = 141
      Width = 124
      Height = 27
      DataField = 'EmpAttr'
      DataSource = frmZgda.dsZGDA
      TabOrder = 6
    end
    object DBMemo1: TDBMemo
      Left = 155
      Top = 288
      Width = 185
      Height = 57
      DataField = 'Memo'
      DataSource = frmZgda.dsZGDA
      ScrollBars = ssVertical
      TabOrder = 7
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 155
      Top = 97
      Width = 124
      Height = 43
      Columns = 2
      DataField = 'Sex'
      DataSource = frmZgda.dsZGDA
      Items.Strings = (
        #30007
        #22899)
      TabOrder = 8
      Values.Strings = (
        #30007
        #22899)
    end
    object DBEdit5: TDBEdit
      Left = 155
      Top = 44
      Width = 126
      Height = 27
      DataField = 'DepCode'
      DataSource = frmZgda.dsZGDA
      ReadOnly = True
      TabOrder = 9
    end
    object BitBtn1: TBitBtn
      Left = 265
      Top = 46
      Width = 16
      Height = 24
      Caption = #8230
      TabOrder = 10
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 357
    Width = 357
    Height = 31
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 128
      Top = 5
      Width = 98
      Height = 22
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
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 237
      Top = 5
      Width = 100
      Height = 22
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
      OnClick = SpeedButton2Click
    end
  end
end
