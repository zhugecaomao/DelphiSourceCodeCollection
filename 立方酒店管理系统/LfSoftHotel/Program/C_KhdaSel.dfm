inherited KhdaSelForm: TKhdaSelForm
  ActiveControl = edtValue
  ClientHeight = 423
  ClientWidth = 407
  KeyPreview = True
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 407
    Height = 311
    inherited dbgSelect: TDBGrid
      Width = 387
      Height = 291
      Color = clMoneyGreen
      FixedColor = clSkyBlue
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
      OnDblClick = btnOKClick
      Columns = <
        item
          Expanded = False
          FieldName = 'D_KHBH'
          Title.Alignment = taCenter
          Title.Caption = #23458#25143#32534#21495
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_FLMC'
          Title.Alignment = taCenter
          Title.Caption = #31867#21035
          Width = 60
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KHMC'
          Title.Alignment = taCenter
          Title.Caption = #23458#25143#21517#31216
          Width = 200
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Width = 407
    inherited lblTitle: TLabel
      Left = 130
      Width = 187
      Caption = #35760#24080#23458#25143#36873#25321
    end
    inherited Image1: TImage
      Left = 92
    end
    inherited cmbOption: TComboBox
      ItemIndex = 0
      Text = #23458#25143#32534#21495
      Items.Strings = (
        #23458#25143#32534#21495
        #23458#25143#21517#31216)
    end
    inherited edtValue: TEdit
      Width = 138
    end
    inherited btnLoca: TBitBtn
      Left = 324
      OnClick = btnLocaClick
    end
  end
  inherited Panel3: TPanel
    Top = 388
    Width = 407
    inherited btnOK: TBitBtn
      Left = 242
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 322
      OnClick = btnCancClick
    end
  end
  inherited qrySelect: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KHDA order by D_KHBH')
    Left = 24
    object qrySelectD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Origin = 'LFHOTELSYS."KHDA.DB".D_KHBH'
      Size = 5
    end
    object qrySelectD_KHMC: TStringField
      FieldName = 'D_KHMC'
      Origin = 'LFHOTELSYS."KHDA.DB".D_KHMC'
    end
    object qrySelectD_FLBH: TStringField
      FieldName = 'D_FLBH'
      Origin = 'LFHOTELSYS."KHDA.DB".D_FLBH'
      Size = 5
    end
    object qrySelectD_DWDZ: TStringField
      FieldName = 'D_DWDZ'
      Origin = 'LFHOTELSYS."KHDA.DB".D_DWDZ'
      Size = 30
    end
    object qrySelectD_FR: TStringField
      FieldName = 'D_FR'
      Origin = 'LFHOTELSYS."KHDA.DB".D_FR'
      Size = 8
    end
    object qrySelectD_LXDH: TStringField
      FieldName = 'D_LXDH'
      Origin = 'LFHOTELSYS."KHDA.DB".D_LXDH'
      Size = 16
    end
    object qrySelectD_JDRQ: TDateField
      FieldName = 'D_JDRQ'
      Origin = 'LFHOTELSYS."KHDA.DB".D_JDRQ'
    end
    object qrySelectD_DM: TStringField
      FieldName = 'D_DM'
      Origin = 'LFHOTELSYS."KHDA.DB".D_DM'
      Size = 10
    end
    object qrySelectD_FLMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_FLMC'
      LookupDataSet = HotelData.tblFLDM
      LookupKeyFields = 'D_FLBH'
      LookupResultField = 'D_FLMC'
      KeyFields = 'D_FLBH'
      Lookup = True
    end
  end
  inherited dsSelect: TDataSource
    Left = 56
  end
  object DosMove1: TDosMove
    Active = True
    Left = 312
    Top = 8
  end
end
