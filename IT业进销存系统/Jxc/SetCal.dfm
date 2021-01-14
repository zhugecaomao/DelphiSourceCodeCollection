object frmSetCal: TfrmSetCal
  Left = 256
  Top = 151
  Width = 132
  Height = 200
  BorderStyle = bsSizeToolWin
  Caption = '¼ÆËãÆ÷'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape2: TShape
    Left = 1
    Top = 1
    Width = 122
    Height = 172
    Anchors = [akLeft, akTop, akRight, akBottom]
    Brush.Color = clSilver
  end
  object Button7: TSpeedButton
    Left = 6
    Top = 32
    Width = 24
    Height = 24
    Caption = '7'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = NumberButtonClick
  end
  object Button8: TSpeedButton
    Left = 35
    Top = 32
    Width = 24
    Height = 24
    Caption = '8'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = NumberButtonClick
  end
  object Button9: TSpeedButton
    Left = 64
    Top = 32
    Width = 24
    Height = 24
    GroupIndex = 1
    Caption = '9'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = NumberButtonClick
  end
  object DivideButton: TSpeedButton
    Left = 93
    Top = 32
    Width = 24
    Height = 24
    Caption = '/'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = DoCalc
  end
  object Button4: TSpeedButton
    Left = 6
    Top = 60
    Width = 24
    Height = 23
    Caption = '4'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = NumberButtonClick
  end
  object Button1: TSpeedButton
    Left = 6
    Top = 88
    Width = 24
    Height = 23
    Caption = '1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = NumberButtonClick
  end
  object Button0: TSpeedButton
    Left = 6
    Top = 116
    Width = 24
    Height = 23
    GroupIndex = 1
    Caption = '0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = NumberButtonClick
  end
  object ClearButton: TSpeedButton
    Left = 6
    Top = 144
    Width = 24
    Height = 23
    Caption = 'C'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = ClearButtonClick
  end
  object Button2: TSpeedButton
    Left = 35
    Top = 88
    Width = 24
    Height = 23
    Caption = '2'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = NumberButtonClick
  end
  object PointButton: TSpeedButton
    Left = 35
    Top = 116
    Width = 24
    Height = 23
    Caption = '.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = PointButtonClick
  end
  object Button6: TSpeedButton
    Left = 64
    Top = 60
    Width = 24
    Height = 23
    Caption = '6'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = NumberButtonClick
  end
  object MultiplyButton: TSpeedButton
    Left = 93
    Top = 60
    Width = 24
    Height = 23
    Caption = '*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = DoCalc
  end
  object Button3: TSpeedButton
    Left = 64
    Top = 88
    Width = 24
    Height = 23
    Caption = '3'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = NumberButtonClick
  end
  object MinusButton: TSpeedButton
    Left = 93
    Top = 88
    Width = 24
    Height = 23
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = DoCalc
  end
  object NegativeButton: TSpeedButton
    Left = 64
    Top = 116
    Width = 24
    Height = 23
    Caption = '+/-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = NegativeButtonClick
  end
  object BackButton: TSpeedButton
    Left = 35
    Top = 144
    Width = 24
    Height = 23
    Caption = '<-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = BackButtonClick
  end
  object EqualButton: TSpeedButton
    Left = 64
    Top = 144
    Width = 53
    Height = 23
    Caption = '='
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = DoCalc
  end
  object PlusButton: TSpeedButton
    Left = 93
    Top = 116
    Width = 24
    Height = 23
    Caption = '+'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = DoCalc
  end
  object Button5: TSpeedButton
    Left = 35
    Top = 60
    Width = 24
    Height = 23
    Caption = '5'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = NumberButtonClick
  end
  object DisplayPanel: TPanel
    Left = 6
    Top = 7
    Width = 111
    Height = 20
    Alignment = taRightJustify
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = '0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
end
