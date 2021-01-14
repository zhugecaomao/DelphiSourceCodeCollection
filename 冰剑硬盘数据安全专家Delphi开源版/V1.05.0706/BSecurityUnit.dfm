object Form1: TForm1
  Left = 547
  Top = 414
  AlphaBlendValue = 200
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'BinJian Security Experts '
  ClientHeight = 231
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  ParentBiDiMode = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 361
    Height = 25
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object FileEdit: TdcFileEdit
      Left = 1
      Top = 1
      Width = 359
      Height = 23
      AutoSize = False
      Color = clWindow
      TabOrder = 0
      Text = #22312#27492#38190#20837#65292#25110#30452#25509#25302#20837'!'
      DlgType = dtOpen
      DlgFilter = 'All files (*.*)|*.*'
      DlgOptions = [ofHideReadOnly, ofEnableSizing]
      OnDlgOk = FileEditDlgOk
      Align = alClient
      Button.Cursor = crDefault
      Button.Flat = False
      Button.Glyph.Data = {
        42030000424D420300000000000036000000280000000F0000000D0000000100
        2000000000000C03000000000000000000000000000000000000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000080
        8000008080000080800000808000008080000080800000808000008080000000
        0000C0C0C000C0C0C000C0C0C000C0C0C0000000000000FFFF00000000000080
        8000008080000080800000808000008080000080800000808000008080000000
        0000C0C0C000C0C0C000C0C0C00000000000FFFFFF0000FFFF00000000000080
        8000008080000080800000808000008080000080800000808000008080000000
        0000C0C0C000C0C0C0000000000000FFFF00FFFFFF0000FFFF00000000000000
        000000000000000000000000000000000000000000000000000000000000C0C0
        C000C0C0C00000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF0000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C0000000000000FFFF00FFFFFF0000FFFF000000000000000000000000000000
        00000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C0000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C00000000000C0C0C000C0C0C000C0C0C0000000
        0000C0C0C00000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000000000000000000000000000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000}
      Button.NumGlyphs = 1
      Button.Visible = True
      CursorBorder = crDefault
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 25
    Width = 361
    Height = 72
    Align = alTop
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    object Info: TLabel
      Left = 64
      Top = 16
      Width = 3
      Height = 13
    end
    object Shape1: TShape
      Left = 8
      Top = 16
      Width = 41
      Height = 41
    end
    object Img: TImage
      Left = 8
      Top = 16
      Width = 41
      Height = 41
      Center = True
    end
    object FileListBox: TFileListBox
      Left = 0
      Top = 72
      Width = 5000
      Height = 65
      ItemHeight = 13
      TabOrder = 0
      Visible = False
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 168
    Width = 361
    Height = 24
    Align = alBottom
    TabOrder = 2
    object PWEdit: TLabeledEdit
      Left = 50
      Top = 1
      Width = 311
      Height = 21
      EditLabel.Width = 41
      EditLabel.Height = 13
      EditLabel.Caption = #23494#30721'(&P) '
      Enabled = False
      LabelPosition = lpLeft
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 192
    Width = 361
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Dbtn: TButton
      Left = 264
      Top = 8
      Width = 89
      Height = 25
      Caption = #37322#25918#26723#26696'(&D)'
      Enabled = False
      TabOrder = 0
      OnClick = DbtnClick
    end
    object EBtn: TButton
      Left = 168
      Top = 8
      Width = 89
      Height = 25
      Caption = #26500#24314#26723#26696'(&E)'
      Enabled = False
      TabOrder = 1
      OnClick = EBtnClick
    end
    object DelCheck: TCheckBox
      Left = 8
      Top = 8
      Width = 153
      Height = 25
      Caption = #26723#26696#23436#25104#21518#21024#38500#28304#25991#20214'(&I)'
      Enabled = False
      TabOrder = 2
    end
  end
  object P: TPanel
    Left = 0
    Top = 97
    Width = 361
    Height = 24
    Align = alTop
    Caption = #35831#20808#36873#23450#26723#26696#65292#25353'{'#21152#23494'}'#25353#38062#21152#23494#23427#25110#25353'{'#35299#23494'}'#25353#38062#35299#23494#23427'!'
    TabOrder = 4
  end
  object Panel5: TPanel
    Left = 0
    Top = 121
    Width = 361
    Height = 47
    Align = alClient
    TabOrder = 5
    object DiskName: TLabel
      Left = 16
      Top = 24
      Width = 140
      Height = 13
      Caption = #26412#26426#30828#30424#25351#32441'('#31532#19968#30828#30424')'#65306
    end
    object DiSKIDName: TLabel
      Left = 152
      Top = 24
      Width = 80
      Height = 13
      Caption = '????????????????'
    end
    object CBox: TCheckBox
      Left = 16
      Top = 8
      Width = 329
      Height = 17
      Caption = #21551#29992#30828#30424#25351#32441'('#19981#25903#25345#19977#26143#30828#30424') (&N)'
      Enabled = False
      TabOrder = 0
    end
  end
  object FilesMonitor1: TlxpDraggingFilesMonitor
    AcceptFilesControl = FileEdit
    OnDropFiles = FilesMonitor1DropFiles
    Left = 264
    Top = 32
  end
  object FileInfo: TdcFileInfo
    Left = 200
    Top = 64
  end
  object MainMenu: TMainMenu
    Left = 232
    Top = 64
    object N2: TMenuItem
      Caption = #25805#20316'(&A)'
      object C1: TMenuItem
        Caption = #20851#38381'(&C)'
        OnClick = C1Click
      end
    end
    object SHELL1: TMenuItem
      Caption = #35774#32622'(&C)'
      object ShellI1: TMenuItem
        Caption = #20851#32852'(&I)'
        OnClick = ShellI1Click
      end
    end
    object N1: TMenuItem
      Caption = #24110#21161'(&H)'
      object A1: TMenuItem
        Caption = #20851#20110'(&A)'
        OnClick = A1Click
      end
    end
  end
  object FilesMonitor2: TlxpDraggingFilesMonitor
    AcceptFilesControl = Panel2
    OnDropFiles = FilesMonitor2DropFiles
    Left = 168
    Top = 64
  end
  object XPManifest1: TXPManifest
    Left = 200
    Top = 33
  end
  object SaveDlg: TdcSaveDialog
    Filter = 'BinJian Security Experts|*.BSE|All files (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 232
    Top = 33
  end
  object BrowseDlg: TdcBrowseDialog
    StatusText = #36873#25321#19968#20010#30446#24405#65292#20197#20415#37322#25918#26723#26696#12290
    NewFolder.Caption = #26032#24314#25991#20214#22841
    NewFolder.Prompt = 'Create folder in'
    Left = 168
    Top = 33
  end
  object FilesMonitor: TlxpDraggingFilesMonitor
    AcceptFilesControl = P
    OnDropFiles = FilesMonitorDropFiles
    Left = 264
    Top = 65
  end
  object MD5: TznMD5
    OnEnd = MD5End
    Left = 136
    Top = 33
  end
  object K_MD5: TznMD5
    Left = 136
    Top = 65
  end
end
