inherited KrcxForm: TKrcxForm
  Left = 57
  Top = 47
  Width = 720
  Height = 500
  ActiveControl = edtValue
  Caption = #26597#35810
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 712
    Height = 79
    inherited lblTitle: TLabel
      Left = 294
      Top = 6
      Caption = #23458#20154#26597#35810
    end
    inherited Image1: TImage
      Left = 231
    end
    inherited DBNavPlus2: TDBNavPlus [2]
      Top = 34
      Hints.Strings = ()
      Visible = False
    end
    inherited DBNavPlus1: TDBNavPlus [3]
      Top = 34
      Hints.Strings = ()
      Visible = False
    end
    inherited cmbOption: TComboBox [4]
      ItemIndex = 0
      Text = #23458#20154#22995#21517
      Items.Strings = (
        #23458#20154#22995#21517
        #25151#38388#21495
        #21333#20301#25110#22320#22336)
    end
    inherited cmbExpress: TComboBox [5]
    end
    inherited edtValue: TEdit [6]
    end
    inherited btnLoca: TBitBtn [7]
      OnClick = btnLocaClick
    end
    inherited lblState: TStaticText
      Left = 638
      Visible = False
    end
  end
  inherited Panel2: TPanel
    Top = 79
    Width = 712
    Height = 359
    inherited Bevel1: TBevel
      Width = 692
      Height = 339
    end
    object DBGrid1: TDBGrid
      Left = 10
      Top = 10
      Width = 692
      Height = 339
      Align = alClient
      Color = clMoneyGreen
      DataSource = dsWork
      FixedColor = clSkyBlue
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KFBH'
          Title.Alignment = taCenter
          Title.Caption = #25151#21495
          Width = 35
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KRXM'
          Title.Alignment = taCenter
          Title.Caption = #22995#21517
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XB'
          Title.Alignment = taCenter
          Title.Caption = #24615#21035
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JG'
          Title.Alignment = taCenter
          Title.Caption = #31821#36143
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_ZJMC'
          Title.Alignment = taCenter
          Title.Caption = #35777#20214
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_ZJHM'
          Title.Alignment = taCenter
          Title.Caption = #35777#20214#21495#30721
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JTDZ'
          Title.Alignment = taCenter
          Title.Caption = #23478#24237#22320#22336
          Width = 220
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_DDRQ'
          Title.Alignment = taCenter
          Title.Caption = #26085#26399
          Width = 70
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_DDSJ'
          Title.Alignment = taCenter
          Title.Caption = #26102#38388
          Width = 40
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 438
    Width = 712
    inherited btnHelp: TBitBtn
      Left = 551
    end
    inherited btnClose: TBitBtn
      Left = 629
    end
    inherited btnPrint: TBitBtn
      Left = 472
      OnClick = btnPrintClick
    end
    object btnXq: TBitBtn
      Left = 8
      Top = 5
      Width = 100
      Height = 25
      Caption = #35814#32454#24773#20917
      TabOrder = 3
      OnClick = DBGrid1DblClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888844488888444888884F4800084F4800084488888844888888888888888888
        8888888888888888888844488888444888884F4800084F480008448888884488
        88888888888888888888888888888888888844488888444888884F4800084F48
        0008448888884488888888888888888888888888888888888888}
    end
  end
  inherited qryWork: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KFZT where (D_KFZT="F") order by D_LCBH,D_KFBH')
    object qryWorkD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Origin = 'LFHOTELUSER.KFZT.D_KFBH'
      Size = 5
    end
    object qryWorkD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Origin = 'LFHOTELUSER.KFZT.D_ZDBH'
      Size = 12
    end
    object qryWorkD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER.KFZT.D_KRBH'
      Size = 12
    end
    object qryWorkD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Origin = 'LFHOTELUSER.KFZT.D_YJBH'
      Size = 12
    end
    object qryWorkD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
      Origin = 'LFHOTELUSER.KFZT.D_SJFJ'
    end
    object qryWorkD_KFZT: TStringField
      FieldName = 'D_KFZT'
      Origin = 'LFHOTELUSER.KFZT.D_KFZT'
      FixedChar = True
      Size = 1
    end
    object qryWorkD_KFBZ: TStringField
      FieldName = 'D_KFBZ'
      Origin = 'LFHOTELUSER.KFZT.D_KFBZ'
      FixedChar = True
      Size = 1
    end
    object qryWorkD_KRSL: TIntegerField
      FieldName = 'D_KRSL'
      Origin = 'LFHOTELUSER.KFZT.D_KRSL'
    end
    object qryWorkD_DHKT: TStringField
      FieldName = 'D_DHKT'
      Origin = 'LFHOTELUSER.KFZT.D_DHKT'
      FixedChar = True
      Size = 1
    end
    object qryWorkD_BZFJ: TFloatField
      FieldName = 'D_BZFJ'
      Origin = 'LFHOTELUSER.KFZT.D_BZFJ'
    end
    object qryWorkD_CWS: TIntegerField
      FieldName = 'D_CWS'
      Origin = 'LFHOTELUSER.KFZT.D_CWS'
    end
    object qryWorkD_BJS: TIntegerField
      FieldName = 'D_BJS'
      Origin = 'LFHOTELUSER.KFZT.D_BJS'
    end
    object qryWorkD_QJS: TIntegerField
      FieldName = 'D_QJS'
      Origin = 'LFHOTELUSER.KFZT.D_QJS'
    end
    object qryWorkD_JJFJ: TFloatField
      FieldName = 'D_JJFJ'
      Origin = 'LFHOTELUSER.KFZT.D_JJFJ'
    end
    object qryWorkD_FXBH: TStringField
      FieldName = 'D_FXBH'
      Origin = 'LFHOTELUSER.KFZT.D_FXBH'
      Size = 5
    end
    object qryWorkD_LCBH: TStringField
      FieldName = 'D_LCBH'
      Origin = 'LFHOTELUSER.KFZT.D_LCBH'
      Size = 5
    end
    object qryWorkD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Origin = 'LFHOTELUSER.KFZT.D_KRXM'
      Size = 30
    end
    object qryWorkD_DDRQ: TDateField
      FieldKind = fkLookup
      FieldName = 'D_DDRQ'
      LookupDataSet = tblKrxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_DDRQ'
      KeyFields = 'D_KRBH'
      DisplayFormat = 'yyyymmdd'
      Lookup = True
    end
    object qryWorkD_DDSJ: TTimeField
      FieldKind = fkLookup
      FieldName = 'D_DDSJ'
      LookupDataSet = tblKrxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_DDSJ'
      KeyFields = 'D_KRBH'
      DisplayFormat = 'hh:nn'
      Lookup = True
    end
    object qryWorkD_XB: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XB'
      LookupDataSet = tblKrxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_XB'
      KeyFields = 'D_KRBH'
      Lookup = True
    end
    object qryWorkD_JG: TStringField
      FieldKind = fkLookup
      FieldName = 'D_JG'
      LookupDataSet = tblKrxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_DQBH'
      KeyFields = 'D_KRBH'
      OnGetText = qryWorkD_JGGetText
      Lookup = True
    end
    object qryWorkD_MZMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_MZMC'
      LookupDataSet = tblKrxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_MZBH'
      KeyFields = 'D_KRBH'
      OnGetText = qryWorkD_MZMCGetText
      Lookup = True
    end
    object qryWorkD_GZDW: TStringField
      FieldKind = fkLookup
      FieldName = 'D_GZDW'
      LookupDataSet = tblKrxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_DWMC'
      KeyFields = 'D_KRBH'
      Lookup = True
    end
    object qryWorkD_JTDZ: TStringField
      FieldKind = fkLookup
      FieldName = 'D_JTDZ'
      LookupDataSet = tblKrxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_JTDZ'
      KeyFields = 'D_KRBH'
      Size = 30
      Lookup = True
    end
    object qryWorkD_ZJMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_ZJMC'
      LookupDataSet = tblKrxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_ZJBH'
      KeyFields = 'D_KRBH'
      OnGetText = qryWorkD_ZJMCGetText
      Lookup = True
    end
    object qryWorkD_ZJHM: TStringField
      FieldKind = fkLookup
      FieldName = 'D_ZJHM'
      LookupDataSet = tblKrxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_ZJHM'
      KeyFields = 'D_KRBH'
      Lookup = True
    end
  end
  object tblKrxx: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'KRXX'
    Left = 344
    Top = 8
  end
end
