object ckglfm: Tckglfm
  Left = 91
  Top = 188
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26376#20986#36135#31649#29702
  ClientHeight = 493
  ClientWidth = 757
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
    Width = 233
    Height = 493
    Align = alLeft
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 8
      Top = 352
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 120
      Top = 352
      Width = 75
      Height = 25
      Caption = #20462#25913
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 8
      Top = 384
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 120
      Top = 384
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 3
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 8
      Top = 416
      Width = 75
      Height = 25
      Caption = #19978#19968#26465
      TabOrder = 4
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 120
      Top = 416
      Width = 75
      Height = 25
      Caption = #19979#19968#26465
      TabOrder = 5
      OnClick = BitBtn6Click
    end
    object BitBtn7: TBitBtn
      Left = 120
      Top = 448
      Width = 76
      Height = 25
      Caption = #20851#38381
      TabOrder = 6
      OnClick = BitBtn7Click
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 209
      Height = 337
      Caption = #22522#26412#20449#24687
      TabOrder = 7
      object Label1: TLabel
        Left = 8
        Top = 74
        Width = 65
        Height = 17
        AutoSize = False
        Caption = #21830#21697#21517#31216#65306
      end
      object Label2: TLabel
        Left = 8
        Top = 105
        Width = 65
        Height = 17
        AutoSize = False
        Caption = #21830#21697#35268#26684#65306
      end
      object Label3: TLabel
        Left = 8
        Top = 132
        Width = 65
        Height = 17
        AutoSize = False
        Caption = #21830#21697#27454#24335#65306
      end
      object Label4: TLabel
        Left = 8
        Top = 159
        Width = 65
        Height = 17
        AutoSize = False
        Caption = #21830#21697#21697#31867#65306
      end
      object Label5: TLabel
        Left = 8
        Top = 179
        Width = 65
        Height = 17
        AutoSize = False
        Caption = #25968#37327#65306
      end
      object Label8: TLabel
        Left = 8
        Top = 207
        Width = 65
        Height = 17
        AutoSize = False
        Caption = #21333#20301#65306
      end
      object Label6: TLabel
        Left = 8
        Top = 237
        Width = 65
        Height = 17
        AutoSize = False
        Caption = #36827#20215#65306
      end
      object Label7: TLabel
        Left = 8
        Top = 285
        Width = 65
        Height = 17
        AutoSize = False
        Caption = #36827#36135#24635#39069#65306
      end
      object Label9: TLabel
        Left = 8
        Top = 264
        Width = 65
        Height = 17
        AutoSize = False
        Caption = #21806#20215#65306
      end
      object Label10: TLabel
        Left = 8
        Top = 312
        Width = 65
        Height = 17
        AutoSize = False
        Caption = #38144#21806#24635#39069#65306
      end
      object clbh: TLabeledEdit
        Left = 72
        Top = 42
        Width = 121
        Height = 21
        EditLabel.Width = 63
        EditLabel.Height = 13
        EditLabel.Caption = #21830#21697#32534#21495#65306' '
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        LabelPosition = lpLeft
        TabOrder = 0
      end
      object clmc: TComboBox
        Left = 72
        Top = 69
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 1
      end
      object cldj: TEdit
        Left = 72
        Top = 233
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 2
        Text = '0'
        OnChange = cldjChange
        OnKeyDown = cldjKeyDown
      end
      object zje: TEdit
        Left = 72
        Top = 286
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 3
        Text = '0'
      end
      object clgg: TComboBox
        Left = 72
        Top = 97
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 4
      end
      object clks: TComboBox
        Left = 72
        Top = 124
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 5
      end
      object clpl: TComboBox
        Left = 72
        Top = 151
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 6
      end
      object cldw: TComboBox
        Left = 72
        Top = 205
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 7
        Items.Strings = (
          #20214
          #26465
          #20010
          #22359
          #21305
          #26020
          #24352)
      end
      object djbh: TLabeledEdit
        Left = 72
        Top = 16
        Width = 121
        Height = 21
        EditLabel.Width = 63
        EditLabel.Height = 13
        EditLabel.Caption = #21333#25454#32534#21495#65306' '
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        LabelPosition = lpLeft
        TabOrder = 8
      end
      object sl: TEdit
        Left = 72
        Top = 178
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 9
        Text = '0'
        OnChange = slChange
        OnKeyDown = slKeyDown
      end
      object clsj: TEdit
        Left = 72
        Top = 260
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 10
        Text = '0'
        OnChange = cldjChange
        OnKeyDown = cldjKeyDown
      end
      object xszje: TEdit
        Left = 72
        Top = 310
        Width = 121
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 11
        Text = '0'
      end
    end
    object bh: TEdit
      Left = 80
      Top = 344
      Width = 49
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      TabOrder = 8
      Visible = False
    end
    object BitBtn8: TBitBtn
      Left = 8
      Top = 448
      Width = 75
      Height = 25
      Caption = #21047#26032
      TabOrder = 9
      OnClick = BitBtn8Click
    end
  end
  object Panel2: TPanel
    Left = 233
    Top = 0
    Width = 524
    Height = 493
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 522
      Height = 491
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
  object DataSource1: TDataSource
    DataSet = ADOQuery
    Left = 281
    Top = 200
  end
  object ADOQuery: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    Left = 256
    Top = 144
  end
end
