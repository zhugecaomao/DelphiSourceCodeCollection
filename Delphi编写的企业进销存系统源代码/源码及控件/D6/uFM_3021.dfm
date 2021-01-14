object FM_3021: TFM_3021
  Left = 184
  Top = 174
  Width = 818
  Height = 542
  Hint = '发票处理'
  Caption = '发票处理[FM_3021]'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '宋体'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 810
    Height = 515
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 225
      Height = 511
      Align = alLeft
      TabOrder = 0
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 223
        Height = 39
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 9
          Top = 14
          Width = 49
          Height = 12
          Caption = '帐款年月  '
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
        end
        object ComboBox1: TComboBox
          Left = 124
          Top = 8
          Width = 50
          Height = 20
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = '宋体'
          Font.Style = []
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
        object SpinEdit1: TSpinEdit
          Left = 58
          Top = 8
          Width = 64
          Height = 21
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = '宋体'
          Font.Style = []
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 0
          Value = 0
        end
        object BitBtn1: TBitBtn
          Left = 178
          Top = 8
          Width = 39
          Height = 21
          Caption = '确定'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = BitBtn1Click
          Layout = blGlyphTop
          NumGlyphs = 2
          Spacing = 0
        end
      end
      object DBGrid1: TDBGrid
        Left = 1
        Top = 40
        Width = 223
        Height = 470
        Align = alClient
        Color = clInfoBk
        DataSource = DataSource1
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = '宋体'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'F02'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F03'
            Width = 107
            Visible = True
          end>
      end
    end
    object Panel4: TPanel
      Left = 227
      Top = 2
      Width = 581
      Height = 511
      Align = alClient
      TabOrder = 1
      object DBGrid2: TDBGrid
        Left = 1
        Top = 154
        Width = 579
        Height = 356
        Align = alClient
        Color = clInfoBk
        DataSource = DataSource2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = '新细明体'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'F01'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F02'
            Title.Alignment = taCenter
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F13'
            Title.Alignment = taCenter
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F04'
            Title.Alignment = taCenter
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F06'
            Title.Alignment = taCenter
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F07'
            Title.Alignment = taRightJustify
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F08'
            Title.Alignment = taRightJustify
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F09'
            Title.Alignment = taRightJustify
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F10'
            Title.Alignment = taRightJustify
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F14'
            Width = 77
            Visible = True
          end>
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 579
        Height = 153
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        OnExit = Panel5Exit
        object Label2: TLabel
          Left = 13
          Top = 47
          Width = 66
          Height = 13
          AutoSize = False
          Caption = '出货总额  '
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 13
          Top = 70
          Width = 52
          Height = 13
          AutoSize = False
          Caption = '现金折扣'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 13
          Top = 93
          Width = 52
          Height = 13
          AutoSize = False
          Caption = '本期应收'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 13
          Top = 114
          Width = 73
          Height = 13
          AutoSize = False
          Caption = '发票金额   '
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 13
          Top = 135
          Width = 73
          Height = 13
          AutoSize = False
          Caption = '发票号码   '
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 195
          Top = 113
          Width = 52
          Height = 13
          Caption = '实际税额'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 195
          Top = 92
          Width = 52
          Height = 13
          Caption = '本期已收'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 195
          Top = 70
          Width = 52
          Height = 13
          Caption = '销货折让'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 195
          Top = 47
          Width = 52
          Height = 13
          Caption = '退货总额'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 370
          Top = 93
          Width = 66
          Height = 13
          Caption = '本期 未 收'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 370
          Top = 70
          Width = 66
          Height = 13
          Caption = '其它 费 用'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 369
          Top = 47
          Width = 65
          Height = 13
          Caption = '出货单税额'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 72
          Top = 43
          Width = 112
          Height = 20
          AutoSize = False
          Color = clInfoBk
          DataField = 'F03'
          DataSource = DataSource3
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 72
          Top = 64
          Width = 112
          Height = 20
          AutoSize = False
          Color = clInfoBk
          DataField = 'F06'
          DataSource = DataSource3
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit7: TDBEdit
          Left = 72
          Top = 85
          Width = 112
          Height = 20
          AutoSize = False
          Color = clInfoBk
          DataField = 'F09'
          DataSource = DataSource3
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit10: TDBEdit
          Left = 72
          Top = 129
          Width = 481
          Height = 21
          DataField = 'F12'
          DataSource = DataSource3
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit11: TDBEdit
          Left = 72
          Top = 106
          Width = 112
          Height = 21
          DataField = 'F13'
          DataSource = DataSource3
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit3: TDBEdit
          Left = 441
          Top = 43
          Width = 111
          Height = 20
          AutoSize = False
          Color = clInfoBk
          DataField = 'F05'
          DataSource = DataSource3
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit6: TDBEdit
          Left = 441
          Top = 64
          Width = 111
          Height = 20
          AutoSize = False
          Color = clInfoBk
          DataField = 'F08'
          DataSource = DataSource3
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit9: TDBEdit
          Left = 441
          Top = 85
          Width = 111
          Height = 21
          Color = clInfoBk
          DataField = 'F11'
          DataSource = DataSource3
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit12: TDBEdit
          Left = 252
          Top = 106
          Width = 109
          Height = 20
          Color = clBtnHighlight
          DataField = 'F14'
          DataSource = DataSource3
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object DBEdit8: TDBEdit
          Left = 252
          Top = 85
          Width = 109
          Height = 20
          AutoSize = False
          Color = clInfoBk
          DataField = 'F10'
          DataSource = DataSource3
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit5: TDBEdit
          Left = 252
          Top = 64
          Width = 109
          Height = 20
          AutoSize = False
          Color = clInfoBk
          DataField = 'F07'
          DataSource = DataSource3
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit2: TDBEdit
          Left = 252
          Top = 43
          Width = 109
          Height = 20
          AutoSize = False
          Color = clInfoBk
          DataField = 'F04'
          DataSource = DataSource3
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = '宋体'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 579
          Height = 38
          Align = alTop
          TabOrder = 12
          object BitBtn2: TBitBtn
            Left = 272
            Top = 5
            Width = 88
            Height = 28
            Caption = '离开'
            TabOrder = 0
            OnClick = BitBtn2Click
            Glyph.Data = {
              EE000000424DEE0000000000000076000000280000000F0000000F0000000100
              0400000000007800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888080707E7E70007080880707E7E060078088000000007600808888090E0066
              6080800009901067608080999999107070808099999910006080800009901070
              60808888090F107670808888000E106660808888080FEF0760808888880EFEF0
              708088888800000000808888888888888880}
            Spacing = 1
          end
          object DBNavPlus1: TDBNavPlus
            Left = 8
            Top = 5
            Width = 264
            Height = 28
            DataSource = DataSource3
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            TabOrder = 1
            Captions.Strings = (
              '首笔'
              '上笔'
              '下笔'
              '末笔'
              '新增'
              '删除'
              '编辑'
              '存储'
              '撤消'
              '更新')
            Layout = blGlyphLeft
            Margin = -1
          end
        end
      end
    end
  end
  object Query1: TQuery
    AfterScroll = Query1AfterScroll
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select  distinct A.F01,A.F02,B.F03 '
      'from T3020 as A'
      'left join T1010 as B on B.F01=A.F02'
      'where A.F01=:YYMM')
    Left = 25
    Top = 97
    ParamData = <
      item
        DataType = ftString
        Name = 'YYMM'
        ParamType = ptUnknown
      end>
    object Query1F01: TStringField
      FieldName = 'F01'
      Origin = 'STK0311.T3020.F01'
      FixedChar = True
      Size = 4
    end
    object Query1F02: TStringField
      DisplayLabel = '客户编号'
      FieldName = 'F02'
      Origin = 'LASER.T3010.F02'
      FixedChar = True
      Size = 10
    end
    object Query1F03: TStringField
      DisplayLabel = '简称'
      FieldName = 'F03'
      Origin = 'STK0311.T1010.F03'
      FixedChar = True
      Size = 12
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 73
    Top = 97
  end
  object Query2: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select * from T2160 where F12=:YYMM')
    Left = 257
    Top = 265
    ParamData = <
      item
        DataType = ftString
        Name = 'YYMM'
        ParamType = ptUnknown
      end>
    object Query2F01: TStringField
      DisplayLabel = '单号'
      FieldName = 'F01'
      Origin = 'STK0311.T2160.F01'
      FixedChar = True
      Size = 12
    end
    object Query2F02: TDateTimeField
      DisplayLabel = '日期'
      FieldName = 'F02'
      Origin = 'STK0311.T2160.F02'
    end
    object Query2F04: TStringField
      DisplayLabel = '币别'
      FieldName = 'F04'
      Origin = 'STK0311.T2160.F04'
      FixedChar = True
      Size = 8
    end
    object Query2F05: TFloatField
      DisplayLabel = '汇率'
      FieldName = 'F05'
      Origin = 'STK0311.T2160.F05'
    end
    object Query2F06: TStringField
      DisplayLabel = '税别'
      FieldName = 'F06'
      Origin = 'STK0311.T2160.F06'
      FixedChar = True
      Size = 4
    end
    object Query2F07: TFloatField
      DisplayLabel = '税率'
      FieldName = 'F07'
      Origin = 'STK0311.T2160.F07'
    end
    object Query2F08: TFloatField
      DisplayLabel = '税额'
      FieldName = 'F08'
      Origin = 'STK0311.T2160.F08'
    end
    object Query2F09: TFloatField
      DisplayLabel = '明细总额'
      FieldName = 'F09'
      Origin = 'STK0311.T2160.F09'
    end
    object Query2F10: TFloatField
      DisplayLabel = '出货总额'
      FieldName = 'F10'
      Origin = 'STK0311.T2160.F10'
    end
    object Query2F11: TStringField
      DisplayLabel = '备注'
      FieldName = 'F11'
      Origin = 'STK0311.T2160.F11'
      FixedChar = True
      Size = 100
    end
    object Query2F12: TStringField
      DisplayLabel = '帐款年月'
      FieldName = 'F12'
      Origin = 'STK0311.T2160.F12'
      FixedChar = True
      Size = 4
    end
    object Query2F13: TStringField
      DisplayLabel = '出退别'
      FieldName = 'F13'
      Origin = 'STK0311.T2160.F13'
      FixedChar = True
      Size = 2
    end
    object Query2F14: TStringField
      DisplayLabel = '指送厂商'
      FieldName = 'F14'
      Origin = 'STK0311.T2160.F14'
      FixedChar = True
      Size = 8
    end
  end
  object DataSource2: TDataSource
    DataSet = Query2
    Left = 313
    Top = 265
  end
  object DataSource3: TDataSource
    DataSet = Table1
    Left = 305
    Top = 201
  end
  object Table1: TTable
    BeforeInsert = Table1BeforeInsert
    BeforePost = Table1BeforePost
    OnCalcFields = Table1CalcFields
    DatabaseName = 'STK0311'
    IndexFieldNames = 'F01;F02'
    MasterFields = 'F01;F02'
    MasterSource = DataSource1
    TableName = 'dbo.T3020'
    Left = 249
    Top = 209
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
      FieldName = 'F06'
    end
    object Table1F07: TFloatField
      FieldName = 'F07'
    end
    object Table1F08: TFloatField
      FieldName = 'F08'
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
    object Table1F12: TStringField
      FieldName = 'F12'
      Size = 30
    end
    object Table1F13: TFloatField
      DefaultExpression = '0'
      FieldName = 'F13'
    end
    object Table1F14: TFloatField
      DefaultExpression = #39'0'#39
      FieldName = 'F14'
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
  end
  object Qry1: TQuery
    DatabaseName = 'STK0311'
    Left = 537
    Top = 233
  end
end
