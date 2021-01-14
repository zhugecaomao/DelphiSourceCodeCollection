inherited YjxfForm: TYjxfForm
  Width = 600
  Height = 450
  Caption = #26597#35810
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 592
    inherited lblTitle: TLabel
      Left = 208
      Width = 218
      Caption = #25276#37329#12289#28040#36153#26597#35810
    end
    inherited Image1: TImage
      Left = 152
    end
  end
  inherited Panel2: TPanel
    Width = 592
    Height = 302
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 582
      Height = 100
      Align = alTop
      Color = clMoneyGreen
      DataSource = dsKrzd
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KFBH'
          Title.Alignment = taCenter
          Title.Caption = #23458#25151#32534#21495
          Width = 90
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KRXM'
          Title.Alignment = taCenter
          Title.Caption = #23458#20154#22995#21517
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_SJFJ'
          Title.Alignment = taCenter
          Title.Caption = #23454#38469#25151#20215
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_YFJE'
          Title.Alignment = taCenter
          Title.Caption = #39044#20184#37329#39069
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFJE'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#37329#39069
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_YJYE'
          Title.Alignment = taCenter
          Title.Caption = #25276#37329#20313#39069
          Width = 90
          Visible = True
        end>
    end
    object ListView1: TListView
      Left = 5
      Top = 105
      Width = 582
      Height = 192
      Align = alClient
      Color = clMoneyGreen
      Columns = <
        item
          AutoSize = True
        end
        item
          Alignment = taRightJustify
          AutoSize = True
        end
        item
          Alignment = taRightJustify
          AutoSize = True
        end
        item
          Alignment = taRightJustify
          AutoSize = True
        end
        item
          Alignment = taRightJustify
          AutoSize = True
        end
        item
          Alignment = taRightJustify
          AutoSize = True
        end>
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      TabOrder = 1
      ViewStyle = vsReport
    end
  end
  inherited Panel3: TPanel
    Top = 382
    Width = 592
    inherited btnHelp: TBitBtn
      Left = 432
    end
    inherited btnClose: TBitBtn
      Left = 512
    end
    object btnBjyj: TBitBtn
      Left = 352
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #34917#20132#25276#37329
      TabOrder = 2
      OnClick = btnBjyjClick
    end
  end
  object qryKrzd: TQuery
    OnCalcFields = qryKrzdCalcFields
    DatabaseName = 'LFHOTELUSER'
    SQL.Strings = (
      
        'select a.D_ZDBH,a.D_KRBH,a.D_YJBH,a.D_ZDLB,a.D_KFBH,b.D_KRXM,a.D' +
        '_SJFJ'
      ' from KRZD a,KRXX b'
      ' where (a.D_HH=0)and(a.D_KRBH=b.D_KRBH)'
      '  and((a.D_ZDLB="Y")or(a.D_ZDLB="T"))')
    Left = 8
    Top = 8
    object qryKrzdD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Origin = 'LFHOTELUSER."KRZD.DB".D_ZDBH'
      Size = 12
    end
    object qryKrzdD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER."KRZD.DB".D_KRBH'
      Size = 12
    end
    object qryKrzdD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Origin = 'LFHOTELUSER."KRZD.DB".D_YJBH'
      Size = 12
    end
    object qryKrzdD_ZDLB: TStringField
      FieldName = 'D_ZDLB'
      Origin = 'LFHOTELUSER."KRZD.DB".D_ZDLB'
      Size = 1
    end
    object qryKrzdD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Origin = 'LFHOTELUSER."KRZD.DB".D_KFBH'
      Size = 5
    end
    object qryKrzdD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Origin = 'LFHOTELUSER."KRXX.DB".D_KRXM'
      Size = 30
    end
    object qryKrzdD_SJFJ: TCurrencyField
      FieldName = 'D_SJFJ'
      Origin = 'LFHOTELUSER."KRZD.DB".D_SJFJ'
    end
    object qryKrzdD_YFJE: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'D_YFJE'
      Calculated = True
    end
    object qryKrzdD_XFJE: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'D_XFJE'
      Calculated = True
    end
    object qryKrzdD_YJYE: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'D_YJYE'
      Calculated = True
    end
  end
  object dsKrzd: TDataSource
    DataSet = qryKrzd
    OnDataChange = dsKrzdDataChange
    Left = 48
    Top = 8
  end
  object qryXx: TQuery
    DatabaseName = 'LFHOTELUSER'
    Left = 88
    Top = 8
  end
end
