inherited dlgselectps: Tdlgselectps
  Left = 226
  Top = 106
  Caption = #36873#25321#37197#36865#20179#24211
  ClientHeight = 311
  ClientWidth = 251
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 3
    Width = 250
    Height = 280
    DataSource = dsview
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'managerid'
        Title.Alignment = taCenter
        Title.Caption = #20179#24211#32534#21495
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'managername'
        Title.Alignment = taCenter
        Title.Caption = #20179#24211#21517#31216
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'area_NO'
        Title.Alignment = taCenter
        Title.Caption = #25152#23646#22320#21306
        Width = 70
        Visible = True
      end>
  end
  object btnOk: TBitBtn
    Left = 102
    Top = 285
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 176
    Top = 285
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = btnCancelClick
    Kind = bkCancel
  end
  object dsview: TDataSource
    DataSet = dmmain.cdsdata
    Left = 200
    Top = 224
  end
end
