object frmDevReplaceDlg: TfrmDevReplaceDlg
  Left = 255
  Top = 267
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #35774#22791#26367#25442
  ClientHeight = 109
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel11: TPanel
    Left = 0
    Top = 81
    Width = 476
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object bbtnConfirm: TBitBtn
      Left = 138
      Top = 3
      Width = 60
      Height = 22
      Caption = #30830#35748
      TabOrder = 0
      OnClick = bbtnConfirmClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333FF3333333333333344333333
        3333333F88F333333333333422433333333333F8338F33333333334222243333
        33333F833F38F333333334222A224333333338F3F8F38F3333333222A3A22433
        333338FF838F38F333333A2A333A2243333338F83338F38F333333A33333A224
        3333338333338F38F333333333333A2243333333333338F38F333333333333A2
        243333333333338F38F333333333333A2243333333333338F383333333333333
        A2233333333333338F833333333333333A233333333333333883333333333333
        33A3333333333333338333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbtnCancel: TBitBtn
      Left = 200
      Top = 3
      Width = 60
      Height = 22
      Caption = #21462#28040
      TabOrder = 1
      OnClick = bbtnCancelClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333331333333333
        3133338333333333383331113333333331333838333333333833311113333333
        1333383383333333833333111333333133333383833333383333333111333311
        3333333838333388333333331113311333333333838338833333333331111133
        3333333338388833333333333311133333333333338383333333333331111133
        3333333338388833333333331113311333333333838338833333331111333311
        3333338838333388333331111333333113333833833333388333311133333333
        3133388833333333383333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbtnClose: TBitBtn
      Left = 262
      Top = 3
      Width = 75
      Height = 22
      Hint = #20851#38381#24403#21069#31383#21475
      Caption = #20851#38381'(&C)'
      TabOrder = 2
      OnClick = bbtnCloseClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF000FFF
        FFFFFFFF005000FFFFFFFF0055500000FFFF0055555000000FFF055555507880
        00FF055555507770FFFF05555B5077700FF005555B507770B00B05555550770B
        BBBB05555550770BBBBB055555507770B00B0555555077700FF0055555007770
        FFFF055500777770FFFF050077777770FFFF000000000000FFFF}
    end
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 65
    Width = 476
    Height = 16
    Align = alBottom
    Alignment = taCenter
    Caption = #35831#21452#20987#35774#22791#21015#34920#20013#30340#35760#24405#26469#36873#25321#38656#35201#34987#26367#25442#30340#35774#22791#21644#26367#25442#25104#30340#35774#22791
    TabOrder = 4
  end
  object rdgSelected: TRadioGroup
    Left = 0
    Top = 0
    Width = 476
    Height = 59
    Align = alTop
    ItemIndex = 0
    Items.Strings = (
      #35774#22791#27010#36848'('#34987#26367#25442')'#65306
      #35774#22791#27010#36848'('#26367#25442#20026')'#65306)
    TabOrder = 1
  end
  object eSrc: TDBEditEh
    Left = 134
    Top = 13
    Width = 336
    Height = 18
    Ctl3D = False
    DataField = 'desc'
    DataSource = memSrcd
    EditButtons = <>
    ParentCtl3D = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
    Visible = True
  end
  object eDest: TDBEditEh
    Left = 134
    Top = 35
    Width = 336
    Height = 18
    Ctl3D = False
    DataField = 'desc'
    DataSource = memDestd
    EditButtons = <>
    ParentCtl3D = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
    Visible = True
  end
  object memSrc: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    AfterPost = memSrcAfterPost
    OnCalcFields = memCalcFields
    Left = 2
    Top = 84
    object memSrcid: TStringField
      FieldName = 'id'
    end
    object memSrcname: TStringField
      FieldName = 'reg_id'
      Size = 23
    end
    object memSrccustom_id: TStringField
      FieldName = 'custom_id'
    end
    object memSrcdev_code_id: TStringField
      FieldName = 'dev_code_id'
      Size = 6
    end
    object memSrcdev_code_name: TStringField
      FieldName = 'dev_code_name'
      Size = 30
    end
    object memSrcuser_name: TStringField
      FieldName = 'user_name'
      Size = 60
    end
    object memSrcdev_type: TStringField
      FieldName = 'dev_type'
      Size = 30
    end
    object memSrcmanu_no: TStringField
      FieldName = 'manu_no'
      Size = 30
    end
    object memSrcdesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc'
      Size = 63
      Calculated = True
    end
  end
  object memDest: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    AfterPost = memDestAfterPost
    OnCalcFields = memCalcFields
    Left = 58
    Top = 84
    object StringField1: TStringField
      FieldName = 'id'
    end
    object StringField2: TStringField
      FieldName = 'reg_id'
      Size = 23
    end
    object memDestcustom_id: TStringField
      FieldName = 'custom_id'
    end
    object memDestdev_code_id: TStringField
      FieldName = 'dev_code_id'
      Size = 6
    end
    object memDestdev_code_name: TStringField
      FieldName = 'dev_code_name'
      Size = 30
    end
    object memDestuser_name: TStringField
      FieldName = 'user_name'
      Size = 60
    end
    object memDestdev_type: TStringField
      FieldName = 'dev_type'
      Size = 30
    end
    object memDestmanu_no: TStringField
      FieldName = 'manu_no'
      Size = 30
    end
    object memDestdesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc'
      Size = 63
      Calculated = True
    end
  end
  object memSrcd: TDataSource
    DataSet = memSrc
    Left = 30
    Top = 84
  end
  object memDestd: TDataSource
    DataSet = memDest
    Left = 86
    Top = 84
  end
end
