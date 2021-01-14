object Form1: TForm1
  Left = 298
  Top = 177
  Width = 790
  Height = 600
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 648
    Top = 0
    Width = 134
    Height = 566
    Align = alRight
    Caption = 'Panel1'
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 121
      Height = 193
      Caption = #31383#21475
      TabOrder = 0
      object RadioButton1: TRadioButton
        Left = 16
        Top = 16
        Width = 63
        Height = 17
        Caption = '1'#31383#21475
        TabOrder = 0
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 16
        Top = 40
        Width = 63
        Height = 17
        Caption = '4'#31383#21475
        TabOrder = 1
        OnClick = RadioButton2Click
      end
      object RadioButton3: TRadioButton
        Left = 16
        Top = 64
        Width = 63
        Height = 17
        Caption = '9'#31383#21475
        TabOrder = 2
        OnClick = RadioButton3Click
      end
      object RadioButton4: TRadioButton
        Left = 16
        Top = 88
        Width = 63
        Height = 17
        Caption = '16'#31383#21475
        TabOrder = 3
        OnClick = RadioButton4Click
      end
      object RadioButton5: TRadioButton
        Left = 16
        Top = 112
        Width = 63
        Height = 17
        Caption = '25'#31383#21475
        TabOrder = 4
        OnClick = RadioButton5Click
      end
      object RadioButton6: TRadioButton
        Left = 16
        Top = 136
        Width = 63
        Height = 17
        Caption = '36'#31383#21475
        TabOrder = 5
        OnClick = RadioButton6Click
      end
      object RadioButton7: TRadioButton
        Left = 16
        Top = 160
        Width = 63
        Height = 17
        Caption = '49'#31383#21475
        TabOrder = 6
        OnClick = RadioButton7Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 208
      Width = 121
      Height = 89
      Caption = 'CanDrawRect'
      TabOrder = 1
      object RadioButton8: TRadioButton
        Left = 16
        Top = 24
        Width = 78
        Height = 17
        Caption = 'True'
        TabOrder = 0
        OnClick = RadioButton8Click
      end
      object RadioButton9: TRadioButton
        Left = 16
        Top = 56
        Width = 78
        Height = 17
        Caption = 'False'
        TabOrder = 1
        OnClick = RadioButton9Click
      end
    end
    object LabeledEdit1: TLabeledEdit
      Left = 72
      Top = 320
      Width = 49
      Height = 21
      EditLabel.Width = 54
      EditLabel.Height = 13
      EditLabel.Caption = #24403#21069#36873#25321'  '
      ImeName = #26497#21697#20116#31508#36755#20837#27861
      LabelPosition = lpLeft
      TabOrder = 2
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 354
      Width = 118
      Height = 207
      Caption = #35270#39057#31383#21475'Rect'
      TabOrder = 3
      object LabeledEdit2: TLabeledEdit
        Left = 8
        Top = 33
        Width = 98
        Height = 21
        EditLabel.Width = 18
        EditLabel.Height = 13
        EditLabel.Caption = 'Left'
        ImeName = #26497#21697#20116#31508#36755#20837#27861
        TabOrder = 0
      end
      object LabeledEdit3: TLabeledEdit
        Left = 8
        Top = 73
        Width = 98
        Height = 21
        EditLabel.Width = 19
        EditLabel.Height = 13
        EditLabel.Caption = 'Top'
        ImeName = #26497#21697#20116#31508#36755#20837#27861
        TabOrder = 1
      end
      object LabeledEdit4: TLabeledEdit
        Left = 8
        Top = 113
        Width = 98
        Height = 21
        EditLabel.Width = 25
        EditLabel.Height = 13
        EditLabel.Caption = 'Right'
        ImeName = #26497#21697#20116#31508#36755#20837#27861
        TabOrder = 2
      end
      object LabeledEdit5: TLabeledEdit
        Left = 8
        Top = 153
        Width = 98
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Bottom'
        ImeName = #26497#21697#20116#31508#36755#20837#27861
        TabOrder = 3
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 648
    Height = 566
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object HKVideoWindow1: THKVideoWindow
      Left = 8
      Top = 8
      Width = 633
      Height = 553
      PopupMenu = PopupMenu1
      OnClick = HKVideoWindow1Click
    end
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    AutoPopup = False
    Left = 432
    Top = 192
    object N1: TMenuItem
      Caption = #20840#23631
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #27491#24120
      OnClick = N3Click
    end
  end
end
