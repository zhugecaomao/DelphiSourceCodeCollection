inherited TdyfcxForm: TTdyfcxForm
  Left = 169
  Top = 36
  Width = 600
  Height = 500
  Caption = #26597#35810
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 592
    Height = 81
    inherited lblTitle: TLabel
      Left = 238
      Caption = #22242#38431#29992#25151
    end
    inherited Image1: TImage
      Left = 196
    end
    inherited cmbOption: TComboBox
      Top = 8
      Visible = False
    end
    inherited cmbExpress: TComboBox
      Top = 8
      Visible = False
    end
    inherited edtValue: TEdit
      Top = 8
      Visible = False
    end
    inherited btnLoca: TBitBtn
      Top = 5
      Visible = False
    end
    object edtTdmc: TLabeledEdit
      Left = 6
      Top = 56
      Width = 523
      Height = 20
      EditLabel.Width = 48
      EditLabel.Height = 12
      EditLabel.Caption = #22242#38431#21517#31216
      LabelPosition = lpAbove
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 4
    end
  end
  inherited Panel2: TPanel
    Top = 81
    Width = 592
    Height = 357
    inherited DBGrid1: TDBGrid
      Width = 582
      Height = 347
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'D_KFBH'
          Title.Caption = #23458#25151#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFRQ'
          Title.Caption = #21462#25151#26085#26399
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFSJ'
          Title.Caption = #21462#25151#26102#38388
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JZRQ'
          Title.Caption = #36864#25151#26085#26399
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JZSJ'
          Title.Caption = #36864#25151#26102#38388
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_SJFJ'
          Title.Caption = #23454#38469#25151#20215
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JZBZ'
          Title.Caption = #29992#25151#24773#20917
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
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select * from KRZD where (D_KRBH=:KRBH)and(D_XMBH="00001")and(D_' +
        'SJFJ>0)')
    ParamData = <
      item
        DataType = ftString
        Name = 'KRBH'
        ParamType = ptInput
      end>
    object qryWorkD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Origin = 'LFHOTELUSER.KRZD.D_ZDBH'
      Size = 12
    end
    object qryWorkD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER.KRZD.D_HH'
    end
    object qryWorkD_ZDLB: TStringField
      FieldName = 'D_ZDLB'
      Origin = 'LFHOTELUSER.KRZD.D_ZDLB'
      FixedChar = True
      Size = 1
    end
    object qryWorkD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER.KRZD.D_KRBH'
      Size = 12
    end
    object qryWorkD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Origin = 'LFHOTELUSER.KRZD.D_YJBH'
      Size = 12
    end
    object qryWorkD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Origin = 'LFHOTELUSER.KRZD.D_KFBH'
      Size = 5
    end
    object qryWorkD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
      Origin = 'LFHOTELUSER.KRZD.D_SJFJ'
      currency = True
    end
    object qryWorkD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.KRZD.D_XMBH'
      Size = 5
    end
    object qryWorkD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
      Origin = 'LFHOTELUSER.KRZD.D_XFDJ'
    end
    object qryWorkD_XFSL: TFloatField
      FieldName = 'D_XFSL'
      Origin = 'LFHOTELUSER.KRZD.D_XFSL'
    end
    object qryWorkD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER.KRZD.D_XFJE'
    end
    object qryWorkD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
      Origin = 'LFHOTELUSER.KRZD.D_XFRQ'
    end
    object qryWorkD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
      Origin = 'LFHOTELUSER.KRZD.D_XFSJ'
      DisplayFormat = 'hh:nn'
    end
    object qryWorkD_YHJE: TFloatField
      FieldName = 'D_YHJE'
      Origin = 'LFHOTELUSER.KRZD.D_YHJE'
    end
    object qryWorkD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
      Origin = 'LFHOTELUSER.KRZD.D_JZRQ'
    end
    object qryWorkD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
      Origin = 'LFHOTELUSER.KRZD.D_JZSJ'
      DisplayFormat = 'hh:nn'
    end
    object qryWorkD_JZBZ: TStringField
      FieldName = 'D_JZBZ'
      Origin = 'LFHOTELUSER.KRZD.D_JZBZ'
      OnGetText = qryWorkD_JZBZGetText
      FixedChar = True
      Size = 1
    end
    object qryWorkD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      Origin = 'LFHOTELUSER.KRZD.D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object qryWorkD_DLR1: TStringField
      FieldName = 'D_DLR1'
      Origin = 'LFHOTELUSER.KRZD.D_DLR1'
      Size = 8
    end
    object qryWorkD_DLR2: TStringField
      FieldName = 'D_DLR2'
      Origin = 'LFHOTELUSER.KRZD.D_DLR2'
      Size = 8
    end
    object qryWorkD_DLR3: TStringField
      FieldName = 'D_DLR3'
      Origin = 'LFHOTELUSER.KRZD.D_DLR3'
      Size = 8
    end
    object qryWorkD_DLR4: TStringField
      FieldName = 'D_DLR4'
      Origin = 'LFHOTELUSER.KRZD.D_DLR4'
      Size = 8
    end
    object qryWorkD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.KRZD.D_CZYXM'
      Size = 8
    end
    object qryWorkD_JZYXM: TStringField
      FieldName = 'D_JZYXM'
      Origin = 'LFHOTELUSER.KRZD.D_JZYXM'
      Size = 8
    end
    object qryWorkD_TYR: TStringField
      FieldName = 'D_TYR'
      Origin = 'LFHOTELUSER.KRZD.D_TYR'
      Size = 8
    end
    object qryWorkD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.KRZD.D_BZ'
      Size = 30
    end
    object qryWorkD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Origin = 'LFHOTELUSER.KRZD.D_YSRQ'
      Size = 8
    end
    object qryWorkD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Origin = 'LFHOTELUSER.KRZD.D_JZBH'
      Size = 12
    end
  end
end
