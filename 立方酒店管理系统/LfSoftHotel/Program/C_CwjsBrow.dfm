inherited CwjsBrowForm: TCwjsBrowForm
  Left = 120
  Top = 47
  Width = 650
  Height = 500
  Caption = #25253#34920
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 642
    inherited lblTitle: TLabel
      Left = 254
    end
    inherited Image1: TImage
      Left = 210
    end
  end
  inherited Panel2: TPanel
    Width = 642
    Height = 364
    inherited DBGrid1: TDBGrid
      Width = 632
      Height = 354
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_LRRQ'
          Title.Alignment = taCenter
          Title.Caption = #19978#20132#26085#26399
          Width = 90
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_LRSJ'
          Title.Alignment = taCenter
          Title.Caption = #19978#20132#26102#38388
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_RMB'
          Title.Alignment = taCenter
          Title.Caption = #20154#27665#24065#37329#39069
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XYK'
          Title.Alignment = taCenter
          Title.Caption = #20449#29992#21345#37329#39069
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_ZP'
          Title.Alignment = taCenter
          Title.Caption = #25903#31080#37329#39069
          Width = 100
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_CZYXM'
          Title.Alignment = taCenter
          Title.Caption = #25805#20316#21592
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 438
    Width = 642
    inherited btnHelp: TBitBtn
      Left = 482
    end
    inherited btnClose: TBitBtn
      Left = 562
    end
    inherited btnPrint: TBitBtn
      Left = 402
      OnClick = btnPrintClick
    end
  end
  inherited qryWork: TQuery
    BeforeInsert = qryWorkBeforeInsert
    BeforeEdit = qryWorkBeforeEdit
    BeforeDelete = qryWorkBeforeDelete
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from CWJS where D_JSLX=:JSLX')
    ParamData = <
      item
        DataType = ftString
        Name = 'JSLX'
        ParamType = ptInput
      end>
    object qryWorkD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Origin = 'LFHOTELUSER.CWJS.D_YSRQ'
      Size = 8
    end
    object qryWorkD_JSLX: TStringField
      FieldName = 'D_JSLX'
      Origin = 'LFHOTELUSER.CWJS.D_JSLX'
      FixedChar = True
      Size = 1
    end
    object qryWorkD_RMB: TFloatField
      FieldName = 'D_RMB'
      Origin = 'LFHOTELUSER.CWJS.D_RMB'
      DisplayFormat = '#.##'
    end
    object qryWorkD_XYK: TFloatField
      FieldName = 'D_XYK'
      Origin = 'LFHOTELUSER.CWJS.D_XYK'
      DisplayFormat = '#.##'
    end
    object qryWorkD_ZP: TFloatField
      FieldName = 'D_ZP'
      Origin = 'LFHOTELUSER.CWJS.D_ZP'
      DisplayFormat = '#.##'
    end
    object qryWorkD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.CWJS.D_CZYXM'
      Size = 8
    end
    object qryWorkD_LRRQ: TDateTimeField
      FieldName = 'D_LRRQ'
      Origin = 'LFHOTELUSER.CWJS.D_LRRQ'
    end
    object qryWorkD_LRSJ: TDateTimeField
      FieldName = 'D_LRSJ'
      Origin = 'LFHOTELUSER.CWJS.D_LRSJ'
      DisplayFormat = 'hh:nn'
    end
  end
end
