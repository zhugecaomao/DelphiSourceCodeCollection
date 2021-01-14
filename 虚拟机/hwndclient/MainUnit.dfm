object Main: TMain
  Left = 256
  Top = 172
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'QMQC'
  ClientHeight = 490
  ClientWidth = 769
  Color = clBlack
  Enabled = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object TB: TToolBar
    Left = 0
    Top = 0
    Width = 769
    Height = 29
    Caption = 'TB'
    Color = clBtnFace
    Flat = True
    Images = MIL
    ParentColor = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Hint = 'CD/DVD Drive'
      Caption = 'ToolButton1'
      DropdownMenu = CDDVD
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Hint = 'Floppy Disk Drive'
      Caption = 'ToolButton2'
      DropdownMenu = FDISK
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton3: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 54
      Top = 0
      Hint = 'Send CTRL+ALT+DEL'
      Caption = 'ToolButton4'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton4Click
    end
    object ToolButton5: TToolButton
      Left = 77
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object Pause: TToolButton
      Left = 85
      Top = 0
      Hint = 'Pause/Resume Virtual Machine'
      Caption = 'Pause'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = PauseClick
    end
    object ToolButton7: TToolButton
      Left = 108
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 116
      Top = 0
      Hint = 'VM State Management'
      Caption = 'ToolButton8'
      DropdownMenu = SSHOT
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton9: TToolButton
      Left = 139
      Top = 0
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 147
      Top = 0
      Hint = 'Shutdown/Reset Options'
      Caption = 'ToolButton10'
      DropdownMenu = SDOWN
      ImageIndex = 7
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton12: TToolButton
      Left = 170
      Top = 0
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton11: TToolButton
      Left = 178
      Top = 0
      Hint = 'Quit Qemu'
      Caption = 'ToolButton11'
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton11Click
    end
    object ToolButton6: TToolButton
      Left = 201
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 209
      Top = 0
      Caption = 'ToolButton13'
      ImageIndex = 9
      OnClick = ToolButton13Click
    end
    object ToolButton14: TToolButton
      Left = 232
      Top = 0
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 10
      Style = tbsSeparator
    end
  end
  object SB: TPanel
    Left = 0
    Top = 29
    Width = 769
    Height = 442
    BevelOuter = bvNone
    Caption = 'SB'
    Color = clBlack
    TabOrder = 1
    OnResize = SBResize
  end
  object Status: TStatusBar
    Left = 0
    Top = 471
    Width = 769
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 400
      end
      item
        Width = 50
      end>
  end
  object SysTimer: TTimer
    OnTimer = SysTimerTimer
    Left = 352
    Top = 5
  end
  object TCP: TIdTCPClient
    OnStatus = TCPStatus
    MaxLineAction = maException
    ReadTimeout = 0
    OnDisconnected = TCPDisconnected
    Host = 'localhost'
    Port = 0
    Left = 544
    Top = 65261
  end
  object TCPTimer: TTimer
    Enabled = False
    OnTimer = TCPTimerTimer
    Left = 576
    Top = 5
  end
  object MIL: TImageList
    Left = 416
    Top = 5
  end
  object CDDVD: TPopupMenu
    Left = 472
    Top = 5
    object EjectCDDVDMediaFromDrive1: TMenuItem
      Caption = 'Eject CD/DVD Media From Drive'
      OnClick = EjectCDDVDMediaFromDrive1Click
    end
    object LoadDiskImage1: TMenuItem
      Caption = 'Load CD/DVD Disk Image'
      OnClick = LoadDiskImage1Click
    end
    object LoadCDDVDDiskImageRestartVM1: TMenuItem
      Caption = 'Load CD/DVD Disk Image && Restart VM'
      OnClick = LoadCDDVDDiskImageRestartVM1Click
    end
    object UsePCCDDVDDrive1: TMenuItem
      Caption = 'Use Physical CD/DVD Drive'
      OnClick = UsePCCDDVDDrive1Click
    end
  end
  object FDISK: TPopupMenu
    Left = 512
    Top = 5
    object MenuItem1: TMenuItem
      Caption = 'Eject Floppy Disk 0 Media From Drive'
      OnClick = MenuItem1Click
    end
    object EjectFloppyDisk1MediaFromDrive1: TMenuItem
      Caption = 'Eject Floppy Disk 1 Media From Drive'
      OnClick = EjectFloppyDisk1MediaFromDrive1Click
    end
    object MenuItem2: TMenuItem
      Caption = 'Load Floppy Disk 0 Disk Image'
      OnClick = MenuItem2Click
    end
    object LoadFloppyDisk0DiskImageRestartVM1: TMenuItem
      Caption = 'Load Floppy Disk 0 Disk Image && Restart VM'
      OnClick = LoadFloppyDisk0DiskImageRestartVM1Click
    end
    object MenuItem3: TMenuItem
      Caption = 'Use Physical Floppy Disk Drive as Floppy Drive 0'
      OnClick = MenuItem3Click
    end
  end
  object SDOWN: TPopupMenu
    Left = 608
    Top = 5
    object ResetVirtualMachine1: TMenuItem
      Caption = 'Reset Virtual Machine'
      OnClick = ResetVirtualMachine1Click
    end
    object ShutdownVirtualMachine1: TMenuItem
      Caption = 'Shutdown Virtual Machine'
      OnClick = ShutdownVirtualMachine1Click
    end
  end
  object MediaOpen: TTntOpenDialog
    DefaultExt = 'iso'
    Filter = 
      'ISO CD/DVD Disc Image|*.iso|Floppy Disk Image|*.img|ALL Files|*.' +
      '*'
    Left = 384
    Top = 7
  end
  object SSHOT: TPopupMenu
    Left = 544
    Top = 5
    object QCOW2ImagesOnly1: TMenuItem
      Caption = 'QCOW2 Images Only'
      Enabled = False
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object SaveSnapshot1: TMenuItem
      Caption = 'Save State'
      OnClick = SaveSnapshot1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object LoadSnapshot1: TMenuItem
      Caption = 'Load State'
      OnClick = LoadSnapshot1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object DeleteSnapshot1: TMenuItem
      Caption = 'Delete Saved State'
      OnClick = DeleteSnapshot1Click
    end
  end
  object CheckProcess: TTimer
    Enabled = False
    OnTimer = CheckProcessTimer
    Left = 672
    Top = 8
  end
end
