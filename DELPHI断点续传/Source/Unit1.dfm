object Form1: TForm1
  Left = 278
  Top = 225
  Width = 388
  Height = 345
  Caption = #26029#28857#32493#20256#28436#31034
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 12
  object ListBox1: TListBox
    Left = 0
    Top = 153
    Width = 380
    Height = 165
    Align = alClient
    ItemHeight = 12
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 153
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 150
      Height = 12
      Caption = #19979#36733#25991#20214#22320#22336'(http'#25110#32773'ftp)'
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 78
      Height = 12
      Caption = #19979#36733#36827#24230'(0/0)'
    end
    object Button1: TButton
      Left = 48
      Top = 112
      Width = 75
      Height = 25
      Caption = #19979#36733'(&D)'
      TabOrder = 0
      OnClick = Button1Click
    end
    object ProgressBar1: TProgressBar
      Left = 16
      Top = 80
      Width = 345
      Height = 16
      TabOrder = 1
    end
    object Button2: TButton
      Left = 152
      Top = 112
      Width = 75
      Height = 25
      Caption = #20013#26029'(&A)'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 256
      Top = 112
      Width = 75
      Height = 25
      Caption = #36864#20986'(&X)'
      TabOrder = 3
      OnClick = Button3Click
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 32
      Width = 345
      Height = 20
      ItemHeight = 12
      TabOrder = 4
      Text = 'http://www.2ccc.com/uploads/demo.exe'
      Items.Strings = (
        'http://www.2ccc.com/uploads/demo.exe'
        'ftp://uploads:uploads@www.2ccc.com/demo.exe')
    end
  end
  object IdHTTP1: TIdHTTP
    OnStatus = IdHTTP1Status
    MaxLineAction = maException
    ReadTimeout = 0
    OnWork = IdHTTP1Work
    OnWorkBegin = IdHTTP1WorkBegin
    OnWorkEnd = IdHTTP1WorkEnd
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 208
    Top = 56
  end
  object IdFTP1: TIdFTP
    OnStatus = IdHTTP1Status
    MaxLineAction = maException
    ReadTimeout = 0
    OnWork = IdHTTP1Work
    OnWorkBegin = IdHTTP1WorkBegin
    OnWorkEnd = IdHTTP1WorkEnd
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 168
    Top = 56
  end
end
