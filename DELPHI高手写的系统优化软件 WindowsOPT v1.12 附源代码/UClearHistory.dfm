object FrmClearHistory: TFrmClearHistory
  Left = 213
  Top = 322
  BorderStyle = bsDialog
  Caption = #28165#38500#21382#21490#35760#24405
  ClientHeight = 366
  ClientWidth = 340
  Color = 14215660
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object RzChkGupCleHis: TRzCheckGroup
    Left = 10
    Top = 10
    Width = 316
    Height = 311
    BorderColor = 14215660
    Caption = #28165#38500#36873#39033
    Columns = 2
    FlatColorAdjustment = 0
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHotTrack = True
    ItemFont.Charset = GB2312_CHARSET
    ItemFont.Color = clBlack
    ItemFont.Height = -12
    ItemFont.Name = #23435#20307
    ItemFont.Style = []
    Items.Strings = (
      'Microsoft Word'
      'Microsoft Excel'
      'Microsoft PowerPoint'
      'Microsoft FrontPage'
      'Microsoft Project'
      'Microsoft Visio'
      'Microsoft Publisher'
      'Microsoft InfoPath'
      'Windows Media Player'
      'RealPlayer'
      'Dreamweaver MX 2004'
      'Flash MX 2004'
      'Fireworks MX 2004'
      'Delphi'
      'Visual Basic 6.0'
      'Visual C++ 6.0'
      'PhotoImpact 10.0'
      'WinRAR'
      #30011#22270
      #20889#23383#26495
      #8220#27983#35272#8221#23545#35805#26694
      #8220#36816#34892#8221
      #8220#25628#32034#8221
      #26368#36817#30340#25991#26723
      'IE '#22320#22336#26639)
    ParentFont = False
    StartXPos = 15
    StartYPos = 3
    TabOrder = 2
    TextStyle = tsRecessed
    ThemeAware = False
    Transparent = True
    VerticalSpacing = 5
    CheckStates = (
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0)
  end
  object RzChkBoxSelAll: TRzCheckBox
    Left = 25
    Top = 335
    Width = 60
    Height = 17
    Caption = #20840#36873
    HotTrack = True
    State = cbUnchecked
    TabOrder = 3
    Transparent = True
    OnClick = RzChkBoxSelAllClick
  end
  object RzBtnCleHis: TRzButton
    Left = 156
    Top = 331
    Width = 80
    ShowFocusRect = False
    Caption = #28165#38500
    Color = 14938354
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    HotTrack = True
    ParentFont = False
    TabOrder = 0
    TextStyle = tsRecessed
    OnClick = RzBtnCleHisClick
  end
  object RzBtnCleHisCancel: TRzButton
    Left = 245
    Top = 331
    Width = 80
    Cancel = True
    ShowFocusRect = False
    Caption = #20851#38381
    Color = 14938354
    HotTrack = True
    TabOrder = 1
    TextStyle = tsRecessed
    OnClick = RzBtnCleHisCancelClick
  end
end
