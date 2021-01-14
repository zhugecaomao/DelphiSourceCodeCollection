inherited DtbqjForm: TDtbqjForm
  Left = 181
  Top = 56
  Width = 600
  Height = 500
  Caption = #26597#35810
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 592
    Height = 73
    inherited lblTitle: TLabel
      Left = 242
      Width = 187
      Caption = #20170#26085#25151#20215#27719#25253
    end
    inherited Image1: TImage
      Left = 196
    end
    object lblFjze: TLabel [2]
      Left = 296
      Top = 49
      Width = 141
      Height = 19
      Caption = #20170#26085#25151#37329#24635#39069#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #40657#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDqze: TLabel [3]
      Left = 8
      Top = 49
      Width = 141
      Height = 19
      Caption = #24403#21069#25151#37329#24635#39069#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #40657#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited cmbOption: TComboBox
      Top = 14
      Visible = False
    end
    inherited cmbExpress: TComboBox
      Top = 14
      Visible = False
    end
    inherited edtValue: TEdit
      Top = 14
      Visible = False
    end
    inherited btnLoca: TBitBtn
      Top = 11
      Visible = False
    end
  end
  inherited Panel2: TPanel
    Top = 73
    Width = 592
    Height = 365
    inherited DBGrid1: TDBGrid
      Width = 582
      Height = 355
      Columns = <
        item
          Expanded = False
          FieldName = 'D_KFBH'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #23458#25151#21495
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_SJFJ'
          Title.Alignment = taCenter
          Title.Caption = #24403#21069#25151#20215
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_QJ'
          Title.Alignment = taCenter
          Title.Caption = #20840#20215
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_BJ'
          Title.Alignment = taCenter
          Title.Caption = #21322#20215
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JJFJ'
          Title.Alignment = taCenter
          Title.Caption = #38388#25509#25151#20215
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_HJ'
          Title.Alignment = taCenter
          Title.Caption = #21512#35745
          Width = 80
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 438
    Width = 592
    inherited btnHelp: TBitBtn
      Left = 432
    end
    inherited btnClose: TBitBtn
      Left = 512
    end
    inherited btnPrint: TBitBtn
      Left = 352
      OnClick = btnPrintClick
    end
  end
  inherited qryWork: TQuery
    BeforeInsert = qryWorkBeforeInsert
    BeforeEdit = qryWorkBeforeEdit
    BeforeDelete = qryWorkBeforeDelete
    OnCalcFields = qryWorkCalcFields
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from BQJ order by D_KFBH')
    object qryWorkD_HJ: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'D_HJ'
      DisplayFormat = '#.##'
      Currency = False
      Calculated = True
    end
    object qryWorkD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Origin = 'LFHOTELUSER.BQJ.D_KFBH'
      Size = 5
    end
    object qryWorkD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
      Origin = 'LFHOTELUSER.BQJ.D_SJFJ'
      DisplayFormat = '#.##'
    end
    object qryWorkD_BJS: TIntegerField
      FieldName = 'D_BJS'
      Origin = 'LFHOTELUSER.BQJ.D_BJS'
    end
    object qryWorkD_QJS: TIntegerField
      FieldName = 'D_QJS'
      Origin = 'LFHOTELUSER.BQJ.D_QJS'
    end
    object qryWorkD_BJ: TStringField
      FieldName = 'D_BJ'
      Origin = 'LFHOTELUSER.BQJ.D_BJ'
      Size = 30
    end
    object qryWorkD_QJ: TStringField
      FieldName = 'D_QJ'
      Origin = 'LFHOTELUSER.BQJ.D_QJ'
      Size = 30
    end
    object qryWorkD_JJFJ: TFloatField
      FieldName = 'D_JJFJ'
      Origin = 'LFHOTELUSER.BQJ.D_JJFJ'
      DisplayFormat = '#.##'
    end
  end
  object tblKfzt: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KFZT'
    Left = 160
    Top = 48
  end
end
