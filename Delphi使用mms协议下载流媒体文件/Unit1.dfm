object Form1: TForm1
  Left = 138
  Top = 175
  Width = 790
  Height = 531
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 97
    Align = alTop
    TabOrder = 0
    object edtHost: TEdit
      Left = 16
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '218.30.8.12'
    end
    object edtPort: TEdit
      Left = 144
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '1755'
    end
    object btnDownLoad: TButton
      Left = 400
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Download'
      TabOrder = 2
      OnClick = btnDownLoadClick
    end
    object btnDisConnect: TButton
      Left = 496
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Disconnect'
      TabOrder = 3
      OnClick = btnDisConnectClick
    end
    object btnClear: TButton
      Left = 592
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Clear'
      TabOrder = 4
      OnClick = btnClearClick
    end
    object edtDestFile: TEdit
      Left = 16
      Top = 67
      Width = 753
      Height = 21
      TabOrder = 5
      Text = 'e:/MMS.wmv'
    end
    object btnTest: TButton
      Left = 688
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Test'
      TabOrder = 6
      OnClick = btnTestClick
    end
    object edtSourceFile: TEdit
      Left = 16
      Top = 40
      Width = 753
      Height = 21
      TabOrder = 7
      Text = 
        '/vod1/sport/soccer_video_l/050315-8.wmv?str=17464ff53125c07f80c0' +
        '84d07d0d2bab&useraccount=1110932752315&timestamp=1110932752&flag' +
        '=1'
    end
    object edtStartPacketNO: TEdit
      Left = 272
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 8
      Text = '0'
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 97
    Width = 782
    Height = 388
    Align = alClient
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 485
    Width = 782
    Height = 19
    Panels = <>
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 600
    Top = 152
  end
end
