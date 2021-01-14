inherited WbjdForm: TWbjdForm
  Left = 81
  Top = 28
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    inherited lblTitile: TLabel
      Caption = #22806#23486#25509#24453
    end
  end
  inherited Panel2: TPanel
    inherited Bevel1: TBevel
      Width = 287
    end
    inherited Label3: TLabel
      Left = 152
      Top = 77
    end
    inherited Label5: TLabel
      Left = 93
      Top = 127
    end
    inherited Label6: TLabel
      Left = 189
      Top = 127
    end
    inherited Label7: TLabel
      Left = 152
    end
    inherited Label25: TLabel
      Left = 152
      Top = 22
    end
    inherited lblMc: TLabel
      Left = 13
    end
    inherited dbeSjfj: TDBEdit
      Left = 152
      Top = 93
    end
    inherited dbeDdrq: TDBEdit
      Left = 93
      Top = 143
    end
    inherited dbeDdsj: TDBEdit
      Left = 189
      Top = 143
    end
    inherited dbcFkfs: TDBComboBox
      Left = 152
    end
    inherited dbcJzyxm: TDBComboBox
      Left = 152
      Top = 38
    end
    inherited Panel4: TPanel
      Left = 292
      Width = 391
      inherited Label11: TLabel
        Left = 215
        Top = 14
      end
      inherited Label12: TLabel
        Left = 6
        Top = 69
        Width = 64
        Caption = #31614#35777#31867#22411
      end
      inherited Label13: TLabel
        Left = 7
        Top = 118
      end
      inherited Label14: TLabel
        Left = 214
        Top = 118
      end
      inherited Label15: TLabel
        Left = 7
        Top = 171
      end
      inherited Label16: TLabel
        Left = 179
        Top = 171
      end
      inherited Label18: TLabel
        Left = 7
        Top = 223
      end
      inherited Label19: TLabel
        Left = 278
        Top = 171
      end
      inherited Label20: TLabel
        Left = 179
        Top = 223
      end
      inherited Label21: TLabel
        Left = 278
        Top = 224
      end
      inherited Label22: TLabel
        Left = 7
        Top = 266
      end
      inherited Label23: TLabel
        Left = 7
        Top = 354
      end
      inherited lblMz: TLabel
        Left = 109
        Top = 94
      end
      inherited lblDqmc: TLabel
        Left = 109
        Top = 144
      end
      inherited lblZjmc: TLabel
        Left = 318
        Top = 144
      end
      inherited Label8: TLabel
        Left = 7
        Top = 310
      end
      object Label1: TLabel [16]
        Left = 215
        Top = 71
        Width = 80
        Height = 16
        Caption = #31614#35777#26377#25928#26399
      end
      object Label27: TLabel [17]
        Left = 109
        Top = 15
        Width = 48
        Height = 16
        Caption = #33521#25991#21517
      end
      object Label26: TLabel [18]
        Left = 7
        Top = 15
        Width = 48
        Height = 16
        Caption = #33521#25991#22995
      end
      inherited dbeZjhm: TDBEdit
        Left = 7
        Top = 189
        TabOrder = 7
      end
      inherited dbeCsny: TDBEdit
        Left = 180
        Top = 189
        TabOrder = 8
      end
      inherited dbeTlsy: TDBEdit
        Left = 7
        Top = 240
        TabOrder = 10
      end
      inherited dbeZy: TDBEdit
        Left = 279
        Top = 189
        TabOrder = 9
      end
      inherited dbeHcl: TDBEdit
        Left = 180
        Top = 240
        TabOrder = 11
      end
      inherited dbeHcq: TDBEdit
        Left = 279
        Top = 240
        TabOrder = 12
      end
      inherited dbeJtdz: TDBEdit
        Left = 7
        Top = 284
        Width = 371
        TabOrder = 13
      end
      inherited dbeBz: TDBEdit
        Left = 7
        Top = 372
        Width = 371
        TabOrder = 15
      end
      inherited dbcXb: TDBComboBox
        Left = 215
        Top = 31
        Width = 163
        TabOrder = 2
      end
      inherited dbcMz: TDBComboBox
        Left = 7
        Top = 86
        DataField = 'D_QZBH'
        TabOrder = 3
      end
      inherited dbcDqbh: TDBComboBox
        Left = 7
        Top = 136
        DataField = 'D_GBBH'
        TabOrder = 5
      end
      inherited dbcZjlx: TDBComboBox
        Left = 215
        Top = 136
        TabOrder = 6
      end
      inherited dbeDwmc: TDBEdit
        Left = 7
        Top = 328
        Width = 371
        TabOrder = 14
      end
      object dbeYwm: TDBEdit
        Left = 109
        Top = 31
        Width = 100
        Height = 24
        DataField = 'D_YWM'
        DataSource = dsKrxx
        TabOrder = 1
      end
      object dbeYwx: TDBEdit
        Left = 7
        Top = 31
        Width = 100
        Height = 24
        DataField = 'D_YWX'
        DataSource = dsKrxx
        TabOrder = 0
      end
      object dbeQzyxq: TDBEdit
        Left = 215
        Top = 87
        Width = 163
        Height = 24
        DataField = 'D_QZYXQ'
        DataSource = dsKrxx
        TabOrder = 4
      end
    end
  end
  inherited tblKrxx: TTable
    inherited tblKrxxD_QZYXQ: TDateTimeField
      EditMask = '!0000/99/99;1; '
    end
  end
end
