inherited frmZlfxKhSz: TfrmZlfxKhSz
  Caption = 'frmZlfxKhSz'
  ClientHeight = 352
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited labRq: TLabel
    Top = 96
  end
  object Label1: TLabel [1]
    Left = 25
    Top = 16
    Width = 60
    Height = 15
    Caption = '客户编号'
  end
  object Label2: TLabel [2]
    Left = 25
    Top = 52
    Width = 60
    Height = 15
    Alignment = taRightJustify
    Caption = '客户名称'
  end
  object btnKhHelp: TSpeedButton [3]
    Left = 194
    Top = 13
    Width = 21
    Height = 23
    Caption = '…'
    ParentShowHint = False
    ShowHint = False
    OnClick = btnKhHelpClick
  end
  object Bevel2: TBevel [4]
    Left = 15
    Top = 82
    Width = 322
    Height = 13
    Shape = bsTopLine
  end
  inherited btnCancel: TBitBtn
    Top = 309
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  inherited btnOk: TBitBtn
    Top = 309
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  inherited dtpRq: TDateTimePicker
    Top = 92
    TabOrder = 1
  end
  inherited GroupBox1: TGroupBox
    Top = 126
    TabOrder = 4
  end
  inherited btnIni: TBitBtn
    Top = 309
    Anchors = [akLeft, akBottom]
    TabOrder = 5
  end
  object Edit1: TEdit
    Left = 93
    Top = 12
    Width = 102
    Height = 23
    TabOrder = 0
    OnDblClick = btnKhHelpClick
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 93
    Top = 48
    Width = 221
    Height = 23
    TabStop = False
    Color = cl3DLight
    TabOrder = 6
  end
end
