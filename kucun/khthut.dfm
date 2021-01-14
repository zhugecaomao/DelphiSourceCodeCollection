object khthfm: Tkhthfm
  Left = 237
  Top = 207
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#36864#36135#31649#29702
  ClientHeight = 243
  ClientWidth = 673
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 673
    Height = 41
    Align = alTop
    Caption = #23458#25143#36864#36135#31649#29702
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 673
    Height = 161
    Align = alClient
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 6
      Top = 16
      Width = 657
      Height = 137
      Caption = #21830#21697#20449#24687
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 32
        Width = 97
        Height = 25
        AutoSize = False
        Caption = #21830#21697#21517#31216'(*)'#65306
      end
      object Label2: TLabel
        Left = 16
        Top = 68
        Width = 73
        Height = 13
        AutoSize = False
        Caption = #21830#21697#32534#21495'(*)'#65306
      end
      object Label3: TLabel
        Left = 232
        Top = 69
        Width = 65
        Height = 13
        AutoSize = False
        Caption = #21830#21697#21697#31867#65306
      end
      object Label4: TLabel
        Left = 443
        Top = 70
        Width = 65
        Height = 17
        AutoSize = False
        Caption = #25968'        '#37327'(*)'#65306
      end
      object Label5: TLabel
        Left = 16
        Top = 105
        Width = 73
        Height = 25
        AutoSize = False
        Caption = #21333'        '#20301'(*)'#65306
      end
      object Label6: TLabel
        Left = 443
        Top = 107
        Width = 70
        Height = 17
        AutoSize = False
        Caption = #24635'  '#37329'  '#39069'(*)'#65306
      end
      object Label17: TLabel
        Left = 626
        Top = 108
        Width = 25
        Height = 25
        AutoSize = False
        Caption = #20803
      end
      object Label18: TLabel
        Left = 232
        Top = 32
        Width = 73
        Height = 17
        AutoSize = False
        Caption = #21830#21697#35268#26684'(*)'#65306
      end
      object Label19: TLabel
        Left = 232
        Top = 104
        Width = 81
        Height = 25
        AutoSize = False
        Caption = #21830#21697#21333#20215'(*)'#65306
      end
      object Label20: TLabel
        Left = 443
        Top = 32
        Width = 73
        Height = 25
        AutoSize = False
        Caption = #21830#21697#27454#24335'(*)'#65306
      end
      object Label22: TLabel
        Left = 425
        Top = 109
        Width = 19
        Height = 15
        AutoSize = False
        Caption = #20803
      end
      object clmcbox: TComboBox
        Left = 96
        Top = 32
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 0
        OnChange = clmcboxChange
        OnKeyDown = clmcboxKeyDown
      end
      object clbhedit: TEdit
        Left = 96
        Top = 65
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 3
      end
      object clplbox: TComboBox
        Left = 312
        Top = 66
        Width = 121
        Height = 21
        AutoDropDown = True
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 4
      end
      object sledit: TEdit
        Left = 520
        Top = 64
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 5
        Text = '0'
      end
      object dwbox: TComboBox
        Left = 96
        Top = 104
        Width = 121
        Height = 21
        AutoDropDown = True
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 6
        Items.Strings = (
          #20214
          #26465
          #20010
          #22359
          #21305
          #26020
          #24352)
      end
      object zjeedit: TEdit
        Left = 520
        Top = 104
        Width = 105
        Height = 21
        Enabled = False
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 8
        Text = '0'
      end
      object clggbox: TComboBox
        Left = 312
        Top = 32
        Width = 121
        Height = 21
        AutoDropDown = True
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 1
        OnKeyDown = clggboxKeyDown
      end
      object cldjedit: TEdit
        Left = 312
        Top = 104
        Width = 113
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 7
        Text = '0'
      end
      object clksbox: TComboBox
        Left = 520
        Top = 32
        Width = 121
        Height = 21
        AutoDropDown = True
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 2
        OnChange = clksboxChange
        OnKeyDown = clksboxKeyDown
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 202
    Width = 673
    Height = 41
    Align = alBottom
    TabOrder = 2
    object rkbt: TSpeedButton
      Left = 72
      Top = 8
      Width = 73
      Height = 25
      Caption = #36864#36135'[F1]'
    end
    object qxbt: TSpeedButton
      Left = 312
      Top = 8
      Width = 65
      Height = 25
      Caption = #21462#28040'[F2]'
    end
    object gbbt: TSpeedButton
      Left = 544
      Top = 8
      Width = 73
      Height = 25
      Caption = #20851#38381'[F3]'
    end
  end
  object ADOQuery: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    SQL.Strings = (
      'select * from rkb ')
    Left = 256
    Top = 112
  end
end
