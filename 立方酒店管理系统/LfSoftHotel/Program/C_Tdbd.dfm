inherited TdbdForm: TTdbdForm
  Left = 125
  Top = 23
  Width = 550
  Height = 420
  ActiveControl = edtQfrq
  Caption = #25509#24453
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 542
    inherited lblTitile: TLabel
      Left = 203
      Width = 125
      Caption = #22242#38431#34917#30331
    end
  end
  inherited Panel2: TPanel
    Width = 542
    Height = 316
    inherited Bevel1: TBevel
      Width = 281
      Height = 306
    end
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 64
      Height = 16
      Caption = #22242#38431#21517#31216
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 64
      Height = 16
      Caption = #21040#24215#26085#26399
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 142
      Top = 56
      Width = 64
      Height = 16
      Caption = #21040#24215#26102#38388
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 16
      Top = 96
      Width = 48
      Height = 16
      Caption = #25509#24453#20154
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 16
      Top = 136
      Width = 64
      Height = 16
      Caption = #25509#24453#21333#20301
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 142
      Top = 96
      Width = 64
      Height = 16
      Caption = #32852#31995#30005#35805
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 16
      Top = 192
      Width = 64
      Height = 16
      Caption = #21462#25151#26085#26399
    end
    object Label8: TLabel
      Left = 144
      Top = 192
      Width = 64
      Height = 16
      Caption = #21462#25151#26102#38388
    end
    object Panel4: TPanel
      Left = 286
      Top = 5
      Width = 251
      Height = 306
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 6
      object vleKf: TValueListEditor
        Left = 2
        Top = 2
        Width = 247
        Height = 302
        Align = alClient
        DefaultColWidth = 120
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'System'
        Font.Style = [fsBold]
        KeyOptions = [keyDelete, keyUnique]
        ParentFont = False
        TabOrder = 0
        TitleCaptions.Strings = (
          #25151#38388#21495
          #25151#20215)
        ColWidths = (
          120
          121)
      end
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 32
      Width = 250
      Height = 24
      Color = cl3DLight
      DataField = 'D_KRXM'
      DataSource = dsKrxx
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 72
      Width = 124
      Height = 24
      Color = cl3DLight
      DataField = 'D_DDRQ'
      DataSource = dsKrxx
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdit3: TDBEdit
      Left = 142
      Top = 72
      Width = 124
      Height = 24
      Color = cl3DLight
      DataField = 'D_DDSJ'
      DataSource = dsKrxx
      ReadOnly = True
      TabOrder = 9
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 112
      Width = 124
      Height = 24
      Color = cl3DLight
      DataField = 'D_JDR'
      DataSource = dsKrxx
      ReadOnly = True
      TabOrder = 10
    end
    object DBEdit5: TDBEdit
      Left = 16
      Top = 152
      Width = 250
      Height = 24
      Color = cl3DLight
      DataField = 'D_JDDW'
      DataSource = dsKrxx
      ReadOnly = True
      TabOrder = 11
    end
    object DBEdit6: TDBEdit
      Left = 142
      Top = 112
      Width = 124
      Height = 24
      Color = cl3DLight
      DataField = 'D_LXDH'
      DataSource = dsKrxx
      ReadOnly = True
      TabOrder = 12
    end
    object lblBfh: TLabeledEdit
      Left = 16
      Top = 256
      Width = 50
      Height = 24
      EditLabel.Width = 32
      EditLabel.Height = 16
      EditLabel.Caption = #36215#22987
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 2
      OnKeyPress = lblBfhKeyPress
    end
    object lblEfh: TLabeledEdit
      Left = 66
      Top = 256
      Width = 50
      Height = 24
      EditLabel.Width = 32
      EditLabel.Height = 16
      EditLabel.Caption = #32456#27490
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 3
      OnKeyPress = lblBfhKeyPress
    end
    object lblFj: TLabeledEdit
      Left = 120
      Top = 256
      Width = 60
      Height = 24
      EditLabel.Width = 32
      EditLabel.Height = 16
      EditLabel.Caption = #25151#20215
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 4
      OnKeyPress = lblBfhKeyPress
    end
    object btnInsert: TBitBtn
      Left = 185
      Top = 254
      Width = 75
      Height = 25
      Caption = #28155#21152
      TabOrder = 5
      OnClick = btnInsertClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
    end
    object edtQfrq: TMaskEdit
      Left = 16
      Top = 208
      Width = 119
      Height = 24
      EditMask = '!0000/99/99;1; '
      MaxLength = 10
      TabOrder = 0
      Text = '    -  -  '
    end
    object edtQfsj: TMaskEdit
      Left = 144
      Top = 208
      Width = 117
      Height = 24
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
    end
  end
  inherited Panel3: TPanel
    Top = 358
    Width = 542
    inherited btnOK: TBitBtn
      Left = 380
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 459
    end
  end
  object tblKrxx: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRXX'
    Left = 24
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
    object tblKrxxD_QDR1: TStringField
      FieldName = 'D_QDR1'
      Size = 8
    end
    object tblKrxxD_QDR2: TStringField
      FieldName = 'D_QDR2'
      Size = 8
    end
    object tblKrxxD_QDR3: TStringField
      FieldName = 'D_QDR3'
      Size = 8
    end
    object tblKrxxD_QDR4: TStringField
      FieldName = 'D_QDR4'
      Size = 8
    end
  end
  object dsKrxx: TDataSource
    DataSet = tblKrxx
    Left = 64
    Top = 16
  end
end
