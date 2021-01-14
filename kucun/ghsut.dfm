object ghsglfm: Tghsglfm
  Left = 276
  Top = 118
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20379#36135#21830#31649#29702
  ClientHeight = 455
  ClientWidth = 690
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
    Width = 690
    Height = 455
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 185
      Height = 433
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 48
        Width = 113
        Height = 25
        AutoSize = False
        Caption = #20379#36135#21830#21517#31216
      end
      object Label2: TLabel
        Left = 16
        Top = 120
        Width = 81
        Height = 25
        AutoSize = False
        Caption = #20135#21697#31181#31867
      end
      object SpeedButton1: TSpeedButton
        Left = 8
        Top = 352
        Width = 81
        Height = 25
        Caption = #28155#21152
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 96
        Top = 352
        Width = 81
        Height = 25
        Caption = #20462#25913
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 8
        Top = 392
        Width = 81
        Height = 25
        Caption = #21024#38500
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Left = 16
        Top = 320
        Width = 153
        Height = 25
        Caption = #28165#38500
        OnClick = SpeedButton4Click
      end
      object SpeedButton5: TSpeedButton
        Left = 96
        Top = 392
        Width = 81
        Height = 25
        Caption = #20851#38381
        OnClick = SpeedButton5Click
      end
      object Label3: TLabel
        Left = 16
        Top = 192
        Width = 89
        Height = 25
        AutoSize = False
        Caption = #22320#22336
      end
      object Label4: TLabel
        Left = 16
        Top = 256
        Width = 89
        Height = 17
        AutoSize = False
        Caption = #35746#36141#30005#35805
      end
      object ghsmcedit: TEdit
        Left = 16
        Top = 80
        Width = 153
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 0
      end
      object cpzledit: TEdit
        Left = 16
        Top = 152
        Width = 153
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 1
      end
      object dzedit: TEdit
        Left = 16
        Top = 224
        Width = 153
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 2
      end
      object dhedit: TEdit
        Left = 16
        Top = 280
        Width = 153
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 3
      end
    end
    object GroupBox2: TGroupBox
      Left = 200
      Top = 8
      Width = 481
      Height = 441
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 2
        Top = 15
        Width = 477
        Height = 424
        Align = alClient
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
      end
    end
  end
  object ADOQuery: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    SQL.Strings = (
      'select * from ghdwb')
    Left = 200
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery
    Left = 304
    Top = 152
  end
end
