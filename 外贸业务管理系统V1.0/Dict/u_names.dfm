object frm_names: Tfrm_names
  Left = 102
  Top = 105
  Width = 795
  Height = 548
  Caption = 'frm_names'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 502
    Width = 787
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 502
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 65
      Width = 630
      Height = 436
      Align = alClient
      Color = clWhite
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -14
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      OnKeyDown = codeKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'code'
          Title.Alignment = taCenter
          Title.Caption = #20195'  '#30721
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -16
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'names'
          Title.Alignment = taCenter
          Title.Caption = #21517'   '#31216
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -16
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Width = 183
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'note'
          Title.Alignment = taCenter
          Title.Caption = #22791'  '#27880
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -16
          Title.Font.Name = #26999#20307'_GB2312'
          Title.Font.Style = [fsBold]
          Width = 184
          Visible = True
        end>
    end
    object gb1: TGroupBox
      Left = 1
      Top = 1
      Width = 630
      Height = 64
      Align = alTop
      Caption = #35831#36755#20837#25968#25454
      Color = clBtnFace
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 56
        Top = 31
        Width = 35
        Height = 14
        Alignment = taRightJustify
        Caption = #20195#30721':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 248
        Top = 31
        Width = 35
        Height = 14
        Alignment = taRightJustify
        Caption = #21517#31216':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 448
        Top = 31
        Width = 35
        Height = 14
        Caption = #22791#27880':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object code: TEdit
        Left = 96
        Top = 27
        Width = 81
        Height = 22
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'code'
        OnKeyDown = codeKeyDown
      end
      object note: TEdit
        Left = 488
        Top = 27
        Width = 121
        Height = 22
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnKeyDown = codeKeyDown
      end
      object names: TEdit
        Left = 288
        Top = 27
        Width = 137
        Height = 22
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'names'
        OnKeyDown = codeKeyDown
      end
    end
  end
  object Panel4: TPanel
    Left = 632
    Top = 0
    Width = 155
    Height = 502
    Align = alRight
    Caption = 'Panel4'
    TabOrder = 2
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 153
      Height = 200
      Align = alTop
      TabOrder = 0
      object SB1: TBitBtn
        Left = 25
        Top = 8
        Width = 104
        Height = 28
        Caption = 'F9'#20445#23384
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = SB1Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000000000007770330770000330777033077000033077703307700003
          30777033000000033077703333333333307770330000000330777030FFFFFFF0
          30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
          8077777CCC777700007777CCC77777777777777C777777777777}
      end
      object SB2: TBitBtn
        Left = 25
        Top = 37
        Width = 104
        Height = 28
        Caption = 'F11'#21024#38500
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = SB2Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777777777777777777700000000007777770FFFFFFFF07777770FFFFFFF
          F077771F0F888888F077711F0F85BFB8F0777711F11BFBF8F077777151788888
          F077777511FFFFFFF07775111F1FFF00007771570FF1FF0F077777770FFFFF00
          7777777700000007777777777777777777777777777777777777}
      end
      object bb3: TBitBtn
        Left = 25
        Top = 68
        Width = 104
        Height = 28
        Caption = 'F12'#26597#35810
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = bb3Click
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDD0000000DDDD000000000DDDD0000000DDDDDDD000DDDDDDD0000000DD00
          00000000000DD0000000D077777777777770D0000000D070000000000070D000
          0000D070F7E777E77070D0000000D0707F7E777E7070D0000000D070F7F7E777
          E070D0000000D0707F7F7E777070D0000000D070E7F7F7E77070D0000000D070
          7E7F7F7E7070D0000000D07077E7F7F7E070D0000000D070000000000070D000
          0000D077777777777770D0000000DD0000000000000DD0000000DDDDDDDDDDDD
          DDDDD0000000}
      end
      object bb4: TBitBtn
        Left = 25
        Top = 98
        Width = 104
        Height = 28
        Caption = 'F4'#28165#38500
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = bb4Click
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777777777777700000007770707070707070700000007777
          7777777777777000000077707770707777707000000077777777077777777000
          000077707778787777707000000077777070707070777000000071F077777777
          77707000000011F778877777777770000000711F11F070707070700000007718
          1777777777777000000077811F777777777770000000811771F7777777777000
          0000187777177777777770000000777777777777777770000000777777777777
          777770000000}
      end
      object bb6: TBitBtn
        Left = 25
        Top = 129
        Width = 104
        Height = 28
        Caption = 'F5'#25171#21360
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDDD7777777777DDDDD0000DDDD
          000000000007DDDD0000DDD07878787870707DDD0000DD0000000000000707DD
          0000DD0F8F8F8AAA8F0007DD0000DD08F8F8F999F80707DD0000DD0000000000
          0008707D0000DD08F8F8F8F8F080807D0000DDD0000000000F08007D0000DDDD
          0BFFFBFFF0F080DD0000DDDDD0F00000F0000DDD0000DDDDD0FBFFFBFF0DDDDD
          0000DDDDDD0F00000F0DDDDD0000DDDDDD0FFBFFFBF0DDDD0000DDDDDDD00000
          0000DDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
          DDDDDDDDDDDDDDDD0000}
      end
      object BB7: TBitBtn
        Left = 25
        Top = 160
        Width = 104
        Height = 28
        Cancel = True
        Caption = 'ESC'#36864#20986
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = BB7Click
        Glyph.Data = {
          96010000424D9601000000000000760000002800000018000000180000000100
          0400000000002001000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333338888888888888833333333000000000000000883333330BB
          BBBBBBBBBBBBB083333330B0000000000000B083333330B0F9FFFFFFFFF0B083
          333330B04444444444F0B033333330B0F9FFFFFFFFF0B393333330B0F9FFFFFF
          FFF0B399333330B044444444FFFFF399933330B0F9FFFFFFF9999999993330B0
          F9FFFFFFF9999999999330B044444444F9999999993330B0F9FFFFFFFFFFF399
          933330B0F9FFFFFFFFF0B399333330B04444444444F0B393333330B0F9FFFFFF
          FFF0B033333330B0F9FFFFFFFFF0B083333330B0F90000000FF0B083333330B0
          0007F7770000B083333330BBBBB07F70BBBBB033333333000000070000000333
          333333333330F770333333333333333333300000333333333333}
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 201
      Width = 153
      Height = 300
      Align = alClient
      Caption = 'F2'#35831#36873#25321#31867#21035
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 60
        Top = 16
        Width = 1
        Height = 161
        Cursor = crHSplit
        Align = alNone
        Color = clRed
        ParentColor = False
      end
      object RB1: TRadioButton
        Left = 5
        Top = 16
        Width = 52
        Height = 17
        Caption = #35268#26684
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = RB1Click
      end
      object RB2: TRadioButton
        Left = 5
        Top = 39
        Width = 49
        Height = 17
        Caption = #21697#29260
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = RB1Click
      end
      object RB3: TRadioButton
        Left = 5
        Top = 63
        Width = 52
        Height = 19
        Caption = #21333#20301
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = RB1Click
      end
      object RB4: TRadioButton
        Left = 5
        Top = 87
        Width = 52
        Height = 17
        Caption = #38996#33394
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = RB1Click
      end
      object RB5: TRadioButton
        Left = 5
        Top = 110
        Width = 52
        Height = 17
        Caption = #32467#26500
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = RB1Click
      end
      object RB6: TRadioButton
        Left = 5
        Top = 134
        Width = 49
        Height = 17
        Caption = #31867#21035
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = RB1Click
      end
      object rb7: TRadioButton
        Left = 5
        Top = 181
        Width = 73
        Height = 17
        Caption = #20184#27454#26041#24335
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = RB1Click
      end
      object rb8: TRadioButton
        Left = 5
        Top = 158
        Width = 49
        Height = 17
        Caption = #37096#38376
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = RB1Click
      end
      object rb9: TRadioButton
        Left = 5
        Top = 205
        Width = 124
        Height = 17
        Caption = #39033#30446'('#23458#25143')'#21517#31216
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = RB1Click
      end
      object rb10: TRadioButton
        Left = 5
        Top = 229
        Width = 100
        Height = 17
        Caption = #32844#31216'('#32844#21153')'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = RB1Click
      end
      object rb11: TRadioButton
        Left = 64
        Top = 18
        Width = 52
        Height = 17
        Caption = #23703#20301
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnClick = RB1Click
      end
      object rb12: TRadioButton
        Left = 64
        Top = 42
        Width = 52
        Height = 17
        Caption = #20998#32452
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        OnClick = RB1Click
      end
      object rb13: TRadioButton
        Left = 64
        Top = 66
        Width = 81
        Height = 17
        Caption = #24037#31243#31867#21035
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        OnClick = RB1Click
      end
      object rb14: TRadioButton
        Left = 64
        Top = 90
        Width = 81
        Height = 17
        Caption = #19968#32423#31867#21517
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        OnClick = RB1Click
      end
      object rb15: TRadioButton
        Left = 64
        Top = 114
        Width = 81
        Height = 17
        Caption = #20108#32423#31867#21517
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        OnClick = RB1Click
      end
    end
  end
  object Query1: TQuery
    DatabaseName = 'JXGL'
    SQL.Strings = (
      'select * from t_code')
    Left = 464
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 424
    Top = 168
  end
end
