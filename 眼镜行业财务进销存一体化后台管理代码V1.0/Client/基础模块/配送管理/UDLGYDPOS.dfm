inherited DlgYdPos: TDlgYdPos
  Left = 221
  Top = 119
  Caption = #39044#23450#21830#21697#30003#35831#21333
  ClientWidth = 326
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TBitBtn
    Left = 175
    Top = 316
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 249
    Top = 316
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 1
    OnClick = btnCancelClick
    Kind = bkCancel
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 323
    Height = 313
    DataSource = dsview
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = btnOkClick
    Columns = <
      item
        Expanded = False
        FieldName = 'VcBillNo'
        Title.Alignment = taCenter
        Title.Caption = #21333#25454#32534#21495
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VCOfficeID'
        Title.Alignment = taCenter
        Title.Caption = #30003#35831#37096#38376
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DGetDate'
        Title.Alignment = taCenter
        Title.Caption = #30003#35831#26085#26399
        Width = 70
        Visible = True
      end>
  end
  object dsview: TDataSource
    DataSet = dmmain.cdsyddata
    Left = 56
    Top = 320
  end
end
