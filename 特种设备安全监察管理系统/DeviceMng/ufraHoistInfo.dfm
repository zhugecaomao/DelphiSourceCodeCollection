inherited fraHoistInfo: TfraHoistInfo
  inherited Panel6: TPanel
    inherited Panel7: TPanel
      inherited navTechInfo: TCSDBNavigator
        Hints.Strings = ()
      end
    end
  end
  inherited ScrollBox1: TScrollBox
    object Label1: TLabel
      Left = 51
      Top = 7
      Width = 60
      Height = 12
      Caption = #35774#22791#22411#21495#65306
    end
    object Label2: TLabel
      Left = 305
      Top = 7
      Width = 60
      Height = 12
      Caption = #20986#21378#32534#21495#65306
    end
    object Label3: TLabel
      Left = 551
      Top = 7
      Width = 60
      Height = 12
      Caption = #20135#21697#22269#21035#65306
    end
    object Label4: TLabel
      Left = 293
      Top = 29
      Width = 72
      Height = 12
      Caption = #36215#37325#37327'('#20027')'#65306
    end
    object Label5: TLabel
      Left = 539
      Top = 29
      Width = 72
      Height = 12
      Caption = #36215#37325#37327'('#21103')'#65306
    end
    object Label8: TLabel
      Left = 51
      Top = 117
      Width = 60
      Height = 12
      Caption = #24037#20316#32423#21035#65306
    end
    object Label28: TLabel
      Left = 7
      Top = 662
      Width = 36
      Height = 12
      Caption = #22791#27880#65306
    end
    object Label29: TLabel
      Left = 51
      Top = 30
      Width = 60
      Height = 12
      Caption = #20986#21378#26085#26399#65306
    end
    object Label10: TLabel
      Left = 539
      Top = 117
      Width = 72
      Height = 12
      Caption = #21496#26426#23460#22411#24335#65306
    end
    object Label19: TLabel
      Left = 51
      Top = 95
      Width = 60
      Height = 12
      Caption = #36816#34892#36895#24230#65306
    end
    object Label20: TLabel
      Left = 75
      Top = 51
      Width = 36
      Height = 12
      Caption = #36328#24230#65306
    end
    object Label21: TLabel
      Left = 281
      Top = 51
      Width = 84
      Height = 12
      Caption = #24748#33218#38271#24230'(L1)'#65306
    end
    object Label22: TLabel
      Left = 527
      Top = 51
      Width = 84
      Height = 12
      Caption = #24748#33218#38271#24230'(L2)'#65306
    end
    object Label40: TLabel
      Left = 527
      Top = 95
      Width = 84
      Height = 12
      Caption = #21462#29289#35013#32622#31867#22411#65306
    end
    object Label41: TLabel
      Left = 15
      Top = 73
      Width = 96
      Height = 12
      Caption = #38480#36733#36215#37325#37327'('#20027')'#65306
    end
    object Label42: TLabel
      Left = 269
      Top = 73
      Width = 96
      Height = 12
      Caption = #38480#36733#36215#37325#37327'('#21103')'#65306
    end
    object Label58: TLabel
      Left = 305
      Top = 95
      Width = 60
      Height = 12
      Caption = #38376#26550#22411#24335#65306
    end
    object Label64: TLabel
      Left = 527
      Top = 73
      Width = 84
      Height = 12
      Caption = #26368#22823#36215#37325#21147#30697#65306
    end
    object Label86: TLabel
      Left = 236
      Top = 51
      Width = 6
      Height = 12
      Caption = 'm'
    end
    object Label87: TLabel
      Left = 236
      Top = 95
      Width = 30
      Height = 12
      Caption = 'm/min'
    end
    object Label88: TLabel
      Left = 236
      Top = 73
      Width = 6
      Height = 12
      Caption = 't'
    end
    object Label89: TLabel
      Left = 490
      Top = 29
      Width = 6
      Height = 12
      Caption = 't'
    end
    object Label90: TLabel
      Left = 490
      Top = 54
      Width = 6
      Height = 12
      Caption = 'm'
    end
    object Label91: TLabel
      Left = 490
      Top = 75
      Width = 6
      Height = 12
      Caption = 't'
    end
    object Label92: TLabel
      Left = 736
      Top = 29
      Width = 6
      Height = 12
      Caption = 't'
    end
    object Label93: TLabel
      Left = 736
      Top = 51
      Width = 6
      Height = 12
      Caption = 'm'
    end
    object Label94: TLabel
      Left = 736
      Top = 73
      Width = 18
      Height = 12
      Caption = 'kNm'
    end
    object Label99: TLabel
      Left = 499
      Top = 233
      Width = 96
      Height = 12
      Caption = #24037#20316#21322#24452'('#26222#26597')'#65306
      Visible = False
    end
    object Label100: TLabel
      Left = 304
      Top = 117
      Width = 60
      Height = 12
      Caption = #24037#20316#29615#22659#65306
    end
    object DBEdit1: TDBEditEh
      Left = 111
      Top = 4
      Width = 121
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
      Left = 365
      Top = 4
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'manu_no'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 1
      Visible = True
    end
    object DBEdit4: TDBEditEh
      Left = 365
      Top = 26
      Width = 121
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'pri_load_value'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 4
      Visible = True
    end
    object DBEdit5: TDBEditEh
      Left = 611
      Top = 26
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'sec_load_value'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 5
      Visible = True
    end
    object DBMemo1: TdxDBMemo
      Left = 6
      Top = 676
      Width = 743
      Style.BorderStyle = xbsSingle
      TabOrder = 26
      DataField = 'remark'
      DataSource = TechInfod
      Height = 73
    end
    object CSdxDBDateEdit1: TCSdxDBDateEdit
      Left = 110
      Top = 25
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 3
      Alignment = taLeftJustify
      DataField = 'manu_date'
      DataSource = TechInfod
      FixedDateFormat = 'yyyy-MM-dd'
      StoredValues = 1
    end
    object DBEdit20: TDBEditEh
      Left = 111
      Top = 92
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'run_speed'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 12
      Visible = True
    end
    object DBEdit21: TDBEditEh
      Left = 111
      Top = 48
      Width = 121
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'span_value'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 6
      Visible = True
    end
    object DBEdit22: TDBEditEh
      Left = 365
      Top = 48
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'ancon_length_1'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 7
      Visible = True
    end
    object DBEdit23: TDBEditEh
      Left = 611
      Top = 48
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'ancon_length_2'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 8
      Visible = True
    end
    object DBEdit39: TDBEditEh
      Left = 111
      Top = 70
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'pri_limit_load_value'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 9
      Visible = True
    end
    object DBEdit40: TDBEditEh
      Left = 365
      Top = 70
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'sec_limit_load_value'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 10
      Visible = True
    end
    object DBEdit62: TDBEditEh
      Left = 611
      Top = 70
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'max_moment'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 11
      Visible = True
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 378
      Width = 478
      Height = 105
      Caption = ' '#21464#24133#26426#26500' '
      TabOrder = 22
      object Label53: TLabel
        Left = 255
        Top = 83
        Width = 84
        Height = 12
        Caption = #21464#24133#39537#21160#26041#24335#65306
      end
      object Label44: TLabel
        Left = 279
        Top = 16
        Width = 60
        Height = 12
        Caption = #21464#24133#36895#24230#65306
      end
      object Label45: TLabel
        Left = 21
        Top = 38
        Width = 84
        Height = 12
        Caption = #24133#24230'('#20027#26368#23567')'#65306
      end
      object Label48: TLabel
        Left = 255
        Top = 61
        Width = 84
        Height = 12
        Caption = #24133#24230'('#21103#26368#22823')'#65306
      end
      object Label47: TLabel
        Left = 21
        Top = 61
        Width = 84
        Height = 12
        Caption = #24133#24230'('#21103#26368#23567')'#65306
      end
      object Label43: TLabel
        Left = 45
        Top = 16
        Width = 60
        Height = 12
        Caption = #21464#24133#26041#24335#65306
      end
      object Label46: TLabel
        Left = 255
        Top = 38
        Width = 84
        Height = 12
        Caption = #24133#24230'('#20027#26368#22823')'#65306
      end
      object Label52: TLabel
        Left = 21
        Top = 83
        Width = 84
        Height = 12
        Caption = #21464#24133#24179#34913#26041#24335#65306
      end
      object Label65: TLabel
        Left = 209
        Top = 38
        Width = 6
        Height = 12
        Caption = 'm'
      end
      object Label66: TLabel
        Left = 209
        Top = 60
        Width = 6
        Height = 12
        Caption = 'm'
      end
      object Label67: TLabel
        Left = 443
        Top = 15
        Width = 30
        Height = 12
        Caption = 'm/min'
      end
      object Label68: TLabel
        Left = 443
        Top = 37
        Width = 6
        Height = 12
        Caption = 'm'
      end
      object Label69: TLabel
        Left = 443
        Top = 59
        Width = 6
        Height = 12
        Caption = 'm'
      end
      object DBEdit42: TDBEditEh
        Left = 339
        Top = 13
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'change_range_speed'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit43: TDBEditEh
        Left = 105
        Top = 35
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'pri_min_range_value'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
      object DBEdit46: TDBEditEh
        Left = 339
        Top = 57
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'sec_max_range_value'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 5
        Visible = True
      end
      object DBEdit45: TDBEditEh
        Left = 105
        Top = 57
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'sec_min_range_value'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 4
        Visible = True
      end
      object DBEdit44: TDBEditEh
        Left = 339
        Top = 35
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'pri_max_range_value'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 3
        Visible = True
      end
      object dxDBPickEdit8: TdxDBPickEdit
        Left = 104
        Top = 11
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 0
        DataField = 'change_range_type'
        DataSource = TechInfod
        DropDownListStyle = True
      end
      object dxDBPickEdit9: TdxDBPickEdit
        Left = 104
        Top = 79
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 6
        DataField = 'range_balance_type'
        DataSource = TechInfod
        DropDownListStyle = True
      end
      object dxDBPickEdit10: TdxDBPickEdit
        Left = 338
        Top = 79
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 7
        DataField = 'range_drive_type'
        DataSource = TechInfod
        DropDownListStyle = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 229
      Top = 487
      Width = 520
      Height = 103
      Caption = ' '#25805#32437#26041#24335' '
      TabOrder = 25
      object Label23: TLabel
        Left = 31
        Top = 15
        Width = 84
        Height = 12
        Caption = #25805#32437#26041#24335'('#20027')'#65306
      end
      object Label24: TLabel
        Left = 31
        Top = 37
        Width = 84
        Height = 12
        Caption = #25805#32437#26041#24335'('#21103')'#65306
      end
      object Label26: TLabel
        Left = 19
        Top = 81
        Width = 96
        Height = 12
        Caption = #25805#32437#26041#24335'('#22823#36710')'#65306
      end
      object Label25: TLabel
        Left = 19
        Top = 59
        Width = 96
        Height = 12
        Caption = #25805#32437#26041#24335'('#23567#36710')'#65306
      end
      object Label59: TLabel
        Left = 276
        Top = 16
        Width = 96
        Height = 12
        Caption = #25805#32437#26041#24335'('#26059#36716')'#65306
      end
      object Label60: TLabel
        Left = 276
        Top = 38
        Width = 96
        Height = 12
        Caption = #25805#32437#26041#24335'('#21464#24133')'#65306
      end
      object Label61: TLabel
        Left = 276
        Top = 60
        Width = 96
        Height = 12
        Caption = #25805#32437#26041#24335'('#36816#34892')'#65306
      end
      object dxDBPickEdit16: TdxDBPickEdit
        Left = 114
        Top = 11
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 0
        DataField = 'pri_control_type'
        DataSource = TechInfod
        DropDownListStyle = True
      end
      object dxDBPickEdit17: TdxDBPickEdit
        Left = 114
        Top = 33
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 1
        DataField = 'sec_control_type'
        DataSource = TechInfod
        DropDownListStyle = True
      end
      object dxDBPickEdit18: TdxDBPickEdit
        Left = 114
        Top = 55
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 2
        DataField = 'scar_control_type'
        DataSource = TechInfod
        DropDownListStyle = True
      end
      object dxDBPickEdit19: TdxDBPickEdit
        Left = 114
        Top = 77
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 3
        DataField = 'bcar_control_type'
        DataSource = TechInfod
        DropDownListStyle = True
      end
      object dxDBPickEdit20: TdxDBPickEdit
        Left = 371
        Top = 11
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 4
        DataField = 'circ_control_type'
        DataSource = TechInfod
        DropDownListStyle = True
      end
      object dxDBPickEdit21: TdxDBPickEdit
        Left = 371
        Top = 33
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 5
        DataField = 'crange_control_type'
        DataSource = TechInfod
        DropDownListStyle = True
      end
      object dxDBPickEdit22: TdxDBPickEdit
        Left = 371
        Top = 55
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 6
        DataField = 'run_control_type'
        DataSource = TechInfod
        DropDownListStyle = True
      end
    end
    object GroupBox3: TGroupBox
      Left = 6
      Top = 487
      Width = 214
      Height = 103
      Caption = ' '#23548#30005#26041#24335' '
      TabOrder = 24
      object Label27: TLabel
        Left = 9
        Top = 15
        Width = 96
        Height = 12
        Caption = #23548#30005#26041#24335'('#23567#36710')'#65306
      end
      object Label30: TLabel
        Left = 9
        Top = 37
        Width = 96
        Height = 12
        Caption = #23548#30005#26041#24335'('#22823#36710')'#65306
      end
      object Label62: TLabel
        Left = 9
        Top = 59
        Width = 96
        Height = 12
        Caption = #23548#30005#26041#24335'('#26059#36716')'#65306
      end
      object Label63: TLabel
        Left = 9
        Top = 81
        Width = 96
        Height = 12
        Caption = #23548#30005#26041#24335'('#36816#34892')'#65306
      end
      object dxDBPickEdit12: TdxDBPickEdit
        Left = 104
        Top = 11
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 0
        DataField = 'scar_conduct_type'
        DataSource = TechInfod
        DropDownListStyle = True
      end
      object dxDBPickEdit13: TdxDBPickEdit
        Left = 104
        Top = 33
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 1
        DataField = 'bcar_conduct_type'
        DataSource = TechInfod
        DropDownListStyle = True
      end
      object dxDBPickEdit14: TdxDBPickEdit
        Left = 104
        Top = 55
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 2
        DataField = 'circ_conduct_type'
        DataSource = TechInfod
        DropDownListStyle = True
      end
      object dxDBPickEdit15: TdxDBPickEdit
        Left = 104
        Top = 77
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 3
        DataField = 'run_conduct_type'
        DataSource = TechInfod
        DropDownListStyle = True
      end
    end
    object GroupBox4: TGroupBox
      Left = 492
      Top = 378
      Width = 256
      Height = 105
      Caption = ' '#33218#26550' '
      TabOrder = 23
      object Label54: TLabel
        Left = 26
        Top = 15
        Width = 84
        Height = 12
        Caption = #33218#26550#31995#32479#22411#24335#65306
      end
      object Label55: TLabel
        Left = 14
        Top = 38
        Width = 96
        Height = 12
        Caption = #33218#26550#38271#24230'('#26368#23567')'#65306
      end
      object Label56: TLabel
        Left = 14
        Top = 60
        Width = 96
        Height = 12
        Caption = #33218#26550#38271#24230'('#26368#22823')'#65306
      end
      object Label57: TLabel
        Left = 26
        Top = 82
        Width = 84
        Height = 12
        Caption = #33218#26550#20280#32553#36895#24230#65306
      end
      object Label70: TLabel
        Left = 214
        Top = 38
        Width = 6
        Height = 12
        Caption = 'm'
      end
      object Label71: TLabel
        Left = 214
        Top = 60
        Width = 6
        Height = 12
        Caption = 'm'
      end
      object Label72: TLabel
        Left = 214
        Top = 80
        Width = 30
        Height = 12
        Caption = 'm/min'
      end
      object DBEdit53: TDBEditEh
        Left = 110
        Top = 35
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'min_shelf'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit54: TDBEditEh
        Left = 110
        Top = 57
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'max_shelf'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
      object DBEdit55: TDBEditEh
        Left = 110
        Top = 79
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'shelf_speed'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 3
        Visible = True
      end
      object dxDBPickEdit11: TdxDBPickEdit
        Left = 109
        Top = 11
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 0
        DataField = 'shelf_modal'
        DataSource = TechInfod
        DropDownListStyle = True
      end
    end
    object GroupBox5: TGroupBox
      Left = 492
      Top = 291
      Width = 256
      Height = 84
      Caption = ' '#26059#36716#26426#26500' '
      TabOrder = 21
      object Label49: TLabel
        Left = 7
        Top = 15
        Width = 108
        Height = 12
        Caption = #26059#36716#25903#25215#35013#32622#22411#24335#65306
      end
      object Label50: TLabel
        Left = 7
        Top = 38
        Width = 108
        Height = 12
        Caption = #26059#36716#39537#21160#35013#32622#22411#24335#65306
      end
      object Label51: TLabel
        Left = 55
        Top = 59
        Width = 60
        Height = 12
        Caption = #26059#36716#36895#24230#65306
      end
      object Label73: TLabel
        Left = 219
        Top = 60
        Width = 30
        Height = 12
        Caption = 'm/min'
      end
      object DBEdit51: TDBEditEh
        Left = 115
        Top = 57
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'circ_speed'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
      object dxDBPickEdit6: TdxDBPickEdit
        Left = 114
        Top = 11
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 0
        DataField = 'circ_bear_modal'
        DataSource = TechInfod
        DropDownListStyle = True
      end
      object dxDBPickEdit7: TdxDBPickEdit
        Left = 114
        Top = 34
        Width = 102
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 1
        DataField = 'circ_drive_modal'
        DataSource = TechInfod
        DropDownListStyle = True
      end
    end
    object GroupBox6: TGroupBox
      Left = 6
      Top = 138
      Width = 478
      Height = 150
      Caption = ' '#36215#21319#26426#26500' '
      TabOrder = 18
      object Label6: TLabel
        Left = 21
        Top = 16
        Width = 84
        Height = 12
        Caption = #25552#21319#39640#24230'('#20027')'#65306
      end
      object Label7: TLabel
        Left = 255
        Top = 16
        Width = 84
        Height = 12
        Caption = #25552#21319#39640#24230'('#21103')'#65306
      end
      object Label9: TLabel
        Left = 21
        Top = 38
        Width = 84
        Height = 12
        Caption = #25552#21319#36895#24230'('#20027')'#65306
      end
      object Label33: TLabel
        Left = 255
        Top = 38
        Width = 84
        Height = 12
        Caption = #25552#21319#36895#24230'('#21103')'#65306
      end
      object Label11: TLabel
        Left = 21
        Top = 60
        Width = 84
        Height = 12
        Caption = #19979#25918#28145#24230'('#20027')'#65306
      end
      object Label12: TLabel
        Left = 255
        Top = 60
        Width = 84
        Height = 12
        Caption = #19979#25918#28145#24230'('#21103')'#65306
      end
      object Label13: TLabel
        Left = 45
        Top = 82
        Width = 60
        Height = 12
        Caption = #20493#29575'('#20027')'#65306
      end
      object Label14: TLabel
        Left = 279
        Top = 82
        Width = 60
        Height = 12
        Caption = #20493#29575'('#21103')'#65306
      end
      object Label17: TLabel
        Left = 9
        Top = 104
        Width = 96
        Height = 12
        Caption = #38050#19997#32499#22411#21495'('#20027')'#65306
      end
      object Label18: TLabel
        Left = 243
        Top = 104
        Width = 96
        Height = 12
        Caption = #38050#19997#32499#22411#21495'('#21103')'#65306
      end
      object Label39: TLabel
        Left = 9
        Top = 126
        Width = 96
        Height = 12
        Caption = #20027#36215#21319#21046#21160#22120#25968#65306
      end
      object Label74: TLabel
        Left = 209
        Top = 16
        Width = 6
        Height = 12
        Caption = 'm'
      end
      object Label75: TLabel
        Left = 209
        Top = 38
        Width = 30
        Height = 12
        Caption = 'm/min'
      end
      object Label76: TLabel
        Left = 209
        Top = 60
        Width = 6
        Height = 12
        Caption = 'm'
      end
      object Label77: TLabel
        Left = 209
        Top = 104
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label78: TLabel
        Left = 443
        Top = 17
        Width = 6
        Height = 12
        Caption = 'm'
      end
      object Label79: TLabel
        Left = 443
        Top = 38
        Width = 30
        Height = 12
        Caption = 'm/min'
      end
      object Label80: TLabel
        Left = 443
        Top = 60
        Width = 6
        Height = 12
        Caption = 'm'
      end
      object Label81: TLabel
        Left = 443
        Top = 103
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label101: TLabel
        Left = 231
        Top = 126
        Width = 108
        Height = 12
        Caption = #38050#19997#32499#22411#21495'('#21464#24133')'#65306
      end
      object Label102: TLabel
        Left = 442
        Top = 125
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object DBEdit6: TDBEditEh
        Left = 105
        Top = 13
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'pri_raise_height'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object DBEdit7: TDBEditEh
        Left = 339
        Top = 13
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'sec_raise_height'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit9: TDBEditEh
        Left = 105
        Top = 35
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'pri_raise_speed'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
      object DBEdit10: TDBEditEh
        Left = 339
        Top = 35
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'sec_raise_speed'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 3
        Visible = True
      end
      object DBEdit12: TDBEditEh
        Left = 105
        Top = 57
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'pri_down_depth'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 4
        Visible = True
      end
      object DBEdit13: TDBEditEh
        Left = 339
        Top = 57
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'sec_down_depth'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 5
        Visible = True
      end
      object DBEdit14: TDBEditEh
        Left = 105
        Top = 79
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'pri_multiple'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 6
        Visible = True
      end
      object DBEdit15: TDBEditEh
        Left = 339
        Top = 79
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'sec_multiple'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 7
        Visible = True
      end
      object DBEdit18: TDBEditEh
        Left = 105
        Top = 101
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'pri_rope_type'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 8
        Visible = True
      end
      object DBEdit19: TDBEditEh
        Left = 339
        Top = 101
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'sec_rope_type'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 9
        Visible = True
      end
      object DBEdit37: TDBEditEh
        Left = 105
        Top = 123
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'arrester_num'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 10
        Visible = True
      end
      object DBEditEh1: TDBEditEh
        Left = 339
        Top = 123
        Width = 100
        Height = 18
        Alignment = taLeftJustify
        Ctl3D = False
        DataField = 'crange_rope_type'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 11
        Visible = True
      end
    end
    object GroupBox7: TGroupBox
      Left = 6
      Top = 291
      Width = 478
      Height = 84
      Caption = ' '#23567#36710#26426#26500' '
      TabOrder = 20
      object Label15: TLabel
        Left = 45
        Top = 60
        Width = 60
        Height = 12
        Caption = #23567#36710#36895#24230#65306
      end
      object Label35: TLabel
        Left = 279
        Top = 60
        Width = 60
        Height = 12
        Caption = #23567#36710#25968#37327#65306
      end
      object Label34: TLabel
        Left = 279
        Top = 38
        Width = 60
        Height = 12
        Caption = #23567#36710#36712#36317#65306
      end
      object Label38: TLabel
        Left = 267
        Top = 16
        Width = 72
        Height = 12
        Caption = #24037#23383#38050#22411#21495#65306
      end
      object Label36: TLabel
        Left = 15
        Top = 16
        Width = 90
        Height = 12
        Caption = #30005#21160#33899#33446#22411#21495'1'#65306
      end
      object Label37: TLabel
        Left = 15
        Top = 38
        Width = 90
        Height = 12
        Caption = #30005#21160#33899#33446#22411#21495'2'#65306
      end
      object Label82: TLabel
        Left = 208
        Top = 58
        Width = 30
        Height = 12
        Caption = 'm/min'
      end
      object Label83: TLabel
        Left = 443
        Top = 36
        Width = 6
        Height = 12
        Caption = 'm'
      end
      object DBEdit16: TDBEditEh
        Left = 105
        Top = 57
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'scar_speed'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
      object DBEdit33: TDBEditEh
        Left = 339
        Top = 57
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'scar_amount'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 5
        Visible = True
      end
      object DBEdit32: TDBEditEh
        Left = 339
        Top = 35
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'scar_gauge'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 4
        Visible = True
      end
      object DBEdit36: TDBEditEh
        Left = 339
        Top = 13
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'steel_type'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 3
        Visible = True
      end
      object DBEdit34: TDBEditEh
        Left = 105
        Top = 13
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'elec_gourd_type1'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object DBEdit35: TDBEditEh
        Left = 105
        Top = 35
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'elec_gourd_type2'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox8: TGroupBox
      Left = 492
      Top = 138
      Width = 256
      Height = 84
      Caption = ' '#22823#36710#26426#26500' '
      TabOrder = 19
      object Label16: TLabel
        Left = 43
        Top = 16
        Width = 60
        Height = 12
        Caption = #22823#36710#36895#24230#65306
      end
      object Label31: TLabel
        Left = 19
        Top = 38
        Width = 84
        Height = 12
        Caption = #22823#36710#36712#36947#22411#21495#65306
      end
      object Label32: TLabel
        Left = 19
        Top = 60
        Width = 84
        Height = 12
        Caption = #22823#36710#36712#36947#38271#24230#65306
      end
      object Label84: TLabel
        Left = 207
        Top = 16
        Width = 30
        Height = 12
        Caption = 'm/min'
      end
      object Label85: TLabel
        Left = 207
        Top = 59
        Width = 6
        Height = 12
        Caption = 'm'
      end
      object DBEdit17: TDBEditEh
        Left = 103
        Top = 13
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'bcar_speed'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object DBEdit30: TDBEditEh
        Left = 103
        Top = 35
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'track_type'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit31: TDBEditEh
        Left = 103
        Top = 57
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'track_length'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
    end
    object dxDBPickEdit1: TdxDBPickEdit
      Left = 111
      Top = 114
      Width = 123
      Color = clSkyBlue
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 15
      DataField = 'work_level'
      DataSource = TechInfod
      DropDownListStyle = True
    end
    object dxDBPickEdit2: TdxDBPickEdit
      Left = 610
      Top = 3
      Width = 123
      Color = clSkyBlue
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 2
      DataField = 'country_type'
      DataSource = TechInfod
      DropDownListStyle = True
    end
    object dxDBPickEdit3: TdxDBPickEdit
      Left = 610
      Top = 91
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 14
      DataField = 'fetch_type'
      DataSource = TechInfod
      DropDownListStyle = True
      CanDeleteText = True
    end
    object dxDBPickEdit4: TdxDBPickEdit
      Left = 364
      Top = 91
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 13
      DataField = 'door_shelf_modal'
      DataSource = TechInfod
      DropDownListStyle = True
    end
    object dxDBPickEdit5: TdxDBPickEdit
      Left = 610
      Top = 113
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 16
      DataField = 'driver_type'
      DataSource = TechInfod
      DropDownListStyle = True
    end
    object DBEdit3: TDBEditEh
      Left = 595
      Top = 230
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'work_radii_inv'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 17
      Visible = False
    end
    object GroupBox10: TGroupBox
      Left = 761
      Top = 595
      Width = 743
      Height = 64
      TabOrder = 27
      Visible = False
      object Label95: TLabel
        Left = 8
        Top = 16
        Width = 60
        Height = 12
        Caption = #35774#35745#35268#33539#65306
      end
      object Label96: TLabel
        Left = 8
        Top = 40
        Width = 60
        Height = 12
        Caption = #21046#36896#35268#33539#65306
      end
      object Label97: TLabel
        Left = 524
        Top = 16
        Width = 84
        Height = 12
        Caption = #35774#22791#26032#26087#29366#20917#65306
      end
      object Label98: TLabel
        Left = 548
        Top = 40
        Width = 60
        Height = 12
        Caption = #30417#26816#24418#24335#65306
      end
      object dxDBPickEdit23: TdxDBPickEdit
        Left = 67
        Top = 36
        Width = 450
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 1
        DataField = 'manu_standard'
        DataSource = TechInfod
      end
      object dxDBPickEdit24: TdxDBPickEdit
        Left = 607
        Top = 12
        Width = 112
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 2
        DataField = 'is_secondhand'
        DataSource = TechInfod
      end
      object dxDBPickEdit25: TdxDBPickEdit
        Left = 607
        Top = 36
        Width = 112
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 3
        DataField = 'supervise_type'
        DataSource = TechInfod
      end
      object dxDBPickEdit26: TdxDBPickEdit
        Left = 67
        Top = 12
        Width = 450
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 0
        DataField = 'design_standard'
        DataSource = TechInfod
      end
    end
    object dxDBPickEdit27: TdxDBPickEdit
      Left = 364
      Top = 114
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 28
      DataField = 'fit_env'
      DataSource = TechInfod
      DropDownListStyle = True
    end
    object GroupBox9: TGroupBox
      Left = 6
      Top = 596
      Width = 405
      Height = 61
      Caption = ' '#26045#24037#21319#38477#26426' '
      TabOrder = 29
      object Label105: TLabel
        Left = 9
        Top = 16
        Width = 84
        Height = 12
        Caption = #21514#31548#24037#20316#34892#31243#65306
      end
      object Label106: TLabel
        Left = 215
        Top = 39
        Width = 72
        Height = 12
        Caption = #38050#19997#32499#30452#24452#65306
      end
      object Label107: TLabel
        Left = 33
        Top = 37
        Width = 60
        Height = 12
        Caption = #26550#35774#39640#24230#65306
      end
      object Label109: TLabel
        Left = 215
        Top = 16
        Width = 72
        Height = 12
        Caption = #33258#30001#31471#39640#24230#65306
      end
      object Label111: TLabel
        Left = 197
        Top = 16
        Width = 6
        Height = 12
        Caption = 'm'
      end
      object Label112: TLabel
        Left = 197
        Top = 38
        Width = 6
        Height = 12
        Caption = 'm'
      end
      object Label114: TLabel
        Left = 391
        Top = 15
        Width = 6
        Height = 12
        Caption = 'm'
      end
      object Label115: TLabel
        Left = 391
        Top = 37
        Width = 6
        Height = 12
        Caption = 'm'
      end
      object DBEditEh3: TDBEditEh
        Left = 93
        Top = 13
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'cage_work_length'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object DBEditEh4: TDBEditEh
        Left = 287
        Top = 35
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'rope_dia'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 3
        Visible = True
      end
      object DBEditEh5: TDBEditEh
        Left = 93
        Top = 35
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'span_height'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
      object DBEditEh6: TDBEditEh
        Left = 287
        Top = 13
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'top_height'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
    end
  end
  inherited TechInfo: TCSADOQuery
    CursorType = ctStatic
    SQL.Strings = (
      'select * from device.hoist_info where id is null')
  end
end
