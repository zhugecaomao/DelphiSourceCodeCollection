object weal: Tweal
  Left = 238
  Top = 191
  BorderStyle = bsDialog
  Caption = #22871#29992
  ClientHeight = 273
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object SpeedButton1: TSpeedButton
    Left = 168
    Top = 32
    Width = 23
    Height = 22
    Caption = '->'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 168
    Top = 64
    Width = 23
    Height = 22
    Caption = '<-'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 168
    Top = 152
    Width = 23
    Height = 22
    Caption = '>>>'
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TSpeedButton
    Left = 168
    Top = 184
    Width = 23
    Height = 22
    Caption = '<<<'
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton4Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 153
    Height = 225
    Caption = #24050#26377
    TabOrder = 0
    object vleLeft: TValueListEditor
      Left = 16
      Top = 24
      Width = 121
      Height = 177
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goRowSelect, goThumbTracking]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleCaptions.Strings = (
        #22995#21517
        'Value')
      OnDblClick = SpeedButton1Click
      OnMouseMove = vleLeftMouseMove
      ColWidths = (
        150
        -35)
    end
  end
  object Button1: TButton
    Left = 192
    Top = 240
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 272
    Top = 240
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 2
    OnClick = Button2Click
  end
  object GroupBox2: TGroupBox
    Left = 200
    Top = 8
    Width = 153
    Height = 225
    Caption = #36873#25321
    TabOrder = 3
    object vleRight: TValueListEditor
      Left = 16
      Top = 24
      Width = 121
      Height = 177
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goRowSelect, goThumbTracking]
      TabOrder = 0
      TitleCaptions.Strings = (
        #22995#21517
        'Value')
      OnDblClick = SpeedButton2Click
      ColWidths = (
        150
        -35)
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Main.ADOconn
    Parameters = <>
    SQL.Strings = (
      'select * from r_staffinfo where delrecy='#39'0'#39)
    Left = 40
    Top = 240
  end
  object ADOTable1: TADOTable
    Connection = Main.ADOconn
    TableName = 'r_staffpay'
    Left = 64
    Top = 144
  end
  object r_staffinfo: TADOTable
    Connection = Main.ADOconn
    IndexName = 'ID'
    TableName = 'r_staffinfo'
    Left = 72
    Top = 104
  end
  object r_staffclasscode: TADOTable
    Connection = Main.ADOconn
    IndexName = 'id'
    TableName = 'r_staffclasscode'
    Left = 112
    Top = 168
  end
end
