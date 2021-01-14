object frmGdsUnit: TfrmGdsUnit
  Left = 360
  Top = 203
  Width = 568
  Height = 428
  Hint = #21830#21697#21333#20301#31649#29702
  Caption = #21830#21697#21333#20301#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 3
    Top = 31
    Width = 541
    Height = 351
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 6
      Top = 4
      Width = 259
      Height = 341
      Caption = #20844#24335#21015#34920
      TabOrder = 0
      object lvUnit: TListView
        Left = 6
        Top = 15
        Width = 247
        Height = 293
        Columns = <
          item
            Caption = #21333#20301
            Width = 70
          end
          item
            Alignment = taCenter
            Caption = #20844#24335#25968#20540
            Width = 80
          end
          item
            Alignment = taCenter
            Caption = #22522#26412#21333#20301
            Width = 70
          end>
        GridLines = True
        HotTrack = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnSelectItem = lvUnitSelectItem
      end
      object Button2: TButton
        Left = 185
        Top = 314
        Width = 67
        Height = 22
        Caption = #21024#38500
        TabOrder = 1
        OnClick = Button2Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 272
      Top = 4
      Width = 262
      Height = 341
      Caption = #32534#36753#29992#25143
      TabOrder = 1
      object GroupBox4: TGroupBox
        Left = 12
        Top = 125
        Width = 238
        Height = 166
        Caption = #36873#39033
        TabOrder = 0
        object edUnit: TEdit
          Left = 93
          Top = 36
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object StaticText1: TStaticText
          Left = 19
          Top = 39
          Width = 28
          Height = 17
          Hint = #21333#20301
          Caption = #21333#20301
          TabOrder = 1
        end
        object StaticText2: TStaticText
          Left = 19
          Top = 77
          Width = 52
          Height = 17
          Caption = #20844#24335#25968#20540
          TabOrder = 2
        end
        object StaticText3: TStaticText
          Left = 19
          Top = 114
          Width = 52
          Height = 17
          Hint = #22522#26412#21333#20301
          Caption = #22522#26412#21333#20301
          TabOrder = 3
        end
        object edBaseUnit: TwwDBEdit
          Left = 93
          Top = 112
          Width = 121
          Height = 21
          DataField = 'Unit'
          DataSource = DM.dsGoods
          Enabled = False
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object spExpr: TwwDBSpinEdit
          Left = 96
          Top = 72
          Width = 121
          Height = 21
          Increment = 1
          TabOrder = 5
          UnboundDataType = wwDefault
        end
      end
      object Button3: TButton
        Left = 178
        Top = 299
        Width = 67
        Height = 22
        Caption = #30830#23450
        TabOrder = 1
        OnClick = Button3Click
      end
      object GroupBox3: TGroupBox
        Left = 12
        Top = 21
        Width = 237
        Height = 92
        Caption = #21830#21697#36164#26009
        TabOrder = 2
        object StaticText5: TStaticText
          Left = 23
          Top = 26
          Width = 52
          Height = 17
          Caption = #21830#21697#32534#21495
          TabOrder = 0
        end
        object labgdsName: TStaticText
          Left = 25
          Top = 61
          Width = 52
          Height = 17
          Caption = #21830#21697#21517#31216
          TabOrder = 1
        end
        object wwDBEdit1: TwwDBEdit
          Left = 93
          Top = 56
          Width = 121
          Height = 21
          DataField = 'GdsName'
          DataSource = DM.dsGoods
          Enabled = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object btnAdd: TButton
        Left = 102
        Top = 299
        Width = 67
        Height = 22
        Caption = #26032#22686
        TabOrder = 3
        OnClick = btnAddClick
      end
    end
    object wwDBLookupCombo1: TwwDBLookupCombo
      Left = 544
      Top = 32
      Width = 121
      Height = 21
      DropDownAlignment = taLeftJustify
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object lcGdsId: TwwDBLookupCombo
      Left = 376
      Top = 48
      Width = 123
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'GdsID'#9'12'#9#32534#21495#9'F'
        'GdsName'#9'24'#9#21830#21697#21517#31216#9'F'
        'Unit'#9'6'#9#21333#20301#9'F')
      LookupTable = DM.tabGoods
      LookupField = 'GdsID'
      Options = [loColLines, loRowLines, loTitles, loSearchOnBackspace]
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      OnChange = lcGdsIdChange
    end
  end
  object Panel2: TPanel
    Left = 4
    Top = 3
    Width = 540
    Height = 25
    Alignment = taLeftJustify
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object StaticText4: TStaticText
      Left = 12
      Top = 6
      Width = 76
      Height = 16
      Caption = #21830#21697#21333#20301#31649#29702
      TabOrder = 0
    end
    object labSelect: TStaticText
      Left = 400
      Top = 6
      Width = 129
      Height = 16
      Hint = #36873#23450#30340#21333#20301
      Alignment = taRightJustify
      AutoSize = False
      Caption = #36873#23450#30340#21333#20301
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
  end
  object Qry: TADOQuery
    Connection = DM.DB
    Parameters = <>
    Left = 512
    Top = 48
  end
  object RegForm1: TRegForm
    RegEnabled = True
    RegShowWarning = False
    RegLocation = CurrentUser
    RegKey = '\Software\ww\'#36827#38144#23384'\gdsunit'
    Left = 179
    Top = 249
  end
end
