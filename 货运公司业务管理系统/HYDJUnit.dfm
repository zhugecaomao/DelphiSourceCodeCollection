object HYDJForm: THYDJForm
  Left = 26
  Top = 178
  Width = 1023
  Height = 516
  Caption = #28023#36816#21333#20215
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object FlatPanel1: TFlatPanel
    Left = 0
    Top = 41
    Width = 1015
    Height = 106
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = True
    Align = alTop
    TabOrder = 0
    object AALabel1: TAALabel
      Left = 37
      Top = 24
      Width = 26
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #32534#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel2: TAALabel
      Left = 215
      Top = 25
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #33337#36816#20844#21496
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel3: TAALabel
      Left = 12
      Top = 74
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #35746#33329#26465#27456
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel4: TAALabel
      Left = 564
      Top = 25
      Width = 39
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #36215#36816#28207
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel5: TAALabel
      Left = 792
      Top = 24
      Width = 39
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #30446#30340#28207
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel6: TAALabel
      Left = 232
      Top = 76
      Width = 26
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #31665#22411
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel7: TAALabel
      Left = 447
      Top = 75
      Width = 26
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #21333#20215
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object Edit1: TEdit
      Left = 73
      Top = 22
      Width = 104
      Height = 19
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 279
      Top = 22
      Width = 250
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnKeyPress = Edit2KeyPress
    end
    object Edit3: TEdit
      Left = 613
      Top = 22
      Width = 121
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      OnKeyPress = Edit3KeyPress
    end
    object Edit4: TEdit
      Left = 844
      Top = 21
      Width = 121
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      OnKeyPress = Edit4KeyPress
    end
    object Edit6: TEdit
      Left = 483
      Top = 72
      Width = 121
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object FlatComboBox1: TFlatComboBox
      Left = 72
      Top = 71
      Width = 123
      Height = 21
      Style = csDropDownList
      Color = clWindow
      ItemHeight = 13
      Items.Strings = (
        'CFS-D'
        'CFS-CY'
        'CFS-CFS'
        'D-D'
        'D-CFS')
      TabOrder = 4
      ItemIndex = -1
      OnKeyPress = FlatComboBox1KeyPress
    end
    object FlatComboBox2: TFlatComboBox
      Left = 279
      Top = 71
      Width = 145
      Height = 21
      Style = csDropDownList
      Color = clWindow
      ItemHeight = 13
      Items.Strings = (
        '20'
        '40'
        '40HC'
        '20X2')
      TabOrder = 5
      ItemIndex = -1
      OnKeyPress = FlatComboBox2KeyPress
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 147
    Width = 1015
    Height = 342
    Align = alClient
    Color = clInfoBk
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HY_ID'
        Title.Alignment = taCenter
        Title.Caption = #32534#21495
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HY_GONGSI'
        Title.Alignment = taCenter
        Title.Caption = #33337#36816#20844#21496
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HY_ORDER'
        Title.Alignment = taCenter
        Title.Caption = #35746#33329#26465#27454
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HY_BEGIN'
        Title.Alignment = taCenter
        Title.Caption = #36215#36816#28207
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HY_END'
        Title.Alignment = taCenter
        Title.Caption = #30446#30340#28207
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HY_BOX'
        Title.Alignment = taCenter
        Title.Caption = #31665#22411
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HY_PRICE'
        Title.Alignment = taCenter
        Title.Caption = #21333#20215
        Width = 110
        Visible = True
      end>
  end
  object FlatPanel2: TFlatPanel
    Left = 0
    Top = 0
    Width = 1015
    Height = 41
    ParentColor = True
    Align = alTop
    TabOrder = 2
    object FlatButton2: TFlatButton
      Left = 47
      Top = 2
      Width = 44
      Height = 37
      Caption = #20462#25913
      TabOrder = 0
      OnClick = FlatButton2Click
    end
    object FlatButton1: TFlatButton
      Left = 2
      Top = 2
      Width = 44
      Height = 37
      Caption = #28155#21152
      TabOrder = 1
      OnClick = FlatButton1Click
    end
    object FlatButton3: TFlatButton
      Left = 92
      Top = 2
      Width = 44
      Height = 37
      Caption = #21024#38500
      TabOrder = 2
      OnClick = FlatButton3Click
    end
    object FlatButton4: TFlatButton
      Left = 137
      Top = 2
      Width = 44
      Height = 37
      Caption = #20445#23384
      TabOrder = 3
      OnClick = FlatButton4Click
    end
    object FlatButton5: TFlatButton
      Left = 182
      Top = 2
      Width = 43
      Height = 37
      Caption = #26597#35810
      TabOrder = 4
      OnClick = FlatButton5Click
    end
    object FlatButton6: TFlatButton
      Left = 276
      Top = 2
      Width = 47
      Height = 37
      Caption = #20851#38381
      TabOrder = 5
      OnClick = FlatButton6Click
    end
    object FlatButton7: TFlatButton
      Left = 226
      Top = 2
      Width = 49
      Height = 37
      Caption = #25171#21360
      TabOrder = 6
      OnClick = FlatButton7Click
    end
  end
end
