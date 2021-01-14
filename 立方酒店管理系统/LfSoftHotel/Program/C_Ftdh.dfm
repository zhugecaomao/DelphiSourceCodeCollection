object FtdhForm: TFtdhForm
  Left = 205
  Top = 136
  BorderStyle = bsToolWindow
  Caption = #25151#24577#23548#33322
  ClientHeight = 27
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object ComboBoxEx1: TComboBoxEx
    Left = 1
    Top = 1
    Width = 100
    Height = 25
    ItemsEx.CaseSensitive = False
    ItemsEx.SortType = stNone
    ItemsEx = <
      item
        Caption = #20840#37096
      end
      item
        Caption = #31354#25151
        ImageIndex = 0
        SelectedImageIndex = 0
      end
      item
        Caption = #25955#23458
        ImageIndex = 1
        SelectedImageIndex = 1
      end
      item
        Caption = #22242#38431
        ImageIndex = 2
        SelectedImageIndex = 2
      end
      item
        Caption = #32500#20462
        ImageIndex = 3
        SelectedImageIndex = 3
      end
      item
        Caption = #20813#36153
        ImageIndex = 4
        SelectedImageIndex = 4
      end
      item
        Caption = #33039#31354
        ImageIndex = 5
        SelectedImageIndex = 5
      end>
    Style = csExDropDownList
    StyleEx = []
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'System'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
    OnChange = ComboBoxEx1Change
    DropDownCount = 15
  end
  object ComboBoxEx2: TComboBoxEx
    Left = 105
    Top = 1
    Width = 100
    Height = 25
    ItemsEx.CaseSensitive = False
    ItemsEx.SortType = stNone
    ItemsEx = <>
    Style = csExDropDownList
    StyleEx = []
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'System'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
    OnChange = ComboBoxEx2Change
    DropDownCount = 15
  end
  object ComboBox1: TComboBox
    Left = 209
    Top = 1
    Width = 150
    Height = 24
    Style = csDropDownList
    DropDownCount = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'System'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 2
    OnChange = ComboBox1Change
  end
  object btnAll: TBitBtn
    Left = 361
    Top = 1
    Width = 75
    Height = 25
    Caption = #20840#37096#23458#25151
    TabOrder = 3
    OnClick = btnAllClick
  end
end
