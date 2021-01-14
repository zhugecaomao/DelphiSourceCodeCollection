inherited fmBcJg: TfmBcJg
  Top = 95
  Caption = #29677#27425#32467#26500
  ClientHeight = 384
  ClientWidth = 617
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 617
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    object Label1: TLabel
      Left = 38
      Top = 10
      Width = 84
      Height = 20
      Caption = #29677#27425#32467#26500
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #38582#20070
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 184
      Top = 15
      Width = 65
      Height = 13
      Caption = #19979#36733#26465#25968#65306
    end
    object cmbtop: TComboBox
      Left = 248
      Top = 12
      Width = 73
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        '100'
        '200'
        '500'
        '1000'
        '1500'
        '2000'
        '2500'
        '3000'
        '3500'
        '4000'
        '4500'
        '5000')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 617
    Height = 302
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 617
      Height = 302
      Align = alClient
      DataSource = dsview
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Bc_no'
          Title.Alignment = taCenter
          Title.Caption = #29677#27425#32534#21495
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Bc_name'
          Title.Alignment = taCenter
          Title.Caption = #29677#27425#21517#31216
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'swsb'
          Title.Alignment = taCenter
          Title.Caption = #19978#21320#19978#29677
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Swxb'
          Title.Alignment = taCenter
          Title.Caption = #19978#21320#19979#29677
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Xwsb'
          Title.Alignment = taCenter
          Title.Caption = #19979#21320#19978#29677
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Xwxb'
          Title.Alignment = taCenter
          Title.Caption = #19979#21320#19979#29677
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Wssb'
          Title.Alignment = taCenter
          Title.Caption = #26202#19978#19978#29677
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Wsxb'
          Title.Alignment = taCenter
          Title.Caption = #26202#19978#19979#29677
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Jbsb'
          Title.Alignment = taCenter
          Title.Caption = #21152#29677#19978#29677
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Jbxb'
          Title.Alignment = taCenter
          Title.Caption = #21152#29677#19979#29677
          Width = 68
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 343
    Width = 617
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnAdd: TBitBtn
      Left = 228
      Top = 8
      Width = 75
      Height = 25
      Caption = #26032#22686
      TabOrder = 0
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
      Left = 302
      Top = 8
      Width = 75
      Height = 25
      Caption = #20462#25913
      TabOrder = 1
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
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 2
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
      Left = 541
      Top = 8
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 3
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
    object btnpagedown: TBitBtn
      Left = 451
      Top = 8
      Width = 89
      Height = 25
      Caption = #19979#19968#31508#25968#25454
      TabOrder = 4
      OnClick = btnpagedownClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FF3333333333333447333333333333377FFF33333333333744473333333
        333337773FF3333333333444447333333333373F773FF3333333334444447333
        33333373F3773FF3333333744444447333333337F333773FF333333444444444
        733333373F3333773FF333334444444444733FFF7FFFFFFF77FF999999999999
        999977777777777733773333CCCCCCCCCC3333337333333F7733333CCCCCCCCC
        33333337F3333F773333333CCCCCCC3333333337333F7733333333CCCCCC3333
        333333733F77333333333CCCCC333333333337FF7733333333333CCC33333333
        33333777333333333333CC333333333333337733333333333333}
      NumGlyphs = 2
    end
  end
  object dsview: TDataSource
    DataSet = dmmain.CDSquery
    Left = 240
    Top = 72
  end
end
