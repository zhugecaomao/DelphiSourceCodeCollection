object FHXXForm: TFHXXForm
  Left = 39
  Top = 132
  Width = 1005
  Height = 633
  Caption = #21457#36135#26041#20449#24687
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 138
    Width = 997
    Height = 468
    Align = alClient
    Color = clInfoBk
    Ctl3D = False
    DataSource = DM.FhxxSource
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 0
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
        FieldName = 'FH_ID'
        Title.Alignment = taCenter
        Title.Caption = #32534#21495
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FH_GONGSI'
        Title.Alignment = taCenter
        Title.Caption = #21457#36135#20844#21496
        Width = 180
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FH_NAME'
        Title.Alignment = taCenter
        Title.Caption = #32852#31995#20154
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FH_ADDRESS'
        Title.Alignment = taCenter
        Title.Caption = #32852#31995#22320#22336
        Width = 180
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FH_PHONE'
        Title.Alignment = taCenter
        Title.Caption = #30005#35805
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FH_CHZH'
        Title.Alignment = taCenter
        Title.Caption = #20256#30495
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FH_CALL'
        Title.Alignment = taCenter
        Title.Caption = #25163#26426
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FH_YOUBIAN'
        Title.Alignment = taCenter
        Title.Caption = #37038#25919#32534#30721
        Width = 80
        Visible = True
      end>
  end
  object FlatPanel1: TFlatPanel
    Left = 0
    Top = 41
    Width = 997
    Height = 97
    ParentColor = True
    Align = alTop
    TabOrder = 1
    object AALabel1: TAALabel
      Left = 40
      Top = 19
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
      Top = 20
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
      Left = 409
      Top = 20
      Width = 39
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #32852#31995#20154
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel4: TAALabel
      Left = 16
      Top = 72
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #32852#31995#22320#22336
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel5: TAALabel
      Left = 573
      Top = 20
      Width = 26
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #30005#35805
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel6: TAALabel
      Left = 739
      Top = 20
      Width = 26
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #20256#30495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel7: TAALabel
      Left = 523
      Top = 69
      Width = 26
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #25163#26426
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel8: TAALabel
      Left = 740
      Top = 69
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #37038#25919#32534#30721
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object Edit1: TEdit
      Left = 74
      Top = 16
      Width = 100
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
      Left = 271
      Top = 17
      Width = 100
      Height = 19
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnKeyPress = Edit2KeyPress
    end
    object Edit3: TEdit
      Left = 459
      Top = 17
      Width = 100
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
      OnKeyPress = Edit3KeyPress
    end
    object Edit6: TEdit
      Left = 72
      Top = 67
      Width = 385
      Height = 19
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
      OnKeyPress = Edit6KeyPress
    end
    object MaskEdit1: TMaskEdit
      Left = 608
      Top = 16
      Width = 127
      Height = 19
      Ctl3D = False
      EditMask = '9999-99999999-9999;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 18
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      Text = '    -        -    '
      OnKeyPress = MaskEdit1KeyPress
    end
    object MaskEdit2: TMaskEdit
      Left = 776
      Top = 16
      Width = 105
      Height = 19
      Ctl3D = False
      EditMask = '9999-99999999;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 13
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      Text = '    -        '
      OnKeyPress = MaskEdit2KeyPress
    end
    object MaskEdit3: TMaskEdit
      Left = 560
      Top = 66
      Width = 120
      Height = 19
      Ctl3D = False
      EditMask = '99999999999;1;_'
      MaxLength = 11
      ParentCtl3D = False
      TabOrder = 6
      Text = '           '
      OnKeyPress = MaskEdit3KeyPress
    end
    object MaskEdit4: TMaskEdit
      Left = 800
      Top = 65
      Width = 120
      Height = 19
      Ctl3D = False
      EditMask = '999999;1;_'
      MaxLength = 6
      ParentCtl3D = False
      TabOrder = 7
      Text = '      '
    end
  end
  object FlatPanel2: TFlatPanel
    Left = 0
    Top = 0
    Width = 997
    Height = 41
    ParentColor = True
    Align = alTop
    TabOrder = 2
    object FlatButton1: TFlatButton
      Left = 2
      Top = 2
      Width = 45
      Height = 37
      Caption = #28155#21152
      TabOrder = 0
      OnClick = FlatButton1Click
    end
    object FlatButton2: TFlatButton
      Left = 48
      Top = 2
      Width = 45
      Height = 37
      Caption = #20462#25913
      TabOrder = 1
      OnClick = FlatButton2Click
    end
    object FlatButton3: TFlatButton
      Left = 94
      Top = 2
      Width = 45
      Height = 37
      Caption = #21024#38500
      TabOrder = 2
      OnClick = FlatButton3Click
    end
    object FlatButton4: TFlatButton
      Left = 140
      Top = 2
      Width = 45
      Height = 37
      Caption = #20445#23384
      TabOrder = 3
      OnClick = FlatButton4Click
    end
    object FlatButton5: TFlatButton
      Left = 186
      Top = 2
      Width = 49
      Height = 37
      Caption = #26597#35810
      TabOrder = 4
      OnClick = FlatButton5Click
    end
    object FlatButton6: TFlatButton
      Left = 287
      Top = 2
      Width = 49
      Height = 37
      Caption = #20851#38381
      TabOrder = 5
      OnClick = FlatButton6Click
    end
    object FlatButton7: TFlatButton
      Left = 236
      Top = 2
      Width = 50
      Height = 37
      Caption = #25171#21360
      TabOrder = 6
      OnClick = FlatButton7Click
    end
  end
end
