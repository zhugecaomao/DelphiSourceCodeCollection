object Form_query: TForm_query
  Left = 24
  Top = 58
  Width = 763
  Height = 462
  Caption = #26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 755
    Height = 435
    ActivePage = TabSheet3
    Align = alClient
    TabIndex = 2
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #21592#24037#20449#24687
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 747
        Height = 407
        Align = alClient
        BorderStyle = bsSingle
        TabOrder = 0
        object Bevel1: TBevel
          Left = 8
          Top = 89
          Width = 729
          Height = 1
        end
        object GroupBox1: TGroupBox
          Left = 9
          Top = 5
          Width = 144
          Height = 76
          Caption = #20998#31867#26597#35810
          TabOrder = 0
          object RadioButton_bh: TRadioButton
            Left = 24
            Top = 15
            Width = 113
            Height = 17
            Caption = #25353#21592#24037#32534#21495
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            OnClick = RadioButton_bhClick
          end
          object RadioButton_name: TRadioButton
            Left = 24
            Top = 35
            Width = 113
            Height = 17
            Caption = #25353#21592#24037#22995#21517
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = RadioButton_nameClick
          end
          object RadioButton_bm: TRadioButton
            Left = 24
            Top = 53
            Width = 113
            Height = 17
            Caption = #25353#21592#24037#37096#38376
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = RadioButton_bmClick
          end
        end
        object GroupBox2: TGroupBox
          Left = 160
          Top = 5
          Width = 208
          Height = 76
          Caption = #26597#35810#26465#20214
          TabOrder = 1
          object Label1: TLabel
            Left = 16
            Top = 16
            Width = 48
            Height = 13
            Caption = #21592#24037#32534#21495
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Edit_query: TEdit
            Left = 72
            Top = 16
            Width = 121
            Height = 21
            ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
            TabOrder = 0
          end
          object query_BTquery: TBitBtn
            Left = 16
            Top = 44
            Width = 75
            Height = 25
            Caption = #26597#35810
            TabOrder = 1
            OnClick = query_BTqueryClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333FF3FF3333333333CC30003333333333773777333333333C33
              3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
              33003377333337F33377333333333C333300333F333337F33377339333333C33
              3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
              330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
              330077F377F337F33377993399333C33330077FF773337F33377399993333C33
              33333777733337F333FF333333333C33300033333333373FF7773333333333CC
              3000333333333377377733333333333333333333333333333333}
            NumGlyphs = 2
          end
          object query_BTdy: TBitBtn
            Left = 120
            Top = 44
            Width = 75
            Height = 25
            Caption = #25171#21360
            TabOrder = 2
            OnClick = query_BTdyClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
              00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
              8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
              8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
              8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
              03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
              03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
              33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
              33333337FFFF7733333333300000033333333337777773333333}
            NumGlyphs = 2
          end
        end
        object GroupBox3: TGroupBox
          Left = 376
          Top = 4
          Width = 361
          Height = 77
          Caption = #26597#30475#20869#23481
          TabOrder = 2
          object CheckBox1: TCheckBox
            Left = 16
            Top = 14
            Width = 97
            Height = 17
            Caption = #21592#24037#22995#21517
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object CheckBox4: TCheckBox
            Left = 91
            Top = 14
            Width = 97
            Height = 17
            Caption = #21592#24037#24615#21035
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object CheckBox7: TCheckBox
            Left = 171
            Top = 14
            Width = 81
            Height = 17
            Caption = #21592#24037#23398#21382
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object CheckBox2: TCheckBox
            Left = 16
            Top = 34
            Width = 97
            Height = 17
            Caption = #21592#24037#32844#20301
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object CheckBox5: TCheckBox
            Left = 91
            Top = 34
            Width = 97
            Height = 17
            Caption = #21592#24037#37096#38376
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object CheckBox8: TCheckBox
            Left = 171
            Top = 33
            Width = 81
            Height = 17
            Caption = #25152#26377#20449#24687
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnClick = CheckBox8Click
          end
          object CheckBox3: TCheckBox
            Left = 16
            Top = 53
            Width = 97
            Height = 17
            Caption = #21592#24037#30005#35805
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object CheckBox6: TCheckBox
            Left = 91
            Top = 53
            Width = 97
            Height = 17
            Caption = #21592#24037#24180#40836
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object query_BTxz: TBitBtn
            Left = 256
            Top = 16
            Width = 89
            Height = 25
            Caption = #37325#26032#36873#25321
            TabOrder = 8
            OnClick = query_BTxzClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
              3333333777333777FF33339993707399933333773337F3777FF3399933000339
              9933377333777F3377F3399333707333993337733337333337FF993333333333
              399377F33333F333377F993333303333399377F33337FF333373993333707333
              333377F333777F333333993333101333333377F333777F3FFFFF993333000399
              999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
              99933773FF777F3F777F339993707399999333773F373F77777F333999999999
              3393333777333777337333333999993333333333377777333333}
            NumGlyphs = 2
          end
        end
        object DBGrid1: TDBGrid
          Left = 1
          Top = 126
          Width = 741
          Height = 276
          Align = alBottom
          DataSource = DMgzdagl.DSQemployee
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ReadOnly = True
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object DBNavigator1: TDBNavigator
          Left = 64
          Top = 96
          Width = 575
          Height = 25
          DataSource = DMgzdagl.DSQemployee
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          Flat = True
          TabOrder = 4
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #24037#36164#20449#24687
      ImageIndex = 1
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 747
        Height = 407
        Align = alClient
        Caption = #24037#36164#20449#24687#26597#35810
        TabOrder = 0
        object Label2: TLabel
          Left = 86
          Top = 24
          Width = 49
          Height = 13
          AutoSize = False
          Caption = #21592#24037#32534#21495
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Bevel2: TBevel
          Left = 16
          Top = 64
          Width = 721
          Height = 1
        end
        object Edit_gzxx_no: TEdit
          Left = 142
          Top = 24
          Width = 121
          Height = 21
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          TabOrder = 0
        end
        object gzxx_BTquery: TBitBtn
          Left = 310
          Top = 24
          Width = 75
          Height = 25
          Caption = #26597#35810
          TabOrder = 1
          OnClick = gzxx_BTqueryClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333FF3FF3333333333CC30003333333333773777333333333C33
            3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
            33003377333337F33377333333333C333300333F333337F33377339333333C33
            3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
            330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
            330077F377F337F33377993399333C33330077FF773337F33377399993333C33
            33333777733337F333FF333333333C33300033333333373FF7773333333333CC
            3000333333333377377733333333333333333333333333333333}
          NumGlyphs = 2
        end
        object gzxx_BTprint: TBitBtn
          Left = 438
          Top = 24
          Width = 169
          Height = 25
          Caption = #25171#21360#24037#36164#28165#21333
          TabOrder = 2
          OnClick = gzxx_BTprintClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            0003377777777777777308888888888888807F33333333333337088888888888
            88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
            8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
            8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
            03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
            03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
            33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
            33333337FFFF7733333333300000033333333337777773333333}
          NumGlyphs = 2
        end
        object DBGrid2: TDBGrid
          Left = 2
          Top = 104
          Width = 743
          Height = 301
          Align = alBottom
          DataSource = DMgzdagl.DSQgongzi
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ReadOnly = True
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object DBNavigator2: TDBNavigator
          Left = 112
          Top = 72
          Width = 450
          Height = 25
          DataSource = DMgzdagl.DSQgongzi
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
          Flat = True
          TabOrder = 4
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #21592#24037#34917#36148#20449#24687
      ImageIndex = 2
      object GroupBox5: TGroupBox
        Left = 0
        Top = 0
        Width = 747
        Height = 407
        Align = alClient
        Caption = #34917#36148#26597#35810
        TabOrder = 0
        object Label3: TLabel
          Left = 120
          Top = 24
          Width = 48
          Height = 13
          Caption = #21592#24037#32534#21495
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Bevel3: TBevel
          Left = 8
          Top = 60
          Width = 729
          Height = 1
        end
        object Edit_btxx_no: TEdit
          Left = 176
          Top = 24
          Width = 121
          Height = 21
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          TabOrder = 0
        end
        object btxx_BTquery: TBitBtn
          Left = 336
          Top = 24
          Width = 75
          Height = 25
          Caption = #26597#35810
          TabOrder = 1
          OnClick = btxx_BTqueryClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333FF3FF3333333333CC30003333333333773777333333333C33
            3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
            33003377333337F33377333333333C333300333F333337F33377339333333C33
            3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
            330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
            330077F377F337F33377993399333C33330077FF773337F33377399993333C33
            33333777733337F333FF333333333C33300033333333373FF7773333333333CC
            3000333333333377377733333333333333333333333333333333}
          NumGlyphs = 2
        end
        object btxx_BTprint: TBitBtn
          Left = 456
          Top = 24
          Width = 129
          Height = 25
          Caption = #34917#36148#20449#24687#25171#21360
          TabOrder = 2
          OnClick = btxx_BTprintClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            0003377777777777777308888888888888807F33333333333337088888888888
            88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
            8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
            8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
            03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
            03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
            33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
            33333337FFFF7733333333300000033333333337777773333333}
          NumGlyphs = 2
        end
        object DBGrid3: TDBGrid
          Left = 2
          Top = 104
          Width = 743
          Height = 301
          Align = alBottom
          DataSource = DMgzdagl.DSQbutie
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
          ReadOnly = True
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object DBNavigator3: TDBNavigator
          Left = 120
          Top = 72
          Width = 462
          Height = 25
          DataSource = DMgzdagl.DSQbutie
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
          Flat = True
          TabOrder = 4
        end
      end
    end
  end
end
