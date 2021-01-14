inherited HmdForm: THmdForm
  Left = 171
  Top = 33
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 76
    inherited lblTitle: TLabel
      Top = 6
      Width = 126
      Caption = #40657' '#21517' '#21333
    end
    inherited Image1: TImage
      Top = 6
    end
    inherited cmbOption: TComboBox
      Top = 49
      Text = #22995#21517
      Items.Strings = (
        #22995#21517
        #35777#20214#21495#30721)
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
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XM'
          Title.Alignment = taCenter
          Title.Caption = #22995#21517
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_ZJHM'
          Title.Alignment = taCenter
          Title.Caption = #35777#20214#21495#30721
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_NL'
          Title.Alignment = taCenter
          Title.Caption = #24180#40836
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_JTDZ'
          Title.Alignment = taCenter
          Title.Caption = #23478#24237#22320#22336
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_BZ'
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_LRRQ'
          Title.Alignment = taCenter
          Title.Caption = #24405#20837#26085#26399
          Visible = True
        end>
    end
  end
  inherited tblXtdy: TTable
    AfterInsert = tblXtdyAfterInsert
    TableName = 'HMD'
    object tblXtdyD_XM: TStringField
      FieldName = 'D_XM'
      Required = True
      Size = 8
    end
    object tblXtdyD_ZJHM: TStringField
      FieldName = 'D_ZJHM'
      Required = True
      Size = 18
    end
    object tblXtdyD_NL: TIntegerField
      FieldName = 'D_NL'
    end
    object tblXtdyD_LRRQ: TDateTimeField
      FieldName = 'D_LRRQ'
    end
    object tblXtdyD_JTDZ: TStringField
      FieldName = 'D_JTDZ'
      Size = 30
    end
    object tblXtdyD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
  end
end
