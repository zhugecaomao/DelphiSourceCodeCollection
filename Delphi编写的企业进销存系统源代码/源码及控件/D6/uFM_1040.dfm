inherited FM_1040: TFM_1040
  Left = 207
  Top = 112
  Width = 709
  Height = 502
  Hint = '员工资料'
  Caption = '员工基本资料'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar1: TToolBar
    Width = 701
    inherited SB3: TSpeedButton
      Visible = True
    end
  end
  inherited Panel1: TPanel
    Width = 701
    Height = 431
    inherited DBGrid1: TDBGrid
      Width = 699
      Height = 429
      Columns = <
        item
          Expanded = False
          FieldName = 'F01'
          PickList.Strings = ()
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = '宋体'
          Title.Font.Style = []
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'F02'
          PickList.Strings = (
            '男'
            '女')
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = '宋体'
          Title.Font.Style = []
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'F03'
          PickList.Strings = ()
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F04'
          PickList.Strings = ()
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F05'
          PickList.Strings = ()
          Width = 106
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'F06'
          PickList.Strings = ()
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F07'
          PickList.Strings = ()
          Width = 134
          Visible = True
        end>
    end
  end
  inherited Table1: TTable
    Active = True
    AfterScroll = Table1AfterScroll
    TableName = 'dbo.T1040'
    object Table1F01: TStringField
      DisplayLabel = '姓名'
      FieldName = 'F01'
      OnValidate = Table1F01Validate
      FixedChar = True
      Size = 8
    end
    object Table1F02: TStringField
      DefaultExpression = #39'男'#39
      DisplayLabel = '性别'
      FieldName = 'F02'
      OnValidate = Table1F02Validate
      FixedChar = True
      Size = 2
    end
    object Table1F03: TDateTimeField
      DisplayLabel = '到职日期'
      FieldName = 'F03'
    end
    object Table1F04: TStringField
      DisplayLabel = '身份证号'
      FieldName = 'F04'
      FixedChar = True
    end
    object Table1F05: TStringField
      DisplayLabel = '籍贯'
      FieldName = 'F05'
    end
    object Table1F06: TDateTimeField
      DisplayLabel = '出生日期'
      FieldName = 'F06'
    end
    object Table1F07: TStringField
      DisplayLabel = '备注'
      FieldName = 'F07'
    end
    object Table1BUSER: TStringField
      DisplayLabel = '建档人'
      FieldName = 'BUSER'
      FixedChar = True
      Size = 10
    end
    object Table1BTIME: TDateTimeField
      DisplayLabel = '建档时间'
      FieldName = 'BTIME'
    end
    object Table1EUSER: TStringField
      DisplayLabel = '修改人'
      FieldName = 'EUSER'
      FixedChar = True
      Size = 10
    end
    object Table1ETIME: TDateTimeField
      DisplayLabel = '修改时间'
      FieldName = 'ETIME'
    end
  end
end
