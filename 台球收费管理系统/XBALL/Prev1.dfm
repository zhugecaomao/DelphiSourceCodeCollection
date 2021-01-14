object Preview: TPreview
  Left = 10
  Top = 34
  Width = 640
  Height = 480
  Caption = '报表打印窗口'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = '宋体'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 535
    Top = 0
    Width = 97
    Height = 453
    Align = alRight
    TabOrder = 1
    object Button1: TButton
      Left = 11
      Top = 110
      Width = 75
      Height = 25
      Caption = '打　印'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 11
      Top = 214
      Width = 75
      Height = 25
      Caption = '退　出'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 11
      Top = 318
      Width = 75
      Height = 25
      Caption = '终止打印'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object QRPreview1: TQRPreview
    Left = 0
    Top = 0
    Width = 535
    Height = 453
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    TabOrder = 0
    PageNumber = 1
    Zoom = 100
  end
end
