inherited FM_3080: TFM_3080
  Left = 160
  Top = 120
  Width = 852
  Height = 580
  Hint = #36827#26009#24212#20184#24080#27454#20914#24080
  Caption = #36827#26009#24212#20184#24080#27454#20914#24080
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  object Panel2: TPanel
    Left = 201
    Top = 0
    Width = 643
    Height = 553
    Align = alClient
    TabOrder = 0
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 641
      Height = 120
      Align = alTop
      TabOrder = 0
      OnExit = Panel4Exit
      object Label2: TLabel
        Left = 16
        Top = 51
        Width = 48
        Height = 12
        Caption = #36827#36135#24635#39069
        FocusControl = DBEdit1
      end
      object Label4: TLabel
        Left = 312
        Top = 51
        Width = 48
        Height = 12
        Caption = #31246'    '#39069
        FocusControl = DBEdit3
      end
      object Label5: TLabel
        Left = 16
        Top = 75
        Width = 48
        Height = 12
        Caption = #29616#37329#25240#25187
        FocusControl = DBEdit4
      end
      object Label6: TLabel
        Left = 164
        Top = 75
        Width = 48
        Height = 12
        Caption = #36827#26009#25240#35753
        FocusControl = DBEdit5
      end
      object Label7: TLabel
        Left = 313
        Top = 75
        Width = 48
        Height = 12
        Caption = #20854#23427#36153#29992
        FocusControl = DBEdit6
      end
      object Label8: TLabel
        Left = 16
        Top = 99
        Width = 54
        Height = 12
        Caption = #26412#26399#24212#20184' '
        FocusControl = DBEdit7
      end
      object Label9: TLabel
        Left = 164
        Top = 100
        Width = 48
        Height = 12
        Caption = #26412#26399#24050#20184
        FocusControl = DBEdit8
      end
      object Label10: TLabel
        Left = 313
        Top = 100
        Width = 48
        Height = 12
        Caption = #26412#26399#26410#20184
        FocusControl = DBEdit9
      end
      object Label11: TLabel
        Left = 432
        Top = 52
        Width = 48
        Height = 12
        Caption = #23454#38469#31246#39069
        FocusControl = DBEdit10
      end
      object Label3: TLabel
        Left = 164
        Top = 51
        Width = 48
        Height = 12
        Caption = #36864#26009#24635#39069
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 69
        Top = 46
        Width = 87
        Height = 20
        Color = clInfoBk
        DataField = 'F03'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 365
        Top = 47
        Width = 64
        Height = 20
        Color = clInfoBk
        DataField = 'F05'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 69
        Top = 71
        Width = 87
        Height = 20
        DataField = 'F06'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 216
        Top = 71
        Width = 90
        Height = 20
        DataField = 'F07'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 365
        Top = 71
        Width = 180
        Height = 20
        DataField = 'F08'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        TabOrder = 6
      end
      object DBEdit7: TDBEdit
        Left = 69
        Top = 95
        Width = 87
        Height = 20
        Color = clInfoBk
        DataField = 'CalF09'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit8: TDBEdit
        Left = 216
        Top = 96
        Width = 90
        Height = 20
        Color = clInfoBk
        DataField = 'CalF10'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ReadOnly = True
        TabOrder = 8
      end
      object DBEdit9: TDBEdit
        Left = 365
        Top = 96
        Width = 180
        Height = 20
        Color = clInfoBk
        DataField = 'CalF11'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ReadOnly = True
        TabOrder = 9
      end
      object DBEdit10: TDBEdit
        Left = 482
        Top = 47
        Width = 63
        Height = 20
        DataField = 'F14'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        TabOrder = 3
      end
      object CoolBar1: TCoolBar
        Left = 1
        Top = 1
        Width = 639
        Height = 41
        Bands = <
          item
            Control = ToolBar1
            ImageIndex = -1
            MinHeight = 36
            Width = 635
          end>
        Color = clBtnFace
        ParentColor = False
        object ToolBar1: TToolBar
          Left = 9
          Top = 0
          Width = 622
          Height = 36
          ButtonHeight = 28
          Caption = 'ToolBar1'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 0
          object BitBtn3: TBitBtn
            Left = 0
            Top = 2
            Width = 88
            Height = 28
            Caption = #23384#26723
            TabOrder = 0
            OnClick = BitBtn3Click
          end
          object BitBtn2: TBitBtn
            Left = 88
            Top = 2
            Width = 88
            Height = 28
            Caption = #21462#28040
            TabOrder = 1
            OnClick = BitBtn2Click
          end
          object SB6: TSpeedButton
            Left = 176
            Top = 2
            Width = 88
            Height = 28
            Hint = #36864#20986#26412#31383#21475
            Caption = #31163#24320
            Glyph.Data = {
              EE000000424DEE0000000000000076000000280000000F0000000F0000000100
              0400000000007800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888080707E7E70007080880707E7E060078088000000007600808888090E0066
              6080800009901067608080999999107070808099999910006080800009901070
              60808888090F107670808888000E106660808888080FEF0760808888880EFEF0
              708088888800000000808888888888888880}
            OnClick = SB6Click
          end
        end
      end
      object DBEdit2: TDBEdit
        Left = 216
        Top = 46
        Width = 90
        Height = 20
        Color = clInfoBk
        DataField = 'F04'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ReadOnly = True
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 121
      Width = 641
      Height = 431
      Align = alClient
      TabOrder = 1
      OnExit = Panel5Exit
      object DBVertNavigator1: TDBVertNavigator
        Left = 613
        Top = 1
        Width = 27
        Height = 429
        DataSource = DataSource2
        VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
        Align = alRight
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 612
        Height = 429
        Align = alClient
        DataSource = DataSource2
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        TabOrder = 1
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnEditButtonClick = DBGrid1EditButtonClick
        Columns = <
          item
            Alignment = taCenter
            Color = clInfoBk
            Expanded = False
            FieldName = 'D_SN'
            Title.Alignment = taCenter
            Width = 30
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'F03'
            Title.Alignment = taCenter
            Width = 79
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'F04'
            Title.Alignment = taCenter
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F05'
            Title.Alignment = taRightJustify
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F06'
            Title.Alignment = taRightJustify
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F07'
            Title.Alignment = taRightJustify
            Title.Caption = #31080#25454
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F08'
            Title.Alignment = taCenter
            Title.Caption = #31080#25454#21495#30721
            Width = 68
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'F09'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CalF10'
            Title.Alignment = taRightJustify
            Width = 75
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 553
    Align = alLeft
    BevelOuter = bvSpace
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 199
      Height = 40
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 16
        Width = 48
        Height = 12
        Caption = #24080#27454#24180#26376
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object BitBtn4: TBitBtn
        Left = 158
        Top = 11
        Width = 35
        Height = 21
        Caption = #30830#23450
        Default = True
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = BitBtn4Click
        NumGlyphs = 2
      end
      object SpinEdit1: TSpinEdit
        Left = 61
        Top = 11
        Width = 46
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        MaxValue = 3000
        MinValue = 1
        ParentFont = False
        TabOrder = 0
        Value = 2002
      end
      object ComboBox1: TComboBox
        Left = 109
        Top = 11
        Width = 43
        Height = 20
        Style = csDropDownList
        DropDownCount = 12
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ItemHeight = 12
        ParentFont = False
        TabOrder = 1
        Items.Strings = (
          '01'
          '02'
          '03'
          '04'
          '05'
          '06'
          '07'
          '08'
          '09'
          '10'
          '11'
          '12')
      end
    end
    object DBGrid2: TDBGrid
      Left = 1
      Top = 41
      Width = 199
      Height = 511
      Align = alClient
      Color = clInfoBk
      DataSource = DataSource3
      ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'F02'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F03'
          Width = 97
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 201
    Top = 153
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 217
    Top = 225
  end
  object Query1: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select T.F01,T.F02,F.F03 from T3060 as T'
      'left join T1020 as F on T.F02=F.F01'
      'where T.F01=:F01')
    Left = 144
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'F01'
        ParamType = ptUnknown
      end>
    object Query1F01: TStringField
      FieldName = 'F01'
      Origin = 'STK0311.T3110.F01'
      FixedChar = True
      Size = 4
    end
    object Query1F02: TStringField
      DisplayLabel = #21378#21830#32534#21495
      DisplayWidth = 8
      FieldName = 'F02'
      Origin = 'STK0311.T3110.F02'
      FixedChar = True
      Size = 10
    end
    object Query1F03: TStringField
      DisplayLabel = #31616#31216
      FieldName = 'F03'
      Origin = 'STK0311.T1020.F03'
      FixedChar = True
      Size = 12
    end
  end
  object DataSource3: TDataSource
    DataSet = Query1
    Left = 104
    Top = 200
  end
  object Qry1: TQuery
    DatabaseName = 'STK0311'
    Left = 401
    Top = 201
  end
  object Qry2: TQuery
    DatabaseName = 'STK0311'
    Left = 440
    Top = 200
  end
  object Table2: TTable
    BeforeInsert = Table2BeforeInsert
    BeforePost = Table2BeforePost
    AfterPost = Table2AfterPost
    BeforeDelete = Table2BeforeDelete
    AfterDelete = Table2AfterDelete
    OnCalcFields = Table2CalcFields
    DatabaseName = 'STK0311'
    IndexFieldNames = 'F01;F02'
    MasterFields = 'F01;F02'
    MasterSource = DataSource1
    TableName = 'dbo.T3060A'
    Left = 265
    Top = 233
    object Table2F01: TStringField
      DisplayLabel = #24080#27454#24180#26376
      FieldName = 'F01'
      Required = True
      FixedChar = True
      Size = 10
    end
    object Table2F02: TStringField
      DisplayLabel = #22996#22806#21378#21830
      FieldName = 'F02'
      Required = True
      FixedChar = True
      Size = 10
    end
    object Table2K_SN: TStringField
      FieldName = 'K_SN'
      FixedChar = True
      Size = 10
    end
    object Table2D_SN: TStringField
      DisplayLabel = #39033
      FieldName = 'D_SN'
      FixedChar = True
      Size = 10
    end
    object Table2F03: TDateTimeField
      DisplayLabel = #20184#27454#26085#26399
      FieldName = 'F03'
    end
    object Table2F04: TStringField
      DisplayLabel = #24065#21035
      FieldName = 'F04'
      FixedChar = True
      Size = 8
    end
    object Table2F05: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'F05'
    end
    object Table2F06: TFloatField
      DisplayLabel = #29616#37329
      FieldName = 'F06'
    end
    object Table2F07: TFloatField
      DisplayLabel = #26631#25454
      FieldName = 'F07'
    end
    object Table2F08: TStringField
      DisplayLabel = #26631#25454#21495#30721
      FieldName = 'F08'
      FixedChar = True
    end
    object Table2F09: TDateTimeField
      DisplayLabel = #20817#29616#26085#26399
      FieldName = 'F09'
    end
    object Table2F10: TFloatField
      DisplayLabel = #23454#20914#37329#39069
      FieldName = 'F10'
    end
    object Table2BUSER: TStringField
      FieldName = 'BUSER'
      FixedChar = True
      Size = 10
    end
    object Table2BTIME: TDateTimeField
      FieldName = 'BTIME'
    end
    object Table2EUSER: TStringField
      FieldName = 'EUSER'
      FixedChar = True
      Size = 10
    end
    object Table2ETIME: TDateTimeField
      FieldName = 'ETIME'
    end
    object Table2CalF10: TFloatField
      DisplayLabel = #23454#20914#37329#39069
      FieldKind = fkCalculated
      FieldName = 'CalF10'
      Calculated = True
    end
  end
  object Table1: TTable
    BeforeEdit = Table1BeforeEdit
    AfterEdit = Table1AfterEdit
    BeforePost = Table1BeforePost
    AfterScroll = Table1AfterScroll
    OnCalcFields = Table1CalcFields
    DatabaseName = 'STK0311'
    IndexFieldNames = 'F01;F02'
    MasterFields = 'F01;F02'
    MasterSource = DataSource3
    TableName = 'dbo.T3060'
    Left = 233
    Top = 145
    object Table1F01: TStringField
      DisplayLabel = #24080#27454#24180#26376
      FieldName = 'F01'
      Required = True
      FixedChar = True
      Size = 4
    end
    object Table1F02: TStringField
      DisplayLabel = #21378#21830#32534#21495
      FieldName = 'F02'
      Required = True
      FixedChar = True
      Size = 10
    end
    object Table1F03: TFloatField
      DisplayLabel = #36827#26009#24635#39069
      FieldName = 'F03'
    end
    object Table1F04: TFloatField
      DisplayLabel = #36864#26009#24635#39069
      FieldName = 'F04'
    end
    object Table1F05: TFloatField
      DisplayLabel = #31246#39069
      FieldName = 'F05'
    end
    object Table1F06: TFloatField
      DefaultExpression = #39'0'#39
      DisplayLabel = #29616#37329#25240#25187
      FieldName = 'F06'
      OnValidate = Table1F06Validate
    end
    object Table1F07: TFloatField
      DefaultExpression = '0'
      DisplayLabel = #36827#26009#25240#35753
      FieldName = 'F07'
      OnValidate = Table1F07Validate
    end
    object Table1F08: TFloatField
      DefaultExpression = #39'0'#39
      DisplayLabel = #20854#23427#36153#29992
      FieldName = 'F08'
      OnValidate = Table1F08Validate
    end
    object Table1F09: TFloatField
      DisplayLabel = #26412#26399#24212#20184
      FieldName = 'F09'
    end
    object Table1F10: TFloatField
      DisplayLabel = #26412#26399#24050#20184
      FieldName = 'F10'
    end
    object Table1F11: TFloatField
      DisplayLabel = #26412#26399#26410#20184
      FieldName = 'F11'
    end
    object Table1F14: TFloatField
      DisplayLabel = #23454#38469#31246#39069
      FieldName = 'F14'
      OnValidate = Table1F14Validate
    end
    object Table1BUSER: TStringField
      FieldName = 'BUSER'
      FixedChar = True
      Size = 10
    end
    object Table1BTIME: TDateTimeField
      FieldName = 'BTIME'
    end
    object Table1EUSER: TStringField
      FieldName = 'EUSER'
      FixedChar = True
      Size = 10
    end
    object Table1ETIME: TDateTimeField
      FieldName = 'ETIME'
    end
    object Table1CalF09: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalF09'
      Calculated = True
    end
    object Table1CalF10: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalF10'
      Calculated = True
    end
    object Table1CalF11: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalF11'
      Calculated = True
    end
  end
end
