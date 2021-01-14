object MonthForm: TMonthForm
  Left = 34
  Top = 196
  Width = 1015
  Height = 576
  Caption = #26376#25253#31383#20307
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
    Top = 0
    Width = 1007
    Height = 41
    ParentColor = True
    Align = alTop
    TabOrder = 0
    object FlatButton1: TFlatButton
      Left = 3
      Top = 2
      Width = 40
      Height = 37
      Caption = #31532#19968#26465
      TabOrder = 0
      OnClick = FlatButton1Click
    end
    object FlatButton2: TFlatButton
      Left = 44
      Top = 2
      Width = 40
      Height = 37
      Caption = #19978#19968#26465
      TabOrder = 1
      OnClick = FlatButton2Click
    end
    object FlatButton3: TFlatButton
      Left = 85
      Top = 2
      Width = 40
      Height = 37
      Caption = #19979#19968#26465
      TabOrder = 2
      OnClick = FlatButton3Click
    end
    object FlatButton4: TFlatButton
      Left = 126
      Top = 2
      Width = 51
      Height = 37
      Caption = #26368#21518#19968#26465
      TabOrder = 3
      OnClick = FlatButton4Click
    end
    object FlatButton5: TFlatButton
      Left = 178
      Top = 2
      Width = 40
      Height = 37
      Caption = #26597#35810
      TabOrder = 4
      OnClick = FlatButton5Click
    end
    object FlatButton6: TFlatButton
      Left = 219
      Top = 2
      Width = 40
      Height = 37
      Caption = #25171#21360
      TabOrder = 5
      OnClick = FlatButton6Click
    end
    object FlatButton7: TFlatButton
      Left = 260
      Top = 2
      Width = 43
      Height = 37
      Caption = #20851#38381
      TabOrder = 6
      OnClick = FlatButton7Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 1007
    Height = 508
    Align = alClient
    Color = clInfoBk
    Ctl3D = False
    DataSource = DM.MonthSource
    ParentCtl3D = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_ID'
        Title.Alignment = taCenter
        Title.Caption = #25552#21333#21495
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_NAME'
        Title.Alignment = taCenter
        Title.Caption = #21457#36135#20844#21496
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_CALL'
        Title.Alignment = taCenter
        Title.Caption = #32852#31995#20154
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_CHAN'
        Title.Alignment = taCenter
        Title.Caption = #33337#21517'/'#33337#27425
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_YEAR'
        Title.Alignment = taCenter
        Title.Caption = #24180
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_YUE'
        Title.Alignment = taCenter
        Title.Caption = #26376
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_HUO'
        Title.Alignment = taCenter
        Title.Caption = #36135#21517
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_YWY'
        Title.Alignment = taCenter
        Title.Caption = #19994#21153#21592
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_TYADD'
        Title.Alignment = taCenter
        Title.Caption = #25176#36816#22320#22336
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_MUDI'
        Title.Alignment = taCenter
        Title.Caption = #30446#30340#22320
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_BOX'
        Title.Alignment = taCenter
        Title.Caption = #31665#22411
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_NUM'
        Title.Alignment = taCenter
        Title.Caption = #31665#37327
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_TYSJ'
        Title.Alignment = taCenter
        Title.Caption = #25176#36816#26102#38388
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_DCTK'
        Title.Alignment = taCenter
        Title.Caption = #35746#33329#26465#27454
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_JSZT'
        Title.Alignment = taCenter
        Title.Caption = #32467#31639#29366#24577
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_TIT'
        Title.Alignment = taCenter
        Title.Caption = #23458#25143#24635#36153#29992
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KHFY_LIRONG'
        Title.Alignment = taCenter
        Title.Caption = #21033#28070
        Width = 65
        Visible = True
      end>
  end
end
