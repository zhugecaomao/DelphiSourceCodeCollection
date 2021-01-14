inherited fraVesselInfo: TfraVesselInfo
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 107
    Width = 443
    Height = 3
    Cursor = crSizeNS
    Align = alBottom
  end
  inherited Panel6: TPanel
    Top = 79
    inherited Panel7: TPanel
      Left = 290
      Width = 152
      inherited navTechInfo: TCSDBNavigator
        Left = 0
        Hints.Strings = ()
      end
    end
  end
  inherited ScrollBox1: TScrollBox
    Height = 79
    object Label1: TLabel
      Left = 250
      Top = 35
      Width = 60
      Height = 12
      Caption = #21046#36896#26085#26399#65306
    end
    object Label2: TLabel
      Left = 32
      Top = 35
      Width = 48
      Height = 12
      Caption = #21046#36896#22269#65306
    end
    object Label3: TLabel
      Left = 250
      Top = 11
      Width = 60
      Height = 12
      Caption = #20986#21378#32534#21495#65306
    end
    object Label4: TLabel
      Left = 238
      Top = 107
      Width = 72
      Height = 12
      Caption = #20869#24452'('#35268#26684')'#65306
    end
    object Label13: TLabel
      Left = 249
      Top = 83
      Width = 60
      Height = 12
      Caption = #23481#22120#23481#31215#65306
    end
    object Label14: TLabel
      Left = 8
      Top = 107
      Width = 72
      Height = 12
      Caption = #23481#22120#38271'('#39640')'#65306
    end
    object Label15: TLabel
      Left = 16
      Top = 501
      Width = 60
      Height = 12
      Caption = #22771#20307#37325#37327#65306
    end
    object Label16: TLabel
      Left = 246
      Top = 501
      Width = 60
      Height = 12
      Caption = #20869#20214#37325#37327#65306
    end
    object Label17: TLabel
      Left = 478
      Top = 501
      Width = 60
      Height = 12
      Caption = #20805#35013#37325#37327#65306
    end
    object Label18: TLabel
      Left = 459
      Top = 35
      Width = 84
      Height = 12
      Caption = #26377#26080#20445#28201#32477#28909#65306
    end
    object Label37: TLabel
      Left = 20
      Top = 59
      Width = 60
      Height = 12
      Caption = #23481#22120#22270#21495#65306
    end
    object Label38: TLabel
      Left = 250
      Top = 59
      Width = 60
      Height = 12
      Caption = #35774#35745#26085#26399#65306
    end
    object Label46: TLabel
      Left = 20
      Top = 83
      Width = 60
      Height = 12
      Caption = #23553#22836#22411#24335#65306
    end
    object Label47: TLabel
      Left = 482
      Top = 59
      Width = 60
      Height = 12
      Caption = #25903#24231#22411#24335#65306
    end
    object Label62: TLabel
      Left = 20
      Top = 11
      Width = 60
      Height = 12
      Caption = #23481#22120#22411#24335#65306
    end
    object Label63: TLabel
      Left = 470
      Top = 11
      Width = 72
      Height = 12
      Caption = #26159#21542#24555#24320#38376#65306
    end
    object Label34: TLabel
      Left = 205
      Top = 107
      Width = 12
      Height = 12
      Caption = 'mm'
    end
    object Label35: TLabel
      Left = 201
      Top = 501
      Width = 12
      Height = 12
      Caption = 'kg'
    end
    object Label36: TLabel
      Left = 489
      Top = 107
      Width = 12
      Height = 12
      Caption = 'mm'
    end
    object Label45: TLabel
      Left = 431
      Top = 501
      Width = 12
      Height = 12
      Caption = 'kg'
    end
    object Label50: TLabel
      Left = 434
      Top = 83
      Width = 6
      Height = 12
      Caption = 'M'
    end
    object Label59: TLabel
      Left = 664
      Top = 501
      Width = 12
      Height = 12
      Caption = 'kg'
    end
    object Label110: TLabel
      Left = 9
      Top = 1050
      Width = 36
      Height = 12
      Caption = #22791#27880#65306
    end
    object Label74: TLabel
      Left = 482
      Top = 83
      Width = 60
      Height = 12
      Caption = #25442#28909#38754#31215#65306
    end
    object Label121: TLabel
      Left = 668
      Top = 83
      Width = 6
      Height = 12
      Caption = 'M'
    end
    object Label122: TLabel
      Left = 676
      Top = 81
      Width = 5
      Height = 10
      Caption = '2'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label123: TLabel
      Left = 440
      Top = 78
      Width = 5
      Height = 10
      Caption = '3'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object DBEdit1: TDBEditEh
      Left = 80
      Top = 32
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'manu_country'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 3
      Visible = True
    end
    object DBEdit5: TDBEditEh
      Left = 310
      Top = 8
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
    object DBEdit7: TDBEditEh
      Left = 310
      Top = 104
      Width = 173
      Height = 18
      Ctl3D = False
      DataField = 'inner_dia'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 13
      Visible = True
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 190
      Width = 198
      Height = 85
      Caption = ' '#35774#35745#21387#21147' '
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 15
      object Label64: TLabel
        Left = 8
        Top = 17
        Width = 72
        Height = 12
        Caption = #22771#31243'('#20869#32966')'#65306
      end
      object Label65: TLabel
        Left = 8
        Top = 39
        Width = 36
        Height = 12
        Caption = #31649#31243#65306
      end
      object Label66: TLabel
        Left = 8
        Top = 61
        Width = 36
        Height = 12
        Caption = #22841#22871#65306
      end
      object Label60: TLabel
        Left = 169
        Top = 17
        Width = 18
        Height = 12
        Caption = 'MPa'
      end
      object Label61: TLabel
        Left = 169
        Top = 39
        Width = 18
        Height = 12
        Caption = 'MPa'
      end
      object Label77: TLabel
        Left = 169
        Top = 61
        Width = 18
        Height = 12
        Caption = 'MPa'
      end
      object DBEdit12: TDBEditEh
        Left = 80
        Top = 14
        Width = 85
        Height = 18
        Ctl3D = False
        DataField = 'shell_design_pressure'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object DBEdit13: TDBEditEh
        Left = 44
        Top = 36
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'tube_design_pressure'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit14: TDBEditEh
        Left = 44
        Top = 58
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'jacket_design_pressure'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 213
      Top = 190
      Width = 196
      Height = 85
      Caption = ' '#35774#35745#28201#24230' '
      TabOrder = 16
      object Label19: TLabel
        Left = 8
        Top = 17
        Width = 72
        Height = 12
        Caption = #22771#31243'('#20869#32966')'#65306
      end
      object Label22: TLabel
        Left = 8
        Top = 39
        Width = 36
        Height = 12
        Caption = #31649#31243#65306
      end
      object Label25: TLabel
        Left = 8
        Top = 61
        Width = 36
        Height = 12
        Caption = #22841#22871#65306
      end
      object Label78: TLabel
        Left = 169
        Top = 61
        Width = 12
        Height = 12
        Caption = #8451
      end
      object Label79: TLabel
        Left = 169
        Top = 17
        Width = 12
        Height = 12
        Caption = #8451
      end
      object Label80: TLabel
        Left = 169
        Top = 39
        Width = 12
        Height = 12
        Caption = #8451
      end
      object DBEdit15: TDBEditEh
        Left = 80
        Top = 14
        Width = 85
        Height = 18
        Ctl3D = False
        DataField = 'shell_design_temp'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object DBEdit16: TDBEditEh
        Left = 44
        Top = 36
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'tube_design_temp'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit17: TDBEditEh
        Left = 44
        Top = 58
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'jacket_design_temp'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 277
      Width = 198
      Height = 172
      Caption = ' '#20027#20307#26448#36136' '
      TabOrder = 18
      object Label20: TLabel
        Left = 8
        Top = 17
        Width = 72
        Height = 12
        Caption = #31570#20307'('#20869#32966')'#65306
      end
      object Label23: TLabel
        Left = 8
        Top = 39
        Width = 72
        Height = 12
        Caption = #23553#22836'('#20869#32966')'#65306
      end
      object Label26: TLabel
        Left = 8
        Top = 83
        Width = 60
        Height = 12
        Caption = #22841#22871#23553#22836#65306
      end
      object Label67: TLabel
        Left = 8
        Top = 61
        Width = 60
        Height = 12
        Caption = #22841#22871#31570#20307#65306
      end
      object Label75: TLabel
        Left = 8
        Top = 105
        Width = 60
        Height = 12
        Caption = #31649#31243#31570#20307#65306
      end
      object Label76: TLabel
        Left = 8
        Top = 127
        Width = 60
        Height = 12
        Caption = #31649#31243#23553#22836#65306
      end
      object Label104: TLabel
        Left = 32
        Top = 149
        Width = 36
        Height = 12
        Caption = #31649#26495#65306
      end
      object DBEdit21: TDBEditEh
        Left = 80
        Top = 14
        Width = 109
        Height = 18
        Ctl3D = False
        DataField = 'cylinder_material'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object DBEdit22: TDBEditEh
        Left = 80
        Top = 36
        Width = 109
        Height = 18
        Ctl3D = False
        DataField = 'head_material'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit23: TDBEditEh
        Left = 68
        Top = 58
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'jacket_cylinder_material'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
      object DBEdit24: TDBEditEh
        Left = 68
        Top = 80
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'jacket_head_material'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 3
        Visible = True
      end
      object DBEditEh2: TDBEditEh
        Left = 68
        Top = 102
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'tube_cylinder_material'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 4
        Visible = True
      end
      object DBEditEh3: TDBEditEh
        Left = 68
        Top = 124
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'tube_head_material'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 5
        Visible = True
      end
      object DBEditEh4: TDBEditEh
        Left = 68
        Top = 146
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'disc_material'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 6
        Visible = True
      end
    end
    object GroupBox5: TGroupBox
      Left = 213
      Top = 277
      Width = 221
      Height = 172
      Caption = ' '#20844#31216#22721#21402' '
      TabOrder = 19
      object Label5: TLabel
        Left = 8
        Top = 17
        Width = 72
        Height = 12
        Caption = #31570#20307'('#20869#32966')'#65306
      end
      object Label6: TLabel
        Left = 8
        Top = 39
        Width = 72
        Height = 12
        Caption = #23553#22836'('#20869#32966')'#65306
      end
      object Label8: TLabel
        Left = 8
        Top = 61
        Width = 60
        Height = 12
        Caption = #22841#22871#31570#20307#65306
      end
      object Label40: TLabel
        Left = 8
        Top = 83
        Width = 60
        Height = 12
        Caption = #22841#22871#23553#22836#65306
      end
      object Label93: TLabel
        Left = 193
        Top = 61
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label94: TLabel
        Left = 193
        Top = 39
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label95: TLabel
        Left = 193
        Top = 17
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label84: TLabel
        Left = 193
        Top = 83
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label105: TLabel
        Left = 8
        Top = 105
        Width = 60
        Height = 12
        Caption = #31649#31243#31570#20307#65306
      end
      object Label106: TLabel
        Left = 8
        Top = 127
        Width = 60
        Height = 12
        Caption = #31649#31243#23553#22836#65306
      end
      object Label111: TLabel
        Left = 32
        Top = 149
        Width = 36
        Height = 12
        Caption = #31649#26495#65306
      end
      object Label115: TLabel
        Left = 193
        Top = 104
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label116: TLabel
        Left = 193
        Top = 126
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label117: TLabel
        Left = 193
        Top = 148
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object DBEdit25: TDBEditEh
        Left = 80
        Top = 14
        Width = 109
        Height = 18
        Ctl3D = False
        DataField = 'cylinder_thick'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object DBEdit26: TDBEditEh
        Left = 80
        Top = 36
        Width = 109
        Height = 18
        Ctl3D = False
        DataField = 'head_thick'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit27: TDBEditEh
        Left = 68
        Top = 58
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'jacket_cylinder_thick'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
      object DBEdit28: TDBEditEh
        Left = 68
        Top = 80
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'jacket_head_thick'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 3
        Visible = True
      end
      object DBEditEh5: TDBEditEh
        Left = 68
        Top = 102
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'tube_cylinder_thick'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 4
        Visible = True
      end
      object DBEditEh6: TDBEditEh
        Left = 68
        Top = 124
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'tube_head_thick'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 5
        Visible = True
      end
      object DBEditEh7: TDBEditEh
        Left = 68
        Top = 146
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'disc_thick'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 6
        Visible = True
      end
    end
    object GroupBox6: TGroupBox
      Left = 442
      Top = 277
      Width = 224
      Height = 172
      Caption = ' '#33104#34432#35029#37327' '
      TabOrder = 20
      object Label9: TLabel
        Left = 8
        Top = 17
        Width = 72
        Height = 12
        Caption = #31570#20307'('#20869#32966')'#65306
      end
      object Label10: TLabel
        Left = 8
        Top = 39
        Width = 72
        Height = 12
        Caption = #23553#22836'('#20869#32966')'#65306
      end
      object Label12: TLabel
        Left = 8
        Top = 83
        Width = 60
        Height = 12
        Caption = #22841#22871#23553#22836#65306
      end
      object Label41: TLabel
        Left = 8
        Top = 61
        Width = 60
        Height = 12
        Caption = #22841#22871#31570#20307#65306
      end
      object Label85: TLabel
        Left = 193
        Top = 17
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label86: TLabel
        Left = 193
        Top = 39
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label87: TLabel
        Left = 193
        Top = 61
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label88: TLabel
        Left = 193
        Top = 83
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label112: TLabel
        Left = 8
        Top = 105
        Width = 60
        Height = 12
        Caption = #31649#31243#31570#20307#65306
      end
      object Label113: TLabel
        Left = 8
        Top = 127
        Width = 60
        Height = 12
        Caption = #31649#31243#23553#22836#65306
      end
      object Label114: TLabel
        Left = 32
        Top = 149
        Width = 36
        Height = 12
        Caption = #31649#26495#65306
      end
      object Label118: TLabel
        Left = 193
        Top = 104
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label119: TLabel
        Left = 193
        Top = 126
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label120: TLabel
        Left = 193
        Top = 148
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object DBEdit29: TDBEditEh
        Left = 80
        Top = 14
        Width = 109
        Height = 18
        Ctl3D = False
        DataField = 'cylinder_rust'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object DBEdit30: TDBEditEh
        Left = 80
        Top = 36
        Width = 109
        Height = 18
        Ctl3D = False
        DataField = 'head_rust'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit31: TDBEditEh
        Left = 68
        Top = 58
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'jacket_cylinder_rust'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
      object DBEdit32: TDBEditEh
        Left = 68
        Top = 80
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'jacket_head_rust'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 3
        Visible = True
      end
      object DBEditEh8: TDBEditEh
        Left = 68
        Top = 102
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'tube_cylinder_rust'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 4
        Visible = True
      end
      object DBEditEh9: TDBEditEh
        Left = 68
        Top = 124
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'tube_head_rust'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 5
        Visible = True
      end
      object DBEditEh10: TDBEditEh
        Left = 68
        Top = 146
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'disc_rust'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 6
        Visible = True
      end
    end
    object GroupBox3: TGroupBox
      Left = 416
      Top = 190
      Width = 200
      Height = 85
      Caption = ' '#26368#39640#21387#21147' '
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 17
      object Label42: TLabel
        Left = 8
        Top = 39
        Width = 36
        Height = 12
        Caption = #31649#31243#65306
      end
      object Label43: TLabel
        Left = 8
        Top = 17
        Width = 72
        Height = 12
        Caption = #22771#31243'('#20869#32966')'#65306
      end
      object Label44: TLabel
        Left = 8
        Top = 61
        Width = 36
        Height = 12
        Caption = #22841#22871#65306
      end
      object Label81: TLabel
        Left = 169
        Top = 61
        Width = 18
        Height = 12
        Caption = 'MPa'
      end
      object Label82: TLabel
        Left = 169
        Top = 17
        Width = 18
        Height = 12
        Caption = 'MPa'
      end
      object Label83: TLabel
        Left = 169
        Top = 39
        Width = 18
        Height = 12
        Caption = 'MPa'
      end
      object DBEdit18: TDBEditEh
        Left = 80
        Top = 14
        Width = 85
        Height = 18
        Ctl3D = False
        DataField = 'shell_max_pressure'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object DBEdit19: TDBEditEh
        Left = 44
        Top = 36
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'tube_max_pressure'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit20: TDBEditEh
        Left = 44
        Top = 58
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'jacket_max_pressure'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
    end
    object GroupBox8: TGroupBox
      Left = 8
      Top = 701
      Width = 614
      Height = 111
      Caption = ' '#23454#38469#25805#20316#26465#20214' '
      TabOrder = 26
      object GroupBox9: TGroupBox
        Left = 9
        Top = 15
        Width = 194
        Height = 85
        Caption = ' '#21387#21147' '
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object Label28: TLabel
          Left = 8
          Top = 39
          Width = 36
          Height = 12
          Caption = #31649#31243#65306
        end
        object Label29: TLabel
          Left = 8
          Top = 17
          Width = 36
          Height = 12
          Caption = #22771#31243#65306
        end
        object Label30: TLabel
          Left = 8
          Top = 61
          Width = 36
          Height = 12
          Caption = #22841#22871#65306
        end
        object Label89: TLabel
          Left = 169
          Top = 17
          Width = 18
          Height = 12
          Caption = 'MPa'
        end
        object Label90: TLabel
          Left = 169
          Top = 39
          Width = 18
          Height = 12
          Caption = 'MPa'
        end
        object Label91: TLabel
          Left = 169
          Top = 61
          Width = 18
          Height = 12
          Caption = 'MPa'
        end
        object DBEdit35: TDBEditEh
          Left = 44
          Top = 14
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'shell_work_pressure'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object DBEdit36: TDBEditEh
          Left = 44
          Top = 36
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'tube_work_pressure'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
        object DBEdit37: TDBEditEh
          Left = 44
          Top = 58
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'jacket_work_pressure'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 2
          Visible = True
        end
      end
      object GroupBox10: TGroupBox
        Left = 218
        Top = 15
        Width = 196
        Height = 85
        Caption = ' '#28201#24230' '
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 1
        object Label52: TLabel
          Left = 8
          Top = 39
          Width = 36
          Height = 12
          Caption = #31649#31243#65306
        end
        object Label53: TLabel
          Left = 8
          Top = 17
          Width = 36
          Height = 12
          Caption = #22771#31243#65306
        end
        object Label54: TLabel
          Left = 8
          Top = 61
          Width = 36
          Height = 12
          Caption = #22841#22871#65306
        end
        object Label92: TLabel
          Left = 169
          Top = 17
          Width = 12
          Height = 12
          Caption = #8451
        end
        object Label96: TLabel
          Left = 169
          Top = 39
          Width = 12
          Height = 12
          Caption = #8451
        end
        object Label97: TLabel
          Left = 169
          Top = 61
          Width = 12
          Height = 12
          Caption = #8451
        end
        object DBEdit38: TDBEditEh
          Left = 44
          Top = 14
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'shell_work_temp'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object DBEdit39: TDBEditEh
          Left = 44
          Top = 36
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'tube_work_temp'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
        object DBEdit40: TDBEditEh
          Left = 44
          Top = 58
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'jacket_work_temp'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 2
          Visible = True
        end
      end
      object GroupBox11: TGroupBox
        Left = 430
        Top = 15
        Width = 173
        Height = 85
        Caption = ' '#20171#36136' '
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
        object Label70: TLabel
          Left = 8
          Top = 39
          Width = 36
          Height = 12
          Caption = #31649#31243#65306
        end
        object Label71: TLabel
          Left = 8
          Top = 17
          Width = 36
          Height = 12
          Caption = #22771#31243#65306
        end
        object Label72: TLabel
          Left = 8
          Top = 61
          Width = 36
          Height = 12
          Caption = #22841#22871#65306
        end
        object DBEdit41: TDBEditEh
          Left = 44
          Top = 14
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'shell_medium'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object DBEdit42: TDBEditEh
          Left = 44
          Top = 36
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'tube_medium'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
        object DBEdit43: TDBEditEh
          Left = 44
          Top = 58
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'jacket_medium'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 2
          Visible = True
        end
      end
    end
    object GroupBox7: TGroupBox
      Left = 8
      Top = 452
      Width = 399
      Height = 42
      Caption = ' '#20869#34924' '
      TabOrder = 21
      object Label21: TLabel
        Left = 8
        Top = 17
        Width = 60
        Height = 12
        Caption = #20869#34924#26448#26009#65306
      end
      object Label24: TLabel
        Left = 202
        Top = 17
        Width = 60
        Height = 12
        Caption = #20869#34924#22721#21402#65306
      end
      object Label33: TLabel
        Left = 369
        Top = 17
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object DBEdit33: TDBEditEh
        Left = 68
        Top = 14
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'underlay_material'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object DBEdit34: TDBEditEh
        Left = 262
        Top = 14
        Width = 103
        Height = 18
        Ctl3D = False
        DataField = 'underlay_thick'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox12: TGroupBox
      Left = 8
      Top = 817
      Width = 614
      Height = 133
      Caption = ' '#20801#35768#32487#32493#20351#29992#30340#21442#25968' '
      TabOrder = 27
      object Label51: TLabel
        Left = 8
        Top = 109
        Width = 96
        Height = 12
        Caption = #20801#35768#26368#22823#20805#35013#37327#65306
      end
      object Label55: TLabel
        Left = 24
        Top = 24
        Width = 42
        Height = 12
        Caption = 'Label55'
      end
      object Label107: TLabel
        Left = 227
        Top = 111
        Width = 6
        Height = 12
        Caption = 'M'
      end
      object Label150: TLabel
        Left = 233
        Top = 106
        Width = 5
        Height = 10
        Caption = '3'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object GroupBox14: TGroupBox
        Left = 220
        Top = 15
        Width = 193
        Height = 85
        HelpType = htKeyword
        Caption = ' '#28201#24230' '
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 1
        object Label101: TLabel
          Left = 169
          Top = 17
          Width = 12
          Height = 12
          Caption = #8451
        end
        object Label102: TLabel
          Left = 169
          Top = 39
          Width = 12
          Height = 12
          Caption = #8451
        end
        object Label103: TLabel
          Left = 169
          Top = 61
          Width = 12
          Height = 12
          Caption = #8451
        end
        object Label68: TLabel
          Left = 8
          Top = 39
          Width = 36
          Height = 12
          Caption = #31649#31243#65306
        end
        object Label69: TLabel
          Left = 8
          Top = 17
          Width = 36
          Height = 12
          Caption = #22771#31243#65306
        end
        object Label73: TLabel
          Left = 8
          Top = 61
          Width = 36
          Height = 12
          Caption = #22841#22871#65306
        end
        object DBEdit47: TDBEditEh
          Left = 44
          Top = 14
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'permit_shell_temp'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object DBEdit49: TDBEditEh
          Left = 44
          Top = 36
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'permit_tube_temp'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
        object DBEdit51: TDBEditEh
          Left = 44
          Top = 58
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'permit_jacket_temp'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 2
          Visible = True
        end
      end
      object DBEdit53: TDBEditEh
        Left = 104
        Top = 106
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'permit_fill_weight'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 3
        Visible = True
      end
      object GroupBox13: TGroupBox
        Left = 9
        Top = 15
        Width = 194
        Height = 85
        Caption = ' '#21387#21147' '
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object Label56: TLabel
          Left = 8
          Top = 39
          Width = 36
          Height = 12
          Caption = #31649#31243#65306
        end
        object Label57: TLabel
          Left = 8
          Top = 17
          Width = 36
          Height = 12
          Caption = #22771#31243#65306
        end
        object Label58: TLabel
          Left = 8
          Top = 61
          Width = 36
          Height = 12
          Caption = #22841#22871#65306
        end
        object Label98: TLabel
          Left = 169
          Top = 17
          Width = 18
          Height = 12
          Caption = 'MPa'
        end
        object Label99: TLabel
          Left = 169
          Top = 39
          Width = 18
          Height = 12
          Caption = 'MPa'
        end
        object Label100: TLabel
          Left = 169
          Top = 61
          Width = 18
          Height = 12
          Caption = 'MPa'
        end
        object DBEdit44: TDBEditEh
          Left = 44
          Top = 14
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'permit_shell_pressure'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object DBEdit45: TDBEditEh
          Left = 44
          Top = 36
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'permit_tube_pressure'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
        object DBEdit46: TDBEditEh
          Left = 44
          Top = 58
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'permit_jacket_pressure'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 2
          Visible = True
        end
      end
      object GroupBox20: TGroupBox
        Left = 430
        Top = 15
        Width = 173
        Height = 85
        Caption = ' '#20171#36136' '
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
        object Label142: TLabel
          Left = 8
          Top = 39
          Width = 36
          Height = 12
          Caption = #31649#31243#65306
        end
        object Label143: TLabel
          Left = 8
          Top = 17
          Width = 36
          Height = 12
          Caption = #22771#31243#65306
        end
        object Label144: TLabel
          Left = 8
          Top = 61
          Width = 36
          Height = 12
          Caption = #22841#22871#65306
        end
        object DBEditEh20: TDBEditEh
          Left = 44
          Top = 14
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'permit_shell_medium'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object DBEditEh21: TDBEditEh
          Left = 44
          Top = 36
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'permit_tube_medium'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
        object DBEditEh22: TDBEditEh
          Left = 44
          Top = 58
          Width = 121
          Height = 18
          Ctl3D = False
          DataField = 'permit_jacket_medium'
          DataSource = TechInfod
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 2
          Visible = True
        end
      end
    end
    object GroupBox15: TGroupBox
      Left = 8
      Top = 955
      Width = 625
      Height = 41
      Caption = ' '#21307#29992#27687#33329' '
      TabOrder = 28
      object Label7: TLabel
        Left = 8
        Top = 17
        Width = 60
        Height = 12
        Caption = #27687#33329#29031#26126#65306
      end
      object Label11: TLabel
        Left = 198
        Top = 17
        Width = 84
        Height = 12
        Caption = #27687#33329#31354#35843#30005#26426#65306
      end
      object Label49: TLabel
        Left = 412
        Top = 17
        Width = 84
        Height = 12
        Caption = #27687#33329#27979#27687#26041#24335#65306
      end
      object dxDBPickEdit10: TdxDBPickEdit
        Left = 495
        Top = 13
        Width = 123
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 2
        DataField = 'oxy_cabin_mode'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
        DropDownListStyle = True
      end
      object dxDBPickEdit9: TdxDBPickEdit
        Left = 281
        Top = 13
        Width = 123
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 1
        DataField = 'oxy_cabin_elec'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
        DropDownListStyle = True
      end
      object dxDBPickEdit8: TdxDBPickEdit
        Left = 67
        Top = 13
        Width = 123
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 0
        DataField = 'oxy_cabin_light'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
        DropDownListStyle = True
      end
    end
    object GroupBox16: TGroupBox
      Left = 8
      Top = 1001
      Width = 625
      Height = 41
      Caption = ' '#32592'    '#36710' '
      TabOrder = 29
      object Label27: TLabel
        Left = 8
        Top = 17
        Width = 60
        Height = 12
        Caption = #32592#36710#29260#21495#65306
      end
      object Label31: TLabel
        Left = 198
        Top = 17
        Width = 84
        Height = 12
        Caption = #32592#36710#32467#26500#24418#24335#65306
      end
      object Label32: TLabel
        Left = 412
        Top = 17
        Width = 84
        Height = 12
        Caption = #32592#36710#24213#30424#21495#30721#65306
      end
      object DBEdit54: TDBEditEh
        Left = 68
        Top = 14
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'tankcar_no'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object DBEdit55: TDBEditEh
        Left = 282
        Top = 14
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'tankcar_chassis_no'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit56: TDBEditEh
        Left = 496
        Top = 14
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'tankcar_strc_modal'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 2
        Visible = True
      end
    end
    object DBEdit6: TDBEditEh
      Left = 80
      Top = 104
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'length'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 12
      Visible = True
    end
    object DBEdit8: TDBEditEh
      Left = 310
      Top = 80
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'vol'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 10
      Visible = True
    end
    object DBEdit3: TDBEditEh
      Left = 80
      Top = 56
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'drawing_no'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 6
      Visible = True
    end
    object DBEdit11: TDBEditEh
      Left = 539
      Top = 498
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'fill_weight'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 24
      Visible = True
    end
    object DBEdit10: TDBEditEh
      Left = 306
      Top = 498
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'part_weight'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 23
      Visible = True
    end
    object DBEdit9: TDBEditEh
      Left = 76
      Top = 498
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'shell_weight'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 22
      Visible = True
    end
    object CSdxDBDateEdit2: TCSdxDBDateEdit
      Left = 309
      Top = 55
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 7
      DataField = 'design_date'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      FixedDateFormat = 'yyyy-MM-dd'
      StoredValues = 4
    end
    object CSdxDBDateEdit1: TCSdxDBDateEdit
      Left = 309
      Top = 31
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 4
      DataField = 'manu_date'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      FixedDateFormat = 'yyyy-MM-dd'
      StoredValues = 4
    end
    object dxDBPickEdit3: TdxDBPickEdit
      Left = 79
      Top = 79
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 9
      DataField = 'head_modal'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
    end
    object dxDBPickEdit4: TdxDBPickEdit
      Left = 542
      Top = 55
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 8
      DataField = 'suppor_modal'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
    end
    object dxDBPickEdit5: TdxDBPickEdit
      Left = 79
      Top = 7
      Width = 123
      Color = clSkyBlue
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 0
      DataField = 'vessel_modal'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      OnChange = dxDBPickEdit5Change
      DropDownListStyle = True
    end
    object dxDBPickEdit6: TdxDBPickEdit
      Left = 542
      Top = 31
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 5
      DataField = 'attemperator'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      DropDownListStyle = True
    end
    object dxDBPickEdit7: TdxDBPickEdit
      Left = 542
      Top = 7
      Width = 123
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 2
      DataField = 'fast_open_door'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      DropDownListStyle = True
    end
    object GroupBox18: TGroupBox
      Left = 8
      Top = 123
      Width = 657
      Height = 64
      TabOrder = 14
      object Label39: TLabel
        Left = 8
        Top = 16
        Width = 60
        Height = 12
        Caption = #35774#35745#35268#33539#65306
      end
      object Label48: TLabel
        Left = 8
        Top = 40
        Width = 60
        Height = 12
        Caption = #21046#36896#35268#33539#65306
      end
      object Label108: TLabel
        Left = 452
        Top = 16
        Width = 84
        Height = 12
        Caption = #35774#22791#26032#26087#29366#20917#65306
      end
      object Label109: TLabel
        Left = 476
        Top = 40
        Width = 60
        Height = 12
        Caption = #30417#26816#24418#24335#65306
      end
      object dxDBPickEdit15: TdxDBPickEdit
        Left = 67
        Top = 36
        Width = 378
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 1
        DataField = 'manu_standard'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
      end
      object dxDBPickEdit16: TdxDBPickEdit
        Left = 535
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
        Left = 535
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
        Width = 378
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 0
        DataField = 'design_standard'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
      end
    end
    object DBMemo1: TdxDBMemo
      Left = 8
      Top = 1063
      Width = 657
      Style.BorderStyle = xbsSingle
      TabOrder = 30
      DataField = 'remark'
      DataSource = TechInfod
      StyleController = dmData.dxStyleCtrl
      Height = 73
    end
    object DBEditEh1: TDBEditEh
      Left = 543
      Top = 80
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'exchange_heat_area'
      DataSource = TechInfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 11
      Visible = True
    end
    object GroupBox19: TGroupBox
      Left = 10
      Top = 522
      Width = 691
      Height = 175
      Caption = ' '#23433#20840#38468#20214#35774#35745#35201#27714' '
      TabOrder = 25
      object Label124: TLabel
        Left = 12
        Top = 19
        Width = 72
        Height = 12
        Caption = #23433#20840#38400#25968#37327#65306
      end
      object Label125: TLabel
        Left = 12
        Top = 41
        Width = 72
        Height = 12
        Caption = #23433#20840#38400#22411#21495#65306
      end
      object Label126: TLabel
        Left = 12
        Top = 63
        Width = 72
        Height = 12
        Caption = #23433#20840#38400#35268#26684#65306
      end
      object Label127: TLabel
        Left = 12
        Top = 85
        Width = 96
        Height = 12
        Caption = #23433#20840#38400#20844#31216#21387#21147#65306
      end
      object Label128: TLabel
        Left = 12
        Top = 107
        Width = 96
        Height = 12
        Caption = #23433#20840#38400#20844#31216#36890#24452#65306
        Visible = False
      end
      object Label129: TLabel
        Left = 232
        Top = 19
        Width = 72
        Height = 12
        Caption = #21387#21147#34920#25968#37327#65306
      end
      object Label130: TLabel
        Left = 232
        Top = 41
        Width = 72
        Height = 12
        Caption = #21387#21147#34920#37327#31243#65306
      end
      object Label131: TLabel
        Left = 232
        Top = 63
        Width = 72
        Height = 12
        Caption = #21387#21147#34920#31934#24230#65306
      end
      object Label132: TLabel
        Left = 232
        Top = 85
        Width = 72
        Height = 12
        Caption = #28082#38754#35745#22411#24335#65306
      end
      object Label133: TLabel
        Left = 232
        Top = 107
        Width = 72
        Height = 12
        Caption = #28082#38754#35745#31934#24230#65306
      end
      object Label134: TLabel
        Left = 457
        Top = 19
        Width = 72
        Height = 12
        Caption = #29190#30772#29255#25968#37327#65306
      end
      object Label135: TLabel
        Left = 457
        Top = 41
        Width = 72
        Height = 12
        Caption = #29190#30772#29255#22411#21495#65306
      end
      object Label136: TLabel
        Left = 457
        Top = 63
        Width = 72
        Height = 12
        Caption = #29190#30772#29255#35268#26684#65306
      end
      object Label137: TLabel
        Left = 456
        Top = 85
        Width = 96
        Height = 12
        Caption = #29190#30772#29255#20844#31216#21387#21147#65306
      end
      object Label138: TLabel
        Left = 456
        Top = 107
        Width = 96
        Height = 12
        Caption = #29190#30772#29255#20844#31216#30452#24452#65306
      end
      object Label140: TLabel
        Left = 12
        Top = 129
        Width = 96
        Height = 12
        Caption = #32039#24613#20999#26029#38400#22411#24335#65306
      end
      object Label141: TLabel
        Left = 232
        Top = 129
        Width = 96
        Height = 12
        Caption = #32039#24613#20999#26029#38400#35268#26684#65306
      end
      object Label139: TLabel
        Left = 12
        Top = 152
        Width = 72
        Height = 12
        Caption = #28201#24230#35745#22411#24335#65306
      end
      object Label145: TLabel
        Left = 207
        Top = 85
        Width = 18
        Height = 12
        Caption = 'MPa'
      end
      object Label146: TLabel
        Left = 429
        Top = 41
        Width = 18
        Height = 12
        Caption = 'MPa'
      end
      object Label147: TLabel
        Left = 653
        Top = 85
        Width = 18
        Height = 12
        Caption = 'MPa'
      end
      object Label148: TLabel
        Left = 207
        Top = 107
        Width = 12
        Height = 12
        Caption = 'mm'
        Visible = False
      end
      object Label149: TLabel
        Left = 653
        Top = 107
        Width = 12
        Height = 12
        Caption = 'mm'
      end
      object Label151: TLabel
        Left = 456
        Top = 129
        Width = 72
        Height = 12
        Caption = #29190#30772#29255#26448#26009#65306
      end
      object dxDBPickEdit1: TdxDBPickEdit
        Left = 83
        Top = 37
        Width = 123
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 1
        DataField = 'safety_valve_type'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
      end
      object DBEditEh11: TDBEditEh
        Left = 84
        Top = 16
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'safety_valve_num'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 0
        Visible = True
      end
      object dxDBPickEdit2: TdxDBPickEdit
        Left = 83
        Top = 59
        Width = 123
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 2
        DataField = 'safety_valve_spec'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
      end
      object DBEditEh12: TDBEditEh
        Left = 108
        Top = 82
        Width = 97
        Height = 18
        Ctl3D = False
        DataField = 'safety_valve_pressure'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 3
        Visible = True
      end
      object DBEditEh13: TDBEditEh
        Left = 108
        Top = 104
        Width = 97
        Height = 18
        Ctl3D = False
        DataField = 'safety_valve_dia'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 4
        Visible = False
      end
      object DBEditEh14: TDBEditEh
        Left = 304
        Top = 16
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'pressure_num'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 5
        Visible = True
      end
      object dxDBPickEdit11: TdxDBPickEdit
        Left = 303
        Top = 37
        Width = 123
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 6
        DataField = 'pressure_range'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
      end
      object dxDBPickEdit12: TdxDBPickEdit
        Left = 303
        Top = 59
        Width = 123
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 7
        DataField = 'pressure_prec'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
      end
      object dxDBPickEdit13: TdxDBPickEdit
        Left = 303
        Top = 81
        Width = 123
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 8
        DataField = 'liquid_modal'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
      end
      object DBEditEh15: TDBEditEh
        Left = 304
        Top = 104
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'liquid_prec'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 9
        Visible = True
      end
      object DBEditEh16: TDBEditEh
        Left = 529
        Top = 16
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'exploder_num'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 10
        Visible = True
      end
      object dxDBPickEdit18: TdxDBPickEdit
        Left = 528
        Top = 37
        Width = 123
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 11
        DataField = 'exploder_type'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
      end
      object dxDBPickEdit19: TdxDBPickEdit
        Left = 528
        Top = 59
        Width = 123
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 12
        DataField = 'exploder_spec'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
      end
      object DBEditEh17: TDBEditEh
        Left = 553
        Top = 82
        Width = 97
        Height = 18
        Ctl3D = False
        DataField = 'exploder_pressure'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 13
        Visible = True
      end
      object DBEditEh18: TDBEditEh
        Left = 553
        Top = 104
        Width = 97
        Height = 18
        Ctl3D = False
        DataField = 'exploder_dia'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 14
        Visible = True
      end
      object dxDBPickEdit20: TdxDBPickEdit
        Left = 107
        Top = 125
        Width = 99
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 16
        DataField = 'cut_valve_modal'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
      end
      object dxDBPickEdit21: TdxDBPickEdit
        Left = 83
        Top = 148
        Width = 123
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 18
        DataField = 'thermometer_modal'
        DataSource = TechInfod
        StyleController = dmData.dxStyleCtrl
      end
      object DBEditEh19: TDBEditEh
        Left = 328
        Top = 126
        Width = 97
        Height = 18
        Ctl3D = False
        DataField = 'cut_valve_spec'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 17
        Visible = True
      end
      object DBEditEh23: TDBEditEh
        Left = 529
        Top = 126
        Width = 121
        Height = 18
        Ctl3D = False
        DataField = 'exploder_material'
        DataSource = TechInfod
        EditButtons = <>
        ParentCtl3D = False
        TabOrder = 15
        Visible = True
      end
    end
  end
  object GroupBox17: TGroupBox [3]
    Left = 0
    Top = 110
    Width = 443
    Height = 167
    Align = alBottom
    Caption = ' '#23433#20840#38468#20214' '
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 14
      Width = 439
      Height = 123
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      DataSource = VesselSafetyInfod
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      InternalSort = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'dev_id'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'rec_no'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'name'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'type'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'spec'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'num'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'manu'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end>
    end
    object Panel1: TPanel
      Left = 2
      Top = 137
      Width = 439
      Height = 28
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel2: TPanel
        Left = 186
        Top = 1
        Width = 252
        Height = 26
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object navVesselSafetyInfo: TCSDBNavigator
          Left = 100
          Top = 2
          Width = 150
          Height = 22
          DataSource = VesselSafetyInfod
          VisibleButtons = [nbPost, nbCancel, nbRefresh]
          TabOrder = 2
          Captions.Strings = (
            #26368#21069
            #21518#36864
            #21069#36827
            #26368#21518
            #28155#21152
            #21024#38500
            #20462#25913
            #30830#35748
            #21462#28040
            #21047#26032)
        end
        object bbtnSafetyInsert: TBitBtn
          Left = 0
          Top = 2
          Width = 50
          Height = 22
          Hint = #28155#21152#35760#24405
          Caption = #28155#21152
          TabOrder = 0
          OnClick = bbtnSafetyInsertClick
          Glyph.Data = {
            46010000424D460100000000000076000000280000001C0000000D0000000100
            040000000000D000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333300003333333333333333333FFFF333330000333330003333
            3333337333F3333300003333300033333333337333F333330000333330003333
            3333FF3333FFFF3300003300000000033337333333333F330000330000000003
            3337333333333F3300003300000000033337333333333F330000333330003333
            333777733337733300003333300033333333337333F333330000333330003333
            3333337333F33333000033333333333333333377773333330000333333333333
            33333333333333330000}
          NumGlyphs = 2
        end
        object bbtnSafetyDelete: TBitBtn
          Left = 50
          Top = 2
          Width = 50
          Height = 22
          Hint = #21024#38500#35760#24405
          Caption = #21024#38500
          TabOrder = 1
          OnClick = bbtnSafetyDeleteClick
          Glyph.Data = {
            46010000424D460100000000000076000000280000001C0000000D0000000100
            040000000000D000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333000033333333333333333333333333330000333333333333
            3333333333333333000033333333333333333333333333330000333333333333
            3337FFFFFFFFFFF3000033000000000033373333333333F30000330000000000
            33373333333333F3000033000000000033373333333333F30000333333333333
            33377777777777F3000033333333333333333333333333330000333333333333
            3333333333333333000033333333333333333333333333330000333333333333
            33333333333333330000}
          NumGlyphs = 2
        end
      end
    end
  end
  inherited TechInfo: TCSADOQuery
    CursorType = ctStatic
    AfterOpen = TechInfoAfterOpen
    BeforePost = TechInfoBeforePost
    AfterCancel = TechInfoAfterCancel
    Left = 680
    Top = 202
  end
  inherited TechInfod: TDataSource
    Left = 708
    Top = 202
  end
  inherited Temp: TCSADOQuery
    Left = 680
    Top = 230
  end
  object VesselSafetyInfo: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    AfterInsert = VesselSafetyInfoAfterInsert
    Parameters = <>
    Left = 680
    Top = 258
    object VesselSafetyInfodevice_id: TStringField
      DisplayLabel = #35774#22791#20195#30721
      FieldName = 'dev_id'
    end
    object VesselSafetyInforec_no: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'rec_no'
    end
    object VesselSafetyInfoname: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'name'
      Size = 30
    end
    object VesselSafetyInfotype: TStringField
      DisplayLabel = #22411#21495
      FieldName = 'type'
      Size = 30
    end
    object VesselSafetyInfospec: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'spec'
      Size = 30
    end
    object VesselSafetyInfonum: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'num'
    end
    object VesselSafetyInfomanu: TStringField
      DisplayLabel = #21046#36896#21333#20301
      FieldName = 'manu'
      Size = 60
    end
  end
  object VesselSafetyInfod: TDataSource
    DataSet = VesselSafetyInfo
    Left = 708
    Top = 258
  end
end
