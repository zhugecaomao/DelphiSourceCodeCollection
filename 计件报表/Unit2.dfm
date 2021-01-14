object Form2: TForm2
  Left = 320
  Top = 195
  BorderStyle = bsDialog
  Caption = #23548#20986'Excel'#25253#34920
  ClientHeight = 385
  ClientWidth = 677
  Color = 12711880
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    677
    385)
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 40
    Top = 32
    Width = 14
    Height = 14
    Caption = #20174
  end
  object Label2: TLabel
    Left = 192
    Top = 32
    Width = 14
    Height = 14
    Caption = #33267
  end
  object Gauge1: TGauge
    Left = 32
    Top = 336
    Width = 617
    Height = 20
    ForeColor = 33023
    Progress = 0
  end
  object DateTimePicker1: TDateTimePicker
    Left = 62
    Top = 28
    Width = 120
    Height = 22
    CalAlignment = dtaLeft
    Date = 39165.7368430556
    Time = 39165.7368430556
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 216
    Top = 27
    Width = 120
    Height = 22
    CalAlignment = dtaLeft
    Date = 39165.7368430556
    Time = 39165.7368430556
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 464
    Top = 24
    Width = 75
    Height = 25
    Caption = #30452#25509#23548#20986
    TabOrder = 2
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 72
    Width = 617
    Height = 257
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = #26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22995#21517
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = #21697#21517
        PickList.Strings = (
          '23445'
          '345'
          '345')
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = #33391#21697#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21333#20215
        Visible = True
      end
      item
        Expanded = False
        FieldName = #37329#39069
        Visible = True
      end>
  end
  object Button2: TButton
    Left = 360
    Top = 24
    Width = 75
    Height = 25
    Caption = #26597#25214
    TabOrder = 4
    OnClick = Button2Click
  end
  object OpenDialog1: TOpenDialog
    Left = 232
    Top = 144
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 200
    Top = 144
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 264
    Top = 144
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 168
    Top = 144
  end
end
