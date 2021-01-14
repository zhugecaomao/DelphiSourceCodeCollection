object FlwhForm: TFlwhForm
  Left = 192
  Top = 107
  Width = 544
  Height = 450
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
    Width = 536
    Height = 80
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 208
      Top = 8
      Width = 101
      Height = 24
      Caption = #36153#29575#32500#25252
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object cmbOption: TComboBox
      Left = 6
      Top = 54
      Width = 100
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 0
      Items.Strings = (
        #22320#21517
        #21306'/'#23616#21495)
    end
    object cmbExpress: TComboBox
      Left = 106
      Top = 54
      Width = 100
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 1
      Text = #31561#20110
      Items.Strings = (
        #31561#20110)
    end
    object edtValue: TEdit
      Left = 206
      Top = 54
      Width = 150
      Height = 20
      TabOrder = 2
    end
    object btnLoca: TBitBtn
      Left = 359
      Top = 51
      Width = 75
      Height = 25
      Caption = #26597#25214'(&L)'
      TabOrder = 3
      OnClick = btnLocaClick
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 80
    Width = 536
    Height = 302
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 534
      Height = 300
      ActivePage = TabSheet1
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #38271#35805#36153#29575
        object dbgFare: TDBGrid
          Left = 0
          Top = 0
          Width = 526
          Height = 273
          Align = alClient
          DataSource = dsFare
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'PLACE'
              Title.Alignment = taCenter
              Title.Caption = #22320#21517
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODE'
              Title.Alignment = taCenter
              Title.Caption = #21306#21495
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIT'
              Title.Alignment = taCenter
              Title.Caption = #21333#20215
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABBR'
              Title.Alignment = taCenter
              Title.Caption = #21161#35760#31526
              Width = 120
              Visible = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = #24066#20892#36153#29575
        ImageIndex = 1
        object dbgShfare: TDBGrid
          Left = 0
          Top = 0
          Width = 526
          Height = 273
          Align = alClient
          DataSource = dsShfare
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'PLACE'
              Title.Alignment = taCenter
              Title.Caption = #22320#21517
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODE'
              Title.Alignment = taCenter
              Title.Caption = #23616#21495
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIT'
              Title.Alignment = taCenter
              Title.Caption = #21333#20215
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE'
              Title.Alignment = taCenter
              Title.Caption = #35745#26102#21333#20301#65288#31186#65289
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'JFYN'
              Title.Alignment = taCenter
              Title.Caption = #26159#21542#35745#36153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NHYN'
              Title.Alignment = taCenter
              Title.Caption = #26159#21542#20892#35805
              Visible = True
            end>
        end
      end
      object TabSheet3: TTabSheet
        Caption = #20998#26426#20462#25913
        ImageIndex = 2
        object dbgSigcode: TDBGrid
          Left = 0
          Top = 0
          Width = 526
          Height = 273
          Align = alClient
          DataSource = dsSigcode
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CLASS'
              Title.Alignment = taCenter
              Title.Caption = #20998#26426#21495
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLASSNAME'
              Title.Alignment = taCenter
              Title.Caption = #20998#26426#21517#31216
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ROOM'
              Title.Alignment = taCenter
              Title.Caption = #25151#38388#21495
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'JFYN'
              Title.Alignment = taCenter
              Title.Caption = #26159#21542#35745#36153
              Width = 100
              Visible = True
            end>
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 382
    Width = 536
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnBack: TBitBtn
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
    end
  end
  object tblFare: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'FARE.db'
    Left = 40
    Top = 16
    object tblFareCODE: TStringField
      FieldName = 'CODE'
      Size = 7
    end
    object tblFarePLACE: TStringField
      FieldName = 'PLACE'
    end
    object tblFareUNIT: TCurrencyField
      FieldName = 'UNIT'
    end
    object tblFareABBR: TStringField
      FieldName = 'ABBR'
      Size = 6
    end
  end
  object dsFare: TDataSource
    DataSet = tblFare
    Left = 72
    Top = 16
  end
  object DosMove1: TDosMove
    Active = True
    Options = [moEnter]
    Left = 312
    Top = 8
  end
  object tblShfare: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'SHFARE.db'
    Left = 112
    Top = 16
    object tblShfarePLACE: TStringField
      FieldName = 'PLACE'
    end
    object tblShfareCODE: TStringField
      FieldName = 'CODE'
      Size = 6
    end
    object tblShfareUNIT: TCurrencyField
      FieldName = 'UNIT'
    end
    object tblShfarePRICE: TFloatField
      FieldName = 'PRICE'
    end
    object tblShfareJFYN: TBooleanField
      FieldName = 'JFYN'
      DisplayValues = 'Y;N'
    end
    object tblShfareNHYN: TBooleanField
      FieldName = 'NHYN'
      DisplayValues = 'Y;N'
    end
  end
  object dsShfare: TDataSource
    DataSet = tblShfare
    Left = 144
    Top = 16
  end
  object dsSigcode: TDataSource
    DataSet = tblSigcode
    Left = 448
    Top = 16
  end
  object tblSigcode: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'SIGCODE.db'
    Left = 408
    Top = 16
    object tblSigcodeCLASS: TStringField
      FieldName = 'CLASS'
      Size = 4
    end
    object tblSigcodeCLASSNAME: TStringField
      FieldName = 'CLASSNAME'
      Size = 10
    end
    object tblSigcodeROOM: TStringField
      FieldName = 'ROOM'
      Size = 5
    end
    object tblSigcodeJFYN: TBooleanField
      FieldName = 'JFYN'
      DisplayValues = 'Y;N'
    end
    object tblSigcodeTOTAL: TCurrencyField
      FieldName = 'TOTAL'
    end
  end
end
