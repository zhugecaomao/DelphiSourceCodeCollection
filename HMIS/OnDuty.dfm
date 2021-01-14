object F_ODuty: TF_ODuty
  Left = 198
  Top = 147
  Width = 584
  Height = 385
  Caption = #21307#21153#20540#29677#20154#21592#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 139
    Top = 0
    Width = 436
    Height = 356
    DataSource = DM.DS_Person
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Per_Name'
        Title.Alignment = taCenter
        Title.Caption = #22995#21517
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Mon_Name'
        Title.Alignment = taCenter
        Title.Caption = #26143#26399#19968
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tue_Name'
        Title.Alignment = taCenter
        Title.Caption = #26143#26399#20108
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Wen_Name'
        Title.Alignment = taCenter
        Title.Caption = #26143#26399#19977
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Thu_Name'
        Title.Alignment = taCenter
        Title.Caption = #26143#26399#22235
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fri_Name'
        Title.Alignment = taCenter
        Title.Caption = #26143#26399#20116
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sat_Name'
        Title.Alignment = taCenter
        Title.Caption = #26143#26399#20845
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sun_Name'
        Title.Alignment = taCenter
        Title.Caption = #26143#26399#26085
        Width = 41
        Visible = True
      end>
  end
  object StaticText1: TStaticText
    Left = 2
    Top = 1
    Width = 64
    Height = 17
    Caption = #37096#38376#21015#34920#65306
    TabOrder = 1
  end
  object ListBox1: TListBox
    Left = 0
    Top = 18
    Width = 137
    Height = 338
    ItemHeight = 13
    TabOrder = 2
    OnDblClick = ListBox1DblClick
  end
end
