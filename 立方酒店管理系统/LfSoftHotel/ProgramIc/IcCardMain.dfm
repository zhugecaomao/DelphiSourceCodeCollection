object IcCardForm: TIcCardForm
  Left = 119
  Top = 73
  Width = 650
  Height = 500
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #36149#23486#21345#31649#29702#31995#32479
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 642
    Height = 454
    ActivePage = TabSheet2
    Align = alClient
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'System'
    Font.Style = [fsBold]
    HotTrack = True
    Images = ImageList1
    ParentFont = False
    TabHeight = 50
    TabIndex = 1
    TabOrder = 0
    TabWidth = 100
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #35835#21345
      object btnReadCard: TBitBtn
        Left = 8
        Top = 16
        Width = 193
        Height = 57
        Caption = #35835#21345
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #26999#20307'_GB2312'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnReadCardClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
          0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
          0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
          0005555555575FF7777555555555000555555555555577755555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
      end
      object memRead: TMemo
        Left = 8
        Top = 80
        Width = 193
        Height = 297
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'System'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 232
        Top = 16
        Width = 305
        Height = 129
        Caption = ' '#36149#23486#21345#20449#24687' '
        TabOrder = 2
        object edtRCardId: TLabeledEdit
          Left = 16
          Top = 40
          Width = 265
          Height = 24
          Color = cl3DLight
          EditLabel.Width = 80
          EditLabel.Height = 16
          EditLabel.Caption = #36149#23486#21345#21345#21495
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 0
        end
        object edtRCardJe: TLabeledEdit
          Left = 16
          Top = 88
          Width = 265
          Height = 24
          Color = cl3DLight
          EditLabel.Width = 80
          EditLabel.Height = 16
          EditLabel.Caption = #36149#23486#21345#20313#39069
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 232
        Top = 152
        Width = 305
        Height = 225
        Caption = ' '#25968#25454#24211#20449#24687' '
        TabOrder = 3
        object edtRId: TLabeledEdit
          Left = 16
          Top = 48
          Width = 129
          Height = 24
          Color = cl3DLight
          EditLabel.Width = 80
          EditLabel.Height = 16
          EditLabel.Caption = #36149#23486#21345#21345#21495
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 0
        end
        object edtRKrxm: TLabeledEdit
          Left = 152
          Top = 46
          Width = 129
          Height = 24
          Color = cl3DLight
          EditLabel.Width = 64
          EditLabel.Height = 16
          EditLabel.Caption = #23458#20154#22995#21517
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 1
        end
        object edtRZjhm: TLabeledEdit
          Left = 16
          Top = 93
          Width = 265
          Height = 24
          Color = cl3DLight
          EditLabel.Width = 80
          EditLabel.Height = 16
          EditLabel.Caption = #36523#20221#35777#21495#30721
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 2
        end
        object edtRZe: TLabeledEdit
          Left = 16
          Top = 140
          Width = 129
          Height = 24
          Color = cl3DLight
          EditLabel.Width = 64
          EditLabel.Height = 16
          EditLabel.Caption = #20889#21345#24635#39069
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 3
        end
        object edtRXkr: TLabeledEdit
          Left = 152
          Top = 195
          Width = 129
          Height = 24
          Color = cl3DLight
          EditLabel.Width = 48
          EditLabel.Height = 16
          EditLabel.Caption = #20889#21345#20154
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 6
        end
        object edtRJe: TLabeledEdit
          Left = 152
          Top = 140
          Width = 129
          Height = 24
          Color = cl3DLight
          EditLabel.Width = 64
          EditLabel.Height = 16
          EditLabel.Caption = #28040#36153#37329#39069
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 4
        end
        object edtRYe: TLabeledEdit
          Left = 16
          Top = 195
          Width = 129
          Height = 24
          Color = cl3DLight
          EditLabel.Width = 64
          EditLabel.Height = 16
          EditLabel.Caption = #21345#20869#20313#39069
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #21457#21345
      ImageIndex = 1
      object edtWriteCard: TBitBtn
        Left = 8
        Top = 16
        Width = 193
        Height = 57
        Caption = #20889#21345
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #26999#20307'_GB2312'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = edtWriteCardClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
          055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
          88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
          F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
          F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
          0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
          00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
          0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
          05555575FF777777755555500055555555555557775555555555}
        NumGlyphs = 2
      end
      object memWrite: TMemo
        Left = 8
        Top = 80
        Width = 193
        Height = 273
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'System'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object GroupBox3: TGroupBox
        Left = 240
        Top = 16
        Width = 289
        Height = 337
        Caption = ' '#20889#21345#20449#24687' '
        TabOrder = 2
        object edtWCardId: TLabeledEdit
          Left = 16
          Top = 40
          Width = 265
          Height = 24
          EditLabel.Width = 272
          EditLabel.Height = 16
          EditLabel.Caption = #36149#23486#21345#21345#21495#65288#19982#36149#23486#21345#19978#30340#21495#30721#23545#24212#65289
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 0
        end
        object edtWKrxm: TLabeledEdit
          Left = 16
          Top = 94
          Width = 265
          Height = 24
          EditLabel.Width = 64
          EditLabel.Height = 16
          EditLabel.Caption = #23458#20154#22995#21517
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 1
        end
        object edtWZjhm: TLabeledEdit
          Left = 16
          Top = 148
          Width = 265
          Height = 24
          EditLabel.Width = 80
          EditLabel.Height = 16
          EditLabel.Caption = #36523#20221#35777#21495#30721
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 2
        end
        object edtWCardJe: TLabeledEdit
          Left = 16
          Top = 202
          Width = 265
          Height = 24
          EditLabel.Width = 64
          EditLabel.Height = 16
          EditLabel.Caption = #20889#21345#37329#39069
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 3
        end
        object edtWXkr: TLabeledEdit
          Left = 16
          Top = 256
          Width = 265
          Height = 24
          EditLabel.Width = 48
          EditLabel.Height = 16
          EditLabel.Caption = #20889#21345#20154
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 4
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #20805#20540
      ImageIndex = 4
      object BitBtn1: TBitBtn
        Left = 8
        Top = 16
        Width = 193
        Height = 57
        Caption = #35835#21345
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #26999#20307'_GB2312'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
          0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
          0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
          0005555555575FF7777555555555000555555555555577755555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
      end
      object BitBtn2: TBitBtn
        Left = 8
        Top = 80
        Width = 193
        Height = 57
        Caption = #20889#21345
        Enabled = False
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #26999#20307'_GB2312'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BitBtn2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
          055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
          88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
          F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
          F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
          0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
          00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
          0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
          05555575FF777777755555500055555555555557775555555555}
        NumGlyphs = 2
      end
      object memCz: TMemo
        Left = 8
        Top = 144
        Width = 193
        Height = 233
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'System'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object GroupBox4: TGroupBox
        Left = 232
        Top = 16
        Width = 305
        Height = 117
        Caption = ' '#36149#23486#21345#20449#24687' '
        TabOrder = 3
        object LabeledEdit1: TLabeledEdit
          Left = 16
          Top = 40
          Width = 129
          Height = 24
          Color = cl3DLight
          EditLabel.Width = 80
          EditLabel.Height = 16
          EditLabel.Caption = #36149#23486#21345#21345#21495
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 0
        end
        object LabeledEdit2: TLabeledEdit
          Left = 152
          Top = 40
          Width = 129
          Height = 24
          Color = cl3DLight
          EditLabel.Width = 80
          EditLabel.Height = 16
          EditLabel.Caption = #36149#23486#21345#20313#39069
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 1
        end
        object edtCzje: TLabeledEdit
          Left = 16
          Top = 85
          Width = 265
          Height = 24
          EditLabel.Width = 64
          EditLabel.Height = 16
          EditLabel.Caption = #20805#20540#37329#39069
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 2
        end
      end
      object GroupBox5: TGroupBox
        Left = 232
        Top = 136
        Width = 305
        Height = 257
        Caption = ' '#25968#25454#24211#20449#24687' '
        TabOrder = 4
        object LabeledEdit3: TLabeledEdit
          Left = 16
          Top = 40
          Width = 265
          Height = 24
          Color = cl3DLight
          EditLabel.Width = 80
          EditLabel.Height = 16
          EditLabel.Caption = #36149#23486#21345#21345#21495
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 0
        end
        object LabeledEdit4: TLabeledEdit
          Left = 16
          Top = 86
          Width = 265
          Height = 24
          Color = cl3DLight
          EditLabel.Width = 64
          EditLabel.Height = 16
          EditLabel.Caption = #23458#20154#22995#21517
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 1
        end
        object LabeledEdit5: TLabeledEdit
          Left = 16
          Top = 133
          Width = 265
          Height = 24
          Color = cl3DLight
          EditLabel.Width = 80
          EditLabel.Height = 16
          EditLabel.Caption = #36523#20221#35777#21495#30721
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 2
        end
        object LabeledEdit6: TLabeledEdit
          Left = 16
          Top = 180
          Width = 265
          Height = 24
          Color = cl3DLight
          EditLabel.Width = 64
          EditLabel.Height = 16
          EditLabel.Caption = #20889#21345#37329#39069
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 3
        end
        object LabeledEdit7: TLabeledEdit
          Left = 16
          Top = 227
          Width = 265
          Height = 24
          Color = cl3DLight
          EditLabel.Width = 48
          EditLabel.Height = 16
          EditLabel.Caption = #20889#21345#20154
          LabelPosition = lpAbove
          LabelSpacing = 3
          ReadOnly = True
          TabOrder = 4
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #25968#25454#24211
      ImageIndex = 2
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 634
        Height = 37
        Align = alTop
        AutoSize = True
        BorderWidth = 5
        ParentColor = True
        TabOrder = 0
        object lblZe: TLabel
          Left = 8
          Top = 14
          Width = 80
          Height = 16
          Caption = #20889#21345#24635#39069#65306
        end
        object lblJe: TLabel
          Left = 164
          Top = 14
          Width = 80
          Height = 16
          Caption = #28040#36153#37329#39069#65306
        end
        object lblYe: TLabel
          Left = 320
          Top = 14
          Width = 80
          Height = 16
          Caption = #21345#20869#20313#39069#65306
        end
        object btnPrint: TBitBtn
          Left = 544
          Top = 6
          Width = 75
          Height = 25
          Caption = #25171#21360'(&P)'
          TabOrder = 0
          OnClick = btnPrintClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888F8800000000000888808888888880808800000000000008080888888BBB88
            0008088888877788080800000000000008800888888888808080800000000008
            0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
            088888880FFFFFFFF08888888000000000888888888888888888}
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 37
        Width = 634
        Height = 357
        Align = alClient
        DataSource = dsCard
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'System'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'D_CARDID'
            Title.Alignment = taCenter
            Title.Caption = #21345#21495
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'D_KRXM'
            Title.Alignment = taCenter
            Title.Caption = #23458#20154#22995#21517
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'D_ZJHM'
            Title.Alignment = taCenter
            Title.Caption = #36523#20221#35777#21495#30721
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'D_ZE'
            Title.Alignment = taCenter
            Title.Caption = #20889#21345#24635#39069
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'D_JE'
            Title.Alignment = taCenter
            Title.Caption = #28040#36153#37329#39069
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'D_YE'
            Title.Alignment = taCenter
            Title.Caption = #20313#39069
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'D_XKR'
            Title.Alignment = taCenter
            Title.Caption = #20889#21345#20154
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'D_XKRQ'
            Title.Alignment = taCenter
            Title.Caption = #20889#21345#26085#26399
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'D_XKSJ'
            Title.Alignment = taCenter
            Title.Caption = #20889#21345#26102#38388
            Visible = True
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = #28040#36153#26597#35810
      ImageIndex = 3
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 634
        Height = 37
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        BorderWidth = 5
        ParentColor = True
        TabOrder = 0
        object Label3: TLabel
          Left = 16
          Top = 15
          Width = 96
          Height = 16
          Caption = #36149#23486#21345#21345#21495#65306
        end
        object lblXfje: TLabel
          Left = 312
          Top = 15
          Width = 80
          Height = 16
          Caption = #28040#36153#24635#39069#65306
        end
        object edtCardid: TEdit
          Left = 96
          Top = 7
          Width = 121
          Height = 24
          TabOrder = 0
        end
        object BitBtn3: TBitBtn
          Left = 224
          Top = 5
          Width = 75
          Height = 25
          Caption = #26597#35810'(&Q)'
          TabOrder = 1
          OnClick = BitBtn3Click
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888888888800000888880000080F000888880F00080F000888880F
            0008000000080000000800F000000F00000800F000800F00000800F000800F00
            00088000000000000088880F00080F0008888800000800000888888000888000
            88888880F08880F0888888800088800088888888888888888888}
        end
        object BitBtn4: TBitBtn
          Left = 544
          Top = 7
          Width = 75
          Height = 25
          Caption = #25171#21360'(&P)'
          TabOrder = 2
          OnClick = BitBtn4Click
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888F8800000000000888808888888880808800000000000008080888888BBB88
            0008088888877788080800000000000008800888888888808080800000000008
            0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
            088888880FFFFFFFF08888888000000000888888888888888888}
        end
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 37
        Width = 634
        Height = 357
        Align = alClient
        DataSource = dsCardxf
        TabOrder = 1
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'System'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'D_CARDID'
            Title.Alignment = taCenter
            Title.Caption = #21345#21495
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_KRXM'
            Title.Alignment = taCenter
            Title.Caption = #21047#21345#20154#31614#21517
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_XFRQ'
            Title.Alignment = taCenter
            Title.Caption = #28040#36153#26085#26399
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_XFSJ'
            Title.Alignment = taCenter
            Title.Caption = #28040#36153#26102#38388
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_XFJE'
            Title.Alignment = taCenter
            Title.Caption = #28040#36153#37329#39069
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_CZYXM'
            Title.Alignment = taCenter
            Title.Caption = #25805#20316#21592
            Visible = True
          end>
      end
    end
  end
  object tblCard: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'CARD'
    Left = 424
    Top = 24
  end
  object dsCard: TDataSource
    DataSet = tblCard
    Left = 456
    Top = 24
  end
  object qrySum: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select sum(D_ZE),sum(D_JE),sum(D_YE) from CARD')
    Left = 488
    Top = 24
  end
  object tblKrjz: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRJZ'
    Left = 520
    Top = 24
    object tblKrjzD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Required = True
      Size = 12
    end
    object tblKrjzD_HH: TIntegerField
      FieldName = 'D_HH'
    end
    object tblKrjzD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Size = 5
    end
    object tblKrjzD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
    end
    object tblKrjzD_XFSL: TFloatField
      FieldName = 'D_XFSL'
    end
    object tblKrjzD_XFGG: TStringField
      FieldName = 'D_XFGG'
      Size = 5
    end
    object tblKrjzD_XFJE: TFloatField
      FieldName = 'D_XFJE'
    end
    object tblKrjzD_YJJE: TFloatField
      FieldName = 'D_YJJE'
    end
    object tblKrjzD_YHJE: TFloatField
      FieldName = 'D_YHJE'
    end
    object tblKrjzD_JZFS: TStringField
      FieldName = 'D_JZFS'
      Size = 10
    end
    object tblKrjzD_JZLX: TStringField
      FieldName = 'D_JZLX'
      FixedChar = True
      Size = 1
    end
    object tblKrjzD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Size = 5
    end
    object tblKrjzD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Size = 5
    end
    object tblKrjzD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
    end
    object tblKrjzD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
    end
    object tblKrjzD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Size = 8
    end
    object tblKrjzD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
    object tblKrjzD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Size = 8
    end
  end
  object qryCardXf: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select * from CARDXF where D_CARDID=:CARDID order by D_XFRQ,D_XF' +
        'SJ')
    Left = 552
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'CARDID'
        ParamType = ptInput
      end>
  end
  object dsCardxf: TDataSource
    DataSet = qryCardXf
    Left = 584
    Top = 24
  end
  object MainMenu1: TMainMenu
    Left = 56
    Top = 176
    object N1: TMenuItem
      Caption = #26085#24120#19994#21153'(&A)'
      object N10: TMenuItem
        Caption = #35835#21345
        OnClick = N10Click
      end
      object N11: TMenuItem
        Caption = #21457#21345
        OnClick = N11Click
      end
      object N12: TMenuItem
        Caption = #20805#20540
        OnClick = N12Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object N14: TMenuItem
        Caption = #36864#20986'(&X)'
        OnClick = N14Click
      end
    end
    object N2: TMenuItem
      Caption = #26597#35810#25253#34920'(&B)'
      object N8: TMenuItem
        Caption = #25968#25454#24211#26597#35810
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #28040#36153#26126#32454#26597#35810
        OnClick = N9Click
      end
    end
    object N3: TMenuItem
      Caption = #31995#32479#35774#32622'(&C)'
      object N5: TMenuItem
        Caption = #21475#20196#35774#32622
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #37325#26032#30331#24405
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #31995#32479#35774#32622
        OnClick = N7Click
      end
    end
    object N4: TMenuItem
      Caption = #24110#21161'(&D)'
      object A1: TMenuItem
        Caption = #20851#20110#26412#36719#20214
        OnClick = A1Click
      end
    end
  end
  object ImageList1: TImageList
    Left = 128
    Top = 176
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001000000000000018
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07FFF7F00000000E07FFF7F
      E07FFF7FE07F00000000FF7FE07FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07F00000000000000000000
      0000000000000000000000000000FF7F0000A634A33200001C00120016020000
      5812B02F014023392433AC32901B8E34A3370000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F0000DD0C8011241D3C00000000000000
      000000000000000000002D0C03001100000000005C13C00E10002C33B337263A
      A837B4322C002C23B327262ABE18000F801800000000005E86511D080028A931
      B43AB2320028A921B42AB222800A80180000FF7FE07F00000000000000000000
      0000000000000000000000000000FF7F00000851F85F00000000FF7FF85FE43A
      B540F039B540247F2B0000000000FF7FFF7FD006FC5F2048F75FFF7FFF7FEC7F
      2B00700000000800000019000000241D3C26A6292F3334242F3A25363C28A931
      B43AB232BC24A327AE29BC272623A921252EFF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F00000000000000000000000000000000
      00000000000000000000000000000C5EAC40C209ED3FBC000000010000000100
      0000555DF75F0413AD40000000008747200098282100FF7FB54008000000007F
      2B0000000000FF7FFF7FD006FC5FE209F75FFF7FE07F00000000000000000000
      0000000000000000000000000000FF7F0000306CA060010000003721F75F5052
      FC5FA270F85F5052FC5F0626F85FE209F75FA7000000DC68F75F3721F75F5052
      FC5FAE20F85F0000000001000000010000000000000000000000000000000000
      000000000000000000005052FC5F00000000FF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F00006052FC5FE209F75FA7000000A44E
      F85FE43AB54008004000F039B540E43AB540706EA06000000000000000000000
      000000000000000000000000000000000000E006B66000000000E006B6600000
      0000E006B66000000000687F2B003721F75FFF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F00002E2EB037AC34A334A539BC223838
      AC373721F75FF139B54000000000000000000C7F2B002B5CF75F3721F75F5052
      FC5F265CF75F5052FC5F00000000047F2B00785CF75F0C5EAC403721F75F5052
      FC5F9E5CF75F0000000001000000706EA060FF7FE07FFF7FE07FFF7FE07F0000
      000000000000000000000000000000000000020000000000000004000000BC7E
      2B00C10CEB3FC03DD660A80FEB3F00000000047F2B005838F33FE209F75FA700
      00003F0BE85F0100000000000000000000000000000001000000000000000000
      000000000000000000000000000000000000FF7FE07FFF7FE07FFF7FE07F0000
      00000000000000000000000000000000000007655D380E008D41907E2B000C00
      8D41020000000C008D41000000000000000000000000147F2B00FA0AED3F907E
      2B000C008D4100000000000000000C008D41231DBC2B2927A427B7293C2AA536
      B037B230B23C80242E3A2539AE323410A6340000000000000000000000000000
      000000000000000000000000000000000000EF0AE67F4214F75FEC10EB3F5842
      F33FA015ED3F3721F75FF139B5403018AC403A5EAC40E012F55F00382B008E50
      F75F9670F75F0018AC40000000003A5EAC403721F75F080000000B35F75F6052
      FC5F307F2B003535F75FF039B5408E0CF85F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F3C0F3C0F3C0F3C0F3C
      0F3C0F3C00000F3C000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FF75EF75E00000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000F3C0F3C0F3C0F3C0F3C0F3C
      0F3C0F3C0F3C0F3C0F3C0000000000000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75E000000000000000000000000FF7FE07FF75EF75EF75E
      0000000000000000000000000000000000000000000000000000FF7FEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DFF7F000000000000007C007C007C007C007C007C007C
      007C00000F3C0F3C0F3C0F3C000000000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75E0000F75E00000000E07FFF7FFF7FE07FFF7FF75EF75E
      F75EF75E000000000000000000000000000000000000F75EF75EFF7FEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DFF7F00000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0F3C0F3C0F3C0F3C0F3C00000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75E0000F75EF75E0000E07FFF7FFF7FE07FFF7FE07F0000
      F75EF75EF75EF75E000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0F3C0F3C0F3C0F3C0F3C0000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75E0000F75EF75E0000E07FFF7FFF7FE07FFF7FE07FFF7F
      E07F0000F75EF75EF75E00000000000000000000F75EF75EF75EFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FF75E0F3C0F3C0F3C0F3C000000000000FF7FFF7F0000FF7FFF7F
      FF7F0000FF7FFF7FFF7FF75EF75EF75E0000E07FFF7FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07F0000F75EF75E0000000000000000EF3DF75EF75EFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      007C007CFF7FFF7FF75E0F3C0F3C0F3C000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FF75EF75E0000E07FFF7FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F00000000F75E0000000000000000F75EF75E000000000000
      000000000000000000000000EF3DEF3D00000000000000000000000000000000
      EF3DEF3D0000FF7FFF7FF75E0F3C0F3C000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FF75EF75E0000E07FFF7FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F0000000000000000000000000000F75EEF3DEF3DEF3DEF3D
      EF3DEF3DF75E00000000EF3DEF3DEF3D0000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F00000000FF7FFF7FF75E0F3C000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FF75E00000000E07FFF7FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F0000000000000000000000000000F75EF75EF75EF75EF75E
      F75EF75EF75EF75E00000000EF3DEF3D000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F1F7C0000FF7FFF7FF75E000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FF75E00000000E07FFF7F0000E07FFF7FE07FFF7F
      E07FFF7FE07FFF7F00000000000000000000000000000000F75EF75EF75EF75E
      F75EF75EF75EF75EF75E00000000EF3D00000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000EF3D00000000FF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FF75E00000000E07FFF7FFF7FFF7F0000E07FFF7F
      E07FFF7FE07FFF7F000000000000000000000000000000000000F75EF75EF75E
      F75EF75EF75EF75EF75EF75E0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F00000000000000001F7C00000000000000000000FF7FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FF75E000000000000E07F0000FF7F0000E07FFF7F
      E07FFF7FE07FFF7F0000000000000000000000000000000000000000F75EF75E
      F75EF75EF75EF75EF75EF75EF75E0000000000000000FF7FFF7FFF7FFF7FFF7F
      000000000000000000000000000000000000000000000000FF7FFF7F0000F75E
      F75EF75EF75EF75EF75EF75EF75E00000000000000000000F75EF75EF75E0000
      E07F0000E07FFF7F00000000000000000000000000000000000000000000F75E
      F75EF75EF75EF75EF75EF75EF75E00000000000000000000FF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000F75EF75E0000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FF75E
      E07FE07F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7F0000
      F75E00000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FBDEFBDEFBDEFBDEFBDEFBDEFBDEFBDE
      FBDEFBDEFBDEFBDEFBDEFBDEFBDEFBDEFBDEFBDEFBDEFBDEFFFFFFFFFBDEFBDE
      0000000000000000300036200000000000200000000000000000000036200000
      010120009F4B0001000040002000080000000000000000000000000000000000
      00000000000000000F00000000000000FFFF0000000000001011000000000000
      1010000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000000000
      03FF000000000000FFFF000000000000FFFFC03FFFFFEFFFF013801FFFFFC3FF
      F003800F000780FFC00300070003003F800300030001000F8003800100000007
      00038000000000038001C00080000001C001E0008000000CC001E0008003000F
      C001C0008003000FE00180018003000FF00180038003000FF801C1FFC003C00F
      FC03E3FFE1FFE02FFFFFF7FFFFFFF03F00000000000000000000000000000000
      000000000000}
  end
  object DosMove1: TDosMove
    Active = True
    Options = [moEnter]
    Left = 384
    Top = 24
  end
end
