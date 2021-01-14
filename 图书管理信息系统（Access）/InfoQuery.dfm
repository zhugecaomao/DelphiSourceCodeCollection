object QueryForm: TQueryForm
  Left = 96
  Top = 154
  Width = 617
  Height = 471
  Caption = #20449#24687#26597#35810
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
    Top = 13
    Width = 593
    Height = 396
    ActivePage = TabSheet3
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #26597#35810#22270#20070#22522#26412#20449#24687
      object GroupBox1: TGroupBox
        Left = 2
        Top = 0
        Width = 575
        Height = 65
        Caption = #26597#35810#26465#20214
        TabOrder = 0
        object RadioButton1: TRadioButton
          Left = 12
          Top = 18
          Width = 73
          Height = 17
          Caption = #25353#20070#21495
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton1Click
        end
        object RadioButton2: TRadioButton
          Left = 139
          Top = 18
          Width = 73
          Height = 17
          Caption = #25353#20070#21517
          TabOrder = 1
          OnClick = RadioButton2Click
        end
        object RadioButton3: TRadioButton
          Left = 266
          Top = 18
          Width = 73
          Height = 17
          Caption = #25353#20986#29256#31038
          TabOrder = 2
          OnClick = RadioButton3Click
        end
        object RadioButton4: TRadioButton
          Left = 392
          Top = 18
          Width = 70
          Height = 17
          Caption = #25353#20316#32773
          TabOrder = 3
          OnClick = RadioButton4Click
        end
        object CheckBox1: TCheckBox
          Left = 12
          Top = 46
          Width = 82
          Height = 17
          Caption = #27169#31946#26597#35810
          TabOrder = 4
        end
      end
      object StaticText1: TStaticText
        Left = 9
        Top = 75
        Width = 64
        Height = 17
        Caption = #36755#20837#26597#35810#39033
        TabOrder = 1
      end
      object Button2: TButton
        Left = 513
        Top = 71
        Width = 67
        Height = 22
        Caption = #26597#35810
        Default = True
        TabOrder = 2
        OnClick = Button2Click
      end
      object StaticText2: TStaticText
        Left = 6
        Top = 351
        Width = 58
        Height = 17
        Caption = #20849'0'#26465#35760#24405
        TabOrder = 3
      end
      object ListView1: TListView
        Left = 2
        Top = 103
        Width = 575
        Height = 245
        Columns = <
          item
            Caption = #20070#21495
            Width = 70
          end
          item
            Caption = #20070#21517
            Width = 100
          end
          item
            Caption = #20316#32773
          end
          item
            Caption = #20986#29256#31038
            Width = 80
          end
          item
            Caption = #20986#29256#26085#26399
            Width = 60
          end
          item
            Caption = #20215#26684'('#20803')'
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 4
        ViewStyle = vsReport
      end
      object Edit3: TEdit
        Left = 80
        Top = 72
        Width = 425
        Height = 21
        TabOrder = 5
        OnKeyDown = Edit3KeyDown
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26597#35810#35835#32773#22522#26412#20449#24687
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 2
        Top = 0
        Width = 575
        Height = 65
        Caption = #26597#35810#26465#20214
        TabOrder = 0
        object RadioButton5: TRadioButton
          Left = 12
          Top = 18
          Width = 101
          Height = 17
          Caption = #25353#20511#20070#35777#21495
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton5Click
        end
        object RadioButton6: TRadioButton
          Left = 178
          Top = 18
          Width = 103
          Height = 17
          Caption = #25353#35835#32773#22995#21517
          TabOrder = 1
          OnClick = RadioButton6Click
        end
        object CheckBox2: TCheckBox
          Left = 12
          Top = 46
          Width = 82
          Height = 17
          Caption = #27169#31946#26597#35810
          TabOrder = 2
        end
      end
      object StaticText3: TStaticText
        Left = 1
        Top = 75
        Width = 64
        Height = 17
        Caption = #36755#20837#26597#35810#39033
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 78
        Top = 72
        Width = 427
        Height = 21
        TabOrder = 2
      end
      object Button3: TButton
        Left = 513
        Top = 71
        Width = 67
        Height = 22
        Caption = #26597#35810
        Default = True
        TabOrder = 3
        OnClick = Button3Click
      end
      object ListView2: TListView
        Left = 2
        Top = 103
        Width = 575
        Height = 245
        Columns = <
          item
            Caption = #20511#20070#21495
            Width = 70
          end
          item
            Caption = #22995#21517
            Width = 80
          end
          item
            Caption = #24615#21035
          end
          item
            Caption = #36523#20221#35777#21495
            Width = 110
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 4
        ViewStyle = vsReport
      end
      object StaticText4: TStaticText
        Left = 6
        Top = 351
        Width = 58
        Height = 17
        Caption = #20849'0'#26465#35760#24405
        TabOrder = 5
      end
    end
    object TabSheet3: TTabSheet
      Caption = #26597#35810#20511#38405#22522#26412#20449#24687
      ImageIndex = 2
      object GroupBox3: TGroupBox
        Left = 2
        Top = 0
        Width = 575
        Height = 65
        Caption = #26597#35810#26465#20214
        TabOrder = 0
        object RadioButton7: TRadioButton
          Left = 12
          Top = 18
          Width = 93
          Height = 17
          Caption = #25353#20511#20070#35777#21495
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object CheckBox3: TCheckBox
          Left = 12
          Top = 46
          Width = 82
          Height = 17
          Caption = #27169#31946#26597#35810
          TabOrder = 1
        end
      end
      object Edit2: TEdit
        Left = 78
        Top = 72
        Width = 427
        Height = 21
        MaxLength = 10
        TabOrder = 1
      end
      object Button4: TButton
        Left = 513
        Top = 72
        Width = 67
        Height = 22
        Caption = #26597#35810
        Default = True
        TabOrder = 2
        OnClick = Button4Click
      end
      object ListView3: TListView
        Left = 2
        Top = 103
        Width = 575
        Height = 245
        Columns = <
          item
            Caption = #20511#20070#21495
            Width = 70
          end
          item
            Caption = #22995#21517
            Width = 60
          end
          item
            Caption = #24615#21035
            Width = 40
          end
          item
            Caption = #25345#26377#20070#31821#21495
            Width = 80
          end
          item
            Caption = #20511#20986#26102#38388
            Width = 70
          end
          item
            Caption = #25345#26377#22825#25968
            Width = 60
          end
          item
            Caption = #36523#20221#35777#21495
            Width = 80
          end
          item
            Caption = #32602#37329'('#20803')'
            Width = 60
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 3
        ViewStyle = vsReport
      end
      object StaticText6: TStaticText
        Left = 6
        Top = 351
        Width = 58
        Height = 17
        Caption = #20849'0'#26465#35760#24405
        TabOrder = 4
      end
      object StaticText5: TStaticText
        Left = 9
        Top = 75
        Width = 64
        Height = 17
        Caption = #36755#20837#26597#35810#39033
        TabOrder = 5
      end
    end
  end
  object Button1: TButton
    Left = 506
    Top = 416
    Width = 67
    Height = 22
    Caption = #20851#38381
    DragCursor = crDefault
    TabOrder = 1
    OnClick = Button1Click
  end
end
