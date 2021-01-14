inherited KrlyForm: TKrlyForm
  Left = 159
  Top = 49
  Height = 500
  Caption = #26597#35810
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 118
    inherited lblTitle: TLabel
      Caption = #23458#20154#30041#35328
    end
    inherited DBNavPlus1: TDBNavPlus
      Top = 73
      Hints.Strings = ()
    end
    inherited cmbOption: TComboBox
      Top = 47
      Items.Strings = (
        #23458#25151#21495
        #23458#20154#22995#21517)
    end
    inherited cmbExpress: TComboBox
      Top = 47
    end
    inherited edtValue: TEdit
      Top = 47
    end
    inherited btnLoca: TBitBtn
      Top = 44
      OnClick = btnLocaClick
    end
    inherited DBNavPlus2: TDBNavPlus
      Top = 73
      Hints.Strings = ()
    end
    inherited lblState: TStaticText
      Top = 7
    end
  end
  inherited Panel2: TPanel
    Top = 118
    Height = 320
    inherited Bevel1: TBevel
      Top = 130
      Height = 180
    end
    object Label1: TLabel
      Left = 24
      Top = 200
      Width = 48
      Height = 12
      Caption = #30041#35328#26085#26399
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 176
      Top = 200
      Width = 48
      Height = 12
      Caption = #30041#35328#26102#38388
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 24
      Top = 248
      Width = 36
      Height = 12
      Caption = #23458#25151#21495
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 96
      Top = 248
      Width = 48
      Height = 12
      Caption = #23507#23458#22995#21517
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 200
      Top = 248
      Width = 48
      Height = 12
      Caption = #35775#23458#22995#21517
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 312
      Top = 144
      Width = 24
      Height = 12
      Caption = #20869#23481
      FocusControl = DBMemo1
    end
    object DBGrid1: TDBGrid
      Left = 10
      Top = 10
      Width = 522
      Height = 120
      Align = alTop
      DataSource = dsWork
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'D_LYLX'
          Title.Alignment = taCenter
          Title.Caption = #30041#35328#31867#22411
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_LYRQ'
          Title.Alignment = taCenter
          Title.Caption = #30041#35328#26085#26399
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_LYSJ'
          Title.Alignment = taCenter
          Title.Caption = #30041#35328#26102#38388
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_KFBH'
          Title.Alignment = taCenter
          Title.Caption = #23458#25151#21495
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_KRXM'
          Title.Alignment = taCenter
          Title.Caption = #23507#23458#22995#21517
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_LYDX'
          Title.Alignment = taCenter
          Title.Caption = #35775#23458#22995#21517
          Width = 64
          Visible = True
        end>
    end
    object DBEdit1: TDBEdit
      Left = 24
      Top = 216
      Width = 124
      Height = 20
      DataField = 'D_LYRQ'
      DataSource = dsWork
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 176
      Top = 216
      Width = 124
      Height = 20
      DataField = 'D_LYSJ'
      DataSource = dsWork
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 24
      Top = 264
      Width = 64
      Height = 20
      DataField = 'D_KFBH'
      DataSource = dsWork
      TabOrder = 4
      OnExit = DBEdit4Exit
    end
    object DBEdit5: TDBEdit
      Left = 96
      Top = 264
      Width = 100
      Height = 20
      DataField = 'D_KRXM'
      DataSource = dsWork
      TabOrder = 5
    end
    object DBEdit6: TDBEdit
      Left = 200
      Top = 264
      Width = 100
      Height = 20
      DataField = 'D_LYDX'
      DataSource = dsWork
      TabOrder = 6
    end
    object DBMemo1: TDBMemo
      Left = 312
      Top = 160
      Width = 209
      Height = 129
      DataField = 'D_NR'
      DataSource = dsWork
      TabOrder = 7
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 24
      Top = 144
      Width = 273
      Height = 49
      Caption = #30041#35328#31867#22411
      Columns = 2
      DataField = 'D_LYLX'
      DataSource = dsWork
      Items.Strings = (
        #35775#23458#30041#35328
        #23507#23458#30041#35328)
      TabOrder = 1
      Values.Strings = (
        #35775#23458#30041#35328
        #23507#23458#30041#35328)
    end
  end
  inherited Panel3: TPanel
    Top = 438
  end
  inherited qryWork: TQuery
    OnNewRecord = qryWorkNewRecord
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from KRLY')
    object qryWorkD_LYRQ: TDateTimeField
      FieldName = 'D_LYRQ'
      Origin = 'LFHOTELUSER.KRLY.D_LYRQ'
    end
    object qryWorkD_LYSJ: TDateTimeField
      FieldName = 'D_LYSJ'
      Origin = 'LFHOTELUSER.KRLY.D_LYSJ'
      DisplayFormat = 'hh:nn:ss'
      EditMask = '!90:00;1; '
    end
    object qryWorkD_LYLX: TStringField
      FieldName = 'D_LYLX'
      Origin = 'LFHOTELUSER.KRLY.D_LYLX'
      FixedChar = True
      Size = 1
    end
    object qryWorkD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Origin = 'LFHOTELUSER.KRLY.D_KFBH'
      Size = 5
    end
    object qryWorkD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Origin = 'LFHOTELUSER.KRLY.D_KRXM'
      Size = 8
    end
    object qryWorkD_LYDX: TStringField
      FieldName = 'D_LYDX'
      Origin = 'LFHOTELUSER.KRLY.D_LYDX'
      Size = 8
    end
    object qryWorkD_NR: TBlobField
      FieldName = 'D_NR'
      Origin = 'LFHOTELUSER.KRLY.D_NR'
      Size = 1
    end
  end
end
