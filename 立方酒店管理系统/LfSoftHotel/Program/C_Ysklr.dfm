inherited YsklrForm: TYsklrForm
  Left = 186
  Top = 33
  Width = 450
  Height = 450
  Caption = #24212#25910#27454#24405#20837
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 442
    Height = 113
    inherited lblTitile: TLabel
      Left = 145
      Width = 156
      Caption = #24212#25910#27454#24405#20837
    end
    inherited Image1: TImage
      Left = 107
    end
    object Label6: TLabel
      Left = 6
      Top = 68
      Width = 64
      Height = 16
      Caption = #28040#36153#26085#26399
    end
    object Label7: TLabel
      Left = 136
      Top = 68
      Width = 64
      Height = 16
      Caption = #28040#36153#26102#38388
    end
    object Label1: TLabel
      Left = 5
      Top = 48
      Width = 80
      Height = 16
      Caption = #23458#25143#21517#31216#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblKhmc: TLabel
      Left = 85
      Top = 48
      Width = 52
      Height = 16
      Caption = 'lblKhmc'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtXfrq: TMaskEdit
      Left = 5
      Top = 84
      Width = 129
      Height = 24
      EditMask = '!0000/99/99;1; '
      MaxLength = 10
      TabOrder = 0
      Text = '    -  -  '
      OnExit = edtXfrqExit
    end
    object edtXfsj: TMaskEdit
      Left = 138
      Top = 84
      Width = 130
      Height = 24
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
      OnExit = edtXfsjExit
    end
  end
  inherited Panel2: TPanel
    Top = 113
    Width = 442
    Height = 275
    inherited Bevel1: TBevel
      Width = 432
      Height = 265
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 432
      Height = 265
      Align = alClient
      Color = clMoneyGreen
      DataSource = dsYsk
      FixedColor = clSkyBlue
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
      OnColEnter = DBGrid1ColEnter
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'D_XMMC'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#39033#30446
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFJE'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#37329#39069
          Width = 180
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 388
    Width = 442
    object Label8: TLabel [0]
      Left = 8
      Top = 11
      Width = 76
      Height = 14
      Caption = #21512#35745#37329#39069#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblHj: TLabel [1]
      Left = 164
      Top = 11
      Width = 21
      Height = 14
      Caption = '0'#20803
      Font.Charset = GB2312_CHARSET
      Font.Color = clGreen
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = []
      ParentFont = False
    end
    inherited btnOK: TBitBtn
      Left = 282
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 362
      OnClick = btnCancClick
    end
  end
  object qryYsk: TQuery
    CachedUpdates = True
    BeforePost = qryYskBeforePost
    AfterPost = qryYskAfterPost
    OnNewRecord = qryYskNewRecord
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from YSK where (D_KHBH=:KHBH)and(D_ZDBH=:ZDBH)')
    Left = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'KHBH'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ZDBH'
        ParamType = ptInput
      end>
    object qryYskD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Origin = 'LFHOTELUSER.YSK.D_KHBH'
      Size = 5
    end
    object qryYskD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Origin = 'LFHOTELUSER.YSK.D_ZDBH'
      Size = 12
    end
    object qryYskD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER.YSK.D_HH'
    end
    object qryYskD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.YSK.D_XMBH'
      OnValidate = qryYskD_XMBHValidate
      Size = 5
    end
    object qryYskD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
      Origin = 'LFHOTELUSER.YSK.D_XFDJ'
    end
    object qryYskD_XFSL: TFloatField
      FieldName = 'D_XFSL'
      Origin = 'LFHOTELUSER.YSK.D_XFSL'
    end
    object qryYskD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER.YSK.D_XFJE'
      OnValidate = qryYskD_XFJEValidate
      currency = True
    end
    object qryYskD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
      Origin = 'LFHOTELUSER.YSK.D_XFRQ'
    end
    object qryYskD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
      Origin = 'LFHOTELUSER.YSK.D_XFSJ'
    end
    object qryYskD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.YSK.D_CZYXM'
      Size = 8
    end
    object qryYskD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.YSK.D_BZ'
      Size = 30
    end
    object qryYskD_XMMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XMMC'
      LookupDataSet = HotelData.tblXMDM
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
  end
  object dsYsk: TDataSource
    DataSet = qryYsk
    Left = 40
  end
end
