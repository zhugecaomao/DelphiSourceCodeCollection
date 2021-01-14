object Admin_Form: TAdmin_Form
  Left = 316
  Top = 159
  Width = 508
  Height = 493
  Caption = #36229#32423#31649#29702#21592
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
    Width = 497
    Height = 225
    TabOrder = 0
    object Label1: TLabel
      Left = 264
      Top = 0
      Width = 72
      Height = 13
      Caption = #29992#25143#31867#22411#24211#65306
    end
    object Label3: TLabel
      Left = 280
      Top = 24
      Width = 210
      Height = 13
      Caption = #24517#38656#26159#36229#32423#31649#29702#21592#25165#25317#26377#25805#20316#26435#38480
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 265
      Height = 233
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
          FieldName = 'use_type'
          Title.Caption = #29992#25143#31867#22411
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'use_name'
          Title.Caption = #31867#22411#21517
          Width = 116
          Visible = True
        end>
    end
    object GroupBox1: TGroupBox
      Left = 304
      Top = 48
      Width = 177
      Height = 137
      Caption = #25805#20316#21306
      TabOrder = 1
      object Button1: TButton
        Left = 8
        Top = 16
        Width = 75
        Height = 25
        Caption = #28155#21152
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 8
        Top = 56
        Width = 75
        Height = 25
        Caption = #20462#25913
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 8
        Top = 96
        Width = 75
        Height = 25
        Caption = #21024#38500
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 96
        Top = 16
        Width = 75
        Height = 25
        Caption = #19978#19968#26465
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 96
        Top = 56
        Width = 75
        Height = 25
        Caption = #19979#19968#26465
        TabOrder = 4
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 96
        Top = 96
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 5
        OnClick = Button6Click
      end
    end
    object Button7: TButton
      Left = 400
      Top = 192
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 2
      OnClick = Button7Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 240
    Width = 497
    Height = 225
    TabOrder = 1
    object Label2: TLabel
      Left = 280
      Top = 8
      Width = 36
      Height = 13
      Caption = #29992#25143#24211
    end
    object Label4: TLabel
      Left = 282
      Top = 32
      Width = 210
      Height = 13
      Caption = #24517#38656#26159#26222#36890#31649#29702#21592#25165#25317#26377#25805#20316#26435#38480
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 16
      Width = 273
      Height = 201
      DataSource = DataSource2
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
          FieldName = 'use_name'
          Title.Caption = #29992#25143#21517
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'use_psw'
          Title.Caption = #29992#25143#23494#30721
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'use_type'
          Title.Caption = #29992#25143#31867#22411
          Width = 69
          Visible = True
        end>
    end
    object GroupBox2: TGroupBox
      Left = 304
      Top = 48
      Width = 177
      Height = 137
      Caption = #25805#20316#21306
      TabOrder = 1
      object Button8: TButton
        Left = 8
        Top = 16
        Width = 75
        Height = 25
        Caption = #28155#21152
        TabOrder = 0
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 8
        Top = 56
        Width = 75
        Height = 25
        Caption = #20462#25913
        TabOrder = 1
        OnClick = Button9Click
      end
      object Button10: TButton
        Left = 8
        Top = 96
        Width = 75
        Height = 25
        Caption = #21024#38500
        TabOrder = 2
        OnClick = Button10Click
      end
      object Button11: TButton
        Left = 96
        Top = 16
        Width = 75
        Height = 25
        Caption = #19978#19968#26465
        TabOrder = 3
        OnClick = Button11Click
      end
      object Button12: TButton
        Left = 96
        Top = 56
        Width = 75
        Height = 25
        Caption = #19979#19968#26465
        TabOrder = 4
        OnClick = Button12Click
      end
      object Button13: TButton
        Left = 96
        Top = 96
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 5
        OnClick = Button13Click
      end
    end
    object Button14: TButton
      Left = 400
      Top = 192
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 2
      OnClick = Button14Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select use_type,use_name from use_type_t')
    Left = 8
    Top = 65528
  end
  object ADOQuery2: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select use_name,use_psw,use_type from use_t')
    Top = 232
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 40
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 32
    Top = 224
  end
end
