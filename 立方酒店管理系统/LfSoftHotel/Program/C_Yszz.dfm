inherited YszzForm: TYszzForm
  Left = 176
  Top = 55
  Height = 500
  Caption = #25253#34920
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 50
    inherited lblTitle: TLabel
      Left = 186
      Width = 187
      Caption = #23458#25143#24212#25910#24635#24080
    end
    inherited Image1: TImage
      Left = 152
    end
    inherited cmbOption: TComboBox
      Top = 23
      Visible = False
    end
    inherited cmbExpress: TComboBox
      Top = 23
      Visible = False
    end
    inherited edtValue: TEdit
      Top = 23
      Visible = False
    end
    inherited btnLoca: TBitBtn
      Top = 20
      Visible = False
    end
  end
  inherited Panel2: TPanel
    Top = 50
    Height = 388
    inherited DBGrid1: TDBGrid
      Height = 378
      Columns = <
        item
          Expanded = False
          FieldName = 'D_XMMC'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#39033#30446
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUM'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#37329#39069
          Width = 200
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 438
    object lblYsze: TLabel [0]
      Left = 8
      Top = 11
      Width = 84
      Height = 12
      Caption = #23458#25143#24212#25910#24635#39069#65306
    end
    inherited btnPrint: TBitBtn
      OnClick = btnPrintClick
    end
  end
  inherited qryWork: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select D_XMBH,sum(D_XFJE) from YSK where D_HH<>0 group by D_XMBH')
    object qryWorkD_XMBH: TStringField
      DisplayWidth = 6
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.YSK.D_XMBH'
      Size = 5
    end
    object qryWorkSUM: TFloatField
      DisplayWidth = 26
      FieldName = 'SUM'
      Origin = 'LFHOTELUSER.YSK.D_XFJE'
      DisplayFormat = '#.##'
    end
    object qryWorkD_XMMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XMMC'
      LookupDataSet = HotelData.tblXMDM
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
  end
end
