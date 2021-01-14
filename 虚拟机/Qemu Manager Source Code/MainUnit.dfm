object Main: TMain
  Left = 2
  Top = 2
  Width = 1278
  Height = 992
  Caption = 'Qemu Manager v5.0'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PC: TTntPageControl
    Left = 0
    Top = 29
    Width = 1270
    Height = 898
    ActivePage = MainTS
    Align = alClient
    TabOrder = 0
    object MainTS: TTntTabSheet
      Caption = 'Virtual Machines'
      object Splitter1: TSplitter
        Left = 209
        Top = 0
        Height = 870
      end
      object TV: TTntTreeView
        Left = 0
        Top = 0
        Width = 209
        Height = 870
        Align = alLeft
        HideSelection = False
        Images = Mil2
        Indent = 22
        ReadOnly = True
        RowSelect = True
        SortType = stText
        TabOrder = 0
        OnClick = TVClick
        OnGetSelectedIndex = TVGetSelectedIndex
      end
      object Panel1: TPanel
        Left = 212
        Top = 0
        Width = 1050
        Height = 870
        Align = alClient
        TabOrder = 1
        object TntLabel1: TTntLabel
          Left = 408
          Top = 384
          Width = 241
          Height = 13
          Caption = 'Please click a virtual machine to view it'#39's properties'
        end
        object FL: TFileListBox
          Left = 889
          Top = 616
          Width = 657
          Height = 393
          ItemHeight = 13
          Mask = '*.dat'
          TabOrder = 0
          Visible = False
        end
        object scanFl: TFileListBox
          Left = 616
          Top = 592
          Width = 441
          Height = 329
          ItemHeight = 13
          Mask = '*.dat'
          TabOrder = 1
          Visible = False
        end
        object PC2: TTntPageControl
          Left = 1
          Top = 1
          Width = 1048
          Height = 868
          ActivePage = TntTabSheet1
          Align = alClient
          Style = tsFlatButtons
          TabOrder = 2
          Visible = False
          object TntTabSheet1: TTntTabSheet
            Caption = 'Hardware'
            object Label1: TLabel
              Left = 8
              Top = 16
              Width = 3
              Height = 13
            end
            object HLV: TTntListView
              Left = 0
              Top = 0
              Width = 1040
              Height = 837
              Align = alClient
              Columns = <
                item
                  Caption = 'Hardware'
                  Width = 250
                end
                item
                  Caption = 'Setting'
                  Width = 370
                end>
              ReadOnly = True
              RowSelect = True
              SmallImages = MIL
              TabOrder = 0
              ViewStyle = vsReport
              OnDblClick = HLVDblClick
            end
          end
          object TntTabSheet3: TTntTabSheet
            Caption = 'Drives'
            object DLV: TTntListView
              Left = 0
              Top = 0
              Width = 1040
              Height = 837
              Align = alClient
              Columns = <
                item
                  Caption = 'Drive'
                  Width = 250
                end
                item
                  Caption = 'Setting'
                  Width = 370
                end>
              ReadOnly = True
              RowSelect = True
              SmallImages = MIL
              TabOrder = 0
              ViewStyle = vsReport
              OnDblClick = DLVDblClick
            end
          end
          object Netsheet: TTntTabSheet
            Caption = 'Networking'
            object NLV: TTntListView
              Left = 0
              Top = 29
              Width = 1040
              Height = 808
              Align = alClient
              Columns = <
                item
                  Caption = 'VLAN'
                  Width = 250
                end
                item
                  Caption = 'Setting'
                  Width = 370
                end>
              ReadOnly = True
              RowSelect = True
              SmallImages = MIL
              TabOrder = 0
              ViewStyle = vsReport
              OnDblClick = NLVDblClick
            end
            object ToolBar1: TToolBar
              Left = 0
              Top = 0
              Width = 1040
              Height = 29
              Caption = 'ToolBar1'
              Images = Mil2
              TabOrder = 1
              object ToolButton2: TToolButton
                Left = 0
                Top = 2
                Hint = 'New VLAN'
                Caption = 'ToolButton2'
                ImageIndex = 1
                ParentShowHint = False
                ShowHint = True
                OnClick = ToolButton2Click
              end
              object ToolButton3: TToolButton
                Left = 23
                Top = 2
                Hint = 'Delete Selected VLAN'
                Caption = 'ToolButton3'
                ImageIndex = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = ToolButton3Click
              end
              object ToolButton4: TToolButton
                Left = 46
                Top = 2
                Width = 8
                Caption = 'ToolButton4'
                ImageIndex = 2
                Style = tbsSeparator
              end
            end
          end
          object TntTabSheet5: TTntTabSheet
            Caption = 'Advanced'
            object ALV: TTntListView
              Left = 0
              Top = 0
              Width = 1040
              Height = 837
              Align = alClient
              Columns = <
                item
                  Caption = 'Advanced'
                  Width = 250
                end
                item
                  Caption = 'Setting'
                  Width = 370
                end>
              ReadOnly = True
              RowSelect = True
              SmallImages = MIL
              TabOrder = 0
              ViewStyle = vsReport
              OnDblClick = ALVDblClick
            end
          end
        end
      end
    end
  end
  object SB: TTntStatusBar
    Left = 0
    Top = 927
    Width = 1270
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Alignment = taCenter
        Width = 130
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 0
    Width = 1270
    Height = 29
    Caption = 'ToolBar2'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Images = Mil2
    TabOrder = 2
    Transparent = False
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Hint = 'Create New VM'
      Caption = 'ToolButton1'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton1Click
    end
    object ToolButton6: TToolButton
      Left = 23
      Top = 0
      Hint = 'Delete Selected VM'
      Caption = 'ToolButton6'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton6Click
    end
    object ToolButton7: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object Play: TToolButton
      Left = 54
      Top = 0
      Hint = 'Launch Selected VM'
      Caption = 'Play'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = PlayClick
    end
    object Stop: TToolButton
      Left = 77
      Top = 0
      Hint = 'Stop Selected VM'
      Caption = 'Stop'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = StopClick
    end
    object ToolButton11: TToolButton
      Left = 100
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 108
      Top = 0
      Hint = 'Create disk image from removable media'
      Caption = 'ToolButton8'
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton8Click
    end
    object ToolButton10: TToolButton
      Left = 131
      Top = 0
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 10
      Style = tbsSeparator
    end
  end
  object MainMenu: TTntMainMenu
    Left = 736
    object File1: TTntMenuItem
      Caption = '&File'
      object Exit1: TTntMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TTntMenuItem
      Caption = '&Options'
      object ACC1: TTntMenuItem
        Caption = 'Install KQEMU Accelerator'
        OnClick = ACC1Click
      end
      object Acc2: TTntMenuItem
        Caption = 'Uninstall KQEMU Accelerator'
        OnClick = Acc2Click
      end
      object N20: TTntMenuItem
        Caption = '-'
      end
      object CreateDiskImage1: TTntMenuItem
        Caption = 'Create New Virtual Disk'
        OnClick = CreateDiskImage1Click
      end
      object N1: TTntMenuItem
        Caption = '-'
      end
      object ShowLastLaunchCommand1: TTntMenuItem
        Caption = 'Show Last Run Command'
        OnClick = ShowLastLaunchCommand1Click
      end
      object N3: TTntMenuItem
        Caption = '-'
      end
      object ConfigureOperatingSystemDefaults1: TTntMenuItem
        Caption = 'Configure Operating System Defaults'
        OnClick = ConfigureOperatingSystemDefaults1Click
      end
      object QemuVersionControlManager1: TTntMenuItem
        Caption = 'Qemu Version Control Manager'
        OnClick = QemuVersionControlManager1Click
      end
      object N11: TTntMenuItem
        Caption = '-'
      end
      object ConfigureMediaImagePaths1: TTntMenuItem
        Caption = 'Configure Media/Image Paths'
        Visible = False
      end
      object N6: TTntMenuItem
        Caption = '-'
      end
      object BrowseMediaFolders1: TTntMenuItem
        Caption = 'Browse Folders'
        object BrowseDiskImageFolder1: TTntMenuItem
          Caption = 'Browse Disk Image Folder'
          OnClick = BrowseDiskImageFolder1Click
        end
        object N13: TTntMenuItem
          Caption = '-'
        end
        object BrowseMediaImageFolder1: TTntMenuItem
          Caption = 'Browse Media Image Folder'
          OnClick = BrowseMediaImageFolder1Click
        end
      end
      object N17: TTntMenuItem
        Caption = '-'
      end
      object drv: TTntMenuItem
        Caption = 'Stop All Accelerator Drivers On Qemu Manager Close'
        OnClick = drvClick
      end
      object N12: TTntMenuItem
        Caption = '-'
      end
      object DisableQemuManagerQEMUClientSupport1: TTntMenuItem
        Caption = 'Disable Qemu Manager QEMU Client Support'
        OnClick = DisableQemuManagerQEMUClientSupport1Click
      end
      object N7: TTntMenuItem
        Caption = '-'
      end
      object pp2: TTntMenuItem
        Caption = 'Change Language'
        Enabled = False
      end
      object pp1: TTntMenuItem
        Caption = '-'
      end
      object CheckForUpdates1: TTntMenuItem
        Caption = 'Check For Updates'
        OnClick = CheckForUpdates1Click
      end
    end
    object FTPServer1: TTntMenuItem
      Caption = 'File Transfer'
      object FTPStart: TTntMenuItem
        Caption = 'Start File Transfer Server'
        OnClick = FTPStartClick
      end
      object FTPStop: TTntMenuItem
        Caption = 'Stop File Transfer Server'
        OnClick = FTPStopClick
      end
      object N10: TTntMenuItem
        Caption = '-'
      end
      object ConfigureFTPServer1: TTntMenuItem
        Caption = 'Configure File Transfer Server'
        OnClick = ConfigureFTPServer1Click
      end
    end
    object Session: TTntMenuItem
      Caption = '&Session'
      Visible = False
      object PauseSession1: TTntMenuItem
        Caption = 'Pause Session'
      end
      object N8: TTntMenuItem
        Caption = '-'
      end
      object RebootSession1: TTntMenuItem
        Caption = 'Reboot Session'
      end
      object N9: TTntMenuItem
        Caption = '-'
      end
      object QuitSession1: TTntMenuItem
        Caption = 'Quit Session'
      end
    end
    object Help1: TTntMenuItem
      Caption = 'Help'
      object Index1: TTntMenuItem
        Caption = 'View User Manual'
        Enabled = False
      end
      object N4: TTntMenuItem
        Caption = '-'
      end
      object About1: TTntMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object MIL: TImageList
    Left = 669
    Top = 1
  end
  object SysTimer: TTimer
    Enabled = False
    OnTimer = SysTimerTimer
    Left = 797
    Top = 1
  end
  object SaveDlg: TTntSaveDialog
    DefaultExt = 'dsk'
    Filter = 'Disk Image|*.dsk|All Files|*.*'
    FilterIndex = 0
    Title = 'Save Disk Image As'
    Left = 704
  end
  object MIL3: TImageList
    Left = 581
    Top = 1
  end
  object OpSysDB: TDbf
    FilePath = 'C:\qm\'
    IndexDefs = <>
    TableName = 'opsys.dat'
    TableLevel = 4
    UseFloatFields = False
    Left = 829
    Top = 1
    object OpSysDBNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object OpSysDBDISK: TStringField
      FieldName = 'DISK'
    end
    object OpSysDBRAM: TStringField
      FieldName = 'RAM'
    end
    object OpSysDBINDEX: TStringField
      FieldName = 'INDEX'
    end
    object OpSysDBHARDWARE: TStringField
      FieldName = 'HARDWARE'
      Size = 200
    end
  end
  object ProcessDB: TDbf
    IndexDefs = <>
    TableName = 'process.dat'
    TableLevel = 4
    UseFloatFields = False
    Left = 765
    Top = 1
    object ProcessDBPROCESSID: TStringField
      FieldName = 'PROCESSID'
      Size = 100
    end
    object ProcessDBVM: TStringField
      FieldName = 'VM'
      Size = 254
    end
  end
  object ScanProcDB: TDbf
    FilePath = 'C:\qm\'
    IndexDefs = <>
    TableName = 'process.dat'
    TableLevel = 4
    UseFloatFields = False
    Left = 861
    Top = 1
    object ScanProcDBPROCESSID: TStringField
      FieldName = 'PROCESSID'
      Size = 100
    end
    object ScanProcDBVM: TStringField
      FieldName = 'VM'
      Size = 254
    end
  end
  object QMVersDB: TDbf
    FilePath = 'c:\qm\'
    IndexDefs = <>
    TableName = 'qemuvers.dat'
    TableLevel = 4
    UseFloatFields = False
    Left = 917
    Top = 1
    object QMVersDBDESC: TStringField
      FieldName = 'DESC'
      Size = 200
    end
    object QMVersDBEXE: TStringField
      FieldName = 'EXE'
      Size = 200
    end
    object QMVersDBVNO: TStringField
      FieldName = 'VNO'
      Size = 10
    end
    object QMVersDBQMCLIENT: TStringField
      FieldName = 'QMCLIENT'
      Size = 3
    end
    object QMVersDBKQEMU: TStringField
      FieldName = 'KQEMU'
      Size = 3
    end
    object QMVersDBSUBDIR: TStringField
      FieldName = 'SUBDIR'
      Size = 100
    end
    object QMVersDBDEFAULT: TStringField
      FieldName = 'DEFAULT'
      Size = 3
    end
  end
  object Dock: TPopupMenu
    Left = 565
    Top = 249
    object RestoreQemuManage1: TMenuItem
      Caption = 'Restore Qemu Manager'
      OnClick = RestoreQemuManage1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object ScreenCapture1: TMenuItem
      Caption = 'Screen Capture'
      OnClick = ScreenCapture1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object QuitQemuManager1: TMenuItem
      Caption = 'Quit Qemu Manager'
      OnClick = QuitQemuManager1Click
    end
  end
  object SD: TTntSaveDialog
    DefaultExt = 'bmp'
    Filter = 'Bitmap|*.bmp'
    Title = 'Save Screen Capture As'
    Left = 240
    Top = 189
  end
  object Mil2: TImageList
    Left = 416
    Top = 5
  end
end
