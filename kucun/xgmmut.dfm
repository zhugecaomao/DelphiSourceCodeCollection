object xgmmfm: Txgmmfm
  Left = 279
  Top = 215
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20462#25913#23494#30721
  ClientHeight = 217
  ClientWidth = 336
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
    Width = 336
    Height = 217
    Align = alClient
    TabOrder = 0
    object xgbt: TSpeedButton
      Left = 48
      Top = 184
      Width = 73
      Height = 25
      Caption = #20462#25913
      OnClick = xgbtClick
    end
    object qxbt: TSpeedButton
      Left = 184
      Top = 184
      Width = 81
      Height = 25
      Caption = #21462#28040
      OnClick = qxbtClick
    end
    object yhm: TLabel
      Left = 32
      Top = 0
      Width = 265
      Height = 25
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 32
      Top = 16
      Width = 289
      Height = 169
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 32
        Width = 89
        Height = 25
        AutoSize = False
        Caption = #26087'  '#23494'  '#30721#65306
      end
      object Label2: TLabel
        Left = 8
        Top = 80
        Width = 73
        Height = 13
        AutoSize = False
        Caption = #26032'  '#23494'  '#30721#65306
      end
      object Label3: TLabel
        Left = 8
        Top = 128
        Width = 73
        Height = 13
        AutoSize = False
        Caption = #30830#35748#23494#30721#65306
      end
      object jmmedit: TEdit
        Left = 104
        Top = 24
        Width = 145
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        PasswordChar = '#'
        TabOrder = 0
      end
      object xmmedit: TEdit
        Left = 104
        Top = 72
        Width = 145
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        PasswordChar = '#'
        TabOrder = 1
      end
      object qrmmedit: TEdit
        Left = 104
        Top = 120
        Width = 145
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        PasswordChar = '#'
        TabOrder = 2
        OnKeyDown = qrmmeditKeyDown
      end
    end
  end
  object ADOQuery: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    SQL.Strings = (
      'select * from czyb')
    Left = 112
    Top = 72
  end
end
