inherited HcjsForm: THcjsForm
  Left = 139
  Top = 43
  Height = 500
  Caption = #32467#24080
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 160
    object Bevel2: TBevel [0]
      Left = 304
      Top = 41
      Width = 225
      Height = 65
      Shape = bsFrame
    end
    inherited lblTitile: TLabel
      Width = 125
      Caption = #20250#22330#24080#21333
    end
    object Label3: TLabel
      Left = 320
      Top = 49
      Width = 101
      Height = 19
      Caption = #28040#36153#37329#39069#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblXfje: TLabel
      Left = 408
      Top = 48
      Width = 78
      Height = 19
      Caption = 'lblXfje'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 320
      Top = 81
      Width = 101
      Height = 19
      Caption = #23454#32467#37329#39069#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSjje: TLabel
      Left = 408
      Top = 80
      Width = 78
      Height = 19
      Caption = 'lblSjje'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 1
      Top = 54
      Width = 64
      Height = 16
      Caption = #23458#20154#22995#21517
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object radJzfs: TRadioGroup
      Left = 5
      Top = 73
      Width = 284
      Height = 55
      Caption = ' '#32467' '#24080' '#26041' '#24335' '
      Columns = 4
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        #20154#27665#24065
        #20449#29992#21345
        #25903#31080
        #35760#24080
        #25346#25955#23458
        #25346#22242#38431
        #23486#39302#25307#24453)
      ParentFont = False
      TabOrder = 0
      OnClick = radJzfsClick
    end
    object cmbJz: TComboBox
      Left = 5
      Top = 131
      Width = 281
      Height = 24
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 1
    end
    object edtKrxm: TEdit
      Left = 72
      Top = 48
      Width = 217
      Height = 24
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  inherited Panel2: TPanel
    Top = 160
    Height = 278
    inherited Bevel1: TBevel
      Height = 268
    end
    object ListView1: TListView
      Left = 5
      Top = 5
      Width = 526
      Height = 268
      Align = alClient
      Columns = <
        item
          AutoSize = True
          Caption = #28040#36153#39033#30446
        end
        item
          Alignment = taCenter
          AutoSize = True
          Caption = #28040#36153#37329#39069
        end>
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      GridLines = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  inherited Panel3: TPanel
    Top = 438
    inherited btnOK: TBitBtn
      OnClick = btnOKClick
    end
  end
  object tblKrxx: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRXX'
    Left = 424
    Top = 8
  end
  object tblYdhc: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'YDHC'
    Left = 456
    Top = 8
    object tblYdhcD_YDBH: TStringField
      FieldName = 'D_YDBH'
      Required = True
      Size = 12
    end
    object tblYdhcD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Size = 12
    end
    object tblYdhcD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Size = 30
    end
    object tblYdhcD_YDRQ: TDateTimeField
      FieldName = 'D_YDRQ'
    end
    object tblYdhcD_SYRQ: TDateTimeField
      FieldName = 'D_SYRQ'
    end
    object tblYdhcD_SYSJ: TDateTimeField
      FieldName = 'D_SYSJ'
    end
    object tblYdhcD_SJDM: TStringField
      FieldName = 'D_SJDM'
      FixedChar = True
      Size = 4
    end
    object tblYdhcD_HCBH: TStringField
      FieldName = 'D_HCBH'
      Size = 5
    end
    object tblYdhcD_HCMC: TStringField
      FieldName = 'D_HCMC'
      Size = 10
    end
    object tblYdhcD_HCZJ: TFloatField
      FieldName = 'D_HCZJ'
    end
    object tblYdhcD_HCRS: TIntegerField
      FieldName = 'D_HCRS'
    end
    object tblYdhcD_HCRS1: TIntegerField
      FieldName = 'D_HCRS1'
    end
    object tblYdhcD_HFSL: TFloatField
      FieldName = 'D_HFSL'
    end
    object tblYdhcD_HFJE: TFloatField
      FieldName = 'D_HFJE'
    end
    object tblYdhcD_HFBZ: TStringField
      FieldName = 'D_HFBZ'
      Size = 30
    end
    object tblYdhcD_XHSL: TFloatField
      FieldName = 'D_XHSL'
    end
    object tblYdhcD_XHJE: TFloatField
      FieldName = 'D_XHJE'
    end
    object tblYdhcD_XHBZ: TStringField
      FieldName = 'D_XHBZ'
      Size = 30
    end
    object tblYdhcD_SGSL: TFloatField
      FieldName = 'D_SGSL'
    end
    object tblYdhcD_SGJE: TFloatField
      FieldName = 'D_SGJE'
    end
    object tblYdhcD_SGBZ: TStringField
      FieldName = 'D_SGBZ'
      Size = 30
    end
    object tblYdhcD_QTJE: TFloatField
      FieldName = 'D_QTJE'
    end
    object tblYdhcD_QTBZ: TStringField
      FieldName = 'D_QTBZ'
      Size = 30
    end
    object tblYdhcD_HTSL: TFloatField
      FieldName = 'D_HTSL'
    end
    object tblYdhcD_HTBZ: TStringField
      FieldName = 'D_HTBZ'
      Size = 30
    end
    object tblYdhcD_RZBZ: TStringField
      FieldName = 'D_RZBZ'
      FixedChar = True
      Size = 1
    end
    object tblYdhcD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object tblYdhcD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Size = 8
    end
    object tblYdhcD_BZ: TBlobField
      FieldName = 'D_BZ'
      Size = 1
    end
  end
  object tblKrjz: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRJZ'
    Left = 328
    Top = 8
  end
  object tblKrzd: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRZD'
    Left = 360
    Top = 8
  end
  object tblYsk: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'YSK'
    Left = 392
    Top = 8
  end
end
