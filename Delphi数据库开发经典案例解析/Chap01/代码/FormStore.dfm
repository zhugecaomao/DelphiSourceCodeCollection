object store: Tstore
  Left = 222
  Top = 167
  Width = 597
  Height = 375
  Caption = #24211#23384#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 16
    Top = 16
    Width = 545
    Height = 65
    BorderStyle = bsSingle
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 30
      Height = 13
      Caption = #36135#21495'  '
    end
    object Label2: TLabel
      Left = 128
      Top = 16
      Width = 57
      Height = 13
      Caption = #21830#21697#25340#38899'   '
    end
    object Label3: TLabel
      Left = 312
      Top = 16
      Width = 33
      Height = 13
      Caption = #20179#24211'   '
    end
    object Edit1: TEdit
      Left = 40
      Top = 16
      Width = 81
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 192
      Top = 16
      Width = 89
      Height = 21
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 352
      Top = 16
      Width = 73
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        '1'#24211
        '2'#24211
        '3'#24211
        '4'#24211
        '5'#24211)
    end
    object Button1: TButton
      Left = 448
      Top = 16
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 96
    Width = 545
    Height = 241
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = #36135#21495
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21697#21517
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20179#24211
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24211#23384#25968#37327
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24211#23384#21333#20215
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24211#23384#37329#39069
        Width = 80
        Visible = True
      end>
  end
  object ADOQuery1: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=jxcbook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select '#24211#23384#24211'.'#36135#21495','#21830#21697#28165#21333'.'#21697#21517','#21830#21697#28165#21333'.'#21333#20301','#24211#23384#24211'.'#20179#24211','#24211#23384#24211'.'#24211#23384#25968#37327','#24211#23384#24211'.'#24211#23384#21333#20215','#24211#23384#24211'.'#24211#23384#37329#39069' ' +
        'from '#24211#23384#24211','#21830#21697#28165#21333' where '#24211#23384#24211'.'#36135#21495'='#21830#21697#28165#21333'.'#36135#21495
      '')
    Left = 136
    Top = 160
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 96
    Top = 160
  end
end
