inherited KfdyForm: TKfdyForm
  Top = 59
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 76
    inherited lblTitle: TLabel
      Top = 6
      Caption = #23458#25151#23450#20041
    end
    inherited Image1: TImage
      Top = 6
    end
    inherited cmbOption: TComboBox
      Top = 49
    end
    inherited cmbExpress: TComboBox
      Top = 49
    end
    inherited edtValue: TEdit
      Top = 49
    end
    inherited btnLoca: TBitBtn
      Top = 46
    end
    inherited lblState: TStaticText
      Top = 5
    end
  end
  inherited Panel2: TPanel
    Top = 76
    Height = 362
    inherited dbgXtdy: TDBGrid
      Height = 352
      OnColEnter = dbgXtdyColEnter
      OnKeyPress = dbgXtdyKeyPress
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KFBH'
          Title.Alignment = taCenter
          Title.Caption = #23458#25151#32534#21495
          Width = 65
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KFMC'
          Title.Alignment = taCenter
          Title.Caption = #23458#25151#21517#31216
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_BZFJ'
          Title.Alignment = taCenter
          Title.Caption = #26631#20934#25151#20215
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_FXMC'
          Title.Alignment = taCenter
          Title.Caption = #25151#22411
          Width = 90
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_LCMC'
          Title.Alignment = taCenter
          Title.Caption = #27004#23618
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_CWS'
          Title.Alignment = taCenter
          Title.Caption = #24202#20301#25968
          Width = 80
          Visible = True
        end>
    end
  end
  inherited tblXtdy: TTable
    AfterPost = tblXtdyAfterPost
    TableName = 'KFDM'
    object tblXtdyD_FXMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_FXMC'
      LookupDataSet = HotelData.tblFXDM
      LookupKeyFields = 'D_FXBH'
      LookupResultField = 'D_FXMC'
      KeyFields = 'D_FXBH'
      Lookup = True
    end
    object tblXtdyD_LCMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_LCMC'
      LookupDataSet = HotelData.tblLCDM
      LookupKeyFields = 'D_LCBH'
      LookupResultField = 'D_LCMC'
      KeyFields = 'D_LCBH'
      Lookup = True
    end
    object tblXtdyD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Required = True
      Size = 5
    end
    object tblXtdyD_KFMC: TStringField
      FieldName = 'D_KFMC'
      Required = True
      Size = 10
    end
    object tblXtdyD_BZFJ: TFloatField
      FieldName = 'D_BZFJ'
    end
    object tblXtdyD_FXBH: TStringField
      FieldName = 'D_FXBH'
      Required = True
      Size = 5
    end
    object tblXtdyD_LCBH: TStringField
      FieldName = 'D_LCBH'
      Required = True
      Size = 5
    end
    object tblXtdyD_CWS: TIntegerField
      FieldName = 'D_CWS'
      OnValidate = tblXtdyD_CWSValidate
    end
  end
  object tblKfzt: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KFZT'
    Left = 368
    Top = 8
  end
end
