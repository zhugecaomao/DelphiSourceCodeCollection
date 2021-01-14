object pworks: Tpworks
  Left = 230
  Top = 178
  BorderStyle = bsDialog
  Caption = #24037#20316#29992#21697#31649#29702
  ClientHeight = 281
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 433
    Height = 233
    BevelOuter = bvLowered
    BorderWidth = 6
    Caption = 'Panel1'
    TabOrder = 0
    object cxGrid1: TcxGrid
      Left = 7
      Top = 7
      Width = 419
      Height = 219
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSource1
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'id'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsView.ColumnAutoWidth = True
        object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
          Caption = #21517#31216
          Width = 120
          DataBinding.FieldName = 'w_name'
        end
        object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
          Caption = #21333#20215
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Width = 40
          DataBinding.FieldName = 'w_pay'
        end
        object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
          Caption = #25968#37327
          PropertiesClassName = 'TcxSpinEditProperties'
          Width = 40
          DataBinding.FieldName = 'w_account'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object Button1: TButton
    Left = 360
    Top = 248
    Width = 75
    Height = 25
    Cancel = True
    Caption = #20851#38381
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 280
    Top = 248
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 120
    Top = 248
    Width = 75
    Height = 25
    Caption = #22686#21152
    Default = True
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 200
    Top = 248
    Width = 75
    Height = 25
    Caption = #35814#32454
    TabOrder = 4
    OnClick = Button4Click
  end
  object p_tools: TADOTable
    Connection = Main.ADOconn
    IndexName = 'id'
    TableName = 'w_tools'
    Left = 72
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = p_tools
    Left = 136
    Top = 112
  end
end
