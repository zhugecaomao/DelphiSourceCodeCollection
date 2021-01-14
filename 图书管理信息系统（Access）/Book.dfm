object BookForm: TBookForm
  Left = 213
  Top = 106
  Width = 531
  Height = 456
  Caption = #22270#20070#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 505
    Height = 409
    ActivePage = TabSheet2
    DragKind = dkDock
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #26032#20070#20837#24211
      OnShow = TabSheet1Show
      object Panel1: TPanel
        Left = 12
        Top = 16
        Width = 469
        Height = 328
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Bevel2: TBevel
          Left = 11
          Top = 48
          Width = 446
          Height = 10
          Shape = bsBottomLine
        end
        object StaticText1: TStaticText
          Left = 14
          Top = 21
          Width = 64
          Height = 16
          Caption = #20070'   '#21495#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object CodeEdit: TEdit
          Left = 84
          Top = 18
          Width = 133
          Height = 21
          MaxLength = 10
          TabOrder = 1
        end
        object NameEdit: TEdit
          Left = 84
          Top = 66
          Width = 341
          Height = 21
          TabOrder = 2
        end
        object StaticText3: TStaticText
          Left = 14
          Top = 121
          Width = 64
          Height = 17
          Caption = #20316'        '#32773#65306
          TabOrder = 3
        end
        object AuthorEdit: TEdit
          Left = 84
          Top = 120
          Width = 149
          Height = 21
          TabOrder = 4
        end
        object PressEdit: TEdit
          Left = 84
          Top = 145
          Width = 341
          Height = 21
          TabOrder = 5
        end
        object StaticText4: TStaticText
          Left = 14
          Top = 147
          Width = 64
          Height = 17
          Caption = #20986'  '#29256'  '#31038#65306
          TabOrder = 7
        end
        object StaticText5: TStaticText
          Left = 14
          Top = 172
          Width = 64
          Height = 17
          Caption = #20986#29256#26102#38388#65306
          TabOrder = 8
        end
        object CostEdit: TEdit
          Left = 84
          Top = 195
          Width = 149
          Height = 21
          TabOrder = 9
        end
        object Memo1: TMemo
          Left = 84
          Top = 231
          Width = 341
          Height = 89
          TabOrder = 10
        end
        object StaticText7: TStaticText
          Left = 14
          Top = 228
          Width = 64
          Height = 17
          Caption = #22791'        '#27880#65306
          TabOrder = 11
        end
        object StaticText6: TStaticText
          Left = 14
          Top = 198
          Width = 64
          Height = 17
          Caption = #20215'        '#26684#65306
          TabOrder = 12
        end
        object OutTimeEdit: TEdit
          Left = 84
          Top = 170
          Width = 149
          Height = 21
          TabOrder = 6
        end
        object StaticText2: TStaticText
          Left = 14
          Top = 69
          Width = 64
          Height = 17
          Caption = #20070'        '#21517#65306
          TabOrder = 13
        end
      end
      object Button1: TButton
        Left = 301
        Top = 348
        Width = 67
        Height = 22
        Caption = #20837'     '#24211
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 369
        Top = 348
        Width = 67
        Height = 22
        Caption = #20851#38381
        TabOrder = 2
        OnClick = Button2Click
      end
      object StaticText8: TStaticText
        Left = 270
        Top = 188
        Width = 97
        Height = 17
        Caption = '[ '#26684#24335#65306' 2003-1-1 ]'
        TabOrder = 3
      end
    end
    object TabSheet2: TTabSheet
      Caption = #22270#20070#31649#29702
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Button4: TButton
        Left = 403
        Top = 348
        Width = 67
        Height = 22
        Caption = #20851#38381
        TabOrder = 0
        OnClick = Button4Click
      end
      object Button3: TButton
        Left = 335
        Top = 348
        Width = 67
        Height = 22
        Caption = #20445'    '#23384
        TabOrder = 1
        OnClick = Button3Click
      end
      object Panel2: TPanel
        Left = 12
        Top = 15
        Width = 469
        Height = 322
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object Bevel1: TBevel
          Left = 18
          Top = 48
          Width = 439
          Height = 10
          Shape = bsBottomLine
        end
        object StaticText9: TStaticText
          Left = 23
          Top = 21
          Width = 64
          Height = 16
          Caption = #20070'   '#21495#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object StaticText10: TStaticText
          Left = 21
          Top = 70
          Width = 64
          Height = 17
          Caption = #20070'        '#21517#65306
          TabOrder = 1
        end
        object StaticText11: TStaticText
          Left = 21
          Top = 105
          Width = 64
          Height = 17
          Caption = #20316'        '#32773#65306
          TabOrder = 2
        end
        object StaticText12: TStaticText
          Left = 21
          Top = 131
          Width = 64
          Height = 17
          Caption = #20986'  '#29256'  '#31038#65306
          TabOrder = 3
        end
        object StaticText13: TStaticText
          Left = 21
          Top = 156
          Width = 64
          Height = 17
          Caption = #20986#29256#26102#38388#65306
          TabOrder = 4
        end
        object StaticText14: TStaticText
          Left = 21
          Top = 182
          Width = 64
          Height = 17
          Caption = #20215'        '#26684#65306
          TabOrder = 5
        end
        object StaticText15: TStaticText
          Left = 21
          Top = 212
          Width = 64
          Height = 17
          Caption = #22791'        '#27880#65306
          TabOrder = 6
        end
        object ComboBox1: TComboBox
          Left = 88
          Top = 16
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 7
          OnChange = ComboBox1Change
          OnKeyDown = ComboBox1KeyDown
        end
        object DBName: TDBEdit
          Left = 88
          Top = 72
          Width = 361
          Height = 21
          DataSource = DataSource1
          TabOrder = 8
        end
        object DBAuthor: TDBEdit
          Left = 88
          Top = 104
          Width = 153
          Height = 21
          DataSource = DataSource1
          TabOrder = 9
        end
        object DBPress: TDBEdit
          Left = 88
          Top = 128
          Width = 233
          Height = 21
          DataSource = DataSource1
          TabOrder = 10
        end
        object DBOutDate: TDBEdit
          Left = 88
          Top = 152
          Width = 233
          Height = 21
          DataSource = DataSource1
          TabOrder = 11
        end
        object DBCost: TDBEdit
          Left = 88
          Top = 176
          Width = 153
          Height = 21
          DataSource = DataSource1
          TabOrder = 12
        end
        object DBMemo: TDBMemo
          Left = 88
          Top = 216
          Width = 361
          Height = 89
          DataSource = DataSource1
          TabOrder = 13
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModuleADO.ADOTable1
    Left = 275
  end
end
