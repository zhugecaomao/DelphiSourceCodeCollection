object sel_From: Tsel_From
  Left = 127
  Top = 152
  Width = 877
  Height = 484
  Caption = #21830#21697#26597#35810
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
    Width = 609
    Height = 449
    Caption = 'Panel1'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 607
      Height = 447
      Align = alClient
      DataSource = DataSource1
      ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.6'
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Title.Caption = #27969#27700#21495
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_id'
          Title.Caption = #26465#24418#30721
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_name'
          Title.Caption = #21830#21697#21517#31216
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_price'
          Title.Caption = #21333#20215#65288#20803#65289
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_unit'
          Title.Caption = #35745#37327#21333#20301
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_type'
          Title.Caption = #31867#22411#21495
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_store'
          Title.Caption = #26368#22823#24211#23384#37327
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_time'
          Title.Caption = #20837#24211#26102#38388
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_sale'
          Title.Caption = #38144#21806#37327
          Width = 41
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 616
    Top = 0
    Width = 249
    Height = 449
    Caption = 'Panel2'
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 176
      Width = 233
      Height = 137
      Caption = #27169#31946#26597#35810
      TabOrder = 0
      object Label2: TLabel
        Left = 24
        Top = 40
        Width = 56
        Height = 13
        Caption = #21830#21697#21517#31216
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 24
        Top = 88
        Width = 56
        Height = 13
        Caption = #35745#37327#21333#20301
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit2: TEdit
        Left = 88
        Top = 32
        Width = 121
        Height = 21
        ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.6'
        TabOrder = 0
      end
      object Edit4: TEdit
        Left = 88
        Top = 88
        Width = 121
        Height = 21
        ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.6'
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 32
      Width = 225
      Height = 113
      Caption = #31934#30830#26597#35810
      TabOrder = 1
      object Label1: TLabel
        Left = 24
        Top = 32
        Width = 42
        Height = 13
        Caption = #26465#24418#30721
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 24
        Top = 80
        Width = 42
        Height = 13
        Caption = #31867#22411#21495
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 80
        Top = 24
        Width = 121
        Height = 21
        ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.6'
        TabOrder = 0
      end
      object Edit3: TEdit
        Left = 80
        Top = 76
        Width = 121
        Height = 21
        ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.6'
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 336
      Width = 233
      Height = 97
      Caption = #25805#20316#21306
      TabOrder = 2
      object Button1: TButton
        Left = 24
        Top = 40
        Width = 75
        Height = 25
        Caption = #25191#34892#26597#35810
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 136
        Top = 40
        Width = 75
        Height = 25
        Caption = #36864#20986
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button2Click
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 96
    Top = 80
  end
  object ADOQuery1: TADOQuery
    Tag = 2
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select * from produce_t')
    Left = 48
    Top = 80
  end
end
