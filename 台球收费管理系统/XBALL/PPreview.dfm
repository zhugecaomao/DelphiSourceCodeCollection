object Preview: TPreview
  Left = 28
  Top = 129
  Width = 640
  Height = 480
  Caption = #25253#34920#25171#21360#31383#21475
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 29
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      632
      29)
    object Button1: TButton
      Left = 9
      Top = 4
      Width = 75
      Height = 21
      Caption = #25171#21360'(&P)'
      Default = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 169
      Top = 4
      Width = 75
      Height = 21
      Cancel = True
      Caption = #36864#20986'(&X)'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 89
      Top = 4
      Width = 75
      Height = 21
      Caption = #32456#27490'(&T)'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 545
      Top = 4
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #36864#20986'(&X)'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object QRPreview1: TQRPreview
    Left = 0
    Top = 29
    Width = 632
    Height = 424
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    Color = clAppWorkSpace
    ParentColor = False
    TabOrder = 0
    PageNumber = 1
    Zoom = 100
  end
end
