object WaitForm: TWaitForm
  Left = 247
  Top = 168
  BorderStyle = bsNone
  Caption = 'WaitForm'
  ClientHeight = 123
  ClientWidth = 242
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 242
    Height = 123
    Align = alClient
    BevelInner = bvLowered
    Color = clMoneyGreen
    TabOrder = 0
    object Label4: TLabel
      Left = 96
      Top = 64
      Width = 126
      Height = 12
      Caption = #27491#22312#36827#34892#20013#65292#35831#31245#20505'...'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 70
      Top = 38
      Width = 85
      Height = 19
      Caption = #35828#26126#20449#24687
      Font.Charset = GB2312_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 71
      Top = 38
      Width = 85
      Height = 19
      Caption = #35828#26126#20449#24687
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Animate1: TAnimate
      Left = 16
      Top = 32
      Width = 48
      Height = 50
      Active = False
      CommonAVI = aviFindFile
      StopFrame = 23
    end
  end
end
