inherited YddRzForm: TYddRzForm
  Left = 68
  Top = 6
  Caption = #39044#23450
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    inherited lblTitle: TLabel
      Caption = #39044#23450#21333#20837#24080
    end
    inherited Image1: TImage
      Left = 172
    end
  end
  inherited Panel2: TPanel
    inherited dbgMaster: TDBGrid
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_YDBH'
          Title.Alignment = taCenter
          Title.Caption = #39044#23450#32534#21495
          Visible = True
        end
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
          FieldName = 'D_DWMC'
          Title.Alignment = taCenter
          Title.Caption = #21333#20301#21517#31216
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_YDRQ'
          Title.Alignment = taCenter
          Title.Caption = #39044#23450#26085#26399
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_YDSJ'
          Title.Alignment = taCenter
          Title.Caption = #39044#23450#26102#38388
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_FKFS'
          Title.Alignment = taCenter
          Title.Caption = #39044#20184#26041#24335
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_LXR'
          Title.Alignment = taCenter
          Title.Caption = #23486#39302#32852#31995#20154
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
          FieldName = 'D_YDXXBZ'
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_CZY'
          Title.Alignment = taCenter
          Title.Caption = #25805#20316#21592
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    object btnRz: TBitBtn
      Left = 6
      Top = 6
      Width = 75
      Height = 25
      Caption = #20837#24080'(&Z)'
      TabOrder = 2
      OnClick = btnRzClick
      NumGlyphs = 2
    end
  end
  inherited qryMaster: TQuery
    RequestLive = True
    SQL.Strings = (
      'select * from YDD where (D_HH=0)and(D_RZ="1")')
  end
  inherited qryDetail: TQuery
    RequestLive = True
  end
end
