object AccountSetting: TAccountSetting
  Left = 218
  Top = 147
  Width = 696
  Height = 480
  Caption = #24080#25143#35774#32622#65288#26399#21021#25968#25454#24405#20837#65289
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 65
    BorderStyle = bsSingle
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 80
      Top = 24
      Width = 100
      Height = 25
      Caption = #24314#31435#26032#24080#31807
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkRetry
    end
    object BitBtn2: TBitBtn
      Left = 216
      Top = 24
      Width = 100
      Height = 25
      Caption = #21551#29992#24080#31807
      TabOrder = 1
      OnClick = BitBtn2Click
      Kind = bkIgnore
    end
    object BitBtn3: TBitBtn
      Left = 352
      Top = 24
      Width = 100
      Height = 25
      Caption = #35797#31639#24179#34913
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 64
    Width = 460
    Height = 385
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = #31185#30446#20195#30721
        ReadOnly = True
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = #31185#30446#21517#31216
        ReadOnly = True
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = #20313#39069#26041#21521
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32047#35745#20511#26041
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32047#35745#36151#26041
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26399#21021#20313#39069
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 464
    Top = 64
    Width = 217
    Height = 385
    DataSource = DataSource2
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = #32534#21495
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = #21442#25968#21517#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21462#20540
        ReadOnly = False
        Visible = True
      end>
  end
  object ADOTable1: TADOTable
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=caiwubook'
    CursorType = ctStatic
    TableName = #24080#31807#21021#22987#21270#34920
    Left = 504
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    OnDataChange = DataSource1DataChange
    Left = 464
    Top = 24
  end
  object ADOTable2: TADOTable
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=caiwubook'
    CursorType = ctStatic
    TableName = #31995#32479#21442#25968#34920
    Left = 584
    Top = 24
  end
  object DataSource2: TDataSource
    DataSet = ADOTable2
    OnDataChange = DataSource2DataChange
    Left = 544
    Top = 24
  end
  object ADOCommand1: TADOCommand
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=caiwubook'
    Parameters = <>
    Left = 616
    Top = 24
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=caiwubook'
    Parameters = <>
    Left = 648
    Top = 24
  end
end
