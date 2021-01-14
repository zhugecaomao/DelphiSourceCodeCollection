object frmUse: TfrmUse
  Left = 379
  Top = 197
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #30331#38470#29992#25143#31649#29702
  ClientHeight = 321
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000000200000000
    0000000000000000000000000000000000000000800000800000008080008000
    00008000800080800000C0C0C000808080000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF0000000000000000000000000DDD000DDD00FF
    FF000FF0000F0000F000DD000DD00F0000F0F00F000F0000F0000DD0DD000000
    00F0F00F000F0000F00000D0D000000FFF00F00F000F0000F000000D000000F0
    00000FF00FFFFF0FFF0000D0D00000F000000000000F0000F0000DD0DD00000F
    FF0000000000FF00F000DD000DD000000000000000000000000DDD000DDD0000
    0A0A000000C0C00000000000000000000A0000000CCC0CC000000000000000AA
    0000AAAA0C0C0C0CCC000000000000000AAAA0AAC0CCCCCCC0C0000000000000
    A0A0AAAAACCC0CCCCCCCC00000000000AAAAAAAACCCCCCCCCCCCCC0000000000
    00AAAAAAACCAACCCCCCCCCC000000000900AAAAAAAACC0CCCCCCCCCC00000000
    009099AAAAAAACCCCCCCCCC0C000000099990A9AAAAAAAACACCCCCCCCC000000
    099099AAAAAAAACACCCCCCCCC000000090999999AAAAAAAAA0CCCCCCCC0C0000
    999999999AAAAAAAAAACACCCCC0000000099999999AAAAAA0AAACCC000000000
    00909999999AAA0AAA0AACAC0CCC000000099999999990AAAAAAA0C00C000000
    000099999999A9A0A0AA00A0000000000000099999999909000AA00000000000
    0000009099999009AAA0AA000000000000000009909909090A000A0000000000
    0000000009990909000A00000000000000000000000090000000000000000000
    0000000000090990000000000000000000380000013900000193000001D70000
    01EF000001D7000001930000013900000038FAFD7FFFFBF89FFFCF0AA3FFF844
    05FFF500807FF000003FFC00001FF600400FFD000017F0800003F9000007F400
    0402F0000003FC00081FFD002208FE00405BFF0014DFFF802E7FFFD0613FFFE4
    ABBFFFF8AEFFFFFF7FFFFFFE9FFF280000001000000020000000010004000000
    0000800000000000000000000000000000000000000000000000000080000080
    000000808000800000008000800080800000C0C0C000808080000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000000000000000000A
    0C0CC000000000AAA0CCCC00000000A0AACCCCC0000000AAAAACCCCC0000009A
    AACACCCCC0000000AAAAACCCCC0009999AAAAACCCCC0000999A9AAACC0C00099
    999AAAAACC0000099999AAAAA0C0000099999A0AAA000000099999A0A0000000
    0090990AA0A000000000900000000000000000000000FFFF0000EA7F0000C43F
    000DD01F0DDDC00F0A0AC00700C0F003000080010000E0050A00C0030CCCE005
    0000F0230000F8170000FD250C0CFF7FCC00FFFF7D03}
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 467
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Caption = #30331#38470#29992#25143#31649#29702
    Font.Charset = GB2312_CHARSET
    Font.Color = clTeal
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 302
    Width = 467
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 25
    Width = 467
    Height = 277
    Align = alClient
    TabOrder = 2
    object Panel2: TPanel
      Left = 2
      Top = 147
      Width = 463
      Height = 128
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 2
        Top = 2
        Width = 459
        Height = 124
        Align = alClient
        DataSource = DM.DS_USESZ
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'log_id'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #29992#25143'ID'
            Title.Color = clInfoBk
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 99
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'login_name'
            Title.Alignment = taCenter
            Title.Caption = #29992#25143#22995#21517
            Title.Color = clInfoBk
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Width = 121
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'login_type'
            Title.Alignment = taCenter
            Title.Caption = #25805#20316#36523#20221
            Title.Color = clInfoBk
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -12
            Title.Font.Name = #23435#20307
            Title.Font.Style = []
            Visible = True
          end>
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 119
      Width = 463
      Height = 28
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object Panel4: TPanel
        Left = 2
        Top = 2
        Width = 459
        Height = 24
        Align = alClient
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object btn_refresh: TSpeedButton
          Left = 387
          Top = 1
          Width = 50
          Height = 22
          Caption = #20851#38381
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000BFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBD
            BDBFBDBDBFBDBDBFBFBFBFBEBEBF0000BF0000BF0000BF0000BF0000BFBFBFBF
            0000BF0000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBDBDBFBDBDBFBEBEBF0000
            BF0000BF0000BF0000BF0000BFBFBFBF0000BF0000000000BFBFBFBFBFBFBFBF
            BFBFBFBFBFBDBDBFBDBDBFBEBEBF0000BE6E6EBE6E6EBE6E6EBF0000BFBFBFBF
            BFBFBF0000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBDBDBFBDBDBFBEBEBF0000
            BE6E6EBE6E6EBE6E6EBF0000BFBFBFBFBFBFBF0000000000BFBFBFBFBFBFBFBF
            BFBFBFBFBFBDBDBFBDBDBFBEBEBF0000BE6E6EBE6E6EBE6E6EBF0000BFBFBFBF
            BFBFBF0000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBDBDBFBDBDBFBEBEBF0000
            BE6E6EBE6E6EBE6E6EBF0000BFBFBFBFBFBFBF0000000000BFBFBFBFBFBFBFBF
            BFBFBFBFBFBDBDBFBDBDBFBEBEBF0000BE6E6EBE6E6EBE6E6EBF0000BFBFBFBF
            BFBFBF0000BFBFBFBFBFBF0000FFBFBFBFBFBFBFBFBDBDBFBDBDBFBEBEBF0000
            BE6E6EBE6E6EBE6E6EBF0000BFBFBFBFBFBFBFBFBFBFBFBF0000FF0000FFBFBF
            BFBFBFBFBFBDBDBFBDBDBFBEBEBF0000BE6E6EBE6E6EBE6E6EBF0000BFBFBFBF
            BFBFBFBFBF0000FF0000FF0000FF0000FF0000FFBFBFBFBFBDBDBFBEBEBF0000
            BE6E6EBE6E6EBF0000BF0000BFBFBFBFBFBFBFBFBFBFBFBF0000FF0000FFBFBF
            BF0000FFBFBFBFBFBDBDBFBEBEBF0000BE6E6EBF0000BF0000BFBFBFBFBFBFBF
            BFBFBF0000BFBFBFBFBFBF0000FFBFBFBFBFBFBF0000FFBFBDBDBFBEBEBF0000
            BF0000BF0000BFBFBFBFBFBFBFBFBFBFBFBFBF0000000000BFBFBFBFBFBFBFBF
            BFBFBFBF0000FFBFBDBDBFBEBEBF0000BF0000BFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBF0000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBDBDBFBEBEBF0000
            BF0000BF0000BF0000BF0000BF0000BF0000BF0000000000BFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBDBDBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBDBDBFBDBDBFBDBDBFBDBDBFBDBD}
          OnClick = btn_refreshClick
        end
        object btn_insert: TSpeedButton
          Left = 134
          Top = 1
          Width = 50
          Height = 22
          Hint = #28155#21152#26032#21333#25454
          Caption = #28155#21152
          Flat = True
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000F0000000E0000000100
            04000000000070000000130B0000130B00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8880888888888888888088888888888888808888880008888880888888070888
            8880888888070888888088800007000088808880777777708880888000070000
            8880888888070888888088888807088888808888880008888880888888888888
            88808888888888888880}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_insertClick
        end
        object btn_edit: TSpeedButton
          Left = 235
          Top = 1
          Width = 50
          Height = 22
          Hint = #32534#36753#21333#25454
          Caption = #32534#36753
          Flat = True
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_editClick
        end
        object btn_cancel: TSpeedButton
          Left = 286
          Top = 1
          Width = 50
          Height = 22
          Hint = #21333#25454#23450#20301
          Caption = #24674#22797
          Enabled = False
          Flat = True
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
            3333333777333777FF3333993333339993333377FF3333377FF3399993333339
            993337777FF3333377F3393999333333993337F777FF333337FF993399933333
            399377F3777FF333377F993339993333399377F33777FF33377F993333999333
            399377F333777FF3377F993333399933399377F3333777FF377F993333339993
            399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
            99333773FF3333777733339993333339933333773FFFFFF77333333999999999
            3333333777333777333333333999993333333333377777333333}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_cancelClick
        end
        object btn_save: TSpeedButton
          Left = 337
          Top = 1
          Width = 50
          Height = 22
          Hint = #29289#36164#36895#26597
          Caption = #20445#23384
          Enabled = False
          Flat = True
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888880000000000000880330000008803088033000000880308803300000088
            0308803300000000030880333333333333088033000000003308803088888888
            0308803088888888030880308888888803088030888888880308803088888888
            0008803088888888080880000000000000088888888888888888}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_saveClick
        end
        object btn_delete: TSpeedButton
          Left = 184
          Top = 1
          Width = 50
          Height = 22
          Hint = #21024#38500#21333#25454
          Caption = #21024#38500
          Flat = True
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
            F000FF000000000FF000FF0FFFFFFF0FF000FF000000000FF000FFFFFFFFFFFF
            F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
            F000}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_deleteClick
        end
        object DBNavigator: TDBNavigator
          Left = 30
          Top = 1
          Width = 104
          Height = 22
          DataSource = DM.DS_USESZ
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Flat = True
          TabOrder = 0
        end
      end
    end
    object Panel5: TPanel
      Left = 2
      Top = 14
      Width = 463
      Height = 105
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 2
      object Label4: TLabel
        Left = 8
        Top = 65
        Width = 60
        Height = 12
        Caption = #25805#20316#36523#20221#65306
      end
      object Label3: TLabel
        Left = 8
        Top = 35
        Width = 54
        Height = 12
        Caption = #29992#25143#22995#21517':'
      end
      object Label2: TLabel
        Left = 11
        Top = 4
        Width = 48
        Height = 12
        Caption = #29992#25143'ID'#65306
      end
      object sbtnsetup: TSpeedButton
        Left = 160
        Top = 0
        Width = 57
        Height = 22
        Caption = #35774#32622#23494#30721
        Enabled = False
        Flat = True
        OnClick = sbtnsetupClick
      end
      object dbcmbType: TDBComboBox
        Left = 68
        Top = 60
        Width = 121
        Height = 20
        DataField = 'login_type'
        DataSource = DM.DS_USESZ
        ItemHeight = 12
        Items.Strings = (
          #26222#36890#29992#25143
          #31995#32479#31649#29702#21592)
        ParentShowHint = False
        ShowHint = True
        Sorted = True
        TabOrder = 0
      end
      object DBEdit1: TDBEdit
        Left = 67
        Top = 0
        Width = 91
        Height = 20
        DataField = 'log_id'
        DataSource = DM.DS_USESZ
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 69
        Top = 31
        Width = 105
        Height = 20
        DataField = 'login_name'
        DataSource = DM.DS_USESZ
        TabOrder = 2
      end
    end
  end
  object tyqmp: TADOQuery
    Connection = frmMain.ADOConnect
    Parameters = <>
    Left = 344
  end
  object dstmp: TDataSource
    Left = 296
  end
end
