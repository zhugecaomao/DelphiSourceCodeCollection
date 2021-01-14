inherited fraTruckInfo: TfraTruckInfo
  inherited Panel6: TPanel
    inherited Panel7: TPanel
      inherited navTechInfo: TCSDBNavigator
        Hints.Strings = ()
      end
    end
  end
  inherited ScrollBox1: TScrollBox
    object Label1: TLabel
      Left = 18
      Top = 7
      Width = 60
      Height = 12
      Caption = #35774#22791#22411#21495#65306
    end
    object Label2: TLabel
      Left = 294
      Top = 29
      Width = 60
      Height = 12
      Caption = #20986#21378#32534#21495#65306
    end
    object Label4: TLabel
      Left = 18
      Top = 184
      Width = 60
      Height = 12
      Caption = #24037#20316#29615#22659#65306
    end
    object Label5: TLabel
      Left = 294
      Top = 7
      Width = 60
      Height = 12
      Caption = #29260#29031#21495#30721#65306
    end
    object Label6: TLabel
      Left = 562
      Top = 29
      Width = 60
      Height = 12
      Caption = #24213#30424#32534#21495#65306
    end
    object Label29: TLabel
      Left = 562
      Top = 6
      Width = 60
      Height = 12
      Caption = #20986#21378#26085#26399#65306
    end
    object Label30: TLabel
      Left = 18
      Top = 28
      Width = 60
      Height = 12
      Caption = #20135#21697#22269#21035#65306
    end
    object Label31: TLabel
      Left = 294
      Top = 51
      Width = 60
      Height = 12
      Caption = #39069#23450#36733#37325#65306
    end
    object Label8: TLabel
      Left = 18
      Top = 51
      Width = 60
      Height = 12
      Caption = #31354#36710#37325#37327#65306
    end
    object Label9: TLabel
      Left = 318
      Top = 137
      Width = 36
      Height = 12
      Caption = #39537#21160#65306
    end
    object Label10: TLabel
      Left = 294
      Top = 72
      Width = 60
      Height = 12
      Caption = #29123#26009#31181#31867#65306
    end
    object Label11: TLabel
      Left = 562
      Top = 73
      Width = 60
      Height = 12
      Caption = #36710#36523#39068#33394#65306
    end
    object Label12: TLabel
      Left = 294
      Top = 93
      Width = 60
      Height = 12
      Caption = #36816#34892#36895#24230#65306
    end
    object Label13: TLabel
      Left = 562
      Top = 95
      Width = 60
      Height = 12
      Caption = #36716#21521#20301#32622#65306
    end
    object Label14: TLabel
      Left = 30
      Top = 117
      Width = 48
      Height = 12
      Caption = #21069#36718#36317#65306
    end
    object Label15: TLabel
      Left = 306
      Top = 115
      Width = 48
      Height = 12
      Caption = #21518#36718#36317#65306
    end
    object Label23: TLabel
      Left = 556
      Top = 117
      Width = 66
      Height = 12
      Caption = #36724#36317'(1-2)'#65306
    end
    object Label24: TLabel
      Left = 12
      Top = 139
      Width = 66
      Height = 12
      Caption = #36724#36317'(2-3)'#65306
    end
    object Label25: TLabel
      Left = 550
      Top = 139
      Width = 72
      Height = 12
      Caption = #26377#21542#25302#25346#36710#65306
    end
    object Label27: TLabel
      Left = 550
      Top = 51
      Width = 72
      Height = 12
      Caption = #25302#25346#24635#36136#37327#65306
    end
    object Label28: TLabel
      Left = 18
      Top = 161
      Width = 60
      Height = 12
      Caption = #36733#23458#20154#25968#65306
    end
    object Label32: TLabel
      Left = 282
      Top = 159
      Width = 72
      Height = 12
      Caption = #39550#39542#23460#20154#25968#65306
    end
    object Label33: TLabel
      Left = 562
      Top = 161
      Width = 60
      Height = 12
      Caption = #21160#21147#26041#24335#65306
    end
    object Label34: TLabel
      Left = 18
      Top = 95
      Width = 60
      Height = 12
      Caption = #26639#26495#39640#24230#65306
    end
    object Label35: TLabel
      Left = 18
      Top = 73
      Width = 60
      Height = 12
      Caption = #38376#26550#21495#30721#65306
    end
    object Label40: TLabel
      Left = 203
      Top = 52
      Width = 12
      Height = 12
      Caption = 'kg'
    end
    object Label41: TLabel
      Left = 203
      Top = 96
      Width = 12
      Height = 12
      Caption = 'mm'
    end
    object Label42: TLabel
      Left = 203
      Top = 117
      Width = 12
      Height = 12
      Caption = 'mm'
    end
    object Label43: TLabel
      Left = 203
      Top = 139
      Width = 12
      Height = 12
      Caption = 'mm'
    end
    object Label44: TLabel
      Left = 480
      Top = 51
      Width = 12
      Height = 12
      Caption = 'kg'
    end
    object Label45: TLabel
      Left = 480
      Top = 94
      Width = 24
      Height = 12
      Caption = 'Km/h'
    end
    object Label46: TLabel
      Left = 480
      Top = 114
      Width = 12
      Height = 12
      Caption = 'mm'
    end
    object Label47: TLabel
      Left = 747
      Top = 51
      Width = 12
      Height = 12
      Caption = 'kg'
    end
    object Label48: TLabel
      Left = 747
      Top = 116
      Width = 12
      Height = 12
      Caption = 'mm'
    end
    object Label49: TLabel
      Left = 8
      Top = 294
      Width = 36
      Height = 12
      Caption = #22791#27880#65306
    end
    object DBEdit1: TDBEditEh
      Left = 78
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
      Left = 354
      Top = 26
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'manu_no'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 4
      Visible = True
    end
    object DBEdit5: TDBEditEh
      Left = 354
      Top = 4
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'card_no'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 1
      Visible = True
    end
    object DBEdit6: TDBEditEh
      Left = 622
      Top = 26
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'chassis_no'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 5
      Visible = True
    end
    object CSdxDBDateEdit1: TCSdxDBDateEdit
      Left = 621
      Top = 2
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
      Left = 354
      Top = 48
      Width = 121
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'load_value'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 7
      Visible = True
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 205
      Width = 173
      Height = 84
      Caption = ' '#30005#21160#26426' '
      TabOrder = 25
      object Label26: TLabel
        Left = 7
        Top = 16
        Width = 36
        Height = 12
        Caption = #22411#21495#65306
      end
      object Label3: TLabel
        Left = 7
        Top = 38
        Width = 36
        Height = 12
        Caption = #32534#21495#65306
      end
      object Label7: TLabel
        Left = 7
        Top = 60
        Width = 36
        Height = 12
        Caption = #21151#29575#65306
      end
      object Label36: TLabel
        Left = 147
        Top = 60
        Width = 12
        Height = 12
        Caption = 'Kw'
      end
      object DBEdit26: TDBEditEh
        Left = 43
        Top = 13
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'engine_type'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object DBEdit3: TDBEditEh
        Left = 43
        Top = 35
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'engine_no'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit7: TDBEditEh
        Left = 43
        Top = 57
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'engine_power'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
    end
    object DBEdit8: TDBEditEh
      Left = 78
      Top = 48
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'net_weight'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 6
      Visible = True
    end
    object DBEdit9: TDBEditEh
      Left = 354
      Top = 134
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'drive_type'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 19
      Visible = True
    end
    object DBEdit11: TDBEditEh
      Left = 622
      Top = 70
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'truck_color'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 11
      Visible = True
    end
    object DBEdit12: TDBEditEh
      Left = 354
      Top = 90
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'speed'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 13
      Visible = True
    end
    object DBEdit14: TDBEditEh
      Left = 78
      Top = 114
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'fwheel_dis'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 15
      Visible = True
    end
    object DBEdit15: TDBEditEh
      Left = 354
      Top = 112
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'bwheel_dis'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 16
      Visible = True
    end
    object GroupBox1: TGroupBox
      Left = 186
      Top = 205
      Width = 161
      Height = 84
      Caption = ' '#36710#36742#22806#24418' '
      TabOrder = 26
      object Label16: TLabel
        Left = 7
        Top = 16
        Width = 24
        Height = 12
        Caption = #38271#65306
      end
      object Label17: TLabel
        Left = 7
        Top = 38
        Width = 24
        Height = 12
        Caption = #23485#65306
      end
      object Label18: TLabel
        Left = 7
        Top = 60
        Width = 24
        Height = 12
        Caption = #39640#65306
      end
      object Label37: TLabel
        Left = 135
        Top = 16
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label38: TLabel
        Left = 135
        Top = 38
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label39: TLabel
        Left = 135
        Top = 60
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object DBEdit16: TDBEditEh
        Left = 31
        Top = 13
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'truck_length'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object DBEdit17: TDBEditEh
        Left = 31
        Top = 35
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'truck_width'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit18: TDBEditEh
        Left = 31
        Top = 57
        Width = 100
        Height = 18
        Ctl3D = False
        DataField = 'truck_height'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
    end
    object GroupBox3: TGroupBox
      Left = 354
      Top = 205
      Width = 413
      Height = 65
      Caption = ' '#36718#32974#35268#26684#21450#25968#37327' '
      TabOrder = 27
      object Label19: TLabel
        Left = 7
        Top = 18
        Width = 72
        Height = 12
        Caption = #21069#36718#32974#35268#26684#65306
      end
      object Label20: TLabel
        Left = 7
        Top = 40
        Width = 72
        Height = 12
        Caption = #21069#36718#32974#25968#37327#65306
      end
      object Label21: TLabel
        Left = 211
        Top = 18
        Width = 72
        Height = 12
        Caption = #21518#36718#32974#35268#26684#65306
      end
      object Label22: TLabel
        Left = 211
        Top = 40
        Width = 72
        Height = 12
        Caption = #21518#36718#32974#25968#37327#65306
      end
      object DBEdit19: TDBEditEh
        Left = 79
        Top = 15
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'fwheel_type'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object DBEdit20: TDBEditEh
        Left = 79
        Top = 37
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'fwheel_num'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
      object DBEdit21: TDBEditEh
        Left = 283
        Top = 15
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'bwheel_type'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit22: TDBEditEh
        Left = 283
        Top = 37
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'bwheel_num'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 3
        Visible = True
      end
    end
    object DBEdit23: TDBEditEh
      Left = 622
      Top = 114
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'axes_dis1'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 17
      Visible = True
    end
    object DBEdit24: TDBEditEh
      Left = 78
      Top = 136
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'axes_dis2'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 18
      Visible = True
    end
    object DBEdit27: TDBEditEh
      Left = 622
      Top = 48
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'total_load_value'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 8
      Visible = True
    end
    object DBEdit30: TDBEditEh
      Left = 78
      Top = 158
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'load_person'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 21
      Visible = True
    end
    object DBEdit31: TDBEditEh
      Left = 354
      Top = 156
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'driver_person'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 22
      Visible = True
    end
    object DBEdit33: TDBEditEh
      Left = 78
      Top = 92
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'board_height'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 12
      Visible = True
    end
    object DBEdit34: TDBEditEh
      Left = 78
      Top = 70
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'door_no'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 9
      Visible = True
    end
    object dxDBPickEdit3: TdxDBPickEdit
      Left = 353
      Top = 68
      Width = 123
      Color = clSkyBlue
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 10
      DataField = 'fuel_type'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      DropDownListStyle = True
    end
    object dxDBPickEdit1: TdxDBPickEdit
      Left = 622
      Top = 135
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 20
      DataField = 'trailer'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      DropDownListStyle = True
    end
    object dxDBPickEdit2: TdxDBPickEdit
      Left = 622
      Top = 157
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 23
      DataField = 'power_type'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      DropDownListStyle = True
    end
    object dxDBPickEdit4: TdxDBPickEdit
      Left = 77
      Top = 180
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 24
      DataField = 'work_environment'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      DropDownListStyle = True
    end
    object dxDBPickEdit5: TdxDBPickEdit
      Left = 77
      Top = 24
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
    object dxDBPickEdit6: TdxDBPickEdit
      Left = 621
      Top = 91
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 14
      DataField = 'dir_ctrl_type'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      DropDownListStyle = True
    end
    object GroupBox10: TGroupBox
      Left = 8
      Top = 389
      Width = 760
      Height = 64
      TabOrder = 28
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
        TabOrder = 1
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
        TabOrder = 2
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
      Top = 308
      Width = 762
      Style.BorderStyle = xbsSingle
      TabOrder = 29
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
