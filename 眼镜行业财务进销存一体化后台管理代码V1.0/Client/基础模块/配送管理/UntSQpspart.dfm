inherited dlgSQpspart: TdlgSQpspart
  Left = 212
  Top = 177
  Caption = #30003#35831#37197#36865#37096#38376
  ClientHeight = 311
  ClientWidth = 251
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TBitBtn
    Left = 102
    Top = 285
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 176
    Top = 285
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 1
    OnClick = btnCancelClick
    Kind = bkCancel
  end
  object DBGrid1: TDBGrid
    Left = -1
    Top = 0
    Width = 252
    Height = 282
    DataSource = dsview
    FixedColor = clSkyBlue
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
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
        FieldName = 'Part_NO'
        Title.Alignment = taCenter
        Title.Caption = #37096#38376#32534#21495
        Width = 86
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Part_name'
        Title.Alignment = taCenter
        Title.Caption = #37096#38376#21517#31216
        Width = 96
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'storageid'
        Title.Alignment = taCenter
        Title.Caption = #23545#24212#20179#24211
        Width = 94
        Visible = True
      end>
  end
  object dsview: TDataSource
    DataSet = dmmain.cdsdata
    Left = 200
    Top = 224
  end
end
