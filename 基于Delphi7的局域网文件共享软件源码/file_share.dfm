object Form4: TForm4
  Left = 246
  Top = 148
  Width = 592
  Height = 649
  Caption = #32593#32476#25991#20214#20849#20139' V2008'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 209
    Top = 40
    Height = 468
  end
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 209
    Height = 468
    Align = alLeft
    TabOrder = 0
    object ListView1: TListView
      Left = 1
      Top = 1
      Width = 207
      Height = 466
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
      ParentFont = False
      PopupMenu = PopupMenu2
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = ListView1Click
    end
  end
  object Panel2: TPanel
    Left = 212
    Top = 40
    Width = 372
    Height = 468
    Align = alClient
    TabOrder = 1
    object TreeView1: TTreeView
      Left = 1
      Top = 1
      Width = 370
      Height = 466
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Indent = 20
      MultiSelect = True
      MultiSelectStyle = [msShiftSelect]
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      OnDblClick = TreeView1DblClick
      OnDragDrop = TreeView1DragDrop
      OnDragOver = TreeView1DragOver
      OnMouseDown = TreeView1MouseDown
      OnMouseUp = TreeView1MouseUp
    end
    object Memo1: TMemo
      Left = 108
      Top = 184
      Width = 221
      Height = 25
      Lines.Strings = (
        'Memo1')
      TabOrder = 1
      Visible = False
      WordWrap = False
    end
    object TreeView2: TTreeView
      Left = 109
      Top = 268
      Width = 40
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Indent = 20
      MultiSelect = True
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 2
      Visible = False
      OnDblClick = TreeView1DblClick
      OnDragDrop = TreeView1DragDrop
      OnDragOver = TreeView1DragOver
      OnMouseDown = TreeView1MouseDown
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 40
    Align = alTop
    TabOrder = 2
    object Label2: TLabel
      Left = 116
      Top = 20
      Width = 8
      Height = 15
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 4
      Top = 20
      Width = 120
      Height = 15
      Caption = #24403#21069#20849#20139#35745#31639#26426#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 508
    Width = 584
    Height = 87
    Align = alBottom
    TabOrder = 3
    object Label1: TLabel
      Left = 4
      Top = 32
      Width = 8
      Height = 15
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 232
      Top = 8
      Width = 23
      Height = 22
      OnClick = SpeedButton1Click
    end
    object Panel5: TPanel
      Left = 1
      Top = 63
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
    object ProgressBar1: TProgressBar
      Left = 1
      Top = 48
      Width = 582
      Height = 15
      Align = alBottom
      TabOrder = 1
    end
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 236
    Top = 356
    object N7: TMenuItem
      Caption = #25335#36125
      OnClick = N7Click
    end
    object N13: TMenuItem
      Caption = #37325#21629#21517
    end
    object N3: TMenuItem
      Caption = #21024#38500
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #21019#24314#25991#20214#22841
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #21047#26032
    end
  end
  object IdUDPClient1: TIdUDPClient
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
  object PopupMenu2: TPopupMenu
    AutoHotkeys = maManual
    Left = 88
    Top = 104
    object N6: TMenuItem
      Caption = #21047#26032
      OnClick = N6Click
    end
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    Left = 276
    Top = 64
    object N9: TMenuItem
      Caption = #25991#20214
      object N10: TMenuItem
        Caption = #25335#36125
        OnClick = N10Click
      end
      object N4: TMenuItem
        Caption = #21024#38500
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object N12: TMenuItem
        Caption = #37325#21629#21517
      end
    end
  end
end
