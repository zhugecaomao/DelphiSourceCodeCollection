inherited FjbgForm: TFjbgForm
  Left = 170
  Top = 47
  Height = 500
  ActiveControl = edtValue
  Caption = #25509#24453
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    inherited lblTitle: TLabel
      Caption = #25151#20215#21464#26356
    end
    inherited cmbOption: TComboBox
      ItemIndex = 0
      Text = #25151#38388#21495
      Items.Strings = (
        #25151#38388#21495)
    end
    inherited btnLoca: TBitBtn
      OnClick = btnLocaClick
    end
  end
  inherited Panel2: TPanel
    Height = 364
    inherited DBGrid1: TDBGrid
      Height = 354
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KFBH'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #25151#38388#21495
          Width = 100
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KRXM'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #23458#20154#22995#21517
          Width = 250
          Visible = True
        end
        item
          Color = clYellow
          Expanded = False
          FieldName = 'D_SJFJ'
          Title.Alignment = taCenter
          Title.Caption = #23454#38469#25151#20215
          Width = 120
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 438
  end
  inherited qryWork: TQuery
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from KFZT where (D_KFZT="F")or(D_KFZT="T")')
  end
  inherited dsWork: TDataSource
    DataSet = tblKfzt
  end
  object qryKrzd: TQuery
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from KRZD where D_KFBH=:KFBH')
    Left = 104
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'KFBH'
        ParamType = ptInput
      end>
  end
  object tblKfzt: TTable
    BeforeInsert = tblKfztBeforeInsert
    BeforePost = tblKfztBeforePost
    BeforeDelete = tblKfztBeforeDelete
    DatabaseName = 'LfHotelUser'
    Filter = 'D_KFZT='#39'F'#39' or D_KFZT='#39'T'#39
    Filtered = True
    IndexFieldNames = 'D_LCBH;D_KFBH'
    TableName = 'KFZT'
    Left = 352
    Top = 8
    object tblKfztD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Required = True
      Size = 5
    end
    object tblKfztD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Size = 12
    end
    object tblKfztD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Size = 12
    end
    object tblKfztD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Size = 12
    end
    object tblKfztD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
      currency = True
    end
    object tblKfztD_KFZT: TStringField
      FieldName = 'D_KFZT'
      FixedChar = True
      Size = 1
    end
    object tblKfztD_KFBZ: TStringField
      FieldName = 'D_KFBZ'
      FixedChar = True
      Size = 1
    end
    object tblKfztD_KRSL: TIntegerField
      FieldName = 'D_KRSL'
    end
    object tblKfztD_DHKT: TStringField
      FieldName = 'D_DHKT'
      FixedChar = True
      Size = 1
    end
    object tblKfztD_BZFJ: TFloatField
      FieldName = 'D_BZFJ'
    end
    object tblKfztD_CWS: TIntegerField
      FieldName = 'D_CWS'
    end
    object tblKfztD_BJS: TIntegerField
      FieldName = 'D_BJS'
    end
    object tblKfztD_QJS: TIntegerField
      FieldName = 'D_QJS'
    end
    object tblKfztD_JJFJ: TFloatField
      FieldName = 'D_JJFJ'
    end
    object tblKfztD_FXBH: TStringField
      FieldName = 'D_FXBH'
      Size = 5
    end
    object tblKfztD_LCBH: TStringField
      FieldName = 'D_LCBH'
      Size = 5
    end
    object tblKfztD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Size = 30
    end
  end
  object tblBqj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'BQJ'
    Left = 392
    Top = 8
  end
end
