object CswhForm: TCswhForm
  Left = 243
  Top = 82
  Width = 534
  Height = 441
  Caption = #25968#25454#32500#25252
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 526
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 208
      Top = 8
      Width = 101
      Height = 24
      Caption = #21442#25968#32500#25252
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 526
    Height = 332
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel1: TBevel
      Left = 221
      Top = 21
      Width = 297
      Height = 300
      Shape = bsFrame
    end
    object Label2: TLabel
      Left = 232
      Top = 25
      Width = 84
      Height = 12
      Caption = #24403#21069#22269#20869#38468#21152#36153
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 232
      Top = 87
      Width = 84
      Height = 12
      Caption = #24403#21069#22269#38469#38468#21152#36153
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 232
      Top = 149
      Width = 90
      Height = 12
      Caption = '168'#27599#19977#20998#38047#25910#36153
      FocusControl = DBEdit3
    end
    object Label5: TLabel
      Left = 232
      Top = 211
      Width = 108
      Height = 12
      Caption = #24403#21069#24314#35774#36153#20026#30334#20998#20043
      FocusControl = DBEdit4
    end
    object Label6: TLabel
      Left = 232
      Top = 273
      Width = 132
      Height = 12
      Caption = #24403#21069#25163#32493#36153#65288#27599#24352#35805#21333#65289
      FocusControl = DBEdit5
    end
    object Label7: TLabel
      Left = 384
      Top = 25
      Width = 84
      Height = 12
      Caption = #24403#21069#22269#38469#20195#21150#36153
      FocusControl = DBEdit6
    end
    object Label8: TLabel
      Left = 384
      Top = 87
      Width = 84
      Height = 12
      Caption = #24403#21069#22269#20869#20195#21150#36153
      FocusControl = DBEdit7
    end
    object Label9: TLabel
      Left = 384
      Top = 149
      Width = 84
      Height = 12
      Caption = #24403#21069#20892#35805#20195#21150#36153
      FocusControl = DBEdit8
    end
    object Label10: TLabel
      Left = 384
      Top = 211
      Width = 84
      Height = 12
      Caption = #24403#21069#26080#32447#20449#36947#36153
      FocusControl = DBEdit9
    end
    object Label11: TLabel
      Left = 384
      Top = 273
      Width = 84
      Height = 12
      Caption = #24403#21069#30005#35805#26376#31199#36153
      FocusControl = DBEdit10
    end
    object DBEdit1: TDBEdit
      Left = 232
      Top = 39
      Width = 124
      Height = 20
      DataField = 'ADDIFEE'
      DataSource = dsJfconfig
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 232
      Top = 101
      Width = 124
      Height = 20
      DataField = 'ADDIFEE0'
      DataSource = dsJfconfig
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 232
      Top = 163
      Width = 124
      Height = 20
      DataField = 'XXTF'
      DataSource = dsJfconfig
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 232
      Top = 225
      Width = 124
      Height = 20
      DataField = 'SVC'
      DataSource = dsJfconfig
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 232
      Top = 288
      Width = 124
      Height = 20
      DataField = 'SVC0'
      DataSource = dsJfconfig
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 384
      Top = 38
      Width = 124
      Height = 20
      DataField = 'GJ'
      DataSource = dsJfconfig
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 384
      Top = 100
      Width = 124
      Height = 20
      DataField = 'GN'
      DataSource = dsJfconfig
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 384
      Top = 163
      Width = 124
      Height = 20
      DataField = 'NH'
      DataSource = dsJfconfig
      TabOrder = 7
    end
    object DBEdit9: TDBEdit
      Left = 384
      Top = 225
      Width = 124
      Height = 20
      DataField = 'WXF'
      DataSource = dsJfconfig
      TabOrder = 8
    end
    object DBEdit10: TDBEdit
      Left = 384
      Top = 288
      Width = 124
      Height = 20
      DataField = 'YZF'
      DataSource = dsJfconfig
      TabOrder = 9
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 16
      Width = 201
      Height = 105
      Caption = #24066#20892#36153#29575
      TabOrder = 10
      object Label12: TLabel
        Left = 6
        Top = 32
        Width = 48
        Height = 12
        Caption = #24066#35805#39318#27425
        FocusControl = DBEdit11
      end
      object Label14: TLabel
        Left = 110
        Top = 32
        Width = 18
        Height = 12
        Caption = #20803'/'
      end
      object Label13: TLabel
        Left = 181
        Top = 32
        Width = 12
        Height = 12
        Caption = #31186
      end
      object Label15: TLabel
        Left = 6
        Top = 56
        Width = 48
        Height = 12
        Caption = #24066#35805#20197#21518
        FocusControl = DBEdit13
      end
      object Label16: TLabel
        Left = 110
        Top = 56
        Width = 18
        Height = 12
        Caption = #20803'/'
      end
      object Label17: TLabel
        Left = 181
        Top = 56
        Width = 12
        Height = 12
        Caption = #31186
      end
      object Label18: TLabel
        Left = 30
        Top = 80
        Width = 24
        Height = 12
        Caption = #20892#35805
        FocusControl = DBEdit15
      end
      object Label19: TLabel
        Left = 110
        Top = 80
        Width = 18
        Height = 12
        Caption = #20803'/'
      end
      object Label20: TLabel
        Left = 181
        Top = 80
        Width = 12
        Height = 12
        Caption = #31186
      end
      object DBEdit11: TDBEdit
        Left = 57
        Top = 24
        Width = 49
        Height = 20
        DataField = 'SHFEE'
        DataSource = dsJfconfig
        TabOrder = 0
      end
      object DBEdit12: TDBEdit
        Left = 128
        Top = 24
        Width = 49
        Height = 20
        DataField = 'SHUNIT'
        DataSource = dsJfconfig
        TabOrder = 1
      end
      object DBEdit13: TDBEdit
        Left = 56
        Top = 48
        Width = 49
        Height = 20
        DataField = 'SHFEE0'
        DataSource = dsJfconfig
        TabOrder = 2
      end
      object DBEdit14: TDBEdit
        Left = 128
        Top = 48
        Width = 49
        Height = 20
        DataField = 'SHUNIT0'
        DataSource = dsJfconfig
        TabOrder = 3
      end
      object DBEdit15: TDBEdit
        Left = 56
        Top = 72
        Width = 49
        Height = 20
        DataField = 'NHFEE'
        DataSource = dsJfconfig
        TabOrder = 4
      end
      object DBEdit16: TDBEdit
        Left = 128
        Top = 72
        Width = 49
        Height = 20
        DataField = 'NHUNIT'
        DataSource = dsJfconfig
        TabOrder = 5
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 128
      Width = 201
      Height = 193
      Caption = #22269#20869#22269#38469#38271#36884
      TabOrder = 11
      object Label21: TLabel
        Left = 30
        Top = 32
        Width = 24
        Height = 12
        Caption = #22269#20869
        FocusControl = DBEdit17
      end
      object Label22: TLabel
        Left = 110
        Top = 32
        Width = 18
        Height = 12
        Caption = #20803'/'
      end
      object Label23: TLabel
        Left = 181
        Top = 32
        Width = 12
        Height = 12
        Caption = #31186
      end
      object Label24: TLabel
        Left = 30
        Top = 56
        Width = 24
        Height = 12
        Caption = #22269#38469
        FocusControl = DBEdit19
      end
      object Label25: TLabel
        Left = 110
        Top = 56
        Width = 18
        Height = 12
        Caption = #20803'/'
      end
      object Label26: TLabel
        Left = 181
        Top = 56
        Width = 12
        Height = 12
        Caption = #31186
      end
      object Label27: TLabel
        Left = 18
        Top = 80
        Width = 36
        Height = 12
        Caption = #28207#28595#21488
        FocusControl = DBEdit21
      end
      object Label28: TLabel
        Left = 110
        Top = 80
        Width = 18
        Height = 12
        Caption = #20803'/'
      end
      object Label29: TLabel
        Left = 181
        Top = 80
        Width = 12
        Height = 12
        Caption = #31186
      end
      object Label30: TLabel
        Left = 6
        Top = 104
        Width = 48
        Height = 12
        Caption = #22269#20869#20248#24800
        FocusControl = DBEdit23
      end
      object Label31: TLabel
        Left = 110
        Top = 104
        Width = 18
        Height = 12
        Caption = #20803'/'
      end
      object Label32: TLabel
        Left = 181
        Top = 104
        Width = 12
        Height = 12
        Caption = #31186
      end
      object Label33: TLabel
        Left = 6
        Top = 128
        Width = 48
        Height = 12
        Caption = #22269#38469#20248#24800
        FocusControl = DBEdit25
      end
      object Label34: TLabel
        Left = 110
        Top = 128
        Width = 18
        Height = 12
        Caption = #20803'/'
      end
      object Label35: TLabel
        Left = 181
        Top = 128
        Width = 12
        Height = 12
        Caption = #31186
      end
      object Label36: TLabel
        Left = 6
        Top = 168
        Width = 48
        Height = 12
        Caption = #20248#24800#26102#27573
        FocusControl = DBEdit28
      end
      object Label37: TLabel
        Left = 110
        Top = 167
        Width = 12
        Height = 12
        Caption = #21040
        FocusControl = DBEdit29
      end
      object DBEdit17: TDBEdit
        Left = 56
        Top = 24
        Width = 49
        Height = 20
        DataField = 'GNFEE'
        DataSource = dsJfconfig
        TabOrder = 0
      end
      object DBEdit18: TDBEdit
        Left = 128
        Top = 24
        Width = 49
        Height = 20
        DataField = 'GNUNIT'
        DataSource = dsJfconfig
        TabOrder = 1
      end
      object DBEdit19: TDBEdit
        Left = 56
        Top = 48
        Width = 49
        Height = 20
        DataField = 'GJFEE'
        DataSource = dsJfconfig
        TabOrder = 2
      end
      object DBEdit20: TDBEdit
        Left = 128
        Top = 48
        Width = 49
        Height = 20
        DataField = 'GJUNIT'
        DataSource = dsJfconfig
        TabOrder = 3
      end
      object DBEdit21: TDBEdit
        Left = 56
        Top = 72
        Width = 49
        Height = 20
        DataField = 'GATFEE'
        DataSource = dsJfconfig
        TabOrder = 4
      end
      object DBEdit22: TDBEdit
        Left = 128
        Top = 72
        Width = 49
        Height = 20
        DataField = 'GATUNIT'
        DataSource = dsJfconfig
        TabOrder = 5
      end
      object DBEdit23: TDBEdit
        Left = 56
        Top = 96
        Width = 49
        Height = 20
        DataField = 'GNFEEYH'
        DataSource = dsJfconfig
        TabOrder = 6
      end
      object DBEdit24: TDBEdit
        Left = 128
        Top = 96
        Width = 49
        Height = 20
        DataField = 'GNYHUNIT'
        DataSource = dsJfconfig
        TabOrder = 7
      end
      object DBEdit26: TDBEdit
        Left = 8
        Top = 320
        Width = 124
        Height = 20
        DataField = 'GJYHUNIT'
        DataSource = dsJfconfig
        TabOrder = 8
      end
      object DBEdit25: TDBEdit
        Left = 56
        Top = 120
        Width = 49
        Height = 20
        DataField = 'GJFEEYH'
        DataSource = dsJfconfig
        TabOrder = 9
      end
      object DBEdit27: TDBEdit
        Left = 128
        Top = 120
        Width = 49
        Height = 20
        DataField = 'GJYHUNIT'
        DataSource = dsJfconfig
        TabOrder = 10
      end
      object DBEdit28: TDBEdit
        Left = 56
        Top = 160
        Width = 49
        Height = 20
        DataField = 'STIME'
        DataSource = dsJfconfig
        TabOrder = 11
      end
      object DBEdit29: TDBEdit
        Left = 128
        Top = 160
        Width = 49
        Height = 20
        DataField = 'FTIME'
        DataSource = dsJfconfig
        TabOrder = 12
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 373
    Width = 526
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      526
      41)
    object btnOK: TBitBtn
      Left = 365
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #30830#23450'(&O)'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCanc: TBitBtn
      Left = 445
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #21462#28040'(&C)'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancClick
    end
  end
  object tblJfconfig: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'JFCONFIG.db'
    Left = 32
    Top = 8
    object tblJfconfigMANAGE: TSmallintField
      FieldName = 'MANAGE'
    end
    object tblJfconfigSUNDAY: TBooleanField
      FieldName = 'SUNDAY'
    end
    object tblJfconfigSHJF: TBooleanField
      FieldName = 'SHJF'
    end
    object tblJfconfigSHPT: TBooleanField
      FieldName = 'SHPT'
    end
    object tblJfconfigADDIFEE: TCurrencyField
      FieldName = 'ADDIFEE'
    end
    object tblJfconfigADDIFEE0: TCurrencyField
      FieldName = 'ADDIFEE0'
    end
    object tblJfconfigXXTF: TCurrencyField
      FieldName = 'XXTF'
    end
    object tblJfconfigSVC: TCurrencyField
      FieldName = 'SVC'
    end
    object tblJfconfigSVC0: TCurrencyField
      FieldName = 'SVC0'
    end
    object tblJfconfigGJ: TCurrencyField
      FieldName = 'GJ'
    end
    object tblJfconfigGN: TCurrencyField
      FieldName = 'GN'
    end
    object tblJfconfigNH: TCurrencyField
      FieldName = 'NH'
    end
    object tblJfconfigWXF: TCurrencyField
      FieldName = 'WXF'
    end
    object tblJfconfigYZF: TCurrencyField
      FieldName = 'YZF'
    end
    object tblJfconfigSTIME: TTimeField
      FieldName = 'STIME'
      EditMask = '!90:00;1; '
    end
    object tblJfconfigFTIME: TTimeField
      FieldName = 'FTIME'
      EditMask = '!90:00;1; '
    end
    object tblJfconfigSHFEE: TCurrencyField
      FieldName = 'SHFEE'
    end
    object tblJfconfigSHUNIT: TFloatField
      FieldName = 'SHUNIT'
    end
    object tblJfconfigSHFEE0: TCurrencyField
      FieldName = 'SHFEE0'
    end
    object tblJfconfigSHUNIT0: TFloatField
      FieldName = 'SHUNIT0'
    end
    object tblJfconfigNHFEE: TCurrencyField
      FieldName = 'NHFEE'
    end
    object tblJfconfigNHUNIT: TFloatField
      FieldName = 'NHUNIT'
    end
    object tblJfconfigGNFEE: TCurrencyField
      FieldName = 'GNFEE'
    end
    object tblJfconfigGNUNIT: TFloatField
      FieldName = 'GNUNIT'
    end
    object tblJfconfigGJFEE: TCurrencyField
      FieldName = 'GJFEE'
    end
    object tblJfconfigGJUNIT: TFloatField
      FieldName = 'GJUNIT'
    end
    object tblJfconfigGATFEE: TCurrencyField
      FieldName = 'GATFEE'
    end
    object tblJfconfigGATUNIT: TFloatField
      FieldName = 'GATUNIT'
    end
    object tblJfconfigGNFEEYH: TCurrencyField
      FieldName = 'GNFEEYH'
    end
    object tblJfconfigGNYHUNIT: TFloatField
      FieldName = 'GNYHUNIT'
    end
    object tblJfconfigGJFEEYH: TCurrencyField
      FieldName = 'GJFEEYH'
    end
    object tblJfconfigGJYHUNIT: TFloatField
      FieldName = 'GJYHUNIT'
    end
  end
  object dsJfconfig: TDataSource
    DataSet = tblJfconfig
    Left = 64
    Top = 8
  end
  object DosMove1: TDosMove
    Active = True
    Options = [moEnter]
    Left = 96
    Top = 8
  end
end
