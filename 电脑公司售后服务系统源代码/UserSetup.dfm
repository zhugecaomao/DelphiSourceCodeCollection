object FrmUserSetup: TFrmUserSetup
  Left = 400
  Top = 305
  ActiveControl = RBModify
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'FrmUserSetup'
  ClientHeight = 253
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object UserSetupTitle: TFlatTitlebar
    Left = 0
    Top = 0
    Width = 321
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
    Caption = #25805#20316#20154#21592#35774#32622
    object BtnExit: TFlatButton
      Left = 296
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
    Width = 321
    Height = 228
    ParentColor = True
    ColorHighLight = clGreen
    ColorShadow = clGreen
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 144
      Top = 16
      Width = 60
      Height = 12
      Caption = #29992#25143#21517#31216#65306
    end
    object Label2: TLabel
      Left = 144
      Top = 64
      Width = 60
      Height = 12
      Caption = #29992#25143#26435#38480#65306
    end
    object Label3: TLabel
      Left = 144
      Top = 40
      Width = 60
      Height = 12
      Caption = #29992#25143#23494#30721#65306
    end
    object GB1: TFlatGroupBox
      Left = 8
      Top = 8
      Width = 129
      Height = 209
      Caption = #25805#20316#20154#21592#21517#21333
      TabOrder = 0
      ColorBorder = clGreen
      object LtbUser: TFlatListBox
        Left = 8
        Top = 24
        Width = 113
        Height = 176
        TransparentMode = tmAlways
        ScrollBars = True
        ColorBorder = clGreen
        OnClick = LtbUserClick
      end
    end
    object EditUser: TFlatEdit
      Left = 208
      Top = 12
      Width = 105
      Height = 18
      ColorBorder = clGreen
      ColorFlat = clBtnFace
      ParentColor = True
      Enabled = False
      TabOrder = 1
      Text = 'EditUser'
    end
    object CmbQX: TFlatComboBox
      Left = 208
      Top = 60
      Width = 105
      Height = 20
      Style = csDropDownList
      Color = clMoneyGreen
      ColorArrow = clYellow
      ColorArrowBackground = clGreen
      ColorBorder = clGreen
      Enabled = False
      ItemHeight = 12
      Items.Strings = (
        #26222#36890#29992#25143
        #36229#32423#29992#25143)
      TabOrder = 2
      Text = #26222#36890#29992#25143
      ItemIndex = 0
      OnChange = CmbQXChange
    end
    object BtnSave: TFlatButton
      Left = 264
      Top = 96
      Width = 49
      Height = 25
      ColorBorder = clGreen
      Caption = #20445#23384
      Enabled = False
      TabOrder = 3
      OnClick = BtnSaveClick
    end
    object BtnCancel: TFlatButton
      Left = 264
      Top = 160
      Width = 49
      Height = 25
      ColorBorder = clGreen
      Caption = #21462#28040
      Enabled = False
      TabOrder = 4
      OnClick = BtnCancelClick
    end
    object EditPwd: TFlatEdit
      Left = 208
      Top = 36
      Width = 105
      Height = 18
      ColorBorder = clGreen
      ColorFlat = clBtnFace
      ParentColor = True
      Enabled = False
      TabOrder = 5
      Text = 'EditPwd'
    end
    object Panel2: TFlatPanel
      Left = 144
      Top = 96
      Width = 113
      Height = 25
      ParentColor = True
      ColorHighLight = clGreen
      ColorShadow = clGreen
      TabOrder = 6
      object RBAdd: TFlatRadioButton
        Left = 8
        Top = 5
        Width = 45
        Height = 17
        Caption = #22686#21152
        ColorBorder = clGreen
        TabOrder = 0
        OnClick = RBAddClick
      end
      object RBModify: TFlatRadioButton
        Left = 56
        Top = 5
        Width = 45
        Height = 17
        Caption = #20462#25913
        ColorBorder = clGreen
        TabOrder = 1
        OnClick = RBModifyClick
      end
    end
    object BtnDel: TFlatButton
      Left = 264
      Top = 128
      Width = 49
      Height = 25
      ColorBorder = clGreen
      Caption = #21024#38500
      Enabled = False
      TabOrder = 7
      OnClick = BtnDelClick
    end
    object GB2: TFlatGroupBox
      Left = 144
      Top = 136
      Width = 113
      Height = 81
      Caption = #26435#38480#35828#26126
      TabOrder = 8
      ColorBorder = clGreen
      object Panel3: TFlatPanel
        Left = 1
        Top = 12
        Width = 104
        Height = 61
        ParentColor = True
        Enabled = False
        ColorHighLight = clBtnFace
        ColorShadow = clBtnFace
        TabOrder = 0
        object Chk1: TFlatCheckBox
          Left = 8
          Top = 4
          Width = 81
          Height = 17
          Caption = #25805#20316#21592#35774#32622
          ColorBorder = clGreen
          TabOrder = 0
          TabStop = True
        end
        object CHK2: TFlatCheckBox
          Left = 8
          Top = 22
          Width = 97
          Height = 17
          Caption = #31995#32479#21442#25968#35774#32622
          ColorBorder = clGreen
          TabOrder = 1
          TabStop = True
        end
        object CHK3: TFlatCheckBox
          Left = 8
          Top = 40
          Width = 81
          Height = 17
          Caption = #25968#25454#24211#31649#29702
          ColorBorder = clGreen
          TabOrder = 2
          TabStop = True
        end
      end
    end
    object BtnExit1: TFlatButton
      Left = 264
      Top = 192
      Width = 49
      Height = 25
      ColorBorder = clGreen
      Caption = #36864#20986
      TabOrder = 9
      OnClick = BtnExitClick
    end
  end
  object ADOConnection1: TADOConnection
    Left = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 40
  end
end
