object frmCkxx_KP: TfrmCkxx_KP
  Left = 362
  Top = 240
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #20179#24211#26723#26696#21345#29255
  ClientHeight = 236
  ClientWidth = 383
  Color = 3089698
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = #26999#20307'_GB2312'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 20
  object btnCancel: TSpeedButton
    Left = 248
    Top = 194
    Width = 102
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
  object btnOK: TSpeedButton
    Left = 136
    Top = 194
    Width = 105
    Height = 33
    Caption = #30830' '#23450
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnOKClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 383
    Height = 185
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 27
      Top = 14
      Width = 95
      Height = 20
      Caption = #20179#24211#21517#31216':'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 27
      Top = 48
      Width = 95
      Height = 20
      Caption = #20179#24211#22320#28857':'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 27
      Top = 82
      Width = 96
      Height = 20
      Caption = #36127' '#36131' '#20154':'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 27
      Top = 116
      Width = 95
      Height = 20
      Caption = #32852#31995#30005#35805':'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 27
      Top = 150
      Width = 97
      Height = 20
      Caption = #22791'    '#27880':'
      FocusControl = DBEdit5
    end
    object DBEdit1: TDBEdit
      Left = 136
      Top = 11
      Width = 217
      Height = 28
      DataField = #20179#24211#21517#31216
      DataSource = frmWarehouseSetting.DataSourceCKDYB
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 136
      Top = 45
      Width = 218
      Height = 28
      DataField = #20179#24211#22320#28857
      DataSource = frmWarehouseSetting.DataSourceCKDYB
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 136
      Top = 79
      Width = 217
      Height = 28
      DataField = #36127#36131#20154
      DataSource = frmWarehouseSetting.DataSourceCKDYB
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 136
      Top = 112
      Width = 217
      Height = 28
      DataField = #32852#31995#30005#35805
      DataSource = frmWarehouseSetting.DataSourceCKDYB
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 136
      Top = 146
      Width = 217
      Height = 28
      DataField = #22791#27880
      DataSource = frmWarehouseSetting.DataSourceCKDYB
      TabOrder = 4
    end
  end
end
