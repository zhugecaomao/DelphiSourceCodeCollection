object FrmInputInfo: TFrmInputInfo
  Left = 297
  Top = 173
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'FrmInputInfo'
  ClientHeight = 412
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object InputInfoTitle: TFlatTitlebar
    Left = 0
    Top = 0
    Width = 569
    Height = 25
    ActiveTextColor = clYellow
    InactiveTextColor = clMoneyGreen
    TitlebarColor = clGreen
    Align = alTop
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    Caption = #23458#25143#20449#24687#36755#20837
    object BtnExit: TFlatButton
      Left = 544
      Top = 0
      Width = 25
      Height = 25
      Color = clGreen
      ColorFocused = clGreen
      ColorDown = clGreen
      ColorBorder = clGreen
      ColorHighLight = clLime
      Caption = #215
      Font.Charset = GB2312_CHARSET
      Font.Color = clYellow
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      ParentColor = False
      TabOrder = 0
      OnClick = BtnExitClick
    end
  end
  object Panel1: TFlatPanel
    Left = 0
    Top = 25
    Width = 569
    Height = 387
    ParentColor = True
    ColorHighLight = clGreen
    ColorShadow = clGreen
    Align = alClient
    TabOrder = 1
    object GBClientInfo: TFlatGroupBox
      Left = 360
      Top = 8
      Width = 201
      Height = 273
      Caption = #23458#25143#22522#26412#20449#24687
      TabOrder = 0
      ColorBorder = clGreen
      object Label19: TLabel
        Left = 16
        Top = 26
        Width = 36
        Height = 13
        Caption = #22995#21517#65306
      end
      object Label20: TLabel
        Left = 16
        Top = 122
        Width = 36
        Height = 13
        Caption = #22320#22336#65306
      end
      object Label21: TLabel
        Left = 16
        Top = 74
        Width = 36
        Height = 13
        Caption = #30005#35805#65306
      end
      object Label22: TLabel
        Left = 16
        Top = 50
        Width = 36
        Height = 13
        Caption = #25163#26426#65306
      end
      object Label23: TLabel
        Left = 16
        Top = 98
        Width = 36
        Height = 13
        Caption = #20256#30495#65306
      end
      object Label24: TLabel
        Left = 16
        Top = 210
        Width = 60
        Height = 13
        Caption = #36141#26426#26085#26399#65306
      end
      object Label25: TLabel
        Left = 16
        Top = 242
        Width = 60
        Height = 13
        Caption = #36807#20445#26085#26399#65306
      end
      object Label26: TLabel
        Left = 16
        Top = 180
        Width = 60
        Height = 13
        Caption = #23458#25143#24615#36136#65306
      end
      object Label27: TLabel
        Left = 16
        Top = 154
        Width = 60
        Height = 13
        Caption = #36141#20080#25968#37327#65306
      end
      object EUser: TFlatEdit
        Left = 56
        Top = 24
        Width = 137
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 8
        TabOrder = 0
        Text = 'EUser'
      end
      object EMobile: TFlatEdit
        Left = 56
        Top = 48
        Width = 137
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 15
        TabOrder = 1
        Text = 'EMobile'
      end
      object EPhone: TFlatEdit
        Left = 56
        Top = 72
        Width = 137
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 20
        TabOrder = 2
        Text = 'EPhone'
      end
      object EFax: TFlatEdit
        Left = 56
        Top = 96
        Width = 137
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 20
        TabOrder = 3
        Text = 'EFax'
      end
      object EAddr: TFlatEdit
        Left = 56
        Top = 120
        Width = 137
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 100
        TabOrder = 4
        Text = 'EAddr'
      end
      object EAmount: TFlatEdit
        Left = 80
        Top = 152
        Width = 113
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 3
        TabOrder = 5
        Text = 'EAmount'
        OnChange = EAmountChange
        OnKeyPress = EAmountKeyPress
      end
      object DateBuy: TDateTimePicker
        Left = 80
        Top = 208
        Width = 113
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        CalAlignment = dtaLeft
        Date = 37741.6501475231
        Time = 37741.6501475231
        DateFormat = dfLong
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 7
        OnChange = DateBuyChange
      end
      object DateBao: TDateTimePicker
        Left = 80
        Top = 240
        Width = 113
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        CalAlignment = dtaLeft
        Date = 37741.650199456
        Time = 37741.650199456
        DateFormat = dfLong
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 8
      end
      object CmbQuality: TFlatComboBox
        Left = 80
        Top = 176
        Width = 113
        Height = 21
        Style = csDropDownList
        Color = clMoneyGreen
        ColorArrow = clYellow
        ColorArrowBackground = clGreen
        ColorBorder = clGreen
        ItemHeight = 13
        Items.Strings = (
          #19968#33324#23458#25143
          #29305#27530#23458#25143)
        TabOrder = 6
        Text = #19968#33324#23458#25143
        ItemIndex = 0
      end
    end
    object GBComputer: TFlatGroupBox
      Left = 8
      Top = 8
      Width = 337
      Height = 273
      Caption = #23458#25143#30005#33041#37197#32622
      TabOrder = 1
      ColorBorder = clGreen
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 40
        Height = 13
        Caption = 'C P U'#65306
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 39
        Height = 13
        Caption = #20027' '#26495#65306
      end
      object Label3: TLabel
        Left = 16
        Top = 72
        Width = 39
        Height = 13
        Caption = #20869' '#23384#65306
      end
      object Label4: TLabel
        Left = 16
        Top = 96
        Width = 39
        Height = 13
        Caption = #30828' '#30424#65306
      end
      object Label5: TLabel
        Left = 16
        Top = 120
        Width = 39
        Height = 13
        Caption = #22768' '#21345#65306
      end
      object Label6: TLabel
        Left = 16
        Top = 144
        Width = 39
        Height = 13
        Caption = #26174' '#21345#65306
      end
      object Label7: TLabel
        Left = 16
        Top = 168
        Width = 39
        Height = 13
        Caption = #20809' '#39537#65306
      end
      object Label8: TLabel
        Left = 16
        Top = 192
        Width = 39
        Height = 13
        Caption = #36719' '#39537#65306
      end
      object Label9: TLabel
        Left = 16
        Top = 216
        Width = 39
        Height = 13
        Caption = #38190' '#30424#65306
      end
      object Label10: TLabel
        Left = 176
        Top = 24
        Width = 39
        Height = 13
        Caption = #40736' '#26631#65306
      end
      object Label11: TLabel
        Left = 168
        Top = 48
        Width = 48
        Height = 13
        Caption = #26174#31034#22120#65306
      end
      object Label12: TLabel
        Left = 176
        Top = 72
        Width = 39
        Height = 13
        Caption = #26426' '#31665#65306
      end
      object Label13: TLabel
        Left = 176
        Top = 96
        Width = 39
        Height = 13
        Caption = #30005' '#28304#65306
      end
      object Label14: TLabel
        Left = 176
        Top = 120
        Width = 39
        Height = 13
        Caption = #38899' '#31665#65306
      end
      object Label15: TLabel
        Left = 176
        Top = 168
        Width = 39
        Height = 13
        Caption = #32593' '#21345#65306
      end
      object Label17: TLabel
        Left = 168
        Top = 144
        Width = 48
        Height = 13
        Caption = #25171#21360#26426#65306
      end
      object Label18: TLabel
        Left = 16
        Top = 240
        Width = 60
        Height = 13
        Caption = #20854#23427#35774#22791#65306
      end
      object Label16: TLabel
        Left = 168
        Top = 192
        Width = 47
        Height = 13
        Caption = 'Modem'#65306
      end
      object ECPU: TFlatEdit
        Left = 56
        Top = 22
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 0
        Text = 'ECPU'
      end
      object EMouse: TFlatEdit
        Left = 216
        Top = 22
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 9
        Text = 'EMouse'
      end
      object EMainBoard: TFlatEdit
        Left = 56
        Top = 46
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 1
        Text = 'EMainBoard'
      end
      object EMemory: TFlatEdit
        Left = 56
        Top = 70
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 2
        Text = 'EMemory'
      end
      object ESound: TFlatEdit
        Left = 56
        Top = 118
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 4
        Text = 'ESound'
      end
      object EHD: TFlatEdit
        Left = 56
        Top = 94
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 3
        Text = 'EHD'
      end
      object EDisPlayCard: TFlatEdit
        Left = 56
        Top = 142
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 5
        Text = 'EDisPlayCard'
      end
      object ECDROM: TFlatEdit
        Left = 56
        Top = 166
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 6
        Text = 'ECDROM'
      end
      object EFloppy: TFlatEdit
        Left = 56
        Top = 190
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 7
        Text = 'EFloppy'
      end
      object EKeyBoard: TFlatEdit
        Left = 56
        Top = 214
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 8
        Text = 'EKeyBoard'
      end
      object EOther: TFlatEdit
        Left = 72
        Top = 238
        Width = 249
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 200
        TabOrder = 17
        Text = 'EOther'
      end
      object EDisPlay: TFlatEdit
        Left = 216
        Top = 46
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 10
        Text = 'EDisPlay'
      end
      object EBox: TFlatEdit
        Left = 216
        Top = 70
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 11
        Text = 'EBox'
      end
      object EPower: TFlatEdit
        Left = 216
        Top = 94
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 12
        Text = 'EPower'
      end
      object ESoundBox: TFlatEdit
        Left = 216
        Top = 118
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 13
        Text = 'ESoundBox'
      end
      object EPrint: TFlatEdit
        Left = 216
        Top = 142
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 14
        Text = 'EPrint'
      end
      object ENetWork: TFlatEdit
        Left = 216
        Top = 166
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 15
        Text = 'ENetWork'
      end
      object EModem: TFlatEdit
        Left = 216
        Top = 190
        Width = 105
        Height = 17
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        MaxLength = 40
        TabOrder = 16
        Text = 'EModem'
      end
    end
    object GBMemo: TFlatGroupBox
      Left = 8
      Top = 288
      Width = 409
      Height = 89
      Caption = #22791#27880
      TabOrder = 2
      ColorBorder = clGreen
      object Memo: TFlatMemo
        Left = 8
        Top = 16
        Width = 393
        Height = 65
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        ScrollBars = ssVertical
        TabOrder = 0
        Lines.Strings = (
          'Memo')
      end
    end
    object BtnPrint: TFlatButton
      Left = 432
      Top = 296
      Width = 57
      Height = 33
      ColorBorder = clGreen
      Caption = #25171#21360
      TabOrder = 3
      OnClick = BtnPrintClick
    end
    object BtnPreview: TFlatButton
      Left = 504
      Top = 296
      Width = 57
      Height = 33
      ColorBorder = clGreen
      Caption = #39044#35272
      TabOrder = 4
      OnClick = BtnPreviewClick
    end
    object BtnAdd: TFlatButton
      Left = 432
      Top = 344
      Width = 57
      Height = 33
      ColorBorder = clGreen
      Caption = #28155#21152
      TabOrder = 5
      OnClick = BtnAddClick
    end
    object BtnExit1: TFlatButton
      Left = 504
      Top = 344
      Width = 57
      Height = 33
      ColorBorder = clGreen
      Caption = #36864#20986
      TabOrder = 6
      OnClick = BtnExitClick
    end
    object BtnModify: TFlatButton
      Left = 432
      Top = 344
      Width = 57
      Height = 33
      ColorBorder = clGreen
      Caption = #20462#25913
      TabOrder = 7
      OnClick = BtnAddClick
    end
  end
  object ADOConnection1: TADOConnection
    Left = 16
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 8
  end
end
