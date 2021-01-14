object mzsf: Tmzsf
  Left = 127
  Top = 271
  Width = 808
  Height = 576
  Caption = #38376#35786#25910#36153
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 800
    Height = 25
    DataSource = DMmzsf.DSmzsf
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Align = alTop
    Flat = True
    Hints.Strings = (
      #31532#19968#26465#35760#24405
      #19978#19968#26465#35760#24405
      #19979#19968#26465#35760#24405
      #26368#21518#19968#26465#35760#24405
      ''
      ''
      ''
      ''
      ''
      '')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 25
    Width = 800
    Height = 524
    Align = alClient
    TabOrder = 1
    object Label4: TLabel
      Left = 16
      Top = 16
      Width = 26
      Height = 13
      Caption = #33647#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 288
      Top = 16
      Width = 26
      Height = 13
      Caption = #36153#29992
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 288
      Top = 48
      Width = 26
      Height = 13
      Caption = #26085#26399
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 168
      Width = 52
      Height = 13
      Caption = #36153#29992#21015#34920
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 16
      Top = 48
      Width = 26
      Height = 13
      Caption = #25968#37327
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 288
      Top = 80
      Width = 26
      Height = 13
      Caption = #33647#21517
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 16
      Top = 80
      Width = 26
      Height = 13
      Caption = #23454#25910
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 288
      Top = 112
      Width = 26
      Height = 13
      Caption = #34917#38646
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 16
      Top = 112
      Width = 26
      Height = 13
      Caption = #24635#35745
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 560
      Top = 112
      Width = 65
      Height = 13
      Caption = #20170#26085#20849#25910#36153
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object bh: TEdit
      Left = 56
      Top = 16
      Width = 201
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      TabOrder = 0
      OnKeyPress = bhKeyPress
    end
    object rq: TEdit
      Left = 328
      Top = 48
      Width = 201
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 7
    end
    object fy: TEdit
      Left = 328
      Top = 16
      Width = 201
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      TabOrder = 6
    end
    object DBGrid2: TDBGrid
      Left = 1
      Top = 196
      Width = 798
      Height = 327
      Align = alBottom
      Color = clInactiveCaptionText
      DataSource = DMmzsf.DSmzsf
      FixedColor = clMedGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ParentFont = False
      TabOrder = 12
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = #32534#21495
          Width = 188
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25968#37327
          Width = 254
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36153#29992
          Width = 208
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26085#26399
          Visible = True
        end>
    end
    object sl: TEdit
      Left = 56
      Top = 48
      Width = 201
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      TabOrder = 5
      OnKeyPress = slKeyPress
    end
    object mc: TEdit
      Left = 328
      Top = 80
      Width = 201
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 9
    end
    object ss: TEdit
      Left = 56
      Top = 80
      Width = 201
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      TabOrder = 1
      OnKeyPress = ssKeyPress
    end
    object zb: TEdit
      Left = 328
      Top = 112
      Width = 201
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      TabOrder = 10
    end
    object Button1: TButton
      Left = 232
      Top = 152
      Width = 75
      Height = 25
      Caption = #25552#20132'(& )'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
    object zj: TEdit
      Left = 56
      Top = 112
      Width = 201
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      TabOrder = 8
      Text = '0'
    end
    object Button2: TButton
      Left = 448
      Top = 152
      Width = 75
      Height = 25
      Caption = #32479#35745'(&t)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button2Click
    end
    object Mdtzj: TEdit
      Left = 640
      Top = 112
      Width = 161
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 11
    end
    object RichEdit1: TRichEdit
      Left = 536
      Top = 16
      Width = 265
      Height = 89
      Alignment = taCenter
      BorderStyle = bsNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object Button3: TButton
      Left = 648
      Top = 152
      Width = 75
      Height = 25
      Caption = #25171#21360
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Button3Click
    end
  end
end
