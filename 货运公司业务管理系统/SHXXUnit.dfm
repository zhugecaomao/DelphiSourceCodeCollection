object SHXXForm: TSHXXForm
  Left = 56
  Top = 215
  Width = 1018
  Height = 599
  Caption = #25910#36135#26041#20449#24687
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
    Width = 1010
    Height = 112
    ParentColor = True
    Align = alTop
    TabOrder = 0
    object AALabel1: TAALabel
      Left = 42
      Top = 31
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
      Left = 216
      Top = 31
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #25910#36135#20844#21496
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel3: TAALabel
      Left = 449
      Top = 32
      Width = 39
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #25910#36135#20154
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel4: TAALabel
      Left = 655
      Top = 32
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
    object AALabel5: TAALabel
      Left = 845
      Top = 31
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
    object AALabel6: TAALabel
      Left = 458
      Top = 82
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
    object AALabel7: TAALabel
      Left = 15
      Top = 80
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
    object AALabel8: TAALabel
      Left = 637
      Top = 83
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
      Top = 28
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
    object Edit2: TEdit
      Left = 276
      Top = 28
      Width = 134
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
      Left = 499
      Top = 28
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
      TabOrder = 2
      OnKeyPress = Edit3KeyPress
    end
    object Edit7: TEdit
      Left = 74
      Top = 79
      Width = 335
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
      OnKeyPress = Edit7KeyPress
    end
    object MaskEdit1: TMaskEdit
      Left = 704
      Top = 27
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
      Left = 878
      Top = 27
      Width = 118
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
      Left = 491
      Top = 79
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
      Left = 706
      Top = 78
      Width = 120
      Height = 21
      EditMask = '999999;1;_'
      MaxLength = 6
      TabOrder = 7
      Text = '      '
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 153
    Width = 1010
    Height = 412
    Align = alClient
    Color = clInfoBk
    Ctl3D = False
    DataSource = DM.SHXXSource
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
        FieldName = 'SH_ID'
        Title.Alignment = taCenter
        Title.Caption = #32534#21495
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SH_GONGSI'
        Title.Alignment = taCenter
        Title.Caption = #25910#36135#20844#21496
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SH_NAME'
        Title.Alignment = taCenter
        Title.Caption = #25910#36135#20154
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SH_PHONE'
        Title.Alignment = taCenter
        Title.Caption = #30005#35805
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SH_CHZH'
        Title.Alignment = taCenter
        Title.Caption = #20256#30495
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SH_CALL'
        Title.Alignment = taCenter
        Title.Caption = #25163#26426
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SH_ADDRESS'
        Title.Alignment = taCenter
        Title.Caption = #32852#31995#22320#22336
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SH_YOUBIAN'
        Title.Alignment = taCenter
        Title.Caption = #37038#25919#32534#30721
        Width = 70
        Visible = True
      end>
  end
  object FlatPanel2: TFlatPanel
    Left = 0
    Top = 0
    Width = 1010
    Height = 41
    ParentColor = True
    Align = alTop
    TabOrder = 2
    object FlatSpeedButton1: TFlatSpeedButton
      Left = 2
      Top = 2
      Width = 49
      Height = 37
      Caption = #28155#21152
      OnClick = FlatSpeedButton1Click
    end
    object FlatButton1: TFlatButton
      Left = 52
      Top = 2
      Width = 49
      Height = 37
      Caption = #20462#25913
      TabOrder = 0
      OnClick = FlatButton1Click
    end
    object FlatButton2: TFlatButton
      Left = 102
      Top = 2
      Width = 49
      Height = 37
      Caption = #21024#38500
      TabOrder = 1
      OnClick = FlatButton2Click
    end
    object FlatButton3: TFlatButton
      Left = 152
      Top = 2
      Width = 49
      Height = 37
      Caption = #20445#23384
      TabOrder = 2
      OnClick = FlatButton3Click
    end
    object FlatButton4: TFlatButton
      Left = 202
      Top = 2
      Width = 49
      Height = 37
      Caption = #26597#35810
      TabOrder = 3
      OnClick = FlatButton4Click
    end
    object FlatButton5: TFlatButton
      Left = 300
      Top = 2
      Width = 49
      Height = 37
      Caption = #20851#38381
      TabOrder = 4
      OnClick = FlatButton5Click
    end
    object FlatButton6: TFlatButton
      Left = 252
      Top = 2
      Width = 47
      Height = 37
      Caption = #25171#21360
      TabOrder = 5
      OnClick = FlatButton6Click
    end
  end
end
