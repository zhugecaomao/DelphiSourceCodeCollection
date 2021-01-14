inherited FM_3120: TFM_3120
  Left = 119
  Top = 117
  Hint = #22996#22806#24212#20184#24080#27454#20914#24080
  Caption = #22996#22806#24212#20184#20914#24080
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  object Panel2: TPanel
    Left = 193
    Top = 0
    Width = 679
    Height = 573
    Align = alClient
    TabOrder = 0
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 677
      Height = 122
      Align = alTop
      BevelOuter = bvNone
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
        Left = 218
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
        Left = 218
        Top = 75
        Width = 48
        Height = 12
        Caption = #36827#36135#25240#35753
        FocusControl = DBEdit5
      end
      object Label7: TLabel
        Left = 424
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
        Left = 218
        Top = 100
        Width = 48
        Height = 12
        Caption = #26412#26399#24050#20184
        FocusControl = DBEdit8
      end
      object Label10: TLabel
        Left = 424
        Top = 100
        Width = 48
        Height = 12
        Caption = #26412#26399#26410#20184
        FocusControl = DBEdit9
      end
      object Label11: TLabel
        Left = 424
        Top = 52
        Width = 48
        Height = 12
        Caption = #23454#38469#31246#39069
        FocusControl = DBEdit10
      end
      object DBEdit1: TDBEdit
        Left = 70
        Top = 47
        Width = 137
        Height = 20
        Color = clInfoBk
        DataField = 'F03'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 272
        Top = 47
        Width = 144
        Height = 20
        Color = clInfoBk
        DataField = 'F05'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 70
        Top = 71
        Width = 137
        Height = 20
        DataField = 'F06'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 272
        Top = 71
        Width = 144
        Height = 20
        DataField = 'F07'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 477
        Top = 71
        Width = 148
        Height = 20
        DataField = 'F08'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        TabOrder = 5
      end
      object DBEdit7: TDBEdit
        Left = 70
        Top = 95
        Width = 137
        Height = 20
        Color = clInfoBk
        DataField = 'CalF09'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit8: TDBEdit
        Left = 272
        Top = 96
        Width = 144
        Height = 20
        Color = clInfoBk
        DataField = 'CalF10'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit9: TDBEdit
        Left = 477
        Top = 96
        Width = 148
        Height = 20
        Color = clInfoBk
        DataField = 'CalF11'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        ReadOnly = True
        TabOrder = 8
      end
      object DBEdit10: TDBEdit
        Left = 477
        Top = 47
        Width = 148
        Height = 20
        DataField = 'F14'
        DataSource = DataSource1
        ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
        TabOrder = 2
      end
      object CoolBar1: TCoolBar
        Left = 0
        Top = 0
        Width = 677
        Height = 41
        BandBorderStyle = bsNone
        Bands = <
          item
            Control = ToolBar1
            ImageIndex = -1
            MinHeight = 36
            Width = 673
          end>
        Color = clBtnFace
        ParentColor = False
        object ToolBar1: TToolBar
          Left = 9
          Top = 0
          Width = 660
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
              06030000424D060300000000000036000000280000000F0000000F0000000100
              180000000000D0020000C40E0000C40E00000000000000000000BFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBF000000BFBFBF0000007F7F7F0000007F7F7FFFFF007F7F7FFF
              FF007F7F7F0000000000000000007F7F7F000000BFBFBF000000BFBFBFBFBFBF
              0000007F7F7F0000007F7F7FFFFF007F7F7FFFFF000000007F7F000000000000
              007F7F7FBFBFBF000000BFBFBFBFBFBF00000000000000000000000000000000
              00000000000000007F7F7F7F7F00000000000000BFBFBF000000BFBFBFBFBFBF
              BFBFBFBFBFBF0000000000FF000000FFFF000000000000007F7F007F7F007F7F
              00000000BFBFBF000000BFBFBF0000000000000000000000000000FF0000FF00
              000000007F0000007F7F007F7F7F7F7F00000000BFBFBF000000BFBFBF000000
              0000FF0000FF0000FF0000FF0000FF0000FF00007F0000007F7F7F0000007F7F
              7F000000BFBFBF000000BFBFBF0000000000FF0000FF0000FF0000FF0000FF00
              00FF00007F0000000000000000007F7F00000000BFBFBF000000BFBFBF000000
              0000000000000000000000FF0000FF00000000007F0000007F7F7F0000007F7F
              00000000BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBF0000000000FF000000FF
              FFFF00007F0000007F7F7F7F7F007F7F7F000000BFBFBF000000BFBFBFBFBFBF
              BFBFBFBFBFBF000000000000000000FFFF0000007F0000007F7F007F7F007F7F
              00000000BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF000000FF
              FFFFFFFF00FFFFFF0000007F7F7F7F7F00000000BFBFBF000000BFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBF000000FFFF00FFFFFFFFFF00FFFFFF0000007F7F
              7F000000BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00000000
              0000000000000000000000000000000000000000BFBFBF000000BFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBF000000}
            OnClick = SB6Click
          end
        end
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 123
      Width = 677
      Height = 449
      Align = alClient
      TabOrder = 1
      OnExit = Panel5Exit
      object DBVertNavigator1: TDBVertNavigator
        Left = 646
        Top = 1
        Width = 30
        Height = 447
        DataSource = DataSource2
        VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
        Align = alRight
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 645
        Height = 447
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
            Width = 28
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'F03'
            Title.Alignment = taCenter
            Width = 81
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
            Width = 58
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
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F06'
            Title.Alignment = taRightJustify
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F07'
            Title.Alignment = taRightJustify
            Title.Caption = #31080#25454
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F08'
            Title.Alignment = taCenter
            Title.Caption = #31080#25454#21495#30721
            Width = 76
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'F09'
            Title.Alignment = taCenter
            Width = 68
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
    Width = 193
    Height = 573
    Align = alLeft
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 191
      Height = 40
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 7
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
        Left = 152
        Top = 11
        Width = 34
        Height = 20
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
        Left = 56
        Top = 11
        Width = 51
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
        Left = 106
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
      Width = 191
      Height = 531
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
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F03'
          Width = 95
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 265
    Top = 193
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 265
    Top = 241
  end
  object Query1: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select T.F01,T.F02,F.F03 from T3110 as T'
      'left join T1030 as F on T.F02=F.F01'
      'where T.F01=:F01')
    Left = 72
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
      Origin = 'STK0311.T1030.F03'
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
    TableName = 'dbo.T3110A'
    Left = 217
    Top = 241
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
    AfterEdit = Table1AfterEdit
    BeforePost = Table1BeforePost
    AfterScroll = Table1AfterScroll
    OnCalcFields = Table1CalcFields
    DatabaseName = 'STK0311'
    IndexFieldNames = 'F01;F02'
    MasterFields = 'F01;F02'
    MasterSource = DataSource3
    TableName = 'dbo.T3110'
    Left = 217
    Top = 193
    object Table1F01: TStringField
      FieldName = 'F01'
      Required = True
      FixedChar = True
      Size = 4
    end
    object Table1F02: TStringField
      FieldName = 'F02'
      Required = True
      FixedChar = True
      Size = 10
    end
    object Table1F03: TFloatField
      FieldName = 'F03'
    end
    object Table1F04: TFloatField
      FieldName = 'F04'
    end
    object Table1F05: TFloatField
      FieldName = 'F05'
    end
    object Table1F06: TFloatField
      DefaultExpression = #39'0'#39
      DisplayLabel = #29616#37329#25240#25187
      FieldName = 'F06'
      OnValidate = Table1F06Validate
    end
    object Table1F07: TFloatField
      DefaultExpression = #39'0'#39
      DisplayLabel = #36827#36135#25240#35753
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
      FieldName = 'F09'
    end
    object Table1F10: TFloatField
      FieldName = 'F10'
    end
    object Table1F11: TFloatField
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
