object SumAccount: TSumAccount
  Left = 225
  Top = 155
  Width = 723
  Height = 480
  Caption = #35797#31639#24179#34913#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 713
    Height = 385
    DataSource = DataSource1
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
        FieldName = #31185#30446#20195#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31185#30446#21517#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26399#21021#20511#26041
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26399#21021#36151#26041
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26412#26399#21457#29983#20511#26041
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26412#26399#21457#29983#36151#26041
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26399#26411#20511#26041
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26399#26411#36151#26041
        Visible = True
      end>
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 387
    Width = 713
    Height = 57
    ColCount = 8
    RowCount = 2
    TabOrder = 1
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 224
    Top = 72
  end
  object ADOQuery1: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=caiwubook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select '#31185#30446#20195#30721', '#31185#30446#21517#31216', '#9'(case when '#20313#39069#26041#21521'='#39#20511#26041#39' then '#26399#21021#20313#39069' else 0 end - ' +
        #32047#35745#20511#26041') as '#26399#21021#20511#26041', '#9'(case when '#20313#39069#26041#21521'='#39#36151#26041#39' then '#26399#21021#20313#39069' else 0 end - '#32047#35745#36151#26041 +
        ') as '#26399#21021#36151#26041',  '#32047#35745#20511#26041' as '#26412#26399#21457#29983#20511#26041','#32047#35745#36151#26041' as '#26412#26399#21457#29983#36151#26041',  case when '#20313#39069#26041#21521'='#39#20511#26041#39' ' +
        'then '#26399#21021#20313#39069' else 0 end as '#26399#26411#20511#26041',  case when '#20313#39069#26041#21521'='#39#36151#26041#39' then '#26399#21021#20313#39069' els' +
        'e 0 end as '#26399#26411#36151#26041' from '#24080#31807#21021#22987#21270#34920' where '#32047#35745#20511#26041'<>0 or '#32047#35745#36151#26041'<>0 or '#26399#21021#20313#39069'<>0')
    Left = 296
    Top = 72
  end
end
