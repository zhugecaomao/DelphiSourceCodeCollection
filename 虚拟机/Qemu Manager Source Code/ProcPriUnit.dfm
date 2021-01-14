object Proc: TProc
  Left = 137
  Top = 206
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Priority'
  ClientHeight = 115
  ClientWidth = 508
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
    Left = 1
    Top = 0
    Width = 504
    Height = 86
    Caption = 'Process Priority'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 323
      Height = 13
      Caption = 
        'Please select the priority QEMU should run at on startup (CAUTIO' +
        'N).'
    end
    object CB: TComboBox
      Left = 9
      Top = 33
      Width = 288
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'Low'
        'Below Normal'
        'Normal'
        'Above Normal'
        'High'
        'Realtime')
    end
  end
  object Button1: TButton
    Left = 350
    Top = 88
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 429
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
