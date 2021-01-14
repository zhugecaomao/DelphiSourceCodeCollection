object Form4: TForm4
  Left = 0
  Top = 0
  Caption = #32593#32476#25991#20214#20849#20139' V2008'
  ClientHeight = 590
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  GlassFrame.Bottom = 60
  GlassFrame.Left = 10
  GlassFrame.Right = 10
  GlassFrame.Top = 40
  object Splitter1: TSplitter
    Left = 209
    Top = 40
    Height = 490
    ExplicitLeft = 272
    ExplicitTop = 372
    ExplicitHeight = 100
  end
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 209
    Height = 490
    Align = alLeft
    TabOrder = 0
    object ListView1: TListView
      Left = 1
      Top = 1
      Width = 207
      Height = 488
      Align = alClient
      Columns = <
        item
          Caption = #35745#31639#26426#21517#31216
          Width = 200
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      GridLines = True
      HotTrack = True
      HotTrackStyles = [htUnderlineCold, htUnderlineHot]
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = ListView1Click
    end
  end
  object Panel2: TPanel
    Left = 212
    Top = 40
    Width = 372
    Height = 490
    Align = alClient
    TabOrder = 1
    object TreeView1: TTreeView
      Left = 1
      Top = 1
      Width = 370
      Height = 488
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Indent = 20
      MultiSelect = True
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      OnDragDrop = TreeView1DragDrop
      OnDragOver = TreeView1DragOver
      OnMouseDown = TreeView1MouseDown
      Items.NodeData = {
        0101000000210000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        00047151AB4E87656368}
    end
    object Memo1: TMemo
      Left = 108
      Top = 436
      Width = 221
      Height = 21
      Lines.Strings = (
        'Memo1')
      TabOrder = 1
      Visible = False
      WordWrap = False
    end
    object Memo2: TMemo
      Left = 100
      Top = 292
      Width = 221
      Height = 97
      Lines.Strings = (
        'Memo1')
      TabOrder = 2
      WordWrap = False
    end
    object Memo3: TMemo
      Left = 100
      Top = 395
      Width = 221
      Height = 21
      Lines.Strings = (
        'Memo1')
      TabOrder = 3
      Visible = False
      WordWrap = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 40
    Align = alTop
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 0
    Top = 530
    Width = 584
    Height = 60
    Align = alBottom
    TabOrder = 3
    object Panel5: TPanel
      Left = 1
      Top = 36
      Width = 582
      Height = 23
      Align = alBottom
      BevelOuter = bvLowered
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Button1: TButton
      Left = 20
      Top = 5
      Width = 75
      Height = 25
      Caption = #21047#26032
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 296
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 236
    Top = 356
    object N1: TMenuItem
      Caption = #21019#24314#25991#20214#22841
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #21024#38500
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #21047#26032
    end
  end
  object DropFileSource1: TDropFileSource
    DragTypes = [dtCopy, dtLink]
    Left = 208
    Top = 356
  end
  object DropURLSource1: TDropURLSource
    DragTypes = [dtCopy, dtLink]
    Left = 328
    Top = 500
  end
  object DropURLTarget1: TDropURLTarget
    DragTypes = [dtCopy, dtLink]
    GetDataOnEnter = True
    Left = 300
    Top = 500
  end
  object IdUDPClient1: TIdUDPClient
    BroadcastEnabled = True
    Host = '255.255.255.255'
    Port = 8000
    Left = 228
    Top = 160
  end
  object IdUDPServer1: TIdUDPServer
    Bindings = <>
    DefaultPort = 8000
    OnUDPRead = IdUDPServer1UDPRead
    Left = 260
    Top = 160
  end
end
