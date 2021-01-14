inherited YdxxForm: TYdxxForm
  Width = 418
  Height = 342
  ActiveControl = dbeXm
  Caption = #39044#23450
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 410
    inherited lblTitile: TLabel
      Left = 132
      Width = 156
      Caption = #39044#23450#20154#20449#24687
    end
    inherited Image1: TImage
      Left = 99
    end
  end
  inherited Panel2: TPanel
    Width = 410
    Height = 238
    inherited Bevel1: TBevel
      Width = 400
      Height = 228
    end
    object Label1: TLabel
      Left = 33
      Top = 17
      Width = 80
      Height = 16
      Caption = #22995#21517#25110#21333#20301
      FocusControl = dbeXm
    end
    object lblYfje: TLabel
      Left = 129
      Top = 145
      Width = 64
      Height = 16
      Caption = #39044#20184#37329#39069
      FocusControl = dbeYfje
    end
    object Label3: TLabel
      Left = 33
      Top = 58
      Width = 80
      Height = 16
      Caption = #23545#26041#32852#31995#20154
      FocusControl = dbeDwmc
    end
    object Label4: TLabel
      Left = 32
      Top = 101
      Width = 64
      Height = 16
      Caption = #32852#31995#30005#35805
      FocusControl = dbeLxdh
    end
    object Label5: TLabel
      Left = 31
      Top = 187
      Width = 48
      Height = 16
      Caption = #22791'    '#27880
      FocusControl = dbeBz
    end
    object Label7: TLabel
      Left = 31
      Top = 145
      Width = 64
      Height = 16
      Caption = #20184#27454#26041#24335
    end
    object Label10: TLabel
      Left = 201
      Top = 59
      Width = 80
      Height = 16
      Caption = #23486#39302#32852#31995#20154
      FocusControl = dbeLxr
    end
    object lblMc: TLabel
      Left = 285
      Top = 166
      Width = 30
      Height = 12
      Caption = 'lblMc'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object dbeXm: TDBEdit
      Left = 32
      Top = 32
      Width = 329
      Height = 24
      DataField = 'D_KRXM'
      DataSource = dsWork
      TabOrder = 0
    end
    object dbeYfje: TDBEdit
      Left = 128
      Top = 160
      Width = 150
      Height = 24
      DataField = 'D_YFJE'
      DataSource = dsWork
      TabOrder = 5
    end
    object dbeDwmc: TDBEdit
      Left = 32
      Top = 74
      Width = 169
      Height = 24
      DataField = 'D_DWMC'
      DataSource = dsWork
      TabOrder = 1
    end
    object dbeLxdh: TDBEdit
      Left = 31
      Top = 117
      Width = 330
      Height = 24
      DataField = 'D_LXDH'
      DataSource = dsWork
      TabOrder = 3
    end
    object dbeBz: TDBEdit
      Left = 31
      Top = 203
      Width = 322
      Height = 24
      DataField = 'D_BZ'
      DataSource = dsWork
      TabOrder = 8
    end
    object dbcFkfs: TDBComboBox
      Left = 32
      Top = 160
      Width = 89
      Height = 24
      Style = csDropDownList
      DataField = 'D_FKFS'
      DataSource = dsWork
      ItemHeight = 16
      Items.Strings = (
        #20154#27665#24065
        #20449#29992#21345
        #25903#31080
        #35760#24080)
      TabOrder = 4
      OnKeyPress = dbcFkfsKeyPress
    end
    object dbeLxr: TDBEdit
      Left = 201
      Top = 74
      Width = 160
      Height = 24
      DataField = 'D_LXR'
      DataSource = dsWork
      TabOrder = 2
    end
    object dbcXykbh: TDBComboBox
      Left = 261
      Top = 3
      Width = 150
      Height = 24
      DataField = 'D_XYKBH'
      DataSource = dsWork
      ItemHeight = 16
      TabOrder = 6
      Visible = False
      OnExit = dbcXykbhExit
    end
    object dbcKhbh: TDBComboBox
      Left = 261
      Top = 27
      Width = 150
      Height = 24
      DataField = 'D_KHBH'
      DataSource = dsWork
      ItemHeight = 16
      TabOrder = 7
      Visible = False
      OnExit = dbcKhbhExit
    end
  end
  inherited Panel3: TPanel
    Top = 280
    Width = 410
    inherited btnOK: TBitBtn
      Left = 250
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 330
      OnClick = btnCancClick
    end
  end
  object qryWork: TQuery
    BeforePost = qryWorkBeforePost
    OnNewRecord = qryWorkNewRecord
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from YDXX'
      '')
    Left = 16
    Top = 8
    object qryWorkD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER.YDXX.D_KRBH'
      Size = 12
    end
    object qryWorkD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Origin = 'LFHOTELUSER.YDXX.D_KRXM'
      Size = 30
    end
    object qryWorkD_FKFS: TStringField
      FieldName = 'D_FKFS'
      Origin = 'LFHOTELUSER.YDXX.D_FKFS'
      OnChange = qryWorkD_FKFSChange
      Size = 10
    end
    object qryWorkD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Origin = 'LFHOTELUSER.YDXX.D_XYKBH'
      Size = 5
    end
    object qryWorkD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Origin = 'LFHOTELUSER.YDXX.D_KHBH'
      Size = 5
    end
    object qryWorkD_YFJE: TFloatField
      FieldName = 'D_YFJE'
      Origin = 'LFHOTELUSER.YDXX.D_YFJE'
    end
    object qryWorkD_DWMC: TStringField
      FieldName = 'D_DWMC'
      Origin = 'LFHOTELUSER.YDXX.D_DWMC'
      Size = 30
    end
    object qryWorkD_LXDH: TStringField
      FieldName = 'D_LXDH'
      Origin = 'LFHOTELUSER.YDXX.D_LXDH'
      Size = 16
    end
    object qryWorkD_LXR: TStringField
      FieldName = 'D_LXR'
      Origin = 'LFHOTELUSER.YDXX.D_LXR'
      Size = 8
    end
    object qryWorkD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.YDXX.D_BZ'
      Size = 30
    end
    object qryWorkD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.YDXX.D_CZYXM'
      Size = 8
    end
  end
  object dsWork: TDataSource
    DataSet = qryWork
    Left = 56
    Top = 8
  end
end
