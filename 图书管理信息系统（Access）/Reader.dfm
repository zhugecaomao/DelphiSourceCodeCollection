object ReaderForm: TReaderForm
  Left = 116
  Top = 77
  Width = 633
  Height = 445
  Caption = #35835#32773#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox3: TGroupBox
    Left = 3
    Top = 14
    Width = 334
    Height = 368
    Caption = #35835#32773#21015#34920
    TabOrder = 0
    object ListView1: TListView
      Left = 6
      Top = 15
      Width = 331
      Height = 322
      Columns = <
        item
          Caption = #20511#20070#35777#21495
          Width = 80
        end
        item
          Caption = #22995#21517
          Width = 70
        end
        item
          Caption = #24615#21035
        end
        item
          Caption = #36523#20221#35777#21495
          Width = 120
        end>
      GridLines = True
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      TabStop = False
      ViewStyle = vsReport
      OnClick = ListView1Click
    end
    object Button3: TButton
      Left = 175
      Top = 341
      Width = 67
      Height = 22
      Caption = #21047#26032
      TabOrder = 1
      TabStop = False
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 251
      Top = 341
      Width = 67
      Height = 22
      Caption = #21024#38500
      TabOrder = 2
      TabStop = False
      OnClick = Button4Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 352
    Top = 14
    Width = 265
    Height = 368
    Caption = #32534#36753#35835#32773#20449#24687#65306
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 34
      Width = 249
      Height = 52
      Caption = #25805#20316
      TabOrder = 0
      object RadioButton1: TRadioButton
        Left = 21
        Top = 21
        Width = 49
        Height = 17
        Caption = #28155#21152
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 96
        Top = 21
        Width = 52
        Height = 17
        Caption = #20462#25913
        TabOrder = 1
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 107
      Width = 251
      Height = 206
      Caption = #35835#32773#20449#24687'  '
      TabOrder = 1
      TabStop = True
      object Edit3: TEdit
        Left = 103
        Top = 151
        Width = 130
        Height = 21
        MaxLength = 18
        TabOrder = 4
      end
      object Edit1: TEdit
        Left = 103
        Top = 39
        Width = 130
        Height = 21
        MaxLength = 10
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 103
        Top = 73
        Width = 130
        Height = 21
        TabOrder = 1
      end
      object ComboBox1: TComboBox
        Left = 103
        Top = 107
        Width = 50
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        Items.Strings = (
          #30007
          #22899)
      end
      object StaticText1: TStaticText
        Left = 18
        Top = 41
        Width = 52
        Height = 17
        Caption = #20511#20070#35777#21495
        TabOrder = 3
      end
      object StaticText2: TStaticText
        Left = 18
        Top = 76
        Width = 28
        Height = 17
        Caption = #22995#21517
        TabOrder = 5
      end
      object StaticText3: TStaticText
        Left = 18
        Top = 110
        Width = 28
        Height = 17
        Caption = #24615#21035
        TabOrder = 6
      end
      object StaticText4: TStaticText
        Left = 18
        Top = 155
        Width = 52
        Height = 17
        Caption = #36523#20221#35777#21495
        TabOrder = 7
      end
    end
    object Button2: TButton
      Left = 185
      Top = 325
      Width = 67
      Height = 22
      Caption = #30830#23450
      Default = True
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object Button1: TButton
    Left = 516
    Top = 390
    Width = 67
    Height = 22
    Caption = #20851#38381
    TabOrder = 2
    TabStop = False
    OnClick = Button1Click
  end
end
