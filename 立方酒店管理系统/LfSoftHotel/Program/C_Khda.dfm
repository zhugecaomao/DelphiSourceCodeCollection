inherited KhdaForm: TKhdaForm
  Left = 60
  Top = 49
  Width = 700
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 692
    Height = 76
    inherited lblTitle: TLabel
      Left = 281
      Top = 6
      Caption = #23458#25143#26723#26696
    end
    inherited Image1: TImage
      Left = 209
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
      Left = 620
      Top = 5
    end
  end
  inherited Panel2: TPanel
    Top = 76
    Width = 692
    Height = 362
    inherited dbgXtdy: TDBGrid
      Width = 682
      Height = 352
      OnColEnter = dbgXtdyColEnter
      OnKeyPress = dbgXtdyKeyPress
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_FLMC'
          Title.Alignment = taCenter
          Title.Caption = #23458#25143#20998#31867
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KHBH'
          Title.Alignment = taCenter
          Title.Caption = #23458#25143#32534#21495
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KHMC'
          Title.Alignment = taCenter
          Title.Caption = #23458#25143#21517#31216
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_FR'
          Title.Alignment = taCenter
          Title.Caption = #27861#20154
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_DWDZ'
          Title.Alignment = taCenter
          Title.Caption = #21333#20301#22320#22336
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_LXDH'
          Title.Alignment = taCenter
          Title.Caption = #32852#31995#30005#35805
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_JDRQ'
          Title.Alignment = taCenter
          Title.Caption = #24314#26723#26085#26399
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_DM'
          Title.Alignment = taCenter
          Title.Caption = #20195#30721
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Width = 692
    inherited btnHelp: TBitBtn
      Left = 533
    end
    inherited btnClose: TBitBtn
      Left = 612
    end
    inherited btnPrint: TBitBtn
      Left = 454
    end
  end
  inherited tblXtdy: TTable
    AfterInsert = tblXtdyAfterInsert
    IndexFieldNames = 'D_KHBH'
    TableName = 'KHDA'
    object tblXtdyD_FLMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_FLMC'
      LookupDataSet = HotelData.tblFLDM
      LookupKeyFields = 'D_FLBH'
      LookupResultField = 'D_FLMC'
      KeyFields = 'D_FLBH'
      Lookup = True
    end
    object tblXtdyD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Required = True
      Size = 5
    end
    object tblXtdyD_KHMC: TStringField
      FieldName = 'D_KHMC'
      Required = True
      Size = 30
    end
    object tblXtdyD_FLBH: TStringField
      FieldName = 'D_FLBH'
      Required = True
      OnChange = tblXtdyD_FLBHChange
      OnValidate = tblXtdyD_FLBHValidate
      Size = 5
    end
    object tblXtdyD_DWDZ: TStringField
      FieldName = 'D_DWDZ'
      Size = 30
    end
    object tblXtdyD_FR: TStringField
      FieldName = 'D_FR'
      Size = 8
    end
    object tblXtdyD_LXDH: TStringField
      FieldName = 'D_LXDH'
      Size = 16
    end
    object tblXtdyD_JDRQ: TDateTimeField
      FieldName = 'D_JDRQ'
    end
    object tblXtdyD_DM: TStringField
      FieldName = 'D_DM'
      Size = 10
    end
  end
  object qryYsk: TQuery
    DatabaseName = 'LfHotelUser'
    Left = 456
    Top = 24
  end
end
