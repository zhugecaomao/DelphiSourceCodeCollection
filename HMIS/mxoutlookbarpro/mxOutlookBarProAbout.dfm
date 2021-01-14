object frm_OutlookProAboutBox: Tfrm_OutlookProAboutBox
  Left = 386
  Top = 451
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'About Component'
  ClientHeight = 189
  ClientWidth = 309
  Color = 10930928
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_Copyright: TLabel
    Left = 10
    Top = 63
    Width = 244
    Height = 13
    Caption = 'Copyright (C) 2002 Bitvadász Kft. All rights reserved.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Lbl_ComponentName: TLabel
    Left = 10
    Top = 33
    Width = 321
    Height = 24
    AutoSize = False
    Caption = 'Component Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 10
    Top = 83
    Width = 214
    Height = 13
    Caption = 'This component was created by Lajos Farkas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 10
    Top = 102
    Width = 39
    Height = 13
    Caption = 'E-mail:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 10
    Top = 121
    Width = 51
    Height = 13
    Caption = 'Website:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 66
    Top = 102
    Width = 141
    Height = 13
    Caption = 'support@maxcomponents.net'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 66
    Top = 121
    Width = 122
    Height = 13
    Caption = 'www.maxcomponents.net'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 148
    Width = 309
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = clNavy
    TabOrder = 0
    object btn_WebSite: TSpeedButton
      Left = 8
      Top = 10
      Width = 65
      Height = 22
      Caption = '&Website'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btn_WebSiteClick
    end
    object btn_Close: TSpeedButton
      Left = 240
      Top = 10
      Width = 65
      Height = 22
      Caption = '&OK'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btn_CloseClick
    end
    object SpeedButton1: TSpeedButton
      Left = 80
      Top = 10
      Width = 65
      Height = 22
      Caption = '&E-mail'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 309
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' About component'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnMouseDown = Panel2MouseDown
  end
end
