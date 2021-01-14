object frmEditGame: TfrmEditGame
  Left = 297
  Top = 83
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #32534#36753#28216#25103
  ClientHeight = 184
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object ListBoxGame: TListBox
    Left = 4
    Top = 8
    Width = 179
    Height = 169
    Style = lbOwnerDrawVariable
    Color = clGradientInactiveCaption
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    IntegralHeight = True
    ItemHeight = 16
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    OnClick = ListBoxGameClick
  end
  object GroupBox2: TGroupBox
    Left = 192
    Top = 8
    Width = 273
    Height = 169
    Caption = #28216#25103#20449#24687
    TabOrder = 1
    object Label5: TLabel
      Left = 8
      Top = 68
      Width = 66
      Height = 12
      Caption = #26381#21153#22120#31471#21475':'
    end
    object Label7: TLabel
      Left = 8
      Top = 44
      Width = 66
      Height = 12
      Caption = #26381#21153#22120#22320#22336':'
    end
    object Label8: TLabel
      Left = 8
      Top = 92
      Width = 54
      Height = 12
      Caption = #32593#31449#39318#39029':'
    end
    object Label11: TLabel
      Left = 8
      Top = 20
      Width = 66
      Height = 12
      Caption = #26381#21153#22120#21517#31216':'
    end
    object EditGamePort: TEdit
      Left = 80
      Top = 64
      Width = 185
      Height = 20
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      TabOrder = 2
      Text = '7000'
    end
    object EditGameAddr: TEdit
      Left = 80
      Top = 40
      Width = 185
      Height = 20
      Hint = #28216#25103#26381#21153#22120'IP'#22320#22336
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      TabOrder = 1
    end
    object EditNotice: TEdit
      Left = 80
      Top = 88
      Width = 185
      Height = 20
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      TabOrder = 3
      Text = 'http://'
    end
    object EditServerName: TEdit
      Left = 80
      Top = 16
      Width = 185
      Height = 20
      Hint = #28216#25103#26381#21153#22120#21517#31216
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      TabOrder = 0
    end
    object ButtonGameChange: TRzButton
      Left = 13
      Top = 136
      Width = 60
      Caption = #20462#25913
      HotTrack = True
      TabOrder = 4
      OnClick = ButtonGameChangeClick
    end
    object ButtonGameAdd: TRzButton
      Left = 77
      Top = 136
      Width = 60
      Caption = #22686#21152
      HotTrack = True
      TabOrder = 5
      OnClick = ButtonGameAddClick
    end
    object ButtonGameDel: TRzButton
      Left = 141
      Top = 136
      Width = 60
      Caption = #21024#38500
      HotTrack = True
      TabOrder = 6
      OnClick = ButtonGameDelClick
    end
    object ButtonGameSave: TRzButton
      Left = 205
      Top = 136
      Width = 60
      Caption = #20445#23384
      HotTrack = True
      TabOrder = 7
      OnClick = ButtonGameSaveClick
    end
  end
end
