object cprkfm: Tcprkfm
  Left = 188
  Top = 173
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25104#21697#20837#24211
  ClientHeight = 315
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object inpl: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 315
    Align = alClient
    TabOrder = 0
    object GroupBox3: TGroupBox
      Left = 1
      Top = 208
      Width = 702
      Height = 106
      Align = alBottom
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 16
        Width = 81
        Height = 33
        AutoSize = False
        Caption = #20179#24211#31649#29702#21592#65306
        Layout = tlCenter
      end
      object bcbt: TSpeedButton
        Left = 296
        Top = 64
        Width = 81
        Height = 33
        Hint = #20445#23384#25104#21697#20837#24211#21333
        Caption = #20445#23384#20837#24211#21333
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = bcbtClick
      end
      object gbbt: TSpeedButton
        Left = 376
        Top = 64
        Width = 89
        Height = 33
        Hint = #20851#38381#31383#21475
        Caption = #20851#38381#31383#21475
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = gbbtClick
      end
      object sxbt: TSpeedButton
        Left = 472
        Top = 64
        Width = 41
        Height = 33
        Caption = #21047#26032
        Flat = True
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = FormCreate
      end
      object Bevel2: TBevel
        Left = 1
        Top = 46
        Width = 704
        Height = 11
        Shape = bsBottomLine
      end
      object kg: TComboBox
        Left = 88
        Top = 23
        Width = 129
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ItemHeight = 13
        TabOrder = 0
      end
      object DBNavigator1: TDBNavigator
        Left = 200
        Top = 64
        Width = 94
        Height = 33
        DataSource = DataSource1
        VisibleButtons = [nbDelete]
        Flat = True
        Hints.Strings = (
          'First record'
          'Prior record'
          'Next record'
          'Last record'
          'Insert record'
          #21024#38500#35760#24405
          'Edit record'
          #25552#20132#35760#24405
          'Cancel edit'
          'Refresh data')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 702
      Height = 96
      Align = alTop
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object djbh: TLabel
        Left = 543
        Top = 53
        Width = 153
        Height = 15
        AutoSize = False
        Caption = '11'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object Label9: TLabel
        Left = 472
        Top = 71
        Width = 65
        Height = 23
        AutoSize = False
        Caption = #36864#26009#26085#26399#65306
        Layout = tlCenter
      end
      object Label1: TLabel
        Left = 472
        Top = 48
        Width = 65
        Height = 23
        AutoSize = False
        Caption = #21333#25454#32534#21495#65306
        Layout = tlCenter
      end
      object Label15: TLabel
        Left = 176
        Top = 16
        Width = 265
        Height = 33
        AutoSize = False
        Caption = #24191#24030#26234#36798#23478#20855#26377#38480#20844#21496' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 238
        Top = 48
        Width = 137
        Height = 33
        AutoSize = False
        Caption = ' '#25104#21697#20837#24211#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object Bevel1: TBevel
        Left = 179
        Top = 48
        Width = 249
        Height = 2
        Shape = bsBottomLine
      end
      object jhrqbox: TDateTimePicker
        Left = 544
        Top = 71
        Width = 118
        Height = 19
        Date = 38492.474073437500000000
        Time = 38492.474073437500000000
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 97
      Width = 702
      Height = 111
      Align = alClient
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      object DBGrid1: TDBGrid
        Left = 1
        Top = 14
        Width = 700
        Height = 96
        Align = alClient
        Ctl3D = False
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #24207#21495
            Title.Alignment = taCenter
            Visible = True
          end
          item
            DropDownRows = 20
            Expanded = False
            FieldName = #21517#31216
            Visible = True
          end
          item
            Expanded = False
            FieldName = #35268#26684
            Visible = True
          end
          item
            Expanded = False
            FieldName = #25968#37327
            Visible = True
          end
          item
            Expanded = False
            FieldName = #21333#20301
            PickList.Strings = (
              #24352
              #22871
              #20214
              #21488
              #24202)
            Visible = True
          end
          item
            Expanded = False
            FieldName = #22791#27880
            Visible = True
          end
          item
            Expanded = False
            FieldName = #21333#25454#32534#21495
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end>
      end
    end
  end
  object ADOQuery: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    SQL.Strings = (
      'select * from rkb ')
    Left = 232
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 177
    Top = 177
  end
  object ADOQuery1: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    Left = 265
    Top = 193
  end
  object ADOQuery2: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    Left = 313
    Top = 193
  end
  object ADOQuery3: TADOQuery
    Connection = dataconfm.datacon
    Parameters = <>
    Left = 345
    Top = 193
  end
end
