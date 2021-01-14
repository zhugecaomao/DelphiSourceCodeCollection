object loginfm: Tloginfm
  Left = 161
  Top = 127
  ActiveControl = usernamebox
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #29992#25143#30331#38470
  ClientHeight = 177
  ClientWidth = 302
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 302
    Height = 177
    Align = alClient
    TabOrder = 0
    object loginbt: TSpeedButton
      Left = 40
      Top = 128
      Width = 81
      Height = 25
      Caption = #30331#24405'[ENTER]'
      OnClick = loginbtClick
    end
    object closebt: TSpeedButton
      Left = 192
      Top = 128
      Width = 81
      Height = 25
      Caption = #36864#20986'[ESC]'
      OnClick = closebtClick
    end
    object GroupBox1: TGroupBox
      Left = 40
      Top = 16
      Width = 233
      Height = 105
      TabOrder = 0
      object Label1: TLabel
        Left = 28
        Top = 32
        Width = 48
        Height = 13
        Caption = #29992#25143#21517#65306
        Transparent = True
      end
      object userpasedit: TLabeledEdit
        Left = 80
        Top = 64
        Width = 121
        Height = 21
        EditLabel.Width = 48
        EditLabel.Height = 13
        EditLabel.Caption = #23494'    '#30721#65306
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        LabelPosition = lpLeft
        PasswordChar = '#'
        TabOrder = 0
        OnKeyDown = userpaseditKeyDown
      end
      object usernamebox: TComboBox
        Left = 81
        Top = 28
        Width = 121
        Height = 21
        AutoDropDown = True
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 1
        OnKeyDown = usernameboxKeyDown
      end
    end
  end
  object ADOQuery: TADOQuery
    Connection = dataconfm.datacon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from czyb')
    Left = 48
    Top = 40
  end
end
