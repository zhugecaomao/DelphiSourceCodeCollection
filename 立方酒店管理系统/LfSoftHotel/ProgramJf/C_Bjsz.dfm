object BjszForm: TBjszForm
  Left = 192
  Top = 107
  Width = 369
  Height = 375
  Caption = #31995#32479#35774#32622
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 361
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 120
      Top = 8
      Width = 101
      Height = 24
      Caption = #21322#20215#35774#32622
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
    Width = 361
    Height = 266
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 359
      Height = 264
      ActivePage = TabSheet1
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #33410#20551#26085#35774#32622
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 351
          Height = 237
          Align = alClient
          DataSource = dsHoliday
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'HOLIDAY'
              Title.Alignment = taCenter
              Title.Caption = #33410#20551#26085
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STIME'
              Title.Alignment = taCenter
              Title.Caption = #21322#20215#24320#22987#26102#38388
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FTIME'
              Title.Alignment = taCenter
              Title.Caption = #21322#20215#32467#26463#26102#38388
              Visible = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = #26143#26399#26085#29366#24577
        ImageIndex = 1
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 72
          Height = 12
          Caption = #21322#20215#24320#22987#26102#38388
          FocusControl = DBEdit1
        end
        object Label3: TLabel
          Left = 144
          Top = 48
          Width = 72
          Height = 12
          Caption = #21322#20215#32467#26463#26102#38388
          FocusControl = DBEdit2
        end
        object DBCheckBox1: TDBCheckBox
          Left = 8
          Top = 16
          Width = 177
          Height = 17
          Caption = #26143#26399#20845#12289#26143#26399#26085#26159#21542#21322#20215
          DataField = 'SUNDAY'
          DataSource = dsJfconfig
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 64
          Width = 124
          Height = 20
          DataField = 'STIME'
          DataSource = dsJfconfig
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Left = 144
          Top = 64
          Width = 124
          Height = 20
          DataField = 'FTIME'
          DataSource = dsJfconfig
          TabOrder = 2
        end
      end
      object TabSheet3: TTabSheet
        Caption = #21475#20196#35774#32622
        ImageIndex = 2
        object Label4: TLabel
          Left = 8
          Top = 8
          Width = 24
          Height = 12
          Caption = #21475#20196
          FocusControl = DBEdit3
        end
        object DBEdit3: TDBEdit
          Left = 8
          Top = 24
          Width = 196
          Height = 20
          DataField = 'PASSWORD'
          DataSource = dsJfconfig
          TabOrder = 0
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 307
    Width = 361
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      361
      41)
    object btnOK: TBitBtn
      Left = 195
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
      Left = 275
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
  object tblHoliday: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'HOLIDAY.db'
    Left = 16
    Top = 8
    object tblHolidayHOLIDAY: TDateField
      FieldName = 'HOLIDAY'
      EditMask = '!0000/99/99;1; '
    end
    object tblHolidayFTIME: TTimeField
      FieldName = 'FTIME'
      EditMask = '!90:00;1; '
    end
    object tblHolidaySTIME: TTimeField
      FieldName = 'STIME'
      EditMask = '!90:00;1; '
    end
  end
  object dsHoliday: TDataSource
    DataSet = tblHoliday
    Left = 48
    Top = 8
  end
  object tblJfconfig: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'JFCONFIG.db'
    Left = 88
    Top = 8
    object tblJfconfigMANAGE: TSmallintField
      FieldName = 'MANAGE'
    end
    object tblJfconfigSUNDAY: TBooleanField
      FieldName = 'SUNDAY'
    end
    object tblJfconfigSTIME: TTimeField
      FieldName = 'STIME'
      EditMask = '!90:00;1; '
    end
    object tblJfconfigFTIME: TTimeField
      FieldName = 'FTIME'
      EditMask = '!90:00;1; '
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
    object tblJfconfigPASSWORD: TStringField
      FieldName = 'PASSWORD'
      Size = 16
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
    Left = 120
    Top = 8
  end
  object DosMove1: TDosMove
    Active = True
    Options = [moEnter]
    Left = 224
    Top = 8
  end
end
