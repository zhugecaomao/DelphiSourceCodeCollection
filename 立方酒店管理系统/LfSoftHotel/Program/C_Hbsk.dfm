inherited HbskForm: THbskForm
  Caption = #26597#35810
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 72
    inherited lblTitle: TLabel
      Width = 156
      Caption = #33322#29677#26102#21051#34920
    end
    inherited cmbOption: TComboBox
      Top = 45
      ItemIndex = -1
      Text = ''
      Items.Strings = (
        #33322#29677#29677#27425
        #21306#38388#31449)
    end
    inherited cmbExpress: TComboBox
      Top = 45
    end
    inherited edtValue: TEdit
      Top = 45
    end
    inherited btnLoca: TBitBtn
      Top = 42
      OnClick = btnLocaClick
    end
  end
  inherited Panel2: TPanel
    Top = 72
    Height = 366
    inherited dbgMaster: TDBGrid
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      Columns = <
        item
          Expanded = False
          FieldName = 'D_HBBC'
          Title.Alignment = taCenter
          Title.Caption = #33322#29677#29677#27425
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_KJLX'
          Title.Alignment = taCenter
          Title.Caption = #23458#26426#31867#22411
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_SFZ'
          Title.Alignment = taCenter
          Title.Caption = #22987#21457#31449
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_ZDZ'
          Title.Alignment = taCenter
          Title.Caption = #32456#28857#31449
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_SFSJ'
          Title.Alignment = taCenter
          Title.Caption = #22987#21457#26102#38388
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_ZDSJ'
          Title.Alignment = taCenter
          Title.Caption = #32456#28857#26102#38388
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_BZ'
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Visible = True
        end>
    end
    inherited dbgDetail: TDBGrid
      Height = 184
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'D_HBBC'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #33322#29677#29677#27425
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_ZJZ'
          Title.Alignment = taCenter
          Title.Caption = #21306#38388#31449
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_DZSJ'
          Title.Alignment = taCenter
          Title.Caption = #21040#31449#26102#38388
          Width = 150
          Visible = True
        end>
    end
  end
  inherited qryMaster: TQuery
    OnNewRecord = qryMasterNewRecord
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from HBSK where D_HH=0')
    object qryMasterD_HBBC: TStringField
      FieldName = 'D_HBBC'
      Origin = 'LFHOTELUSER.HBSK.D_HBBC'
      Size = 10
    end
    object qryMasterD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER.HBSK.D_HH'
    end
    object qryMasterD_KJLX: TStringField
      FieldName = 'D_KJLX'
      Origin = 'LFHOTELUSER.HBSK.D_KJLX'
    end
    object qryMasterD_SFZ: TStringField
      FieldName = 'D_SFZ'
      Origin = 'LFHOTELUSER.HBSK.D_SFZ'
      Size = 10
    end
    object qryMasterD_ZDZ: TStringField
      FieldName = 'D_ZDZ'
      Origin = 'LFHOTELUSER.HBSK.D_ZDZ'
      Size = 10
    end
    object qryMasterD_SFSJ: TDateTimeField
      FieldName = 'D_SFSJ'
      Origin = 'LFHOTELUSER.HBSK.D_SFSJ'
    end
    object qryMasterD_ZDSJ: TDateTimeField
      FieldName = 'D_ZDSJ'
      Origin = 'LFHOTELUSER.HBSK.D_ZDSJ'
    end
    object qryMasterD_ZJZ: TStringField
      FieldName = 'D_ZJZ'
      Origin = 'LFHOTELUSER.HBSK.D_ZJZ'
      Size = 10
    end
    object qryMasterD_DZSJ: TDateTimeField
      FieldName = 'D_DZSJ'
      Origin = 'LFHOTELUSER.HBSK.D_DZSJ'
    end
  end
  inherited qryDetail: TQuery
    OnNewRecord = qryDetailNewRecord
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from HBSK where (D_HH<>0)and(D_HBBC=:D_HBBC)')
    ParamData = <
      item
        DataType = ftString
        Name = 'D_HBBC'
        ParamType = ptUnknown
        Size = 11
      end>
    object qryDetailD_HBBC: TStringField
      FieldName = 'D_HBBC'
      Origin = 'LFHOTELUSER.HBSK.D_HBBC'
      Size = 10
    end
    object qryDetailD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER.HBSK.D_HH'
    end
    object qryDetailD_KJLX: TStringField
      FieldName = 'D_KJLX'
      Origin = 'LFHOTELUSER.HBSK.D_KJLX'
    end
    object qryDetailD_SFZ: TStringField
      FieldName = 'D_SFZ'
      Origin = 'LFHOTELUSER.HBSK.D_SFZ'
      Size = 10
    end
    object qryDetailD_ZDZ: TStringField
      FieldName = 'D_ZDZ'
      Origin = 'LFHOTELUSER.HBSK.D_ZDZ'
      Size = 10
    end
    object qryDetailD_SFSJ: TDateTimeField
      FieldName = 'D_SFSJ'
      Origin = 'LFHOTELUSER.HBSK.D_SFSJ'
    end
    object qryDetailD_ZDSJ: TDateTimeField
      FieldName = 'D_ZDSJ'
      Origin = 'LFHOTELUSER.HBSK.D_ZDSJ'
    end
    object qryDetailD_ZJZ: TStringField
      FieldName = 'D_ZJZ'
      Origin = 'LFHOTELUSER.HBSK.D_ZJZ'
      Size = 10
    end
    object qryDetailD_DZSJ: TDateTimeField
      FieldName = 'D_DZSJ'
      Origin = 'LFHOTELUSER.HBSK.D_DZSJ'
    end
  end
end
