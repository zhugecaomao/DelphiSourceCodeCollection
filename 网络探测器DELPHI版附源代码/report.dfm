object frmReport: TfrmReport
  Left = 572
  Top = 71
  Width = 389
  Height = 528
  Caption = #27426#36814#20351#29992'"'#27927#30871#34411'"'#36719#20214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    381
    501)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 7
    Width = 76
    Height = 18
    AutoSize = False
    Caption = #26816#27979#25253#21578':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 124
    Top = 443
    Width = 67
    Height = 13
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = #26816#27979#27425#25968
    Color = clAqua
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label19: TLabel
    Left = 16
    Top = 443
    Width = 50
    Height = 13
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = #32447#31243#25968
  end
  object Label2: TLabel
    Left = 259
    Top = 444
    Width = 67
    Height = 13
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = #26377#25928#26816#27979
    Color = clAqua
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 9
    Top = 473
    Width = 282
    Height = 24
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = #20320#35201#26377#32784#24515'!  '#24930#24930#31561'...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    Layout = tlCenter
  end
  object Edit9: TEdit
    Left = 188
    Top = 440
    Width = 66
    Height = 21
    Anchors = [akLeft, akBottom]
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clAqua
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    Text = '0'
  end
  object Edit14: TEdit
    Left = 62
    Top = 440
    Width = 52
    Height = 21
    Anchors = [akLeft, akBottom]
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clAqua
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Text = '0'
  end
  object Edit1: TEdit
    Left = 326
    Top = 440
    Width = 52
    Height = 21
    Anchors = [akLeft, akBottom]
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    Text = '0'
  end
  object Button1: TButton
    Left = 314
    Top = 474
    Width = 59
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #36864#20986
    TabOrder = 3
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 5
    Top = 30
    Width = 372
    Height = 402
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 4
    object Splitter1: TSplitter
      Left = 0
      Top = 253
      Width = 372
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object ok_info: TMemo
      Left = 0
      Top = 256
      Width = 372
      Height = 146
      Align = alClient
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HideSelection = False
      ParentFont = False
      PopupMenu = PopupMenu1
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object all_info: TMemo
      Left = 0
      Top = 0
      Width = 372
      Height = 253
      Align = alTop
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HideSelection = False
      ParentFont = False
      PopupMenu = PopupMenu1
      ScrollBars = ssHorizontal
      TabOrder = 1
      WordWrap = False
    end
  end
  object BitBtn6: TBitBtn
    Left = 307
    Top = 2
    Width = 65
    Height = 24
    Anchors = [akTop, akRight]
    Caption = #20572#27490
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn6Click
  end
  object PopupMenu1: TPopupMenu
    Left = 254
    Top = 262
    object N4: TMenuItem
      Caption = #23548#20837'...'
      OnClick = N4Click
    end
    object N3: TMenuItem
      Caption = #23548#20986'...'
      OnClick = N3Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #28165#38500
      OnClick = N1Click
    end
  end
end
