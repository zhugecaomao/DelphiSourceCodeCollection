object enterFrom: TenterFrom
  Left = 286
  Top = 168
  Width = 569
  Height = 401
  Caption = #36827#36135#21333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 561
    Height = 313
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 559
      Height = 311
      Align = alClient
      DataSource = DataSource1
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = clFuchsia
          Expanded = False
          FieldName = 'p_id'
          ReadOnly = True
          Title.Caption = #26465#24418#30721
          Width = 81
          Visible = True
        end
        item
          Color = clFuchsia
          Expanded = False
          FieldName = 'p_name'
          ReadOnly = True
          Title.Caption = #21830#21697#21517#31216
          Width = 121
          Visible = True
        end
        item
          Color = clFuchsia
          Expanded = False
          FieldName = 'p_price'
          ReadOnly = True
          Title.Caption = #21333#20215#65288#20803#65289
          Width = 77
          Visible = True
        end
        item
          Color = clFuchsia
          Expanded = False
          FieldName = 'p_unit'
          ReadOnly = True
          Title.Caption = #35745#37327#21333#20301
          Width = 65
          Visible = True
        end
        item
          Color = clFuchsia
          Expanded = False
          FieldName = 'p_type'
          ReadOnly = True
          Title.Caption = #31867#22411#21517
          Width = 63
          Visible = True
        end
        item
          Color = clGradientActiveCaption
          Expanded = False
          FieldName = 'p_sale'
          Title.Caption = #39035#36827#36135#25968#37327
          Width = 101
          Visible = True
        end>
    end
  end
  object Button1: TButton
    Left = 168
    Top = 328
    Width = 75
    Height = 25
    Caption = #25968#25454#36830#25509
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 304
    Top = 328
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 2
    OnClick = Button2Click
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select p_id,p_name,p_price,p_unit,p_type,p_sale from produce_t w' +
        'here p_sale>0 order by p_sale DESC')
    Left = 16
    Top = 40
    object ADOQuery1p_id: TSmallintField
      FieldName = 'p_id'
    end
    object ADOQuery1p_name: TWideStringField
      FieldName = 'p_name'
      Size = 50
    end
    object ADOQuery1p_price: TBCDField
      FieldName = 'p_price'
      Precision = 19
    end
    object ADOQuery1p_unit: TWideStringField
      FieldName = 'p_unit'
      Size = 50
    end
    object ADOQuery1p_type: TSmallintField
      FieldName = 'p_type'
      LookupKeyFields = 'p_name'
      LookupResultField = 'p_name'
      KeyFields = 'p_type'
    end
    object ADOQuery1p_sale: TSmallintField
      FieldName = 'p_sale'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 48
    Top = 40
  end
end
