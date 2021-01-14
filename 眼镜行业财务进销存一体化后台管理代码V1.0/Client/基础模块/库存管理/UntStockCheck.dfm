inherited FmStockCheck: TFmStockCheck
  Left = 1
  Top = 2
  Caption = #21830#21697#24211#23384#29366#20917#26597#35810
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited btnChart: TBitBtn [0]
      Left = 328
    end
    inherited btnExit: TBitBtn [1]
      Left = 584
    end
    inherited btnQuery: TBitBtn [2]
      Left = 17
      Top = 9
      Caption = #36873#23450#25968#25454
      Visible = False
    end
    inherited btnColumn: TBitBtn [3]
      Left = 171
    end
    inherited btnPrivew: TBitBtn [4]
      Left = 250
    end
    inherited btnpagedown: TBitBtn
      Left = 486
      OnClick = btnpagedownClick
    end
    inherited BtnSort: TBitBtn
      Left = 93
    end
    object CopyCode: TBitBtn
      Left = 407
      Top = 8
      Width = 75
      Height = 25
      Caption = #25335#36125#32534#21495
      TabOrder = 7
      OnClick = CopyCodeClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00000000000000
        00DA07FFFFFFFFFFFF0D08000F0007000070070CC00BB0099100070CC40BB309
        910A070CC40BB309910D070CC40BB309910A070CC40BB309910D080CC40BB309
        910A0780000BB309910D0870DA0BB309910A0780AD0BB300910D0F70DA0BB30A
        000AA0F0AD0BB80DADADDA00DAD0000ADADAADA0ADADADADADAD}
    end
  end
  inherited DBGrid1: TDBGrid
    Top = 88
    Width = 727
    Height = 349
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OnDrawColumnCell = nil
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Goods_NO'
        Title.Caption = #21830#21697#32534#21495
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Goods_Name'
        Title.Caption = #21830#21697#21517#31216
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BarCode'
        Title.Caption = #21830#21697#26465#30721
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Stock_amount'
        Title.Caption = #24211#23384#25968#37327
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Up_amount'
        Title.Caption = #24211#23384#19978#38480
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Down_amount'
        Title.Caption = #24211#23384#19979#38480
        Width = 60
        Visible = True
      end>
  end
  inherited Panel1: TPanel
    Height = 87
    Color = clBtnFace
    inherited Label1: TLabel
      Left = 24
      Top = 56
      Width = 119
      Height = 14
      Font.Color = clBlue
      Font.Height = -14
    end
    inherited LblSort: TLabel
      Left = 367
      Top = 58
      Width = 112
      Height = 14
      Font.Color = clBlue
      Font.Height = -14
    end
    inherited ComboBox1: TComboBox
      Left = 176
      Top = 54
      ItemIndex = 0
      Text = '10'
      Items.Strings = (
        '10'
        '20'
        '30'
        '50'
        '100'
        '200'
        '300'
        '400'
        '500'
        '600'
        '700'
        '800'
        '900'
        '1000'
        '1500'
        '2000'
        '2500'
        '3000'
        '4000'
        '5000'
        '6000'
        #20840#37096)
    end
    inherited edtTime: TEdit [4]
      Left = 656
      Top = 54
      Width = 33
      Height = 19
      Visible = False
    end
    object Panel3: TPanel [5]
      Left = 2
      Top = 2
      Width = 724
      Height = 45
      Align = alTop
      BevelOuter = bvLowered
      Color = 16573127
      TabOrder = 3
      object Label2: TLabel
        Left = 23
        Top = 15
        Width = 48
        Height = 16
        Caption = #31867#21035#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 194
        Top = 15
        Width = 48
        Height = 16
        Caption = #21697#29260#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 364
        Top = 15
        Width = 48
        Height = 16
        Caption = #21697#31181#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object CBType: TComboBox
        Left = 69
        Top = 15
        Width = 112
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = CBTypeChange
      end
      object cbBrand: TComboBox
        Left = 239
        Top = 15
        Width = 113
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = cbBrandChange
      end
      object CbBreed: TComboBox
        Left = 412
        Top = 15
        Width = 125
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnChange = CbBreedChange
      end
    end
    inherited edtRecNo: TEdit [6]
      Left = 548
      Top = 16
      Width = 168
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Height = -14
      Font.Name = #23435#20307
      ImeName = ''
    end
    object Edit1: TEdit
      Left = 536
      Top = 56
      Width = 25
      Height = 21
      TabOrder = 4
      Visible = False
    end
  end
  object DataSource1: TDataSource
    DataSet = dmmain.dsquery
    Left = 272
    Top = 184
  end
  object frPrintGrid1: TfrPrintGrid
    PageSize = 9
    PageWidth = 0
    PageHeight = 0
    PageMargins.Left = 5
    PageMargins.Top = 5
    PageMargins.Right = 5
    PageMargins.Bottom = 5
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = #23435#20307
    Title.Font.Style = [fsBold]
    Title.Color = clWhite
    Title.Frame = []
    Title.FrameWidth = 1
    Title.Align = taLeftJustify
    Title.Text = #38646#21806#39038#23458#25253#34920
    PageHeader.Font.Charset = ANSI_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -13
    PageHeader.Font.Name = #23435#20307
    PageHeader.Font.Style = []
    PageHeader.Color = clWhite
    PageHeader.Frame = []
    PageHeader.FrameWidth = 1
    PageHeader.Text = #38646#26143#39038#23458#36164#26009#25253#34920
    PageFooter.Font.Charset = ANSI_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -13
    PageFooter.Font.Name = #23435#20307
    PageFooter.Font.Style = []
    PageFooter.Color = clWhite
    PageFooter.Frame = []
    PageFooter.FrameWidth = 1
    PageFooter.Align = taLeftJustify
    PageFooter.Text = #23453#35270#36798#30524#38236#38646#21806#23458#25143#31649#29702#25253#34920
    Header.Font.Charset = ANSI_CHARSET
    Header.Font.Color = clWhite
    Header.Font.Height = -13
    Header.Font.Name = #23435#20307
    Header.Font.Style = [fsBold]
    Header.Color = clNavy
    Header.Frame = [frLeft, frTop, frRight, frBottom]
    Header.FrameWidth = 1
    Body.Font.Charset = ANSI_CHARSET
    Body.Font.Color = clWindowText
    Body.Font.Height = -13
    Body.Font.Name = #23435#20307
    Body.Font.Style = []
    Body.Color = clWhite
    Body.Frame = [frLeft, frTop, frRight, frBottom]
    Body.FrameWidth = 1
    Left = 640
    Top = 48
  end
end
