object LybEditForm: TLybEditForm
  Left = 192
  Top = 107
  Width = 544
  Height = 435
  Caption = 'LybEditForm'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object DBText1: TDBText
    Left = 96
    Top = 24
    Width = 65
    Height = 17
    DataField = 'D_RQ'
    DataSource = dsLyb
  end
  object DBText2: TDBText
    Left = 296
    Top = 24
    Width = 65
    Height = 17
    DataField = 'D_SJ'
    DataSource = dsLyb
  end
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 80
    Height = 16
    Caption = #30041#35328#26085#26399#65306
  end
  object Label2: TLabel
    Left = 208
    Top = 24
    Width = 80
    Height = 16
    Caption = #30041#35328#26102#38388#65306
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 72
    Height = 16
    Caption = #30041' '#35328' '#20154#65306
  end
  object DBText3: TDBText
    Left = 96
    Top = 48
    Width = 65
    Height = 17
    DataField = 'D_XM'
    DataSource = dsLyb
  end
  object Label4: TLabel
    Left = 8
    Top = 80
    Width = 80
    Height = 16
    Caption = #30041#35328#20869#23481#65306
  end
  object Label5: TLabel
    Left = 8
    Top = 272
    Width = 64
    Height = 16
    Caption = #38405#35835#20154#65306
  end
  object DBMemo1: TDBMemo
    Left = 88
    Top = 80
    Width = 433
    Height = 185
    DataField = 'D_NR'
    DataSource = dsLyb
    TabOrder = 0
  end
  object DBMemo2: TDBMemo
    Left = 88
    Top = 272
    Width = 433
    Height = 89
    DataField = 'D_YDR'
    DataSource = dsLyb
    ReadOnly = True
    TabOrder = 1
  end
  object btnOk: TButton
    Left = 352
    Top = 368
    Width = 75
    Height = 25
    Caption = #30830#23450'(&O)'
    TabOrder = 2
    OnClick = OnOk
  end
  object btnCancel: TButton
    Left = 440
    Top = 368
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 3
    OnClick = OnCancel
  end
  object tblLyb: TTable
    OnNewRecord = tblLybNewRecord
    DatabaseName = 'LfHotelUser'
    TableName = 'LYB'
    Left = 408
    Top = 24
    object tblLybD_LYBID: TIntegerField
      FieldName = 'D_LYBID'
    end
    object tblLybD_XM: TStringField
      FieldName = 'D_XM'
      Size = 8
    end
    object tblLybD_RQ: TDateTimeField
      FieldName = 'D_RQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object tblLybD_SJ: TDateTimeField
      FieldName = 'D_SJ'
      DisplayFormat = 'hh:nn:ss'
    end
    object tblLybD_NR: TBlobField
      FieldName = 'D_NR'
      Size = 1
    end
    object tblLybD_YDR: TBlobField
      FieldName = 'D_YDR'
      Size = 1
    end
  end
  object dsLyb: TDataSource
    DataSet = tblLyb
    Left = 448
    Top = 24
  end
end
