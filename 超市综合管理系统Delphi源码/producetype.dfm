object PType_Form: TPType_Form
  Left = 316
  Top = 224
  Width = 500
  Height = 387
  Caption = #21830#21697#31867#22411#31649#29702
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
    Left = 16
    Top = 16
    Width = 457
    Height = 289
    TabOrder = 0
    object Label1: TLabel
      Left = 208
      Top = 32
      Width = 65
      Height = 12
      Caption = #21830#21697#31867#22411#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 208
      Top = 80
      Width = 65
      Height = 12
      Caption = #21830#21697#31867#22411#21517
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 185
      Height = 289
      DataSource = DataSource1
      Enabled = False
      ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
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
          FieldName = 'p_type'
          Title.Caption = #20135#21697#31867#22411#21495
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_name'
          Title.Caption = #20135#21697#31867#22411#21517
          Width = 78
          Visible = True
        end>
    end
    object DBEdit2: TDBEdit
      Left = 288
      Top = 72
      Width = 121
      Height = 21
      DataField = 'p_name'
      DataSource = DataSource1
      ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 288
      Top = 24
      Width = 121
      Height = 21
      DataField = 'p_type'
      DataSource = DataSource1
      ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 184
      Top = 128
      Width = 273
      Height = 65
      Caption = #36873#25321#25805#20316#26041#24335
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object Button2: TButton
        Left = 14
        Top = 24
        Width = 75
        Height = 25
        Caption = #22686#21152#31867#22411
        TabOrder = 0
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 102
        Top = 24
        Width = 75
        Height = 25
        Caption = #20462#25913#31867#22411
        TabOrder = 1
        OnClick = Button3Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 184
      Top = 208
      Width = 273
      Height = 65
      Caption = #25191#34892#25805#20316
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object Button7: TButton
        Left = 102
        Top = 24
        Width = 75
        Height = 25
        Caption = #19979#26465#35760#24405
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Button7Click
      end
      object Button6: TButton
        Left = 14
        Top = 24
        Width = 75
        Height = 25
        Caption = #19978#26465#35760#24405
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button6Click
      end
      object Button4: TButton
        Left = 190
        Top = 24
        Width = 75
        Height = 25
        Caption = #20445#23384
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Visible = False
        OnClick = Button4Click
      end
    end
  end
  object Button1: TButton
    Left = 392
    Top = 320
    Width = 75
    Height = 25
    Caption = #36864#20986
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button5: TButton
    Left = 392
    Top = 168
    Width = 75
    Height = 25
    Caption = #21024#38500#31867#22411
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button5Click
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 24
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from produce_type_t')
    Top = 65528
  end
end
