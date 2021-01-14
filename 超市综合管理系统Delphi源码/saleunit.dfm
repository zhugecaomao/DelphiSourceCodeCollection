object Sale_Form: TSale_Form
  Left = -11
  Top = -8
  Align = alClient
  BorderStyle = bsNone
  Caption = #25910#38134#21488
  ClientHeight = 714
  ClientWidth = 1028
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1028
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 208
      Top = 24
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
    object Label2: TLabel
      Left = 456
      Top = 24
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
    object Edit1: TEdit
      Left = 272
      Top = 24
      Width = 121
      Height = 21
      ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
      TabOrder = 0
    end
    object Button1: TButton
      Left = 656
      Top = 24
      Width = 75
      Height = 25
      Caption = #25552#20132
      TabOrder = 2
      TabStop = False
      Visible = False
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 752
      Top = 24
      Width = 75
      Height = 25
      Caption = #32467#31639
      TabOrder = 3
      TabStop = False
      Visible = False
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 936
      Top = 24
      Width = 75
      Height = 25
      Caption = #31163#24320
      TabOrder = 4
      TabStop = False
      Visible = False
      OnClick = Button3Click
    end
    object Edit2: TEdit
      Left = 544
      Top = 24
      Width = 121
      Height = 21
      ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
      TabOrder = 1
    end
    object Button6: TButton
      Left = 848
      Top = 24
      Width = 75
      Height = 25
      Caption = #21024#38500#20840#37096
      TabOrder = 5
      Visible = False
      OnClick = Button6Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 57
    Width = 1028
    Height = 508
    TabStop = False
    Align = alClient
    Color = clInfoBk
    DataSource = DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 's_p_id'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        Title.Caption = #26465#24418#30721
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = 's_p_name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        Title.Caption = #21830#21697#21517#31216
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 's_p_price'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        Title.Caption = #24212#20184#37329#39069#65288#21333#20301#65306#20803#65289
        Width = 255
        Visible = True
      end
      item
        Expanded = False
        FieldName = 's_p_unit'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        Title.Caption = #21333#20301
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 's_p_left'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        Title.Caption = #24211#23384#37327
        Width = 152
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 677
    Width = 1028
    Height = 37
    Enabled = False
    Panels = <
      item
        Text = #25910#38134#21592#65306
        Width = 200
      end
      item
        Text = #24110#21161#65306'F1'
        Width = 120
      end
      item
        Text = #25552#20132#65306'F2'
        Width = 120
      end
      item
        Text = #32467#31639#65306'F3'
        Width = 120
      end
      item
        Text = #21024#38500#20840#37096#65306'Del'
        Width = 120
      end
      item
        Text = #31163#24320#65306'Esc'
        Width = 120
      end
      item
        Text = #31995#32479#26102#38388#65306
        Width = 120
      end>
  end
  object RichEdit1: TRichEdit
    Left = 0
    Top = 565
    Width = 1028
    Height = 112
    TabStop = False
    Align = alBottom
    Color = clMenuText
    Font.Charset = GB2312_CHARSET
    Font.Color = clRed
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
    Lines.Strings = (
      #12288#12288#12288#12288#27426#36814#24744#26469#21040#19975#23478#31119)
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 368
    Top = 232
    Width = 273
    Height = 233
    TabOrder = 4
    Visible = False
    object GroupBox1: TGroupBox
      Left = 16
      Top = 8
      Width = 241
      Height = 217
      TabOrder = 0
      object Label3: TLabel
        Left = 16
        Top = 120
        Width = 68
        Height = 15
        Caption = #24212#25910#37329#39069
        Font.Charset = GB2312_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = #26999#20307'_GB2312'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 16
        Top = 48
        Width = 68
        Height = 15
        Caption = #23454#25910#37329#39069
        Font.Charset = GB2312_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = #26999#20307'_GB2312'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 192
        Top = 120
        Width = 17
        Height = 15
        Caption = #20803
        Font.Charset = GB2312_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = #26999#20307'_GB2312'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 192
        Top = 48
        Width = 17
        Height = 15
        Caption = #20803
        Font.Charset = GB2312_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = #26999#20307'_GB2312'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Button4: TButton
        Left = 16
        Top = 168
        Width = 81
        Height = 33
        Caption = #25552#20132
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button4Click
      end
      object Edit4: TEdit
        Left = 96
        Top = 24
        Width = 89
        Height = 24
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = #38582#20070
        Font.Style = [fsBold]
        ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
        ParentFont = False
        TabOrder = 0
      end
      object Edit3: TEdit
        Left = 96
        Top = 104
        Width = 89
        Height = 24
        TabStop = False
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = #38582#20070
        Font.Style = [fsBold]
        ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object Button5: TButton
        Left = 128
        Top = 168
        Width = 81
        Height = 33
        Caption = #21462#28040
        TabOrder = 3
        OnClick = Button5Click
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery2
    Left = 72
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from produce_t')
    Left = 40
    Top = 8
    object ADOQuery1id: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
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
    end
    object ADOQuery1p_store: TSmallintField
      FieldName = 'p_store'
    end
    object ADOQuery1p_time: TDateTimeField
      FieldName = 'p_time'
    end
    object ADOQuery1p_sale: TSmallintField
      FieldName = 'p_sale'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from sell_t')
    Left = 8
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 736
    Top = 24
    object N1: TMenuItem
      Caption = #25552#20132
      ShortCut = 113
      OnClick = Button1Click
    end
    object N2: TMenuItem
      Caption = #32467#31639
      ShortCut = 114
      OnClick = Button2Click
    end
    object N3: TMenuItem
      Caption = #36864#20986
      ShortCut = 27
      OnClick = Button3Click
    end
    object N4: TMenuItem
      Caption = #21024#38500#20840#37096
      ShortCut = 46
      OnClick = Button6Click
    end
    object N5: TMenuItem
      Caption = #24110#21161
      ShortCut = 112
      OnClick = N5Click
    end
  end
  object ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'sell_back_t'
    Left = 8
    Top = 40
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 208
    Top = 136
  end
end
