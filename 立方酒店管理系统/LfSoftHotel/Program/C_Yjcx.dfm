inherited YjcxForm: TYjcxForm
  Left = 106
  Top = 6
  Width = 640
  Height = 580
  Caption = #25276#37329#20652#20132
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 632
    inherited lblTitle: TLabel
      Left = 259
      Caption = #25276#37329#20652#20132
    end
    inherited Image1: TImage
      Left = 210
    end
    inherited cmbOption: TComboBox
      ItemIndex = 0
      Text = #25151#38388#21495
      Items.Strings = (
        #25151#38388#21495)
    end
    inherited btnLoca: TBitBtn
      OnClick = btnLocaClick
    end
  end
  inherited Panel2: TPanel
    Width = 632
    Height = 444
    inherited DBGrid1: TDBGrid
      Width = 622
      Height = 434
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = btnBjyjClick
      Columns = <
        item
          Expanded = False
          FieldName = 'D_KFBH'
          Title.Alignment = taCenter
          Title.Caption = #23458#25151#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_KRXM'
          Title.Alignment = taCenter
          Title.Caption = #23458#20154#22995#21517
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUM'
          Title.Alignment = taCenter
          Title.Caption = #25276#37329#24635#39069
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFJE'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#37329#39069
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 518
    Width = 632
    object Label1: TLabel [0]
      Left = 8
      Top = 9
      Width = 192
      Height = 16
      Caption = #27880#65306#32418#33394#34920#31034#38656#35201#20652#20132#25276#37329
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnHelp: TBitBtn
      Left = 472
    end
    inherited btnClose: TBitBtn
      Left = 552
    end
    inherited btnPrint: TBitBtn
      Left = 392
    end
    object btnBjyj: TBitBtn
      Left = 312
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #34917#20132#25276#37329'(&B)'
      TabOrder = 3
      OnClick = btnBjyjClick
    end
  end
  inherited qryWork: TQuery
    OnCalcFields = qryWorkCalcFields
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select a.d_kfbh,a.d_krxm,a.d_zdbh,sum(b.d_yfje) from kfzt a,kryj' +
        ' b where (a.d_kfzt="F")and(b.d_yjbh=a.d_yjbh)and(b.d_fkfs="'#20154#27665#24065'")' +
        ' group by a.d_kfbh,a.d_krxm,a.d_zdbh')
    object qryWorkD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Size = 5
    end
    object qryWorkD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Size = 30
    end
    object qryWorkD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Size = 12
    end
    object qryWorkSUM: TFloatField
      FieldName = 'SUM'
      DisplayFormat = '#.##'
    end
    object qryWorkD_XFJE: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'D_XFJE'
      DisplayFormat = '#.##'
      Calculated = True
    end
  end
end
