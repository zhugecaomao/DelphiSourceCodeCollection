object Put_Form: TPut_Form
  Left = 223
  Top = 165
  Width = 702
  Height = 466
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
    Width = 689
    Height = 81
    TabOrder = 0
    object Label1: TLabel
      Left = 368
      Top = 40
      Width = 65
      Height = 12
      Caption = #21830#21697#31867#22411#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 96
      Top = 40
      Width = 78
      Height = 12
      Caption = #21830#21697#31867#22411#21495#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 16
      Top = 8
      Width = 340
      Height = 19
      Caption = #28155#21152#21830#21697#21069#35831#30830#23450#24182#36873#25321#22909#21830#21697#31867#22411#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbcombobox2: TComboBox
      Left = 176
      Top = 40
      Width = 145
      Height = 21
      ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
      ItemHeight = 13
      TabOrder = 0
      OnChange = DBComboBox2Change
    end
    object dbcombobox1: TComboBox
      Left = 456
      Top = 40
      Width = 145
      Height = 21
      ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
      ItemHeight = 13
      TabOrder = 1
      OnChange = DBComboBox1Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 96
    Width = 689
    Height = 337
    Enabled = False
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 689
      Height = 161
      DataSource = DataSource2
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
          FieldName = 'id'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Title.Caption = #27969#27700#21495
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clRed
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_id'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Title.Caption = #26465#24418#30721
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clRed
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_name'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #26999#20307'_GB2312'
          Font.Style = []
          Title.Caption = #21517#31216
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = []
          Width = 114
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_price'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #26999#20307'_GB2312'
          Font.Style = []
          Title.Caption = #21333#20215#65288#20803#65289
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = []
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_unit'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #26999#20307'_GB2312'
          Font.Style = []
          Title.Caption = #35745#37327#21333#20301
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = []
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_type'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Title.Caption = #31867#22411#21495
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clRed
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_store'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #26999#20307'_GB2312'
          Font.Style = []
          Title.Caption = #26368#22823#24211#23384#37327
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = []
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_time'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Title.Caption = #20837#24211#26102#38388
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clRed
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'p_sale'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Title.Caption = #38144#21806#37327
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clRed
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 73
          Visible = True
        end>
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 192
      Width = 273
      Height = 137
      Caption = #26597#35810#21306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label8: TLabel
        Left = 24
        Top = 32
        Width = 40
        Height = 12
        Caption = #21830#21697'ID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 24
        Top = 64
        Width = 52
        Height = 12
        Caption = #21830#21697#21517#31216
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit6: TEdit
        Left = 88
        Top = 24
        Width = 121
        Height = 20
        ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
        TabOrder = 0
      end
      object Edit7: TEdit
        Left = 88
        Top = 64
        Width = 121
        Height = 20
        ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
        TabOrder = 1
      end
      object Button3: TButton
        Left = 8
        Top = 104
        Width = 75
        Height = 25
        Caption = #26597#35810
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button7: TButton
        Left = 96
        Top = 104
        Width = 75
        Height = 25
        Caption = #19978#19968#26465
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = Button7Click
      end
      object Button9: TButton
        Left = 184
        Top = 104
        Width = 75
        Height = 25
        Caption = #19979#19968#26465
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = Button9Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 352
      Top = 192
      Width = 305
      Height = 137
      Caption = #25805#20316#21306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Button4: TButton
        Left = 24
        Top = 32
        Width = 75
        Height = 25
        Caption = #28155#21152#21830#21697
        TabOrder = 0
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 128
        Top = 32
        Width = 75
        Height = 25
        Caption = #20462#25913#21830#21697
        TabOrder = 1
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 224
        Top = 32
        Width = 75
        Height = 25
        Caption = #21024#38500#21830#21697
        TabOrder = 2
        OnClick = Button6Click
      end
      object Button8: TButton
        Left = 224
        Top = 88
        Width = 75
        Height = 25
        Caption = #36864#20986
        TabOrder = 3
        OnClick = Button8Click
      end
    end
    object Panel3: TPanel
      Left = 376
      Top = -16
      Width = 281
      Height = 337
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Visible = False
      object Label3: TLabel
        Left = 32
        Top = 40
        Width = 52
        Height = 12
        Caption = #21830#21697#26465#30721
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 32
        Top = 92
        Width = 39
        Height = 12
        Caption = #21830#21697#21517
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 32
        Top = 188
        Width = 52
        Height = 12
        Caption = #35745#37327#21333#20301
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 32
        Top = 236
        Width = 26
        Height = 12
        Caption = #21333#20215
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 32
        Top = 140
        Width = 26
        Height = 12
        Caption = #25968#37327
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 96
        Top = 32
        Width = 121
        Height = 20
        ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 96
        Top = 92
        Width = 121
        Height = 20
        ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 96
        Top = 140
        Width = 121
        Height = 20
        ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
        TabOrder = 2
      end
      object Edit4: TEdit
        Left = 96
        Top = 188
        Width = 121
        Height = 20
        ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
        TabOrder = 3
      end
      object Edit5: TEdit
        Left = 96
        Top = 236
        Width = 121
        Height = 20
        ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
        TabOrder = 4
      end
      object Button1: TButton
        Left = 40
        Top = 280
        Width = 75
        Height = 25
        Caption = #30830#23450
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 152
        Top = 280
        Width = 75
        Height = 25
        Caption = #36864#20986
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = Button2Click
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 40
    Top = 32
  end
  object ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
    Left = 8
    Top = 32
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 40
    Top = 64
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 8
    Top = 64
  end
end
