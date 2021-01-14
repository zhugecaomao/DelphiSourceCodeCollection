object frmSLD: TfrmSLD
  Left = 148
  Top = 148
  BorderStyle = bsDialog
  Caption = #25910#26009#21333
  ClientHeight = 510
  ClientWidth = 815
  Color = 4013343
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #20223#23435'_GB2312'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object btnCancel: TSpeedButton
    Left = 704
    Top = 465
    Width = 89
    Height = 33
    Caption = #36864' '#20986
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnCancelClick
  end
  object btnAppend: TSpeedButton
    Left = 32
    Top = 465
    Width = 89
    Height = 33
    Caption = #28155' '#21152
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnAppendClick
  end
  object btnDelete: TSpeedButton
    Left = 128
    Top = 465
    Width = 89
    Height = 33
    Caption = #21024' '#38500
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnDeleteClick
  end
  object btnEdit: TSpeedButton
    Left = 224
    Top = 465
    Width = 89
    Height = 33
    Caption = #32534' '#36753
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnEditClick
  end
  object btnUndo: TSpeedButton
    Left = 320
    Top = 465
    Width = 89
    Height = 33
    Caption = #24674' '#22797
    Enabled = False
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnUndoClick
  end
  object btnSave: TSpeedButton
    Left = 416
    Top = 465
    Width = 89
    Height = 33
    Caption = #20445' '#23384
    Enabled = False
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnSaveClick
  end
  object btnSH: TSpeedButton
    Left = 512
    Top = 465
    Width = 89
    Height = 33
    Caption = #23457' '#26680
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnSHClick
  end
  object btnRefresh: TSpeedButton
    Left = 608
    Top = 465
    Width = 89
    Height = 33
    Caption = #21047' '#26032
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnRefreshClick
  end
  object Label16: TLabel
    Left = 22
    Top = 11
    Width = 114
    Height = 24
    Caption = #25910#26009#21333'...'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 993
    Height = 417
    BevelInner = bvLowered
    TabOrder = 0
    object pnl_Main: TPanel
      Left = 2
      Top = 2
      Width = 989
      Height = 137
      Align = alTop
      BevelInner = bvLowered
      Enabled = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 77
        Height = 15
        Caption = #20179#24211#21517#31216':'
      end
      object Label2: TLabel
        Left = 600
        Top = 16
        Width = 77
        Height = 15
        Caption = #25910#26009#23383#21495':'
        FocusControl = edtSlzh
      end
      object Label3: TLabel
        Left = 325
        Top = 16
        Width = 68
        Height = 15
        Caption = #21046#21333#26085#26399
        FocusControl = edtZdrq
      end
      object Label4: TLabel
        Left = 8
        Top = 48
        Width = 77
        Height = 15
        Caption = #20379#24212#21378#23478':'
        FocusControl = edtGycj
      end
      object Label5: TLabel
        Left = 321
        Top = 48
        Width = 77
        Height = 15
        Caption = #29289#36164#26469#28304':'
        FocusControl = edtWzly
      end
      object Label6: TLabel
        Left = 616
        Top = 48
        Width = 60
        Height = 15
        Caption = #37319#36141#20154':'
        FocusControl = edtCgr
      end
      object Label7: TLabel
        Left = 8
        Top = 81
        Width = 77
        Height = 15
        Caption = #21512#21516#32534#21495':'
        FocusControl = edtHtbh
      end
      object Label10: TLabel
        Left = 251
        Top = 84
        Width = 60
        Height = 15
        Caption = #21457#31080#21495':'
        FocusControl = edtFph
      end
      object Label14: TLabel
        Left = 455
        Top = 81
        Width = 60
        Height = 15
        Caption = #23457#26680#20154':'
        FocusControl = edtShr
      end
      object Label15: TLabel
        Left = 8
        Top = 113
        Width = 77
        Height = 15
        Caption = #21333#25454#22791#27880':'
        FocusControl = edtDjbz
      end
      object Label39: TLabel
        Left = 675
        Top = 81
        Width = 68
        Height = 15
        Caption = #26159#21542#23457#26680
        FocusControl = edtShr
      end
      object Label8: TLabel
        Left = 296
        Top = 116
        Width = 112
        Height = 15
        Caption = #21457#31080#37329#39069'('#20803'):'
        FocusControl = edtFpje
      end
      object Label9: TLabel
        Left = 550
        Top = 116
        Width = 129
        Height = 15
        Caption = #20854#20013#36816#26434#36153'('#20803'):'
        FocusControl = edtQzyzf
      end
      object edtSlzh: TDBEdit
        Left = 680
        Top = 11
        Width = 89
        Height = 23
        DataField = 'InNo'
        DataSource = dsSLD
        TabOrder = 0
      end
      object edtZdrq: TDBEdit
        Left = 408
        Top = 13
        Width = 131
        Height = 23
        DataField = 'DrawDate'
        DataSource = dsSLD
        TabOrder = 1
      end
      object edtGycj: TDBEdit
        Left = 96
        Top = 44
        Width = 185
        Height = 23
        DataField = 'SupName'
        DataSource = dsSLD
        TabOrder = 2
      end
      object edtWzly: TDBEdit
        Left = 407
        Top = 44
        Width = 134
        Height = 23
        DataField = 'WSource'
        DataSource = dsSLD
        TabOrder = 3
      end
      object edtCgr: TDBEdit
        Left = 680
        Top = 44
        Width = 89
        Height = 23
        DataField = 'StockPerson'
        DataSource = dsSLD
        TabOrder = 4
      end
      object edtHtbh: TDBEdit
        Left = 96
        Top = 80
        Width = 121
        Height = 23
        DataField = 'BargainNo'
        DataSource = dsSLD
        TabOrder = 5
      end
      object edtFph: TDBEdit
        Left = 320
        Top = 80
        Width = 85
        Height = 23
        DataField = 'InvoiceID'
        DataSource = dsSLD
        TabOrder = 6
      end
      object edtShr: TDBEdit
        Left = 520
        Top = 79
        Width = 110
        Height = 23
        DataField = 'AuditingPerson'
        DataSource = dsSLD
        Enabled = False
        TabOrder = 7
      end
      object edtDjbz: TDBEdit
        Left = 96
        Top = 111
        Width = 193
        Height = 23
        DataField = 'Memo'
        DataSource = dsSLD
        TabOrder = 8
      end
      object cbSfsh: TDBCheckBox
        Left = 758
        Top = 78
        Width = 14
        Height = 17
        DataField = 'IsAuditing'
        DataSource = dsSLD
        Enabled = False
        TabOrder = 9
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object cmbCkmc: TDBComboBox
        Left = 96
        Top = 11
        Width = 185
        Height = 23
        DataField = 'WName'
        DataSource = dsSLD
        ItemHeight = 15
        TabOrder = 10
      end
      object btn_cgr: TBitBtn
        Left = 753
        Top = 46
        Width = 18
        Height = 16
        Caption = #8230
        TabOrder = 11
        Visible = False
        OnClick = btn_cgrClick
      end
      object edtFpje: TDBEdit
        Left = 416
        Top = 112
        Width = 133
        Height = 23
        DataField = 'InvoiceNum'
        DataSource = dsSLD
        TabOrder = 12
      end
      object edtQzyzf: TDBEdit
        Left = 686
        Top = 112
        Width = 91
        Height = 23
        DataField = 'TraPay'
        DataSource = dsSLD
        TabOrder = 13
      end
    end
    object DBGrid: TDBGrid
      Left = 2
      Top = 139
      Width = 989
      Height = 232
      Align = alTop
      DataSource = dsSLD_DETAIL
      PopupMenu = pm_Detail
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = #20223#23435'_GB2312'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'MatCode'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #26448#26009#32534#21495
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MatName'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #26448#26009#21517#31216
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'StoPosition'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #23384#25918#20301#32622
          Title.Color = clGray
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BillNum'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #20973#35777#25968#37327
          Title.Color = clGray
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'InNum'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #23454#25910#25968#37327
          Title.Color = clGray
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'InPrice'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #20837#24211#21333#20215'('#20803')'
          Title.Color = clGray
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'InNum'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #20837#24211#24635#20215'('#20803')'
          Title.Color = clGray
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Size'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #35268#26684#22411#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUnit'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #35745#37327#21333#20301
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PlanPrice'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #35745#21010#21333#20215
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PriceUnit'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #21333#20215#21333#20301
          Visible = True
        end>
    end
    object pnl_Main1: TPanel
      Left = 272
      Top = 379
      Width = 529
      Height = 34
      BevelInner = bvLowered
      Enabled = False
      TabOrder = 2
      object Label11: TLabel
        Left = 17
        Top = 9
        Width = 34
        Height = 15
        Caption = #20027#31649
        FocusControl = edtZg
      end
      object Label12: TLabel
        Left = 193
        Top = 9
        Width = 51
        Height = 15
        Caption = #21046#21333#20154
        FocusControl = edtZdr
      end
      object Label13: TLabel
        Left = 364
        Top = 9
        Width = 51
        Height = 15
        Caption = #39564#25910#20154
        FocusControl = edtYsr
      end
      object edtZg: TDBEdit
        Left = 65
        Top = 5
        Width = 104
        Height = 23
        DataField = 'Admin'
        DataSource = dsSLD
        TabOrder = 0
      end
      object edtZdr: TDBEdit
        Left = 248
        Top = 5
        Width = 97
        Height = 23
        DataField = 'DrawPeron'
        DataSource = dsSLD
        TabOrder = 1
      end
      object edtYsr: TDBEdit
        Left = 419
        Top = 5
        Width = 94
        Height = 23
        DataField = 'CheckPerson'
        DataSource = dsSLD
        TabOrder = 2
      end
      object btn_zg: TBitBtn
        Left = 151
        Top = 7
        Width = 18
        Height = 16
        Caption = #8230
        TabOrder = 3
        Visible = False
      end
      object btn_zdr: TBitBtn
        Left = 327
        Top = 7
        Width = 18
        Height = 16
        Caption = #8230
        TabOrder = 4
        Visible = False
      end
      object btn_ysr: TBitBtn
        Left = 497
        Top = 7
        Width = 18
        Height = 16
        Caption = #8230
        TabOrder = 5
        Visible = False
      end
    end
    object DBNavigator: TDBNavigator
      Left = 16
      Top = 383
      Width = 244
      Height = 22
      DataSource = dsSLD
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        #39318#24352#21333#25454
        #21069#19968#24352#21333#25454
        #19979#19968#24352#21333#25454
        #26411#21333#25454)
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = DBNavigatorClick
    end
  end
  object dsSLD: TDataSource
    DataSet = aqSLDMAIN
    Left = 336
    Top = 8
  end
  object dsSLD_DETAIL: TDataSource
    DataSet = aqSLDDetail
    Left = 360
    Top = 184
  end
  object aqSLDMAIN: TADOQuery
    Connection = dmWarehouse.ACWarehouse
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from SLD_MAIN')
    Left = 424
    Top = 8
  end
  object aqSLDDetail: TADOQuery
    Connection = dmWarehouse.ACWarehouse
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from SLD_DETAIL')
    Left = 416
    Top = 184
  end
  object pm_Detail: TPopupMenu
    Left = 290
    Top = 186
    object pmi_Insert: TMenuItem
      Caption = #28155#21152#29289#36164
      ImageIndex = 0
      OnClick = pmi_InsertClick
    end
    object pmi_Delete: TMenuItem
      Caption = #21024#38500#29289#36164
      ImageIndex = 1
      OnClick = pmi_DeleteClick
    end
  end
end
