object JfMainForm: TJfMainForm
  Left = 192
  Top = 107
  Width = 544
  Height = 375
  Caption = #30005#35805#35745#36153#31649#29702#31995#32479
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 536
    Height = 288
    Align = alClient
    ReadOnly = True
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 41
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 8
      Top = 8
      Width = 273
      Height = 20
      TabOrder = 1
      Text = '030209/0912:3000:01:2305196671599'
    end
  end
  object MSComm1: TMSComm
    Left = 80
    Top = 72
    Width = 32
    Height = 32
    OnComm = MSComm1Comm
    ControlData = {
      2143341208000000ED030000ED03000001568A64000006000000010050000000
      00020000802500000000080000000000000000003F00000001000000}
  end
  object MainMenu1: TMainMenu
    OwnerDraw = True
    Left = 40
    Top = 80
    object N1: TMenuItem
      Caption = #35805#21333#26597#35810'(&A)'
      object N3: TMenuItem
        Caption = #20998#26426#26032#32426#24405
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #20998#26426#26087#35760#24405
        OnClick = N4Click
      end
    end
    object B1: TMenuItem
      Caption = #35805#21333#32479#35745'(&B)'
      object N8: TMenuItem
        Caption = #20998#26426#26032#35760#24405
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #20998#26426#26087#35760#24405
        OnClick = N9Click
      end
    end
    object D1: TMenuItem
      Caption = #25968#25454#32500#25252'(&D)'
      object N17: TMenuItem
        Caption = #36153#29575#32500#25252
        OnClick = N17Click
      end
      object N18: TMenuItem
        Caption = #21442#25968#32500#25252
        OnClick = N18Click
      end
    end
    object N2: TMenuItem
      Caption = #31995#32479#35774#32622'(&E)'
      object N21: TMenuItem
        Caption = #21475#20196#35774#32622
        OnClick = N21Click
      end
      object N22: TMenuItem
        Caption = #21322#20215#35774#32622
        OnClick = N22Click
      end
      object N23: TMenuItem
        Caption = #35805#21333#21024#38500
        OnClick = N23Click
      end
      object N5: TMenuItem
        Caption = #31471#21475#35774#32622
        OnClick = N5Click
      end
    end
    object F1: TMenuItem
      Caption = #24110#21161'(&F)'
      object N24: TMenuItem
        Caption = #20851#20110'...'
        OnClick = N24Click
      end
    end
  end
  object XPMenu1: TXPMenu
    Font.Charset = GB2312_CHARSET
    Font.Color = clMenuText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Pitch = fpVariable
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
    FlatMenu = True
    AutoDetect = False
    Active = True
    Left = 136
    Top = 88
  end
end
