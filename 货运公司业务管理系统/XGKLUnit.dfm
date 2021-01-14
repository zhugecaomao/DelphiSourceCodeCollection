object XGKLForm: TXGKLForm
  Left = 301
  Top = 120
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #20462#25913#21475#20196
  ClientHeight = 275
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object FlatPanel1: TFlatPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 275
    ParentColor = True
    Align = alClient
    TabOrder = 0
    object AALabel1: TAALabel
      Left = 40
      Top = 48
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #29992#25143#21517#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel2: TAALabel
      Left = 39
      Top = 94
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #21407#21475#20196#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel3: TAALabel
      Left = 39
      Top = 144
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #26032#21475#20196#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel4: TAALabel
      Left = 29
      Top = 192
      Width = 65
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #30830#35748#21475#20196#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object FlatSpeedButton1: TFlatSpeedButton
      Left = 90
      Top = 232
      Width = 38
      Height = 23
      Caption = #30830#35748
      OnClick = FlatSpeedButton1Click
    end
    object FlatSpeedButton2: TFlatSpeedButton
      Left = 179
      Top = 232
      Width = 38
      Height = 23
      Caption = #21462#28040
      OnClick = FlatSpeedButton2Click
    end
    object Edit1: TEdit
      Left = 107
      Top = 48
      Width = 121
      Height = 19
      Color = clTeal
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 107
      Top = 92
      Width = 121
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 108
      Top = 140
      Width = 121
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 107
      Top = 191
      Width = 121
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
  end
end
