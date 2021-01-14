inherited fmgoodCodeSelStr: TfmgoodCodeSelStr
  Left = 22
  Top = 65
  Caption = #21830#21697#32534#30721#36873#25321
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited btnChart: TBitBtn [0]
      Left = 24
      Caption = #36873#23450#25968#25454
      Visible = False
      OnClick = nil
    end
    inherited btnExit: TBitBtn [1]
      Left = 584
    end
    inherited btnQuery: TBitBtn [2]
      Left = 343
      Caption = #36873#23450#25968#25454
    end
    inherited btnColumn: TBitBtn [3]
    end
    inherited btnPrivew: TBitBtn [4]
    end
    inherited btnpagedown: TBitBtn
      Left = 421
      OnClick = btnpagedownClick
    end
    inherited BtnSort: TBitBtn
      Visible = False
    end
  end
  inherited DBGrid1: TDBGrid
    Top = 88
    Width = 727
    Height = 349
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OnDrawColumnCell = nil
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Type'
        Title.Caption = #21830#21697#31867#21035
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Goods_NO'
        Title.Caption = #21830#21697#32534#21495
        Width = 180
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
        FieldName = 'singleprice'
        Title.Caption = #21830#21697#21333#20215
        Width = 75
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
      Left = 471
      Top = 58
      Width = 112
      Height = 14
      Font.Color = clBlue
      Font.Height = -14
      Visible = False
    end
    inherited ComboBox1: TComboBox
      Left = 176
      Top = 54
      ItemIndex = -1
      Text = ''
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
        Sorted = True
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
        Sorted = True
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
        Sorted = True
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
  end
  object DataSource1: TDataSource
    DataSet = dmmain.dsquery
    Left = 272
    Top = 184
  end
end
