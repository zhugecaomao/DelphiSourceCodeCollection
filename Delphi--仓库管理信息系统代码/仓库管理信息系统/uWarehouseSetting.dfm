object frmWarehouseSetting: TfrmWarehouseSetting
  Left = 352
  Top = 237
  BorderStyle = bsDialog
  Caption = #20179#24211#31649#29702
  ClientHeight = 420
  ClientWidth = 664
  Color = 4013343
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = #26999#20307'_GB2312'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 22
    Top = 11
    Width = 139
    Height = 24
    Caption = #20179#24211#35774#32622'...'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnCancel: TSpeedButton
    Left = 512
    Top = 379
    Width = 105
    Height = 33
    Caption = #36864' '#20986
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnCancelClick
  end
  object btnAppend: TSpeedButton
    Left = 176
    Top = 379
    Width = 105
    Height = 33
    Caption = #28155' '#21152
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnAppendClick
  end
  object btnDelete: TSpeedButton
    Left = 400
    Top = 379
    Width = 105
    Height = 33
    Caption = #21024' '#38500
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnDeleteClick
  end
  object btnModify: TSpeedButton
    Left = 288
    Top = 379
    Width = 105
    Height = 33
    Caption = #26356' '#26032
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnModifyClick
  end
  object Panel1: TPanel
    Left = -16
    Top = 40
    Width = 705
    Height = 329
    BevelInner = bvLowered
    TabOrder = 0
    object Label2: TLabel
      Left = 40
      Top = 232
      Width = 84
      Height = 20
      Caption = #20179#24211#21517#31216
    end
    object Label3: TLabel
      Left = 368
      Top = 232
      Width = 84
      Height = 20
      Caption = #20179#24211#22320#28857
    end
    object Label4: TLabel
      Left = 64
      Top = 264
      Width = 63
      Height = 20
      Caption = #36127#36131#20154
    end
    object Label5: TLabel
      Left = 368
      Top = 264
      Width = 84
      Height = 20
      Caption = #32852#31995#30005#35805
    end
    object Label6: TLabel
      Left = 80
      Top = 296
      Width = 42
      Height = 20
      Caption = #22791#27880
    end
    object DBGrid1: TDBGrid
      Left = 40
      Top = 16
      Width = 617
      Height = 201
      Cursor = crArrow
      Color = clBtnFace
      DataSource = DataSourceCKDYB
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -24
      TitleFont.Name = #26999#20307'_GB2312'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'WName'
          Title.Alignment = taCenter
          Title.Caption = #20179#24211#21517#31216
          Title.Color = clHotLight
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -20
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Width = 118
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'WPostion'
          Title.Alignment = taCenter
          Title.Caption = #20179#24211#22320#28857
          Title.Color = clHotLight
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -20
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Width = 170
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Admin'
          Title.Alignment = taCenter
          Title.Caption = #36127#36131#20154
          Title.Color = clHotLight
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -20
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tel'
          Title.Alignment = taCenter
          Title.Caption = #32852#31995#30005#35805
          Title.Color = clHotLight
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -20
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Memo'
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Title.Color = clHotLight
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -20
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end>
    end
    object dbeName: TDBEdit
      Left = 144
      Top = 228
      Width = 185
      Height = 28
      DataField = 'WName'
      DataSource = DataSourceCKDYB
      TabOrder = 1
    end
    object dbePostion: TDBEdit
      Left = 464
      Top = 228
      Width = 193
      Height = 28
      DataField = 'WPostion'
      DataSource = DataSourceCKDYB
      TabOrder = 2
    end
    object dbeAdmin: TDBEdit
      Left = 144
      Top = 260
      Width = 185
      Height = 28
      DataField = 'Admin'
      DataSource = DataSourceCKDYB
      TabOrder = 3
    end
    object dbePhone: TDBEdit
      Left = 464
      Top = 260
      Width = 193
      Height = 28
      DataField = 'Tel'
      DataSource = DataSourceCKDYB
      TabOrder = 4
    end
    object dbeMemo: TDBEdit
      Left = 144
      Top = 292
      Width = 513
      Height = 28
      DataField = 'Memo'
      DataSource = DataSourceCKDYB
      TabOrder = 5
    end
  end
  object DataSourceCKDYB: TDataSource
    DataSet = aqWarehouse
    Left = 280
    Top = 8
  end
  object aqWarehouse: TADOQuery
    Connection = dmWarehouse.ACWarehouse
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from CKDYB order by WName'
      '')
    Left = 336
    Top = 8
  end
end
