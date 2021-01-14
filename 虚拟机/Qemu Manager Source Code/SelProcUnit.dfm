object SelProc: TSelProc
  Left = 363
  Top = 341
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Processors'
  ClientHeight = 115
  ClientWidth = 507
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
    Caption = 'Processors'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 289
      Height = 13
      Caption = 'Specify the total amount of processors for the Virtual Machine'
    end
    object Label2: TLabel
      Left = 124
      Top = 36
      Width = 55
      Height = 13
      Caption = 'Processors.'
    end
    object SE: TSpinEdit
      Left = 8
      Top = 32
      Width = 113
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
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
