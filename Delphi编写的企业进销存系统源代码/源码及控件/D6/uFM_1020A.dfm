inherited FM_1020A: TFM_1020A
  Left = 16
  Top = 121
  Caption = '原料价格'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar1: TToolBar
    inherited SB2: TSpeedButton
      Visible = True
    end
  end
  inherited Panel1: TPanel
    object Splitter1: TSplitter [0]
      Left = 135
      Top = 1
      Width = 3
      Height = 527
      Cursor = crHSplit
    end
    inherited DBGrid1: TDBGrid
      Left = 138
      Width = 733
      Columns = <
        item
          Expanded = False
          FieldName = 'F02'
          PickList.Strings = ()
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = '宋体'
          Title.Font.Style = []
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F03'
          PickList.Strings = ()
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = '宋体'
          Title.Font.Style = []
          Width = 123
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F04'
          PickList.Strings = ()
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F05'
          PickList.Strings = ()
          Title.Alignment = taRightJustify
          Width = 85
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'F06'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F07'
          PickList.Strings = ()
          Width = 192
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 1
      Top = 1
      Width = 134
      Height = 527
      Align = alLeft
      Color = clInfoBk
      DataSource = DataSource2
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = '宋体'
      TitleFont.Style = []
    end
  end
  inherited Table1: TTable
    Active = True
    IndexFieldNames = 'F01'
    MasterFields = 'F03'
    MasterSource = DataSource2
    TableName = 'dbo.T1020A'
    object Table1F01: TStringField
      FieldName = 'F01'
      Required = True
      FixedChar = True
    end
    object Table1F02: TStringField
      DisplayLabel = '原料编号'
      FieldName = 'F02'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 8
    end
    object Table1F03: TStringField
      DisplayLabel = '品名'
      FieldName = 'F03'
      OnValidate = RequiredValue
      FixedChar = True
      Size = 30
    end
    object Table1F04: TStringField
      DisplayLabel = '规格'
      FieldName = 'F04'
      FixedChar = True
      Size = 14
    end
    object Table1F05: TFloatField
      DisplayLabel = '单价'
      FieldName = 'F05'
    end
    object Table1K_SN: TSmallintField
      FieldName = 'K_SN'
    end
    object Table1F06: TDateTimeField
      DisplayLabel = '日期'
      FieldName = 'F06'
    end
    object Table1F07: TStringField
      DisplayLabel = '备注'
      FieldName = 'F07'
      FixedChar = True
      Size = 50
    end
  end
  object DataSource2: TDataSource
    DataSet = Query1
    Left = 48
    Top = 108
  end
  object Query1: TQuery
    Active = True
    DatabaseName = 'STK0311'
    SQL.Strings = (
      ' select F03 from T1020')
    Left = 48
    Top = 184
    object Query1F03: TStringField
      DisplayLabel = '厂商简称'
      DisplayWidth = 18
      FieldName = 'F03'
      Origin = 'STK0311.T1020.F03'
      FixedChar = True
      Size = 12
    end
  end
end
