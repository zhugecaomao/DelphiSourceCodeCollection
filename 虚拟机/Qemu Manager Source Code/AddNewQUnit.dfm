object NewQVersion: TNewQVersion
  Left = 348
  Top = 332
  BorderStyle = bsDialog
  Caption = 'Qemu Version'
  ClientHeight = 209
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 1
    Width = 591
    Height = 176
    Caption = 'QEMU Version'
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Description:'
    end
    object Label3: TLabel
      Left = 8
      Top = 57
      Width = 45
      Height = 13
      Caption = 'Filename:'
    end
    object Label4: TLabel
      Left = 8
      Top = 97
      Width = 25
      Height = 13
      Caption = 'Path:'
    end
    object SpeedButton2: TSpeedButton
      Left = 368
      Top = 72
      Width = 33
      Height = 22
      Hint = 'Use Portable Qemu Path'
      Caption = '{QM}'
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 400
      Top = 72
      Width = 23
      Height = 22
      Hint = 'Select Path'
      Caption = '..'
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton3Click
    end
    object Name: TEdit
      Left = 7
      Top = 32
      Width = 386
      Height = 21
      TabOrder = 0
    end
    object fname: TEdit
      Left = 7
      Top = 72
      Width = 362
      Height = 21
      TabOrder = 1
    end
    object path: TEdit
      Left = 7
      Top = 112
      Width = 338
      Height = 21
      TabOrder = 2
    end
    object client: TCheckBox
      Left = 8
      Top = 136
      Width = 257
      Height = 17
      Caption = 'Use Qemu Manager QEMU Client'
      TabOrder = 3
    end
    object default: TCheckBox
      Left = 8
      Top = 152
      Width = 257
      Height = 17
      Caption = 'Set As Default'
      TabOrder = 4
    end
  end
  object Button1: TButton
    Left = 432
    Top = 182
    Width = 79
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 515
    Top = 182
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object OD: TTntOpenDialog
    DefaultExt = 'exe'
    Filter = 'Qemu Executables|*.exe'
    Title = 'Qemu Version'
    Left = 544
    Top = 41
  end
  object OD2: TOpenDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    OptionsEx = [ofExNoPlacesBar]
    Left = 496
    Top = 137
  end
end
