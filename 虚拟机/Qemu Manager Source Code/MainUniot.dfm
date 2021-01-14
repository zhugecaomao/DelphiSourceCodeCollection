object Form1: TForm1
  Left = 192
  Top = 122
  Width = 870
  Height = 640
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TB: TTntToolBar
    Left = 0
    Top = 0
    Width = 854
    Height = 29
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    TabOrder = 0
    Transparent = False
    object NewBtn: TTntToolButton
      Left = 0
      Top = 0
      Hint = 'Create new Virtual Machine'
      Caption = 'NewBtn'
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton1: TTntToolButton
      Left = 23
      Top = 0
      Hint = 'Delete Selected Virtual Machine'
      Caption = 'ToolButton1'
      ImageIndex = 6
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton22: TTntToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'ToolButton22'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object GoBtn: TTntToolButton
      Left = 54
      Top = 0
      Hint = 'Launch selected Virtual Machine'
      Caption = 'GoBtn'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton10: TTntToolButton
      Left = 77
      Top = 0
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object StopBtn: TTntToolButton
      Left = 85
      Top = 0
      Hint = 'Terminate A Qemu Session'
      Caption = 'StopBtn'
      ImageIndex = 17
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton7: TTntToolButton
      Left = 108
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object CfgBtn: TTntToolButton
      Left = 116
      Top = 0
      Hint = 'Configure Selected Virtual Machine'
      Caption = 'CfgBtn'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton4: TTntToolButton
      Left = 139
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object SingleSess: TTntToolButton
      Left = 147
      Top = 0
      Hint = 'Launch selected Virtual Machine using quick media.'
      Caption = 'SingleSess'
      ImageIndex = 7
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton6: TTntToolButton
      Left = 170
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object MediaBtn: TTntToolButton
      Left = 178
      Top = 0
      Hint = 'Import Media From Removable Disk'
      Caption = 'MediaBtn'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton20: TTntToolButton
      Left = 201
      Top = 0
      Width = 8
      Caption = 'ToolButton20'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object DockBtn: TTntToolButton
      Left = 209
      Top = 0
      Hint = 'Dock Qemu Manager To System Tray'
      Caption = 'DockBtn'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton11: TTntToolButton
      Left = 232
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton2: TTntToolButton
      Left = 240
      Top = 0
      Hint = 'Configure Profiles'
      Caption = 'ToolButton2'
      ImageIndex = 13
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton26: TTntToolButton
      Left = 263
      Top = 0
      Width = 8
      Caption = 'ToolButton26'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object Excl: TTntToolButton
      Left = 271
      Top = 0
      Hint = 'Launch selected Virtual Machine Exclusively'
      Caption = 'Excl'
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
    end
  end
end
