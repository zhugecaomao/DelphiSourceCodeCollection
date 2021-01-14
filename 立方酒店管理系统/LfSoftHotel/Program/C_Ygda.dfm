inherited YgdaForm: TYgdaForm
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 79
    inherited lblTitle: TLabel
      Caption = #21592#24037#26723#26696
    end
    inherited cmbOption: TComboBox
      Top = 52
    end
    inherited cmbExpress: TComboBox
      Top = 52
    end
    inherited edtValue: TEdit
      Top = 52
    end
    inherited btnLoca: TBitBtn
      Top = 49
    end
    inherited lblState: TStaticText
      Top = 8
    end
  end
  inherited Panel2: TPanel
    Top = 79
    Height = 359
    inherited dbgXtdy: TDBGrid
      Height = 349
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_YGBH'
          Title.Alignment = taCenter
          Title.Caption = #21592#24037#32534#21495
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_YGXM'
          Title.Alignment = taCenter
          Title.Caption = #21592#24037#22995#21517
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_BMMC'
          Title.Alignment = taCenter
          Title.Caption = #25152#23646#37096#38376
          Width = 200
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_DM'
          Title.Alignment = taCenter
          Title.Caption = #21592#24037#20195#30721
          Width = 120
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    inherited btnPrint: TBitBtn
      TabOrder = 4
    end
    object btnQx: TBitBtn
      Left = 117
      Top = 5
      Width = 100
      Height = 25
      Caption = #26435#38480'(&R)'
      TabOrder = 2
      OnClick = btnQxClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080BFB0888880BFB080FBF0888880FBF08000008808800
        000888088808088808888808808E80880888880008E8E80008888888808E8088
        8888888888080888888888888880888888888888800000888888888880FBF088
        8888888880BFB088888888888000008888888888888888888888}
    end
    object btnKl: TBitBtn
      Left = 6
      Top = 5
      Width = 100
      Height = 25
      Caption = #21475#20196'(&S)'
      TabOrder = 3
      OnClick = btnKlClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888800080008000888888888888888
        8888888800888008888888880008000888888880000800008888888008000800
        8888888008000800888888008880888008888800888888800888880088888880
        0888888888888888888888888888888888888888888888888888}
    end
  end
  inherited tblXtdy: TTable
    TableName = 'YGDA'
    object tblXtdyD_BMMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_BMMC'
      LookupDataSet = HotelData.tblBMDM
      LookupKeyFields = 'D_BMBH'
      LookupResultField = 'D_BMMC'
      KeyFields = 'D_BMBH'
      Lookup = True
    end
    object tblXtdyD_YGBH: TStringField
      FieldName = 'D_YGBH'
      Required = True
      Size = 5
    end
    object tblXtdyD_YGXM: TStringField
      FieldName = 'D_YGXM'
      Required = True
      Size = 8
    end
    object tblXtdyD_BMBH: TStringField
      FieldName = 'D_BMBH'
      Required = True
      Size = 5
    end
    object tblXtdyD_KL: TStringField
      FieldName = 'D_KL'
      Size = 8
    end
    object tblXtdyD_DM: TStringField
      FieldName = 'D_DM'
      Size = 10
    end
  end
end
