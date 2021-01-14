inherited fmBatchmanager: TfmBatchmanager
  Left = 74
  Top = 117
  Caption = #37197#36865#22320#21306#31649#36758
  ClientWidth = 601
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 345
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 3
      Top = 4
      Width = 218
      Height = 336
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
          FieldName = 'Storage_NO'
          Title.Alignment = taCenter
          Title.Caption = #20179#24211#32534#21495
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Storage_Name'
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
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 225
    Top = 56
    Width = 376
    Height = 264
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 1
    object Label2: TLabel
      Left = 136
      Top = 8
      Width = 65
      Height = 13
      Caption = #21463#31649#36758#20179#24211
    end
    object StringGrid1: TStringGrid
      Left = 4
      Top = 25
      Width = 365
      Height = 236
      ColCount = 4
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 0
      OnDblClick = StringGrid1DblClick
      OnDrawCell = StringGrid1DrawCell
      OnSelectCell = StringGrid1SelectCell
    end
  end
  object btnAdd: TBitBtn
    Left = 226
    Top = 321
    Width = 75
    Height = 23
    Caption = #26032#22686
    TabOrder = 2
    OnClick = btnAddClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
      0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
      0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
      0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
      0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
      0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
      5555557FFFFF7755555555500000005555555577777775555555555555555555
      5555555555555555555555555555555555555555555555555555}
    NumGlyphs = 2
  end
  object btnEdit: TBitBtn
    Left = 301
    Top = 320
    Width = 75
    Height = 25
    Caption = #20462#25913
    TabOrder = 3
    OnClick = btnEditClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADA000000000000000D088888888888880A080808080808080D000000000000
      000AA0EEEEEEEE0DADADD0E0000EE0DADADAA0E0A0EE00ADADADD0E00EE0D00A
      DADAA0E0EE0DA000ADADD0EEE0DAD0B70ADAA0EE0DADA0B80DADD0E0DADADA0B
      70DAA00DADADAD0B00ADD0DADADADAD0110AADADADADADA000AD}
  end
  object btnDelete: TBitBtn
    Left = 449
    Top = 320
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 4
    OnClick = btnDeleteClick
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888888888888888881F88881F8888888888888991F8888889F8888191F888881
      F888888199F88891F8888888191F819F88888888819199F88888888888919F88
      88888888891911F888888888191F89F88888889191F88819F88881919F888881
      9F88891F8888888819F88888888888888888}
  end
  object btnExit: TBitBtn
    Left = 523
    Top = 320
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 5
    OnClick = btnExitClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
      BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
      BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
      BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
      BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
      EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
      EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
      EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
      EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
    NumGlyphs = 2
  end
  object Panel3: TPanel
    Left = 226
    Top = 0
    Width = 375
    Height = 56
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 6
    object Label1: TLabel
      Left = 25
      Top = 8
      Width = 65
      Height = 13
      Caption = #37197#36865#20179#24211#65306
    end
    object Cmbmanager: TComboBox
      Left = 91
      Top = 4
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = CmbmanagerChange
    end
    object edtremark: TLabeledEdit
      Left = 92
      Top = 32
      Width = 217
      Height = 21
      EditLabel.Width = 39
      EditLabel.Height = 13
      EditLabel.Caption = #35828#26126#65306
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 1
    end
    object cmb_no: TComboBox
      Left = 243
      Top = 4
      Width = 69
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Visible = False
    end
  end
  object btnSave: TBitBtn
    Left = 375
    Top = 320
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 7
    OnClick = btnSaveClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADAAD0000000000000DD03300000088030AA03300000088030DD03300000088
      030AA03300000000030DD03333333333330AA03300000000330DD03088888888
      030AA03088888888030DD03088888888030AA03088888888030DD03088888888
      000AA03088888888080DD00000000000000AADADADADADADADAD}
  end
  object dsview: TDataSource
    DataSet = cdsview
    Left = 168
    Top = 88
  end
  object cdsview: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 160
  end
  object cdsbase: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 160
  end
end
