inherited fraEscalatorInfo: TfraEscalatorInfo
  inherited Panel6: TPanel
    inherited Panel7: TPanel
      inherited navTechInfo: TCSDBNavigator
        Hints.Strings = ()
      end
    end
  end
  inherited ScrollBox1: TScrollBox
    object Label1: TLabel
      Left = 28
      Top = 7
      Width = 60
      Height = 12
      Caption = #35774#22791#22411#21495#65306
    end
    object Label2: TLabel
      Left = 273
      Top = 7
      Width = 60
      Height = 12
      Caption = #20986#21378#32534#21495#65306
    end
    object Label4: TLabel
      Left = 273
      Top = 29
      Width = 60
      Height = 12
      Caption = #24037#20316#29615#22659#65306
    end
    object Label5: TLabel
      Left = 506
      Top = 30
      Width = 60
      Height = 12
      Caption = #39069#23450#36895#24230#65306
    end
    object Label6: TLabel
      Left = 273
      Top = 51
      Width = 60
      Height = 12
      Caption = #25552#21319#39640#24230#65306
    end
    object Label10: TLabel
      Left = 482
      Top = 73
      Width = 84
      Height = 12
      Caption = #31449#31435#37096#20214#31867#22411#65306
    end
    object Label11: TLabel
      Left = 4
      Top = 95
      Width = 84
      Height = 12
      Caption = #25206#25163#26639#26495#22411#24335#65306
    end
    object Label12: TLabel
      Left = 16
      Top = 73
      Width = 72
      Height = 12
      Caption = #21046#21160#22120#22411#24335#65306
    end
    object Label29: TLabel
      Left = 506
      Top = 8
      Width = 60
      Height = 12
      Caption = #20986#21378#26085#26399#65306
    end
    object Label30: TLabel
      Left = 28
      Top = 29
      Width = 60
      Height = 12
      Caption = #20135#21697#22269#21035#65306
    end
    object Label31: TLabel
      Left = 506
      Top = 51
      Width = 60
      Height = 12
      Caption = #36755#36865#33021#21147#65306
    end
    object Label39: TLabel
      Left = 237
      Top = 73
      Width = 96
      Height = 12
      Caption = #38468#21152#21046#21160#22120#22411#24335#65306
    end
    object Label3: TLabel
      Left = 28
      Top = 51
      Width = 60
      Height = 12
      Caption = #20542#26012#35282#24230#65306
    end
    object Label13: TLabel
      Left = 457
      Top = 51
      Width = 6
      Height = 12
      Caption = 'm'
    end
    object Label14: TLabel
      Left = 690
      Top = 30
      Width = 18
      Height = 12
      Caption = 'm/s'
    end
    object Label87: TLabel
      Left = 8
      Top = 249
      Width = 36
      Height = 12
      Caption = #22791#27880#65306
    end
    object Label20: TLabel
      Left = 691
      Top = 50
      Width = 24
      Height = 12
      Caption = #20154'/h'
    end
    object DBEdit1: TDBEditEh
      Left = 88
      Top = 4
      Width = 120
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'dev_type'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 0
      Visible = True
    end
    object DBEdit2: TDBEditEh
      Left = 333
      Top = 4
      Width = 120
      Height = 18
      Ctl3D = False
      DataField = 'manu_no'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 1
      Visible = True
    end
    object DBEdit5: TDBEditEh
      Left = 566
      Top = 27
      Width = 120
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'speed'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 5
      Visible = True
    end
    object DBEdit6: TDBEditEh
      Left = 333
      Top = 48
      Width = 120
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'drag_height'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 7
      Visible = True
    end
    object DBEdit7: TDBEditEh
      Left = 88
      Top = 48
      Width = 120
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'angle_num'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 6
      Visible = True
    end
    object CSdxDBDateEdit1: TCSdxDBDateEdit
      Left = 565
      Top = 4
      Width = 121
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 2
      DataField = 'manu_date'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      SaveTime = False
      FixedDateFormat = 'yyyy-MM-dd'
      StoredValues = 4
    end
    object DBEdit29: TDBEditEh
      Left = 566
      Top = 48
      Width = 120
      Height = 18
      Ctl3D = False
      DataField = 'transfer_value'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 8
      Visible = True
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 181
      Width = 510
      Height = 63
      Caption = #30005#21160#26426
      TabOrder = 14
      object Label25: TLabel
        Left = 10
        Top = 39
        Width = 36
        Height = 12
        Caption = #21151#29575#65306
      end
      object Label26: TLabel
        Left = 10
        Top = 17
        Width = 36
        Height = 12
        Caption = #22411#21495#65306
      end
      object Label37: TLabel
        Left = 171
        Top = 17
        Width = 36
        Height = 12
        Caption = #30005#21387#65306
      end
      object Label38: TLabel
        Left = 331
        Top = 17
        Width = 36
        Height = 12
        Caption = #36716#36895#65306
      end
      object Label46: TLabel
        Left = 171
        Top = 39
        Width = 36
        Height = 12
        Caption = #30005#27969#65306
      end
      object Label16: TLabel
        Left = 149
        Top = 39
        Width = 12
        Height = 12
        Caption = 'kw'
      end
      object Label17: TLabel
        Left = 311
        Top = 17
        Width = 6
        Height = 12
        Caption = 'V'
      end
      object Label18: TLabel
        Left = 311
        Top = 38
        Width = 6
        Height = 12
        Caption = 'A'
      end
      object Label19: TLabel
        Left = 471
        Top = 17
        Width = 30
        Height = 12
        Caption = 'r/min'
      end
      object DBEdit26: TDBEditEh
        Left = 46
        Top = 14
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'motor_type'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object DBEdit27: TDBEditEh
        Left = 207
        Top = 14
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'motor_voltage1'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit25: TDBEditEh
        Left = 46
        Top = 36
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'motor_power1'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 3
        Visible = True
      end
      object DBEdit43: TDBEditEh
        Left = 207
        Top = 36
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'motor_amperage1'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 4
        Visible = True
      end
      object DBEdit45: TDBEditEh
        Left = 367
        Top = 14
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'motor_speed1'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 114
      Width = 510
      Height = 63
      Caption = ' '#26799#32423' '
      TabOrder = 13
      object Label8: TLabel
        Left = 7
        Top = 39
        Width = 60
        Height = 12
        Caption = #26799#32423#23485#24230#65306
      end
      object Label9: TLabel
        Left = 291
        Top = 17
        Width = 84
        Height = 12
        Caption = #27700#24179#27573#26799#32423#25968#65306
      end
      object Label32: TLabel
        Left = 279
        Top = 39
        Width = 96
        Height = 12
        Caption = #26799#32423#34920#23618#36816#34892#25968#65306
      end
      object Label7: TLabel
        Left = 7
        Top = 17
        Width = 60
        Height = 12
        Caption = #26799#32423#22411#24335#65306
      end
      object Label15: TLabel
        Left = 190
        Top = 39
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object DBEdit8: TDBEditEh
        Left = 67
        Top = 36
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'step_width'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
      object DBEdit9: TDBEditEh
        Left = 375
        Top = 14
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'hori_step_num'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit30: TDBEditEh
        Left = 375
        Top = 36
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'step_run_num'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 3
        Visible = True
      end
      object dxDBPickEdit8: TdxDBPickEdit
        Left = 66
        Top = 12
        Width = 123
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 0
        DataField = 'step_modal'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
        DropDownListStyle = True
      end
    end
    object dxDBPickEdit3: TdxDBPickEdit
      Left = 565
      Top = 69
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 11
      DataField = 'standing_part_type'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      DropDownListStyle = True
    end
    object dxDBPickEdit1: TdxDBPickEdit
      Left = 332
      Top = 69
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 10
      DataField = 'plus_arrester_modal'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      DropDownListStyle = True
    end
    object dxDBPickEdit2: TdxDBPickEdit
      Left = 87
      Top = 69
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 9
      DataField = 'arrester_modal'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      DropDownListStyle = True
    end
    object dxDBPickEdit4: TdxDBPickEdit
      Left = 87
      Top = 91
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 12
      DataField = 'handrail_modal'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      DropDownListStyle = True
    end
    object dxDBPickEdit5: TdxDBPickEdit
      Left = 332
      Top = 25
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 4
      DataField = 'work_environment'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      DropDownListStyle = True
    end
    object dxDBPickEdit6: TdxDBPickEdit
      Left = 87
      Top = 25
      Width = 123
      Color = clSkyBlue
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 3
      DataField = 'country_type'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      DropDownListStyle = True
    end
    object GroupBox10: TGroupBox
      Left = 8
      Top = 342
      Width = 757
      Height = 64
      TabOrder = 15
      Visible = False
      object Label88: TLabel
        Left = 8
        Top = 16
        Width = 60
        Height = 12
        Caption = #35774#35745#35268#33539#65306
      end
      object Label89: TLabel
        Left = 8
        Top = 40
        Width = 60
        Height = 12
        Caption = #21046#36896#35268#33539#65306
      end
      object Label90: TLabel
        Left = 548
        Top = 16
        Width = 84
        Height = 12
        Caption = #35774#22791#26032#26087#29366#20917#65306
      end
      object Label91: TLabel
        Left = 572
        Top = 40
        Width = 60
        Height = 12
        Caption = #30417#26816#24418#24335#65306
      end
      object dxDBPickEdit15: TdxDBPickEdit
        Left = 67
        Top = 36
        Width = 470
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 2
        DataField = 'manu_standard'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
        DropDownListStyle = True
      end
      object dxDBPickEdit16: TdxDBPickEdit
        Left = 631
        Top = 12
        Width = 112
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 1
        DataField = 'is_secondhand'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
        DropDownListStyle = True
      end
      object dxDBPickEdit17: TdxDBPickEdit
        Left = 631
        Top = 36
        Width = 112
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 3
        DataField = 'supervise_type'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
        DropDownListStyle = True
      end
      object dxDBPickEdit14: TdxDBPickEdit
        Left = 67
        Top = 12
        Width = 470
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 0
        DataField = 'design_standard'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
        DropDownListStyle = True
      end
    end
    object DBMemo1: TdxDBMemo
      Left = 8
      Top = 262
      Width = 758
      Style.BorderStyle = xbsSingle
      TabOrder = 16
      DataField = 'remark'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      Height = 73
    end
  end
  inherited TechInfo: TCSADOQuery
    CursorType = ctStatic
  end
end
