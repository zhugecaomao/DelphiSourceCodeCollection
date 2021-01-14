object MainForm: TMainForm
  Left = 261
  Top = 165
  Width = 434
  Height = 430
  Caption = 'Windows '#20219#21153#31649#29702#22120
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 104
    Top = 32
    Width = 105
    Height = 105
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 426
    Height = 365
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24212#29992#31243#24207
      DesignSize = (
        418
        337)
      object TaskListView: TListView
        Left = 22
        Top = 24
        Width = 377
        Height = 281
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            Caption = #20219#21153
            Width = 250
          end
          item
            Caption = #29366#24577
            Width = 100
          end>
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        SmallImages = ImageList
        TabOrder = 0
        ViewStyle = vsReport
      end
      object Button1: TButton
        Left = 137
        Top = 311
        Width = 89
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #32467#26463#20219#21153'(&E)'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 234
        Top = 311
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #20999#25442#33267'(&S)'
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 315
        Top = 311
        Width = 87
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #26032#20219#21153'(&N)...'
        TabOrder = 3
        OnClick = Button3Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #36827#31243
      ImageIndex = 1
      DesignSize = (
        418
        337)
      object procListView: TListView
        Left = 24
        Top = 24
        Width = 377
        Height = 281
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            Caption = #26144#20687#21517#31216
            Width = 100
          end
          item
            Alignment = taRightJustify
            Caption = 'PID'
          end
          item
            Alignment = taRightJustify
            Caption = 'CPU'
          end
          item
            Alignment = taRightJustify
            Caption = 'CPU'#26102#38388
            Width = 70
          end
          item
            Alignment = taRightJustify
            Caption = #20869#23384#20351#29992
            Width = 100
          end>
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object endProcBtn: TButton
        Left = 298
        Top = 310
        Width = 101
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #32467#26463#36827#31243'(&E)'
        TabOrder = 1
        OnClick = endProcBtnClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = #24615#33021
      ImageIndex = 2
      object GroupBox1: TGroupBox
        Left = 120
        Top = 8
        Width = 283
        Height = 121
        Caption = 'CPU '#20351#29992#35760#24405
        TabOrder = 0
        object CpuPanel: TPanel
          Left = 12
          Top = 21
          Width = 260
          Height = 90
          BevelInner = bvLowered
          BevelOuter = bvLowered
          TabOrder = 0
          object CpuImg: TImage
            Left = 2
            Top = 2
            Width = 256
            Height = 86
            Align = alClient
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 120
        Top = 131
        Width = 284
        Height = 121
        Caption = #20869#23384#20351#29992#35760#24405
        TabOrder = 1
        object memPanel: TPanel
          Left = 12
          Top = 21
          Width = 260
          Height = 90
          BevelInner = bvLowered
          BevelOuter = bvLowered
          TabOrder = 0
          object memImg: TImage
            Left = 2
            Top = 2
            Width = 256
            Height = 86
            Align = alClient
          end
        end
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 365
    Width = 426
    Height = 19
    Panels = <
      item
        Width = 95
      end
      item
        Width = 120
      end
      item
        Width = 50
      end>
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 320
    Top = 96
  end
  object ImageList: TImageList
    Left = 268
    Top = 112
  end
  object MainMenu: TMainMenu
    Left = 156
    Top = 168
    object F1: TMenuItem
      Caption = #25991#20214'(&F)'
      object N1: TMenuItem
        Caption = #26032#20219#21153'('#36816#34892'...)(&N)'
        OnClick = N1Click
      end
      object X1: TMenuItem
        Caption = #36864#20986#20219#21153#31649#29702#22120'(&X)'
        OnClick = X1Click
      end
    end
    object N2: TMenuItem
      Caption = #36873#39033'(&Q)'
      object A1: TMenuItem
        Caption = #24635#22312#26368#21069#38754'(&A)'
        OnClick = A1Click
      end
    end
    object V1: TMenuItem
      Caption = #26597#30475'(&V)'
      object N4: TMenuItem
        Caption = #26356#26032#36895#24230'(&U)'
        object H2: TMenuItem
          Tag = 500
          Caption = #39640'(&H)'
          OnClick = N1Click
        end
        object N5: TMenuItem
          Tag = 1000
          Caption = #26631#20934'(&N)'
          Checked = True
          OnClick = N1Click
        end
        object N6: TMenuItem
          Tag = 2000
          Caption = #20302'(&L)'
          OnClick = N1Click
        end
        object N8: TMenuItem
          Caption = #26242#20572'(&P)'
          OnClick = N1Click
        end
      end
    end
    object H1: TMenuItem
      Caption = #24110#21161'(&H)'
      object N3: TMenuItem
        Caption = #20851#20110'...'
        OnClick = N3Click
      end
    end
  end
end
