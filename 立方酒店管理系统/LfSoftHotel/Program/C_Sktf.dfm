inherited SktfForm: TSktfForm
  Width = 319
  Height = 234
  Caption = #25509#24453
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 311
    inherited lblTitile: TLabel
      Left = 103
      Width = 125
      Caption = #35843#25442#25151#38388
    end
    inherited Image1: TImage
      Left = 65
    end
  end
  inherited Panel2: TPanel
    Width = 311
    Height = 130
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    inherited Bevel1: TBevel
      Width = 301
      Height = 120
    end
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 64
      Height = 16
      Caption = #35843#20986#25151#21495
    end
    object Label2: TLabel
      Left = 152
      Top = 16
      Width = 64
      Height = 16
      Caption = #35843#20986#25151#20215
    end
    object Label3: TLabel
      Left = 24
      Top = 72
      Width = 64
      Height = 16
      Caption = #35843#20837#25151#21495
    end
    object Label4: TLabel
      Left = 152
      Top = 72
      Width = 64
      Height = 16
      Caption = #35843#20837#25151#20215
    end
    object edtDcfh: TEdit
      Left = 24
      Top = 32
      Width = 121
      Height = 24
      TabOrder = 0
      OnExit = edtDcfhExit
      OnKeyPress = edtDcfhKeyPress
    end
    object edtDcfj: TEdit
      Left = 152
      Top = 32
      Width = 121
      Height = 24
      ReadOnly = True
      TabOrder = 1
    end
    object edtDrfh: TEdit
      Left = 24
      Top = 88
      Width = 121
      Height = 24
      TabOrder = 2
      OnExit = edtDrfhExit
      OnKeyPress = edtDcfhKeyPress
    end
    object edtDrfj: TEdit
      Left = 152
      Top = 88
      Width = 121
      Height = 24
      TabOrder = 3
      OnKeyPress = edtDcfhKeyPress
    end
  end
  inherited Panel3: TPanel
    Top = 172
    Width = 311
    inherited btnOK: TBitBtn
      Left = 151
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 231
    end
  end
  inherited DosMove1: TDosMove
    Left = 24
  end
  object tblKrzd: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRZD'
    Left = 232
    Top = 8
    object tblKrzdD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Required = True
      Size = 12
    end
    object tblKrzdD_HH: TIntegerField
      FieldName = 'D_HH'
    end
    object tblKrzdD_ZDLB: TStringField
      FieldName = 'D_ZDLB'
      FixedChar = True
      Size = 1
    end
    object tblKrzdD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Size = 12
    end
    object tblKrzdD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Size = 12
    end
    object tblKrzdD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Size = 5
    end
    object tblKrzdD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
    end
    object tblKrzdD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Size = 5
    end
    object tblKrzdD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
    end
    object tblKrzdD_XFSL: TFloatField
      FieldName = 'D_XFSL'
    end
    object tblKrzdD_XFJE: TFloatField
      FieldName = 'D_XFJE'
    end
    object tblKrzdD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
    end
    object tblKrzdD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
    end
    object tblKrzdD_YHJE: TFloatField
      FieldName = 'D_YHJE'
    end
    object tblKrzdD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
    end
    object tblKrzdD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
    end
    object tblKrzdD_JZBZ: TStringField
      FieldName = 'D_JZBZ'
      FixedChar = True
      Size = 1
    end
    object tblKrzdD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object tblKrzdD_DLR1: TStringField
      FieldName = 'D_DLR1'
      Size = 8
    end
    object tblKrzdD_DLR2: TStringField
      FieldName = 'D_DLR2'
      Size = 8
    end
    object tblKrzdD_DLR3: TStringField
      FieldName = 'D_DLR3'
      Size = 8
    end
    object tblKrzdD_DLR4: TStringField
      FieldName = 'D_DLR4'
      Size = 8
    end
    object tblKrzdD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Size = 8
    end
    object tblKrzdD_JZYXM: TStringField
      FieldName = 'D_JZYXM'
      Size = 8
    end
    object tblKrzdD_TYR: TStringField
      FieldName = 'D_TYR'
      Size = 8
    end
    object tblKrzdD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
    object tblKrzdD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Size = 8
    end
    object tblKrzdD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Size = 12
    end
  end
  object tblKfzt: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KFZT'
    Left = 272
    Top = 8
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
  object tblBqj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'BQJ'
    Left = 192
    Top = 16
  end
end
