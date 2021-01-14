object MaskForm: TMaskForm
  Left = 595
  Top = 425
  BorderStyle = bsDialog
  Caption = 'Masked Text Editor'
  ClientHeight = 104
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object EditText: TFlatMaskEdit
    Left = 96
    Top = 8
    Width = 218
    Height = 19
    Version = '4.38.0.0'
    Ticket.Width = 51
    Ticket.Height = 13
    Ticket.Caption = 'Input Text:'
    ColorFlat = clBtnFace
    ParentColor = True
    Color = clBtnFace
    TabOrder = 0
  end
  object EditMask: TFlatEdit
    Left = 96
    Top = 40
    Width = 218
    Height = 19
    Version = '4.38.0.0'
    ColorFocused = clBtnFace
    ColorBorder = clBtnFace
    ColorFlat = clBtnFace
    ParentColor = True
    ReadOnly = True
    TabOrder = 1
    Text = '(None)'
    Ticket.Width = 50
    Ticket.Height = 13
    Ticket.Caption = 'Edit Mask:'
  end
  object Button1: TButton
    Left = 98
    Top = 72
    Width = 57
    Height = 22
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 256
    Top = 71
    Width = 57
    Height = 23
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
