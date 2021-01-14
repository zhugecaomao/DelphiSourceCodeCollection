object FrmColor: TFrmColor
  Left = 206
  Top = 406
  BorderStyle = bsDialog
  Caption = #33756#21333#21450#30331#24405#32972#26223#33394
  ClientHeight = 298
  ClientWidth = 392
  Color = 16772062
  Font.Charset = GB2312_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 19
    Top = 20
    Width = 60
    Height = 12
    Caption = #39068#33394#26041#26696#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 19
    Top = 63
    Width = 36
    Height = 12
    Caption = #33756#21333#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 19
    Top = 93
    Width = 60
    Height = 12
    Caption = #33756#21333#39640#20142#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 19
    Top = 123
    Width = 60
    Height = 12
    Caption = #39640#20142#25991#26412#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 19
    Top = 153
    Width = 36
    Height = 12
    Caption = #39640#20142#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 15
    Top = 187
    Width = 348
    Height = 12
    Caption = #27880#38144#21518#26041#33021#29983#25928#12290'XP'#37324#30340#8220#39640#20142#8221#21516#26102#20063#26159#33756#21333#39640#20142#26102#30340#36793#26694#33394#12290
    Font.Charset = GB2312_CHARSET
    Font.Color = 13500416
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 15
    Top = 205
    Width = 342
    Height = 12
    Caption = '9X'#21644'2000'#27809#26377#8220#33756#21333#39640#20142#8221#36825#20010#38190#20540','#8220#39640#20142#8221#23601#26159#33756#21333#39640#20142#33394#12290
    Font.Charset = GB2312_CHARSET
    Font.Color = 13500416
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label8: TLabel
    Left = 19
    Top = 240
    Width = 144
    Height = 12
    Caption = 'Windows '#30331#24405#26102#30340#32972#26223#33394#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Bevel1: TBevel
    Left = 0
    Top = 226
    Width = 400
    Height = 2
  end
  object ComBoxColor: TComboBox
    Left = 84
    Top = 17
    Width = 121
    Height = 20
    Cursor = crHandPoint
    Style = csDropDownList
    Color = clWhite
    DropDownCount = 12
    ItemHeight = 12
    TabOrder = 0
    OnChange = ComBoxColorChange
    Items.Strings = (
      #24403#21069#39068#33394
      #40664#35748#65288'2000'#65289
      '2000 '#25512#33616
      #40664#35748#65288'XP'#65289
      'Office 01'
      'Office 02'
      'FlatXP'
      'Korilla'
      #34013#22825#33609#22320
      #38597#34382#36890
      'Win 2003'
      'Longhorn')
  end
  object Edit11: TEdit
    Left = 84
    Top = 60
    Width = 121
    Height = 20
    BorderStyle = bsNone
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Text = 'Edit11'
    OnChange = Edit11Change
    OnDblClick = Edit11DblClick
    OnMouseMove = Edit11MouseMove
  end
  object Edit12: TEdit
    Left = 84
    Top = 90
    Width = 121
    Height = 20
    BorderStyle = bsNone
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Text = 'Edit12'
    OnChange = Edit11Change
    OnDblClick = Edit11DblClick
    OnMouseMove = Edit11MouseMove
  end
  object Edit13: TEdit
    Left = 84
    Top = 120
    Width = 121
    Height = 20
    BorderStyle = bsNone
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Text = 'Edit13'
    OnChange = Edit11Change
    OnDblClick = Edit11DblClick
    OnMouseMove = Edit11MouseMove
  end
  object Edit14: TEdit
    Left = 84
    Top = 150
    Width = 121
    Height = 20
    BorderStyle = bsNone
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    Text = 'Edit14'
    OnChange = Edit11Change
    OnDblClick = Edit11DblClick
    OnMouseMove = Edit11MouseMove
  end
  object Edit15: TEdit
    Left = 84
    Top = 264
    Width = 121
    Height = 20
    BorderStyle = bsNone
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    Text = 'Edit15'
    OnChange = Edit11Change
    OnDblClick = Edit11DblClick
    OnMouseMove = Edit11MouseMove
  end
  object ColorBox1: TColorBox
    Left = 220
    Top = 60
    Width = 140
    Height = 22
    Cursor = crHandPoint
    Style = [cbStandardColors, cbExtendedColors, cbCustomColor]
    Color = clWhite
    DropDownCount = 21
    ItemHeight = 16
    TabOrder = 2
    OnChange = ColorBox1Change
  end
  object RzBtnOK: TRzButton
    Left = 220
    Top = 15
    Width = 80
    ShowFocusRect = False
    Caption = #30830#35748
    Color = 14938354
    Enabled = False
    HotTrack = True
    TabOrder = 1
    OnClick = RzBtnOKClick
  end
  object ComBoxLogon: TComboBox
    Left = 19
    Top = 264
    Width = 57
    Height = 20
    Cursor = crHandPoint
    Style = csDropDownList
    Color = clWhite
    ItemHeight = 12
    TabOrder = 8
    OnChange = ComBoxLogonChange
    Items.Strings = (
      #24403#21069
      '2000'#40664#35748
      'XP'#40664#35748
      #32511#33394
      #31881#32418#33394)
  end
  object RzBtnCancel: TRzButton
    Left = 305
    Top = 15
    Width = 80
    Cancel = True
    ShowFocusRect = False
    Caption = #20851#38381
    Color = 14938354
    HotTrack = True
    TabOrder = 9
    OnClick = RzBtnCancelClick
  end
end
