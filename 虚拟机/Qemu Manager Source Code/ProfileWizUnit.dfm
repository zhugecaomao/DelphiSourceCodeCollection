object DefProWiz: TDefProWiz
  Left = 302
  Top = 338
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Qemu Manager First Run Wizard'
  ClientHeight = 295
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = TntFormCloseQuery
  OnCreate = TntFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TTntBevel
    Left = 0
    Top = 49
    Width = 549
    Height = 1
    Align = alTop
  end
  object Label1: TLabel
    Left = 3
    Top = 278
    Width = 357
    Height = 13
    Caption = 
      '* Please note: Qemu Manager 5.0 will only work with QEMU 0.9.0 O' +
      'nwards!'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Panel2: TTntPanel
    Left = 0
    Top = 0
    Width = 549
    Height = 49
    Align = alTop
    Color = clWhite
    TabOrder = 0
    object Label5: TTntLabel
      Left = 8
      Top = 16
      Width = 474
      Height = 13
      Caption = 
        'Welcome to Qemu Manager! - Before you can use this software plea' +
        'se specify some default settings.'
    end
  end
  object OK: TButton
    Left = 390
    Top = 268
    Width = 74
    Height = 25
    Caption = 'OK'
    Enabled = False
    ModalResult = 1
    TabOrder = 1
    OnClick = OKClick
  end
  object Button2: TButton
    Left = 468
    Top = 268
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 53
    Width = 545
    Height = 211
    Caption = 'Default Settings'
    TabOrder = 3
    object Label11: TTntLabel
      Left = 8
      Top = 54
      Width = 117
      Height = 13
      Caption = 'Default Keyboard Layout'
    end
    object TntLabel1: TTntLabel
      Left = 8
      Top = 17
      Width = 124
      Height = 13
      Caption = 'Qemu Manager Language'
    end
    object Label2: TLabel
      Left = 5
      Top = 116
      Width = 367
      Height = 65
      Caption = 
        'The Qemu Manager QEMU Client is a new feature which allows you t' +
        'o control'#13#10'QEMU without entering lines of text into the QEMU mon' +
        'itor, making changing '#13#10'cd/floppy media, as easy as clicking a b' +
        'utton!. '#13#10#13#10
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Kqemu: TCheckBox
      Left = 9
      Top = 93
      Width = 465
      Height = 17
      Caption = 'Install && Enable KQEMU Accelerator Support.'
      TabOrder = 0
    end
    object Keyb: TTntComboBox
      Left = 8
      Top = 68
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = LangChange
      Items.Strings = (
        'ar'
        'da'
        'de'
        'de-ch '
        'en-gb'
        'en-us'
        'es'
        'et'
        'fi'
        'fo'
        'fr'
        'fr-be'
        'fr-ca'
        'fr-ch'
        'hr'
        'hu'
        'is'
        'it'
        'ja'
        'lt'
        'lv'
        'mk'
        'nl'
        'nl-be'
        'no'
        'pl'
        'pt'
        'pt-br'
        'ru'
        'sl'
        'sv'
        'th'
        'tr')
    end
    object Lang: TTntComboBox
      Left = 8
      Top = 31
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'English'
      OnChange = LangChange
      Items.Strings = (
        'English')
    end
    object Client: TCheckBox
      Left = 6
      Top = 160
      Width = 465
      Height = 17
      Caption = 'Enable the Qemu Manager QEMU Client by default.'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
end
