object FrmAbout: TFrmAbout
  Left = 549
  Top = 305
  BorderStyle = bsNone
  Caption = 'FrmAbout'
  ClientHeight = 315
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object AboutTitle: TFlatTitlebar
    Left = 0
    Top = 0
    Width = 361
    Height = 21
    ActiveTextColor = clYellow
    InactiveTextColor = clMoneyGreen
    TitlebarColor = clGreen
    Align = alTop
    Caption = 'AboutTitle'
  end
  object FlatPanel1: TFlatPanel
    Left = 0
    Top = 21
    Width = 361
    Height = 294
    ParentColor = True
    ColorHighLight = clGreen
    ColorShadow = clGreen
    Align = alClient
    TabOrder = 1
    object lblProgramName: TLabel
      Left = 16
      Top = 8
      Width = 182
      Height = 24
      Caption = 'lblProgramName'
      Enabled = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblVersion: TLabel
      Left = 24
      Top = 48
      Width = 90
      Height = 12
      Caption = #24403#21069#29256#26412#65306'1.0.0'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Shape1: TShape
      Left = 8
      Top = 240
      Width = 345
      Height = 2
      Pen.Color = clGreen
    end
    object lblZZ: TLabel
      Left = 24
      Top = 248
      Width = 148
      Height = 35
      Caption = #27426#36814#20351#29992
      Enabled = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -35
      Font.Name = #38582#20070
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lblzzz: TLabel
      Left = 24
      Top = 72
      Width = 96
      Height = 12
      Caption = #36719#20214#20316#32773#65306#32599#31062#26415
    end
    object lblemail: TLabel
      Left = 232
      Top = 72
      Width = 96
      Height = 12
      Caption = 'Luozs168@163.net'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 184
      Top = 72
      Width = 42
      Height = 12
      Caption = 'E-Mail:'
    end
    object Shape2: TShape
      Left = 8
      Top = 168
      Width = 345
      Height = 2
      Pen.Color = clGreen
    end
    object Label2: TLabel
      Left = 16
      Top = 184
      Width = 84
      Height = 12
      Caption = #26412#36719#20214#25480#26435#32473#65306
      Enabled = False
    end
    object lblRegInc: TLabel
      Left = 16
      Top = 208
      Width = 337
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = #26410#27880#20876#29256#26412
      Enabled = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 96
      Width = 329
      Height = 41
      AutoSize = False
      Caption = 
        '    '#36825#26159#25105#30001'2002'#24180'12'#26376#24320#22987#23398#20064' DELPHI '#32534#31243#20197#26469#30340#31532#20108#20010#25968#25454#24211#31867#36719#20214#12290#24076#26395#22312#20320#30340#20351#29992#36807#31243#20013#21457#29616#26377#20160#20040#38169#35823#25110#26377#22909#30340 +
        #24314#35758#35831#19982#25105#32852#31995#12290#35874#35874#65281
      WordWrap = True
    end
    object Label4: TLabel
      Left = 32
      Top = 144
      Width = 252
      Height = 14
      Caption = #26412#36719#20214#23646#20110#20813#36153#27880#20876#29256#65292#20855#20307#24773#20917#35831#28857#20987
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label5: TLabel
      Left = 288
      Top = 144
      Width = 28
      Height = 14
      Cursor = crHandPoint
      Caption = #36825#37324
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      OnClick = Label5Click
    end
    object BtnOk: TFlatButton
      Left = 280
      Top = 255
      Width = 65
      Height = 25
      ColorBorder = clGreen
      ColorHighLight = 14805739
      Caption = #30830'  '#23450
      Font.Charset = GB2312_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnOkClick
    end
  end
end
