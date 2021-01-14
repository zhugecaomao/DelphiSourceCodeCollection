object tsSetNameDlg: TtsSetNameDlg
  Left = 280
  Top = 241
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'tsSetNameDlg'
  ClientHeight = 102
  ClientWidth = 255
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 28
    Width = 48
    Height = 13
    Caption = 'Setname :'
  end
  object txtSetName: TEdit
    Left = 72
    Top = 25
    Width = 155
    Height = 21
    TabOrder = 0
    Visible = False
    OnChange = txtSetNameChange
    OnKeyPress = txtSetNameKeyPress
  end
  object cmbSetNames: TComboBox
    Left = 72
    Top = 25
    Width = 155
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    Visible = False
  end
  object butCancel: TButton
    Left = 160
    Top = 68
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object butOK: TButton
    Left = 82
    Top = 68
    Width = 75
    Height = 25
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 3
    OnClick = butOKClick
  end
end
