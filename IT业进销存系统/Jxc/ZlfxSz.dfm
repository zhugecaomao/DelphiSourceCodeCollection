object frmZlfxSz: TfrmZlfxSz
  Left = 184
  Top = 28
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'frmZlfxSz'
  ClientHeight = 274
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = '宋体'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object labRq: TLabel
    Left = 25
    Top = 18
    Width = 60
    Height = 15
    Alignment = taRightJustify
    Caption = '截止日期'
    Transparent = True
  end
  object btnCancel: TBitBtn
    Left = 243
    Top = 231
    Width = 90
    Height = 31
    Caption = '取消(&C)'
    TabOrder = 2
    Kind = bkCancel
  end
  object btnOk: TBitBtn
    Left = 131
    Top = 231
    Width = 90
    Height = 31
    Caption = '确定(&O)'
    TabOrder = 1
    OnClick = btnOkClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object dtpRq: TDateTimePicker
    Left = 93
    Top = 14
    Width = 109
    Height = 23
    CalAlignment = dtaLeft
    Date = 36770.9898202546
    Time = 36770.9898202546
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 18
    Top = 48
    Width = 315
    Height = 169
    Caption = '帐龄分组'
    TabOrder = 3
    object BT1: TEdit
      Left = 16
      Top = 52
      Width = 96
      Height = 23
      TabStop = False
      Color = cl3DLight
      TabOrder = 0
      Text = '180至188天'
    end
    object TS1: TEdit
      Left = 114
      Top = 52
      Width = 38
      Height = 23
      TabOrder = 1
      Text = '7200'
      OnChange = TS1Change
      OnExit = TS1Exit
    end
    object Panel1: TPanel
      Left = 16
      Top = 24
      Width = 96
      Height = 23
      BevelOuter = bvLowered
      BevelWidth = 2
      Caption = '标题'
      TabOrder = 9
    end
    object Panel2: TPanel
      Left = 114
      Top = 24
      Width = 38
      Height = 23
      BevelOuter = bvLowered
      BevelWidth = 2
      Caption = '天数'
      TabOrder = 10
    end
    object BT2: TEdit
      Left = 16
      Top = 79
      Width = 96
      Height = 23
      TabStop = False
      Color = cl3DLight
      TabOrder = 11
      Text = '180至188天'
    end
    object TS2: TEdit
      Left = 114
      Top = 79
      Width = 38
      Height = 23
      TabOrder = 2
      Text = '7200'
      OnChange = TS1Change
      OnExit = TS1Exit
    end
    object BT3: TEdit
      Left = 16
      Top = 107
      Width = 96
      Height = 23
      TabStop = False
      Color = cl3DLight
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      Text = '180至188天'
    end
    object TS3: TEdit
      Left = 114
      Top = 107
      Width = 38
      Height = 23
      TabOrder = 3
      Text = '7200'
      OnChange = TS1Change
      OnExit = TS1Exit
    end
    object BT4: TEdit
      Left = 16
      Top = 134
      Width = 96
      Height = 23
      TabStop = False
      Color = cl3DLight
      TabOrder = 13
      Text = '180至188天'
    end
    object TS4: TEdit
      Left = 114
      Top = 134
      Width = 38
      Height = 23
      TabOrder = 4
      Text = '7200'
      OnChange = TS1Change
      OnExit = TS1Exit
    end
    object BT5: TEdit
      Left = 162
      Top = 52
      Width = 96
      Height = 23
      TabStop = False
      Color = cl3DLight
      TabOrder = 14
      Text = '180至188天'
    end
    object TS5: TEdit
      Left = 260
      Top = 52
      Width = 38
      Height = 23
      TabOrder = 5
      Text = '7200'
      OnChange = TS1Change
      OnExit = TS1Exit
    end
    object BT6: TEdit
      Left = 162
      Top = 79
      Width = 96
      Height = 23
      TabStop = False
      Color = cl3DLight
      TabOrder = 15
      Text = '180至188天'
    end
    object TS6: TEdit
      Left = 260
      Top = 79
      Width = 38
      Height = 23
      TabOrder = 6
      Text = '7200'
      OnChange = TS1Change
      OnExit = TS1Exit
    end
    object BT7: TEdit
      Left = 162
      Top = 107
      Width = 96
      Height = 23
      TabStop = False
      Color = cl3DLight
      TabOrder = 16
      Text = '180至188天'
    end
    object TS7: TEdit
      Left = 260
      Top = 107
      Width = 38
      Height = 23
      TabOrder = 7
      Text = '7200'
      OnChange = TS1Change
      OnExit = TS1Exit
    end
    object BT8: TEdit
      Left = 162
      Top = 134
      Width = 96
      Height = 23
      TabStop = False
      Color = cl3DLight
      TabOrder = 17
      Text = '180天以上'
    end
    object TS8: TEdit
      Left = 260
      Top = 134
      Width = 38
      Height = 23
      TabStop = False
      Color = cl3DLight
      TabOrder = 8
    end
    object Panel3: TPanel
      Left = 162
      Top = 24
      Width = 96
      Height = 23
      BevelOuter = bvLowered
      BevelWidth = 2
      Caption = '标题'
      TabOrder = 18
    end
    object Panel4: TPanel
      Left = 260
      Top = 24
      Width = 38
      Height = 23
      BevelOuter = bvLowered
      BevelWidth = 2
      Caption = '天数'
      TabOrder = 19
    end
  end
  object btnIni: TBitBtn
    Left = 18
    Top = 231
    Width = 90
    Height = 31
    Hint = '设置成系统默认的栏目布局'
    Caption = '初始化 '
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnIniClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADAAD0000000000000DDA0FFF0FFF0FFF0AAD0FFF0FFF0FFF0DDA0FFF0FFF0F
      FF0AAD0FFF0FFF0FFF0DDA0FFF0FFF0FFF0AAD0FFF0FFF0FFF0DDA0FFF0FFF0F
      FF0AAD0FFF0FFF0FFF0DDA0FFF0FFF0FFF0AAD0000000000000DDA0888088808
      880AAD0888088808880DDA0000000000000AADADADADADADADAD}
  end
end
