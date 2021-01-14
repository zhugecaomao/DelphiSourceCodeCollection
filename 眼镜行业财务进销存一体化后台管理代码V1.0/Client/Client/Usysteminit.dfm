inherited frmsysteminit: Tfrmsysteminit
  Top = 107
  Caption = #20179#24211#36164#26009
  ClientWidth = 644
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited spbexit: TSpeedButton
    Left = 480
    Top = 0
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 348
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      644
      348)
    object TVstock: TTreeView
      Left = 0
      Top = 1
      Width = 169
      Height = 300
      Color = clCream
      HotTrack = True
      Indent = 19
      ReadOnly = True
      TabOrder = 0
      OnClick = TVstockClick
    end
    object DBGrid1: TDBGrid
      Left = 170
      Top = 1
      Width = 473
      Height = 300
      Color = clCream
      DataSource = dsstock
      FixedColor = 16772335
      ReadOnly = True
      TabOrder = 1
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
          Width = 110
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
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Manager'
          Title.Alignment = taCenter
          Title.Caption = #24211#25151#31649#29702#21592
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Telphone'
          Title.Alignment = taCenter
          Title.Caption = #32852#31995#30005#35805
          Width = 68
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'volume'
          Title.Alignment = taCenter
          Title.Caption = #20179#24211#22823#23567
          Width = 56
          Visible = True
        end>
    end
    object btnAdd: TBitBtn
      Left = 346
      Top = 312
      Width = 75
      Height = 25
      Caption = #26032#22686
      TabOrder = 2
      OnClick = BitBtn1Click
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
      Left = 420
      Top = 312
      Width = 75
      Height = 25
      Caption = #20462#25913
      TabOrder = 3
      OnClick = BitBtn2Click
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
      Left = 494
      Top = 312
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 4
      OnClick = BitBtn3Click
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
      Left = 569
      Top = 312
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #36864#20986
      TabOrder = 5
      OnClick = BitBtn7Click
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
  end
  object dsstock: TDataSource
    DataSet = dmmain.CDSquery
    Left = 240
    Top = 304
  end
end
