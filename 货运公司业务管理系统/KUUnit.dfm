object KHForm: TKHForm
  Left = 140
  Top = 180
  Width = 1015
  Height = 546
  Caption = #23458#25143#20449#24687
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
    Width = 1007
    Height = 100
    ParentColor = True
    Align = alTop
    TabOrder = 0
    object AALabel1: TAALabel
      Left = 19
      Top = 22
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
      Left = 192
      Top = 23
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #21457#36135#20844#21496
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel3: TAALabel
      Left = 581
      Top = 24
      Width = 39
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #30446#30340#22320
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel4: TAALabel
      Left = 395
      Top = 21
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #25176#36816#22320#22336
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel5: TAALabel
      Left = 406
      Top = 64
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
    object AALabel6: TAALabel
      Left = 588
      Top = 64
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
    object AALabel7: TAALabel
      Left = 195
      Top = 66
      Width = 39
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #19994#21153#21592
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel8: TAALabel
      Left = 775
      Top = 28
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #25176#36816#26465#27454
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel9: TAALabel
      Left = 3
      Top = 67
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #35746#20215#26102#38388
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel10: TAALabel
      Left = 777
      Top = 63
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #26377#25928#26102#38388
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object Edit1: TEdit
      Left = 61
      Top = 20
      Width = 110
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
    object Edit3: TEdit
      Left = 631
      Top = 22
      Width = 110
      Height = 19
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      OnKeyPress = Edit3KeyPress
    end
    object Edit4: TEdit
      Left = 453
      Top = 20
      Width = 114
      Height = 19
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      OnKeyPress = Edit4KeyPress
    end
    object Edit6: TEdit
      Left = 633
      Top = 61
      Width = 110
      Height = 19
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 8
      OnKeyPress = Edit6KeyPress
    end
    object FlatComboBox1: TFlatComboBox
      Left = 454
      Top = 60
      Width = 114
      Height = 21
      Style = csDropDownList
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 13
      Items.Strings = (
        '20'
        '40'
        '40HC'
        '20X2'
        '')
      ParentFont = False
      TabOrder = 7
      ItemIndex = -1
      OnKeyPress = FlatComboBox1KeyPress
    end
    object FlatComboBox2: TFlatComboBox
      Left = 249
      Top = 62
      Width = 123
      Height = 21
      Style = csDropDownList
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 6
      ItemIndex = -1
      OnKeyPress = FlatComboBox2KeyPress
    end
    object FlatComboBox3: TFlatComboBox
      Left = 839
      Top = 21
      Width = 112
      Height = 21
      Style = csDropDownList
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 13
      Items.Strings = (
        'CFS-D'
        'CFS-CY'
        'CFS-CFS'
        'D-D'
        'D-CFS')
      ParentFont = False
      TabOrder = 4
      ItemIndex = -1
      OnKeyPress = FlatComboBox3KeyPress
    end
    object DateTimePicker1: TDateTimePicker
      Left = 58
      Top = 63
      Width = 116
      Height = 21
      CalAlignment = dtaLeft
      Date = 37778.7629703704
      Time = 37778.7629703704
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 5
      OnKeyPress = DateTimePicker1KeyPress
    end
    object DateTimePicker2: TDateTimePicker
      Left = 839
      Top = 58
      Width = 116
      Height = 21
      CalAlignment = dtaLeft
      Date = 37778.7630215509
      Time = 37778.7630215509
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 9
    end
    object FlatComboBox4: TFlatComboBox
      Left = 248
      Top = 16
      Width = 124
      Height = 21
      Style = csDropDownList
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 1
      ItemIndex = -1
      OnKeyPress = FlatComboBox4KeyPress
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 141
    Width = 1007
    Height = 378
    Align = alClient
    Color = clInfoBk
    Ctl3D = False
    DataSource = DM.CD_XXSource
    ParentCtl3D = False
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
        FieldName = 'CD_ID'
        Title.Alignment = taCenter
        Title.Caption = #32534#21495
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #21457#36135#20844#21496
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CD_ADDRESS'
        Title.Alignment = taCenter
        Title.Caption = #36215#36816#22320#22336
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CD_BEGIN'
        Title.Alignment = taCenter
        Title.Caption = #30446#30340#22320
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CD_TYTK'
        Title.Alignment = taCenter
        Title.Caption = #25176#36816#26465#27454
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CD_DJSJ'
        Title.Alignment = taCenter
        Title.Caption = #35746#20215#26102#38388
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CD_YWY'
        Title.Alignment = taCenter
        Title.Caption = #19994#21153#21592
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CD_BOX'
        Title.Alignment = taCenter
        Title.Caption = #31665#22411
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CD_PRICE'
        Title.Alignment = taCenter
        Title.Caption = #21333#20215
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CD_YXSJ'
        Title.Alignment = taCenter
        Title.Caption = #26377#25928#26102#38388
        Width = 80
        Visible = True
      end>
  end
  object FlatPanel2: TFlatPanel
    Left = 0
    Top = 0
    Width = 1007
    Height = 41
    ParentColor = True
    Align = alTop
    TabOrder = 2
    object FlatButton2: TFlatButton
      Left = 52
      Top = 2
      Width = 49
      Height = 37
      Caption = #20462#25913
      TabOrder = 0
      OnClick = FlatButton2Click
    end
    object FlatButton1: TFlatButton
      Left = 2
      Top = 2
      Width = 49
      Height = 37
      Caption = #28155#21152
      TabOrder = 1
      OnClick = FlatButton1Click
    end
    object FlatButton3: TFlatButton
      Left = 102
      Top = 2
      Width = 49
      Height = 37
      Caption = #21024#38500
      TabOrder = 2
      OnClick = FlatButton3Click
    end
    object FlatButton4: TFlatButton
      Left = 152
      Top = 2
      Width = 49
      Height = 37
      Caption = #20445#23384
      TabOrder = 3
      OnClick = FlatButton4Click
    end
    object FlatButton5: TFlatButton
      Left = 202
      Top = 2
      Width = 49
      Height = 37
      Caption = #26597#35810
      TabOrder = 4
      OnClick = FlatButton5Click
    end
    object FlatButton6: TFlatButton
      Left = 300
      Top = 2
      Width = 49
      Height = 37
      Caption = #20851#38381
      TabOrder = 5
      OnClick = FlatButton6Click
    end
    object FlatButton7: TFlatButton
      Left = 252
      Top = 2
      Width = 47
      Height = 37
      Caption = #25171#21360
      TabOrder = 6
      OnClick = FlatButton7Click
    end
  end
end
