inherited MfjdForm: TMfjdForm
  Width = 304
  Height = 262
  ActiveControl = edtFjh
  Caption = #25509#24453
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 296
    inherited lblTitile: TLabel
      Left = 94
      Width = 125
      Caption = #20813#36153#25509#24453
    end
    inherited Image1: TImage
      Left = 57
    end
  end
  inherited Panel2: TPanel
    Width = 296
    Height = 158
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    inherited Bevel1: TBevel
      Width = 286
      Height = 148
    end
    object Label1: TLabel
      Left = 146
      Top = 18
      Width = 80
      Height = 16
      Caption = #22995#21517#25110#21333#20301
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 20
      Top = 58
      Width = 64
      Height = 16
      Caption = #21040#24215#26085#26399
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 146
      Top = 58
      Width = 64
      Height = 16
      Caption = #21040#24215#26102#38388
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 20
      Top = 98
      Width = 48
      Height = 16
      Caption = #21516#24847#20154
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 20
      Top = 18
      Width = 48
      Height = 16
      Caption = #25151#38388#21495
    end
    object DBEdit1: TDBEdit
      Left = 146
      Top = 34
      Width = 121
      Height = 24
      DataField = 'D_KRXM'
      DataSource = dsKrxx
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 20
      Top = 74
      Width = 124
      Height = 24
      DataField = 'D_DDRQ'
      DataSource = dsKrxx
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 146
      Top = 74
      Width = 124
      Height = 24
      DataField = 'D_DDSJ'
      DataSource = dsKrxx
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 20
      Top = 114
      Width = 125
      Height = 24
      DataField = 'D_JDR'
      DataSource = dsKrxx
      TabOrder = 4
    end
    object edtFjh: TEdit
      Left = 20
      Top = 34
      Width = 121
      Height = 24
      TabOrder = 0
      OnExit = edtFjhExit
    end
  end
  inherited Panel3: TPanel
    Top = 200
    Width = 296
    inherited btnOK: TBitBtn
      Left = 137
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 215
      OnClick = btnCancClick
    end
  end
  inherited DosMove1: TDosMove
    Left = 256
    Top = 16
  end
  object tblKrxx: TTable
    CachedUpdates = True
    BeforePost = tblKrxxBeforePost
    OnNewRecord = tblKrxxNewRecord
    DatabaseName = 'LfHotelUser'
    TableName = 'KRXX'
    Left = 16
    Top = 16
    object tblKrxxD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Required = True
      Size = 12
    end
    object tblKrxxD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Size = 30
    end
    object tblKrxxD_KRLX: TStringField
      FieldName = 'D_KRLX'
      FixedChar = True
      Size = 1
    end
    object tblKrxxD_DDRQ: TDateTimeField
      FieldName = 'D_DDRQ'
    end
    object tblKrxxD_DDSJ: TDateTimeField
      FieldName = 'D_DDSJ'
      DisplayFormat = 'hh:nn'
      EditMask = '!90:00;1; '
    end
    object tblKrxxD_LDRQ: TDateTimeField
      FieldName = 'D_LDRQ'
    end
    object tblKrxxD_LDSJ: TDateTimeField
      FieldName = 'D_LDSJ'
    end
    object tblKrxxD_YWX: TStringField
      FieldName = 'D_YWX'
      Size = 8
    end
    object tblKrxxD_YWM: TStringField
      FieldName = 'D_YWM'
      Size = 8
    end
    object tblKrxxD_XB: TStringField
      FieldName = 'D_XB'
      Size = 2
    end
    object tblKrxxD_MZBH: TStringField
      FieldName = 'D_MZBH'
      Size = 5
    end
    object tblKrxxD_DQBH: TStringField
      FieldName = 'D_DQBH'
      Size = 5
    end
    object tblKrxxD_GBBH: TStringField
      FieldName = 'D_GBBH'
      Size = 5
    end
    object tblKrxxD_NZTS: TIntegerField
      FieldName = 'D_NZTS'
    end
    object tblKrxxD_TLSY: TStringField
      FieldName = 'D_TLSY'
      Size = 10
    end
    object tblKrxxD_ZJBH: TStringField
      FieldName = 'D_ZJBH'
      Size = 5
    end
    object tblKrxxD_ZJHM: TStringField
      FieldName = 'D_ZJHM'
      Size = 18
    end
    object tblKrxxD_CSNY: TDateTimeField
      FieldName = 'D_CSNY'
    end
    object tblKrxxD_HCL: TStringField
      FieldName = 'D_HCL'
      Size = 10
    end
    object tblKrxxD_HCQ: TStringField
      FieldName = 'D_HCQ'
      Size = 10
    end
    object tblKrxxD_QZBH: TStringField
      FieldName = 'D_QZBH'
      Size = 5
    end
    object tblKrxxD_QZYXQ: TDateTimeField
      FieldName = 'D_QZYXQ'
    end
    object tblKrxxD_ZY: TStringField
      FieldName = 'D_ZY'
      Size = 10
    end
    object tblKrxxD_LXDH: TStringField
      FieldName = 'D_LXDH'
      Size = 16
    end
    object tblKrxxD_DWMC: TStringField
      FieldName = 'D_DWMC'
      Size = 30
    end
    object tblKrxxD_JTDZ: TStringField
      FieldName = 'D_JTDZ'
      Size = 30
    end
    object tblKrxxD_JDR: TStringField
      FieldName = 'D_JDR'
      Size = 8
    end
    object tblKrxxD_JDDW: TStringField
      FieldName = 'D_JDDW'
      Size = 30
    end
    object tblKrxxD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
  end
  object dsKrxx: TDataSource
    DataSet = tblKrxx
    Left = 48
    Top = 16
  end
  object tblKfzt: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KFZT'
    Left = 80
    Top = 16
    object tblKfztD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Required = True
      Size = 5
    end
    object tblKfztD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Size = 12
    end
    object tblKfztD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Size = 12
    end
    object tblKfztD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Size = 12
    end
    object tblKfztD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
    end
    object tblKfztD_KFZT: TStringField
      FieldName = 'D_KFZT'
      FixedChar = True
      Size = 1
    end
    object tblKfztD_KFBZ: TStringField
      FieldName = 'D_KFBZ'
      FixedChar = True
      Size = 1
    end
    object tblKfztD_KRSL: TIntegerField
      FieldName = 'D_KRSL'
    end
    object tblKfztD_DHKT: TStringField
      FieldName = 'D_DHKT'
      FixedChar = True
      Size = 1
    end
    object tblKfztD_BZFJ: TFloatField
      FieldName = 'D_BZFJ'
    end
    object tblKfztD_CWS: TIntegerField
      FieldName = 'D_CWS'
    end
    object tblKfztD_BJS: TIntegerField
      FieldName = 'D_BJS'
    end
    object tblKfztD_QJS: TIntegerField
      FieldName = 'D_QJS'
    end
    object tblKfztD_JJFJ: TFloatField
      FieldName = 'D_JJFJ'
    end
    object tblKfztD_FXBH: TStringField
      FieldName = 'D_FXBH'
      Size = 5
    end
    object tblKfztD_LCBH: TStringField
      FieldName = 'D_LCBH'
      Size = 5
    end
    object tblKfztD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Size = 30
    end
  end
end
