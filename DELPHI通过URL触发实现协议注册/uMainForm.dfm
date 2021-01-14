object MainForm: TMainForm
  Left = 366
  Top = 310
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21327#35758#27880#20876#24037#20855
  ClientHeight = 193
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 174
    Width = 357
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 4
    Width = 349
    Height = 89
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 20
      Width = 77
      Height = 13
      AutoSize = False
      Caption = #21327#35758#21517#31216#65306
    end
    object Label2: TLabel
      Left = 12
      Top = 44
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #21327#35758#31243#24207#65306
    end
    object txtProtocolName: TEdit
      Left = 84
      Top = 16
      Width = 228
      Height = 21
      TabOrder = 0
    end
    object txtProtocolApplication: TEdit
      Left = 84
      Top = 40
      Width = 228
      Height = 21
      TabOrder = 1
    end
    object btnBrowser: TButton
      Left = 316
      Top = 40
      Width = 21
      Height = 21
      Caption = '...'
      TabOrder = 2
      OnClick = btnBrowserClick
    end
    object chkUseAsParams: TCheckBox
      Left = 84
      Top = 66
      Width = 97
      Height = 17
      Caption = #20801#35768#21442#25968
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object btnRegProtocol: TButton
    Left = 4
    Top = 142
    Width = 89
    Height = 25
    Caption = #27880#20876#21327#35758
    TabOrder = 2
    OnClick = btnRegProtocolClick
  end
  object btnUnRegProtocol: TButton
    Left = 100
    Top = 142
    Width = 89
    Height = 25
    Caption = #21368#36733#21327#35758
    TabOrder = 3
    OnClick = btnUnRegProtocolClick
  end
  object btnClose: TButton
    Left = 277
    Top = 142
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 4
    OnClick = btnCloseClick
  end
  object pnlProtocolUrl: TPanel
    Left = 4
    Top = 100
    Width = 349
    Height = 33
    BevelInner = bvLowered
    Color = clInfoBk
    TabOrder = 5
  end
end
