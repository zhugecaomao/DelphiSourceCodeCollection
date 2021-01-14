object cardin: Tcardin
  Left = 198
  Top = 135
  BorderStyle = bsDialog
  Caption = #23548#20837#25968#25454
  ClientHeight = 252
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 408
    Height = 252
    ActivePage = TabSheet3
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Bevel1: TBevel
        Left = 0
        Top = 184
        Width = 401
        Height = 9
        Shape = bsTopLine
      end
      object Button1: TButton
        Left = 216
        Top = 192
        Width = 75
        Height = 25
        Caption = #19979#19968#27493
        Default = True
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 312
        Top = 192
        Width = 75
        Height = 25
        Cancel = True
        Caption = #21462#28040
        TabOrder = 1
        OnClick = Button2Click
      end
      object ListBox1: TListBox
        Left = 264
        Top = 32
        Width = 121
        Height = 129
        DragMode = dmAutomatic
        ItemHeight = 12
        TabOrder = 2
        OnDblClick = ListBox1DblClick
      end
      object DriveComboBox1: TDriveComboBox
        Left = 8
        Top = 32
        Width = 121
        Height = 18
        DirList = DirectoryListBox1
        TabOrder = 3
      end
      object DirectoryListBox1: TDirectoryListBox
        Left = 8
        Top = 64
        Width = 121
        Height = 97
        FileList = FileListBox1
        ItemHeight = 16
        TabOrder = 4
      end
      object FileListBox1: TFileListBox
        Left = 136
        Top = 32
        Width = 121
        Height = 129
        DragMode = dmAutomatic
        ItemHeight = 12
        Mask = '*.txt'
        MultiSelect = True
        TabOrder = 5
        OnDblClick = FileListBox1DblClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object Bevel2: TBevel
        Left = 0
        Top = 184
        Width = 400
        Height = 9
        Shape = bsTopLine
      end
      object Button3: TButton
        Left = 216
        Top = 192
        Width = 75
        Height = 25
        Caption = #19979#19968#27493
        Default = True
        TabOrder = 0
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 312
        Top = 192
        Width = 75
        Height = 25
        Cancel = True
        Caption = #21462#28040
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button5: TButton
        Left = 136
        Top = 192
        Width = 75
        Height = 25
        Caption = #19978#19968#27493
        TabOrder = 2
        OnClick = Button5Click
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 21
        Width = 369
        Height = 148
        Caption = #25991#20214#20869#23481
        TabOrder = 3
        object RichEdit1: TRichEdit
          Left = 16
          Top = 22
          Width = 329
          Height = 107
          BorderWidth = 1
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          HideSelection = False
          HideScrollBars = False
          ParentFont = False
          PlainText = True
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      object Bevel3: TBevel
        Left = 0
        Top = 184
        Width = 400
        Height = 9
        Shape = bsTopLine
      end
      object Gauge1: TGauge
        Left = 24
        Top = 80
        Width = 353
        Height = 17
        Progress = 0
      end
      object Label1: TLabel
        Left = 24
        Top = 56
        Width = 96
        Height = 12
        Caption = #23558#35201#23548#20837'11'#39029#25968#25454
      end
      object Label4: TLabel
        Left = 24
        Top = 112
        Width = 144
        Height = 12
        Caption = #30446#21069#27491#22312#23548#20837#31532'2'#39029#25968#25454'...'
        Visible = False
      end
      object Button6: TButton
        Left = 136
        Top = 192
        Width = 75
        Height = 25
        Caption = #19978#19968#27493
        TabOrder = 0
        OnClick = Button6Click
      end
      object Bb: TButton
        Left = 216
        Top = 120
        Width = 75
        Height = 25
        Caption = #23548#20837
        TabOrder = 1
        Visible = False
        OnClick = BbClick
      end
      object Button8: TButton
        Left = 312
        Top = 192
        Width = 75
        Height = 25
        Cancel = True
        Caption = #21462#28040
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button7: TButton
        Left = 216
        Top = 192
        Width = 75
        Height = 25
        Caption = #23548#20837
        Default = True
        TabOrder = 3
        OnClick = Button7Click
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 41
    BevelOuter = bvNone
    TabOrder = 1
    object Label3: TLabel
      Left = 40
      Top = 21
      Width = 80
      Height = 20
      Caption = #23548#20837#25968#25454
      Font.Charset = GB2312_CHARSET
      Font.Color = clWhite
      Font.Height = -20
      Font.Name = #40657#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 16
      Width = 80
      Height = 20
      Caption = #23548#20837#25968#25454
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #40657#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel4: TBevel
      Left = 136
      Top = 26
      Width = 249
      Height = 9
      Shape = bsTopLine
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Txt|*.txt'
    Left = 88
    Top = 216
  end
  object ADOTable1: TADOTable
    Connection = Main.ADOconn
    IndexName = 'id'
    TableName = 'r_staffinfo'
    Left = 100
    Top = 58
  end
end
