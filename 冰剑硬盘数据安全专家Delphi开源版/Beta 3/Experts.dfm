object Form1: TForm1
  Left = 227
  Top = 112
  Width = 705
  Height = 530
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'BinJian Security Experts Beta 3'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object StatusBar: TStatusBar
    Left = 0
    Top = 465
    Width = 697
    Height = 19
    Hint = #29366#24577#26639
    Panels = <
      item
        Text = 'Sercurity Experts Beta 3'
        Width = 50
      end>
  end
  object Button1: TButton
    Left = 376
    Top = 0
    Width = 89
    Height = 33
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 272
    Top = 0
    Width = 97
    Height = 33
    Caption = 'BitBtn1'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Page: TcxPageControl
    Left = 0
    Top = 0
    Width = 697
    Height = 465
    ActivePage = cxTabSheet1
    Align = alTop
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 3
    ClientRectBottom = 465
    ClientRectRight = 697
    ClientRectTop = 23
    object EnPage: TcxTabSheet
      Caption = #21152#23494#24341#25806'(&Encrypt Engine)'
      ImageIndex = 0
      object EnFileList: TFlatListBox
        Left = 0
        Top = 24
        Width = 697
        Height = 389
        Version = '4.42.8.0'
        Caption = 'EnFileList'
        Skin.BarStartColor = clWhite
        Skin.BackStartColor = clWhite
        Skin.BorderColor = clBlack
        Skin.ItemLineColor = clWhite
        Skin.TitleHas = False
        Skin.TitleFont.Charset = DEFAULT_CHARSET
        Skin.TitleFont.Color = clWindowText
        Skin.TitleFont.Height = -12
        Skin.TitleFont.Name = #23435#20307
        Skin.TitleFont.Style = []
        TabOrder = 0
      end
      object FileEdit: TdcFileEdit
        Left = 0
        Top = 0
        Width = 553
        Height = 25
        AutoSize = False
        Color = clWindow
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        DlgType = dtOpen
        DlgFilter = 'All files (*.*)|*.*'
        DlgOptions = [ofHideReadOnly, ofEnableSizing]
        Button.Cursor = crDefault
        Button.Flat = True
        Button.Glyph.Data = {
          AA040000424DAA04000000000000360000002800000013000000130000000100
          18000000000074040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFF00
          0000FFFFFF000000000000FFFFFFFFFFFF000000FFFFFF000000FFFFFF000000
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FF
          FFFFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFF0000
          00FFFFFFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
          0000000000000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFF
          FF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000}
        Button.NumGlyphs = 1
        Button.Visible = True
        CursorBorder = crDefault
      end
      object AddBtn: TFlatButton
        Left = 552
        Top = 0
        Width = 73
        Height = 25
        Version = '4.42.8.0'
        ColorBorder = clBlack
        Caption = #28155#21152'(&A)'
        TabOrder = 2
        OnClick = addbtnClick
      end
      object FlatButton2: TFlatButton
        Left = 624
        Top = 0
        Width = 73
        Height = 25
        Version = '4.42.8.0'
        ColorBorder = clBlack
        Caption = #28165#31354'(&C)'
        TabOrder = 3
        OnClick = FlatButton2Click
      end
      object Erunbtn: TFlatButton
        Left = 552
        Top = 416
        Width = 145
        Height = 25
        Version = '4.42.8.0'
        ColorBorder = clBlack
        Caption = #25191#34892#25805#20316'(&O)'
        TabOrder = 4
        OnClick = ErunbtnClick
      end
    end
    object DePage: TcxTabSheet
      Caption = #35299#23494#24341#25806'(&Decrypt Engine)'
      ImageIndex = 1
      object Drunbtn: TFlatButton
        Left = 552
        Top = 416
        Width = 145
        Height = 25
        Version = '4.42.8.0'
        ColorBorder = clBlack
        Caption = #25191#34892#25805#20316'(&R)'
        TabOrder = 0
        OnClick = DrunbtnClick
      end
      object deFileEdit: TdcFileEdit
        Left = 0
        Top = 0
        Width = 617
        Height = 25
        AutoSize = False
        Color = clWindow
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        DlgType = dtOpen
        DlgFilter = 'BinJian Sercurity Experts (*.BSE)|*.BSE|All files (*.*)|*.*'
        DlgOptions = [ofHideReadOnly, ofEnableSizing]
        Button.Cursor = crDefault
        Button.Flat = True
        Button.Glyph.Data = {
          AA040000424DAA04000000000000360000002800000013000000130000000100
          18000000000074040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFF00
          0000FFFFFF000000000000FFFFFFFFFFFF000000FFFFFF000000FFFFFF000000
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FF
          FFFFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFF0000
          00FFFFFFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
          0000000000000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFF
          FF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000}
        Button.NumGlyphs = 1
        Button.Visible = True
        CursorBorder = crDefault
      end
      object OpenBtn: TFlatButton
        Left = 616
        Top = 0
        Width = 81
        Height = 25
        Version = '4.42.8.0'
        ColorBorder = clBlack
        Caption = #25171#24320'(&O)'
        TabOrder = 2
        OnClick = OpenBtnClick
      end
      object DeFileList: TFlatListBox
        Left = 0
        Top = 24
        Width = 697
        Height = 389
        Version = '4.42.8.0'
        Caption = 'EnFileList'
        Skin.BarStartColor = clWhite
        Skin.BackStartColor = clWhite
        Skin.BorderColor = clBlack
        Skin.ItemLineColor = clWhite
        Skin.TitleHas = False
        Skin.TitleFont.Charset = DEFAULT_CHARSET
        Skin.TitleFont.Color = clWindowText
        Skin.TitleFont.Height = -12
        Skin.TitleFont.Name = #23435#20307
        Skin.TitleFont.Style = []
        TabOrder = 3
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = #25991#26412#24341#25806'(&Text Engine)'
      ImageIndex = 2
      object Text: TFlatMemo
        Left = 0
        Top = 0
        Width = 697
        Height = 417
        Version = '4.42.8.0'
        ColorBorder = clBlack
        ColorFlat = clBtnFace
        ParentColor = True
        TabOrder = 0
        Lines.Strings = (
          'Text')
      end
      object TextEbtn: TFlatButton
        Left = 552
        Top = 416
        Width = 145
        Height = 25
        Version = '4.42.8.0'
        ColorBorder = clBlack
        Caption = #25191#34892#25805#20316'(&E)'
        TabOrder = 1
        OnClick = TextEbtnClick
      end
    end
  end
  object Titlebar: TFlatTitlebar
    Left = 0
    Top = 439
    Width = 553
    Height = 25
    Version = '4.42.8.0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ActiveTextColor = clWhite
    InactiveTextColor = 8559266
    TitlebarColor = clBlack
    Caption = 
      'BinJian Security Experts Beta 3 by BinJian 2007.6.10 Core Versoi' +
      'n 0.00.0610'
  end
  object zip: TVCLZip
    Left = 624
    Top = 69
  end
  object PopupMenu1: TPopupMenu
    Left = 568
    Top = 69
    object N3: TMenuItem
      Caption = #28165#31354'(&C)'
    end
  end
  object OpenDialog: TdcOpenDialog
    Filter = 'BinJian Sercurity Experts (*.BSE)|*.Bse|All files (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 600
    Top = 72
  end
  object lxpDraggingFilesMonitor1: TlxpDraggingFilesMonitor
    AcceptFilesControl = EnFileList
    OnDropFiles = lxpDraggingFilesMonitor1DropFiles
    Left = 528
    Top = 63
  end
  object MainMenu1: TMainMenu
    Left = 488
    Top = 63
    object N1: TMenuItem
      Caption = #25805#20316'(&E)'
      object N2: TMenuItem
        Caption = #21152#23494'(&E)'
        OnClick = N2Click
      end
      object D1: TMenuItem
        Caption = #35299#23494'(&D)'
        OnClick = D1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object N5: TMenuItem
        Caption = #20851#38381'(&C)'
        OnClick = N5Click
      end
    end
    object A2: TMenuItem
      Caption = #24110#21161'(&H)'
      object A1: TMenuItem
        Caption = #20851#20110'(&A)'
        OnClick = A1Click
      end
    end
  end
end
