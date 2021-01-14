object frmNetWatch: TfrmNetWatch
  Left = 210
  Top = 161
  Width = 696
  Height = 480
  Caption = #22312#32593#32476#30417#35270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 25
    Width = 688
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Splitter2: TSplitter
    Left = 185
    Top = 28
    Height = 406
  end
  object Panel1: TPanel
    Left = 0
    Top = 28
    Width = 185
    Height = 406
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 0
    object TaskList: TListBox
      Left = 1
      Top = 1
      Width = 183
      Height = 404
      Align = alClient
      ItemHeight = 13
      Items.Strings = (
        #26412#26426#32593#32476#31471#21475#26816#27979',127.0.0.1,ping,10'
        #32593#20851#24320#26426#26816#27979',192.168.5.110,ping,10'
        #20844#21496#22495#21517#26381#21153#22120#26816#27979',192.168.0.4,ping,10'
        #25968#25454#24211#26381#21153#22120#26816#27979',192.168.5.53,ping,10')
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 25
    Align = alTop
    TabOrder = 1
    object btnReadTask: TBitBtn
      Left = 0
      Top = 0
      Width = 75
      Height = 25
      Caption = #35835#20837#20219#21153
      TabOrder = 0
      OnClick = btnReadTaskClick
    end
    object btnStartTask: TBitBtn
      Left = 80
      Top = 0
      Width = 75
      Height = 25
      Caption = #24320#22987#20219#21153
      TabOrder = 1
      OnClick = btnStartTaskClick
    end
    object btnStopTask: TBitBtn
      Left = 160
      Top = 0
      Width = 75
      Height = 25
      Caption = #20572#27490#20219#21153
      TabOrder = 2
      OnClick = btnStopTaskClick
    end
    object btnClose: TBitBtn
      Left = 240
      Top = 0
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 3
      OnClick = btnCloseClick
    end
  end
  object Panel2: TPanel
    Left = 188
    Top = 28
    Width = 500
    Height = 406
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 2
    object Splitter3: TSplitter
      Left = 1
      Top = 169
      Width = 498
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object CurentTaskLog: TMemo
      Left = 1
      Top = 1
      Width = 498
      Height = 168
      Align = alTop
      Lines.Strings = (
        'CurentTaskLog')
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 172
      Width = 498
      Height = 233
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = #20219#21153#26085#24535
        object TaskLog: TMemo
          Left = 0
          Top = 0
          Width = 490
          Height = 205
          Align = alClient
          Lines.Strings = (
            'TaskLog')
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object TabSheet2: TTabSheet
        Caption = #38169#35823#20449#24687
        ImageIndex = 1
        object ErrorLog: TMemo
          Left = 0
          Top = 0
          Width = 490
          Height = 205
          Align = alClient
          Lines.Strings = (
            'ErrorLog')
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  object Status: TStatusBar
    Left = 0
    Top = 434
    Width = 688
    Height = 19
    Panels = <
      item
        Text = #32593#32476#26426#22120#29366#24577#30417#35270
        Width = 150
      end
      item
        Text = 'DateTime'
        Width = 150
      end
      item
        Text = 'Logs'
        Width = 50
      end>
  end
  object PingTimer: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = PingTimerTimer
    Left = 196
    Top = 44
  end
  object PingClient: TIdIcmpClient
    OnReply = PingClientReply
    Left = 228
    Top = 44
  end
end
