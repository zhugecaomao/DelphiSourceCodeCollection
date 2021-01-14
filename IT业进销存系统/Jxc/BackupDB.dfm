object frm_Data: Tfrm_Data
  Left = 238
  Top = 168
  BorderStyle = bsDialog
  Caption = 'frm_Data'
  ClientHeight = 238
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 29
    Top = 63
    Width = 403
    Height = 116
    Shape = bsFrame
  end
  object SpeedButton1: TSpeedButton
    Left = 360
    Top = 27
    Width = 24
    Height = 23
    Caption = '...'
    OnClick = SpeedButton1Click
  end
  object lbl_Caption: TLabel
    Left = 38
    Top = 31
    Width = 60
    Height = 13
    Caption = '備份路徑：'
  end
  object btnOK: TBitBtn
    Left = 91
    Top = 195
    Width = 81
    Height = 29
    Cursor = crHandPoint
    Caption = '確定'
    TabOrder = 0
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 260
    Top = 193
    Width = 81
    Height = 29
    Cursor = crHandPoint
    Caption = '取消'
    TabOrder = 1
    OnClick = btnCancelClick
    Kind = bkClose
  end
  object edt_Path: TEdit
    Left = 114
    Top = 28
    Width = 245
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object Panel_Hide: TPanel
    Left = 33
    Top = 65
    Width = 395
    Height = 98
    BevelOuter = bvNone
    TabOrder = 3
    object Label2: TLabel
      Left = 239
      Top = 66
      Width = 24
      Height = 13
      Caption = '到：'
    end
    object Label3: TLabel
      Left = 13
      Top = 25
      Width = 60
      Height = 13
      Caption = '文件名稱：'
    end
    object DT_st: TDateTimePicker
      Left = 121
      Top = 63
      Width = 112
      Height = 20
      CalAlignment = dtaLeft
      Date = 37267.4230797917
      Time = 37267.4230797917
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object DT_end: TDateTimePicker
      Left = 263
      Top = 61
      Width = 113
      Height = 20
      CalAlignment = dtaLeft
      Date = 37267.4235524537
      Time = 37267.4235524537
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object CheckDate: TCheckBox
      Left = 5
      Top = 65
      Width = 106
      Height = 18
      Caption = '備份目期'
      TabOrder = 2
    end
    object Edt_FileName: TEdit
      Left = 81
      Top = 21
      Width = 239
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = 'Edt_FileName'
    end
  end
  object ProgressBar: TProgressBar
    Left = 33
    Top = 163
    Width = 395
    Height = 13
    Min = 0
    Max = 100
    TabOrder = 4
  end
  object ADOBackUP: TADOBackUP
    BackUpFileName = 'Save.dat'
    ADOConnection = dm1.cn
    IsDevide = True
    Procession = ADOBackUPProcession
    Left = 123
    Top = 3
  end
  object OpenDialog1: TOpenDialog
    Left = 212
    Top = 3
  end
  object XPMenu1: TXPMenu
    Font.Charset = CHINESEBIG5_CHARSET
    Font.Color = clMenuText
    Font.Height = -12
    Font.Name = '新細明體'
    Font.Pitch = fpVariable
    Font.Style = []
    Color = clBtnFace
    IconBackColor = clBtnFace
    MenuBarColor = clBtnFace
    SelectColor = clHighlight
    SelectBorderColor = clHighlight
    SelectFontColor = clMenuText
    DisabledColor = clInactiveCaption
    SeparatorColor = clBtnFace
    CheckedColor = clHighlight
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = True
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = True
    Active = True
    Left = 56
    Top = 8
  end
end
