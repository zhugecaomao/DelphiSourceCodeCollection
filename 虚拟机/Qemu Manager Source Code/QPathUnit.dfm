object SelQPath: TSelQPath
  Left = 348
  Top = 325
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Select Path'
  ClientHeight = 115
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 1
    Top = 0
    Width = 520
    Height = 86
    TabOrder = 0
    object Caption: TLabel
      Left = 8
      Top = 13
      Width = 91
      Height = 13
      Caption = 'Specify Qemu Path'
    end
    object SpeedButton1: TSpeedButton
      Left = 447
      Top = 28
      Width = 23
      Height = 21
      Caption = '..'
      OnClick = SpeedButton1Click
    end
    object qm: TSpeedButton
      Left = 471
      Top = 27
      Width = 33
      Height = 22
      Hint = 'Use Portable Qemu Path'
      Caption = '{QM}'
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = qmClick
    end
    object QPath: TEdit
      Left = 8
      Top = 29
      Width = 441
      Height = 21
      TabOrder = 0
    end
    object NewBtn: TButton
      Left = 8
      Top = 52
      Width = 136
      Height = 25
      Caption = 'Create New Disk Image'
      TabOrder = 1
      Visible = False
      OnClick = NewBtnClick
    end
    object Imp: TButton
      Left = 8
      Top = 52
      Width = 136
      Height = 26
      Caption = 'Import From CD/DVD'
      TabOrder = 2
      Visible = False
      OnClick = ImpClick
    end
    object PDisk: TButton
      Left = 150
      Top = 52
      Width = 136
      Height = 26
      Caption = 'Use Physical Disk'
      TabOrder = 3
      Visible = False
      OnClick = PDiskClick
    end
  end
  object Button1: TButton
    Left = 366
    Top = 88
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 445
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object ODDisk: TOpenDialog
    DefaultExt = 'dsk'
    Filter = 'Disk Images|*.dsk|All Files|*.*'
    Options = [ofHideReadOnly, ofNoLongNames, ofEnableSizing]
    Title = 'Specify Disk Image'
    Left = 336
  end
  object ODMedia: TOpenDialog
    DefaultExt = 'img'
    Filter = 'CD/DVD Image|*.Iso|Floppy Image|*.img|All Files|*.*'
    Title = 'Specify Media'
    Left = 392
    Top = 16
  end
end
