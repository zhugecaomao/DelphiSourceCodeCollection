object search: Tsearch
  Left = 296
  Top = 244
  BorderStyle = bsDialog
  Caption = #25628#32034
  ClientHeight = 95
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Button1: TButton
    Left = 288
    Top = 8
    Width = 75
    Height = 25
    Caption = #26597#35810
    Default = True
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 288
    Top = 40
    Width = 75
    Height = 25
    Cancel = True
    Caption = #20851#38381
    TabOrder = 1
    OnClick = Button2Click
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 273
    Height = 77
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 48
      Height = 12
      Caption = #20869#12288#12288#23481
    end
    object Edit1: TEdit
      Left = 72
      Top = 28
      Width = 177
      Height = 20
      TabOrder = 0
    end
  end
end
