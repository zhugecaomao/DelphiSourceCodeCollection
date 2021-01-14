object lujingform: Tlujingform
  Left = 326
  Top = 211
  AutoScroll = False
  BorderIcons = []
  Caption = #36335#24452#36873#25321
  ClientHeight = 255
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object bsSkinPanel1: TbsSkinPanel
    Left = 8
    Top = 8
    Width = 329
    Height = 241
    TabOrder = 0
    SkinData = mainform.bsSkinData1
    SkinDataName = 'panel'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultWidth = 0
    DefaultHeight = 0
    UseSkinFont = True
    RealHeight = -1
    AutoEnabledControls = True
    CheckedMode = False
    Checked = False
    DefaultAlignment = taLeftJustify
    DefaultCaptionHeight = 22
    BorderStyle = bvFrame
    CaptionMode = False
    RollUpMode = False
    RollUpState = False
    NumGlyphs = 1
    Spacing = 2
    Caption = 'bsSkinPanel1'
    object Label1: TLabel
      Left = 9
      Top = 11
      Width = 60
      Height = 13
      Caption = #39537#21160#22120#65306#12288
      Transparent = True
    end
    object divbox: TbsSkinDriveComboBox
      Left = 64
      Top = 8
      Width = 257
      Height = 20
      TabOrder = 0
      SkinData = mainform.bsSkinData1
      SkinDataName = 'combobox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      AlphaBlend = False
      AlphaBlendValue = 0
      AlphaBlendAnimation = False
      AutoComplete = True
      ListBoxUseSkinFont = True
      ListBoxUseSkinItemHeight = True
      ImageIndex = -1
      ListBoxCaptionMode = False
      ListBoxDefaultFont.Charset = DEFAULT_CHARSET
      ListBoxDefaultFont.Color = clWindowText
      ListBoxDefaultFont.Height = 14
      ListBoxDefaultFont.Name = 'Arial'
      ListBoxDefaultFont.Style = []
      ListBoxDefaultCaptionFont.Charset = DEFAULT_CHARSET
      ListBoxDefaultCaptionFont.Color = clWindowText
      ListBoxDefaultCaptionFont.Height = 14
      ListBoxDefaultCaptionFont.Name = 'Arial'
      ListBoxDefaultCaptionFont.Style = []
      ListBoxDefaultItemHeight = 20
      ListBoxCaptionAlignment = taLeftJustify
      TabStop = True
      Text = 'e: [work]'
      Items.Strings = (
        'c: [system]'
        'd: [program]'
        'e: [work]'
        'f: [soft]'
        'g: []'
        'h: []')
      ItemIndex = 2
      DropDownCount = 8
      HorizontalExtent = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
      Sorted = False
      Style = bscbFixedStyle
      DirList = dirlist
      ParentFont = False
    end
    object dirlist: TbsSkinDirectoryListBox
      Left = 8
      Top = 40
      Width = 313
      Height = 161
      TabOrder = 1
      SkinData = mainform.bsSkinData1
      SkinDataName = 'listbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      AutoComplete = True
      UseSkinItemHeight = True
      HorizontalExtent = False
      Columns = 0
      RowCount = 0
      ImageIndex = -1
      NumGlyphs = 1
      Spacing = 2
      CaptionMode = False
      DefaultCaptionHeight = 20
      DefaultCaptionFont.Charset = DEFAULT_CHARSET
      DefaultCaptionFont.Color = clWindowText
      DefaultCaptionFont.Height = 14
      DefaultCaptionFont.Name = 'Arial'
      DefaultCaptionFont.Style = []
      DefaultItemHeight = 20
      Items.Strings = (
        'E:\'
        'work dirctroy'
        'delphi work'
        #20307#32946#24179#20998#31649#29702
        'help'
        'info'
        'style'
        'style1'
        'style2'
        #31354#25968#25454)
      ItemIndex = 3
      MultiSelect = False
      ListBoxFont.Charset = DEFAULT_CHARSET
      ListBoxFont.Color = clWindowText
      ListBoxFont.Height = 14
      ListBoxFont.Name = 'Arial'
      ListBoxFont.Style = []
      ListBoxTabOrder = 0
      ListBoxTabStop = True
      ListBoxDragMode = dmManual
      ListBoxDragKind = dkDrag
      ListBoxDragCursor = crDrag
      ExtandedSelect = True
      Sorted = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
    end
    object bsSkinButton1: TbsSkinButton
      Left = 246
      Top = 208
      Width = 75
      Height = 25
      TabOrder = 2
      SkinData = mainform.bsSkinData1
      SkinDataName = 'button'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      RepeatMode = False
      RepeatInterval = 100
      AllowAllUp = False
      TabStop = True
      CanFocused = True
      Down = False
      GroupIndex = 0
      Caption = #36873#25321#30830#23450
      NumGlyphs = 1
      Spacing = 1
      OnClick = bsSkinButton1Click
    end
  end
  object bsBusinessSkinForm1: TbsBusinessSkinForm
    HideCaptionButtons = False
    AlwaysShowInTray = False
    LogoBitMapTransparent = False
    AlwaysMinimizeToTray = False
    UseSkinFontInMenu = True
    ShowIcon = False
    MaximizeOnFullScreen = False
    AlphaBlend = False
    AlphaBlendAnimation = False
    AlphaBlendValue = 200
    ShowObjectHint = False
    MenusAlphaBlend = False
    MenusAlphaBlendAnimation = False
    MenusAlphaBlendValue = 200
    DefCaptionFont.Charset = DEFAULT_CHARSET
    DefCaptionFont.Color = clBtnText
    DefCaptionFont.Height = 14
    DefCaptionFont.Name = 'Arial'
    DefCaptionFont.Style = [fsBold]
    DefInActiveCaptionFont.Charset = DEFAULT_CHARSET
    DefInActiveCaptionFont.Color = clBtnShadow
    DefInActiveCaptionFont.Height = 14
    DefInActiveCaptionFont.Name = 'Arial'
    DefInActiveCaptionFont.Style = [fsBold]
    DefMenuItemHeight = 20
    DefMenuItemFont.Charset = DEFAULT_CHARSET
    DefMenuItemFont.Color = clWindowText
    DefMenuItemFont.Height = 14
    DefMenuItemFont.Name = 'Arial'
    DefMenuItemFont.Style = []
    UseDefaultSysMenu = True
    SkinData = mainform.bsSkinData1
    MinHeight = 0
    MinWidth = 0
    Magnetic = False
    MagneticSize = 5
    BorderIcons = [biSystemMenu, biRollUp]
    Left = 152
    Top = 24
  end
end
