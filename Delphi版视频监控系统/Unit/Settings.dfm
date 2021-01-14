object FrmSetting: TFrmSetting
  Left = 381
  Top = 251
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = #31995#32479#35774#32622
  ClientHeight = 368
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl: TPageControl
    Left = 7
    Top = 0
    Width = 352
    Height = 334
    ActivePage = TabSheet_Preview
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet_Preview: TTabSheet
      Caption = #39044#35272
      object Label1: TLabel
        Left = 13
        Top = 35
        Width = 36
        Height = 12
        Caption = #20142#24230#65306
      end
      object Label2: TLabel
        Left = 13
        Top = 129
        Width = 48
        Height = 12
        Caption = #23545#27604#24230#65306
      end
      object Label3: TLabel
        Left = 13
        Top = 80
        Width = 36
        Height = 12
        Caption = #33394#35843#65306
      end
      object Label4: TLabel
        Left = 13
        Top = 178
        Width = 48
        Height = 12
        Caption = #39281#21644#24230#65306
      end
      object LAB_Brightness: TLabel
        Left = 61
        Top = 36
        Width = 18
        Height = 12
        AutoSize = False
        Caption = 'N/A'
      end
      object LAB_Hue: TLabel
        Left = 61
        Top = 79
        Width = 18
        Height = 12
        AutoSize = False
        Caption = 'N/A'
      end
      object LAB_Contrast: TLabel
        Left = 61
        Top = 129
        Width = 18
        Height = 12
        AutoSize = False
        Caption = 'N/A'
      end
      object LAB_Saturation: TLabel
        Left = 61
        Top = 177
        Width = 18
        Height = 12
        AutoSize = False
        Caption = 'N/A'
      end
      object Bt_P_Default: TSpeedButton
        Left = 240
        Top = 272
        Width = 86
        Height = 22
        Hint = #20351#29992#25512#33616#20540
        Caption = #32570#30465#20540'(&D)'
        OnClick = Bt_P_DefaultClick
      end
      object SB_PreviewSetAll: TSpeedButton
        Left = 88
        Top = 272
        Width = 144
        Height = 22
        Hint = #24449#23545#39044#35272#25152#26377#36890#36947#35774#32622#19982#25105#30456#21516
        Caption = #25152#26377#36890#36947#35774#32622#19982#25105#30456#21516'(&M)'
        OnClick = SB_PreviewSetAllClick
      end
      object LbDspName: TLabel
        Left = 13
        Top = 244
        Width = 60
        Height = 12
        Caption = #36890#36947#21517#31216#65306
      end
      object SB_Brightness: TScrollBar
        Left = 85
        Top = 33
        Width = 239
        Height = 16
        Max = 255
        PageSize = 0
        Position = 1
        TabOrder = 0
        OnChange = SB_ScrollChange
      end
      object SB_Hue: TScrollBar
        Left = 85
        Top = 78
        Width = 239
        Height = 16
        Max = 255
        PageSize = 0
        Position = 1
        TabOrder = 1
        OnChange = SB_ScrollChange
      end
      object SB_Contrast: TScrollBar
        Left = 85
        Top = 127
        Width = 239
        Height = 16
        Max = 127
        PageSize = 0
        Position = 1
        TabOrder = 2
        OnChange = SB_ScrollChange
      end
      object SB_Saturation: TScrollBar
        Left = 85
        Top = 176
        Width = 239
        Height = 16
        Max = 127
        PageSize = 0
        Position = 1
        TabOrder = 3
        OnChange = SB_ScrollChange
      end
      object Panel15: TPanel
        Left = 13
        Top = 266
        Width = 314
        Height = 2
        BevelOuter = bvLowered
        TabOrder = 4
      end
      object TxtDspName: TEdit
        Left = 80
        Top = 240
        Width = 244
        Height = 20
        MaxLength = 10
        TabOrder = 5
      end
    end
    object TabSheet_Capture: TTabSheet
      Caption = #24405#20687
      ImageIndex = 1
      object Bt_C_default: TSpeedButton
        Left = 240
        Top = 272
        Width = 86
        Height = 22
        Hint = #20351#29992#25512#33616#20540
        Caption = #32570#30465#20540'(&D)'
        OnClick = Bt_C_defaultClick
      end
      object SB_CaptureSetAll: TSpeedButton
        Left = 88
        Top = 272
        Width = 144
        Height = 22
        Hint = #24449#23545#24405#20687#25152#26377#36890#36947#35774#32622#19982#25105#30456#21516
        Caption = #25152#26377#36890#36947#35774#32622#19982#25105#30456#21516'(&M)'
        OnClick = SB_CaptureSetAllClick
      end
      object Label6: TLabel
        Left = 18
        Top = 85
        Width = 72
        Height = 12
        Alignment = taRightJustify
        Caption = #20851#38190#24103#38388#38548#65306
      end
      object Label7: TLabel
        Left = 169
        Top = 85
        Width = 72
        Height = 12
        Alignment = taRightJustify
        Caption = #27599#31186#24635#24103#25968#65306
      end
      object Label24: TLabel
        Left = 215
        Top = 54
        Width = 60
        Height = 12
        Caption = #36136#37327#31561#32423#65306
      end
      object Label30: TLabel
        Left = 17
        Top = 114
        Width = 234
        Height = 12
        Caption = #24405#20687#25991#20214#25171#21253#26102#38388#38388#38548#65306'           ('#20998#38047')'
      end
      object Label34: TLabel
        Left = 197
        Top = 21
        Width = 48
        Height = 12
        Caption = '(M/'#23567#26102')'
      end
      object Lab_Color: TLabel
        Left = 269
        Top = 140
        Width = 57
        Height = 12
        Cursor = crHandPoint
        AutoSize = False
        Color = clTeal
        ParentColor = False
      end
      object Label8: TLabel
        Left = 16
        Top = 54
        Width = 60
        Height = 12
        Caption = #22270#20687#23610#23544#65306
      end
      object Label5: TLabel
        Left = 16
        Top = 214
        Width = 312
        Height = 12
        Caption = #35774#32622#29992#20110#20445#23384#24405#20687#25991#20214#30340#30913#30424#65306#20174'        '#30424#21040'        '#30424
      end
      object Label12: TLabel
        Left = 16
        Top = 236
        Width = 312
        Height = 24
        Caption = #27880#24847#65306#21508#36890#36947#20043#38388#30340#23384#30424#35774#32622#31105#27490#20132#21449#65288#21253#21547#21253#25324#65289#65292#13#10#21542#21017#26377#21487#33021#23548#33267#28165#30424#24322#24120#12290
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 226
        Top = 167
        Width = 36
        Height = 12
        Caption = #21046#24335#65306
      end
      object Label18: TLabel
        Left = 16
        Top = 191
        Width = 72
        Height = 12
        Caption = #26368#22823#27604#29305#29575#65306
      end
      object Panel4: TPanel
        Left = 16
        Top = 266
        Width = 310
        Height = 2
        BevelOuter = bvLowered
        TabOrder = 0
      end
      object SE_KeyFrameIntervals: TSpinEdit
        Left = 93
        Top = 81
        Width = 46
        Height = 21
        Hint = #20027#35201#29992#20110#35843#33410#24405#20687#22238#25918#26102#30340#25238#21160#65292#20540#36234#22823#36234#24179#28369
        MaxValue = 400
        MinValue = 1
        TabOrder = 1
        Value = 301
      end
      object SE_FrameRate: TSpinEdit
        Left = 245
        Top = 81
        Width = 46
        Height = 21
        Hint = #20302#20110'25'#24103#21017#19981#36830#32493#65292#20294#24405#20687#25991#20214#20250#23567#19968#28857
        MaxValue = 30
        MinValue = 1
        TabOrder = 2
        Value = 25
      end
      object SE_QuantLevel: TSpinEdit
        Left = 281
        Top = 50
        Width = 45
        Height = 21
        Hint = #21387#32553#21442#25968#65292#20540#36234#22823#65292#21387#32553#27604#36234#39640#65292#20294#36136#37327#36234#24046
        MaxValue = 30
        MinValue = 1
        TabOrder = 3
        Value = 15
      end
      object CB_UseAudio: TCheckBox
        Left = 16
        Top = 164
        Width = 97
        Height = 17
        Hint = #24320#21551#22768#38899#37319#38598
        Caption = #21516#26102#24405#21046#22768#38899
        TabOrder = 4
      end
      object CB_OSD: TCheckBox
        Left = 16
        Top = 139
        Width = 185
        Height = 17
        Hint = #21472#21152#22312#30011#38754#30340#19979#26041
        Caption = #22312#24405#20687#25991#20214#19978#26174#31034#21517#31216#21450#26102#38388
        TabOrder = 5
      end
      object SE_Package: TSpinEdit
        Left = 152
        Top = 110
        Width = 57
        Height = 21
        Hint = #35774#25171#21253#26102#38388#65292#23545#25152#26377#36890#36947#26377#25928
        MaxValue = 600
        MinValue = 2
        TabOrder = 6
        Value = 2
      end
      object SE_FileSize: TSpinEdit
        Left = 144
        Top = 18
        Width = 49
        Height = 21
        MaxValue = 10000
        MinValue = 50
        TabOrder = 7
        Value = 100
      end
      object CB_FileSize: TCheckBox
        Left = 16
        Top = 20
        Width = 121
        Height = 17
        Caption = #38480#21046#25991#20214#23610#23544#19978#38480
        TabOrder = 8
      end
      object CB_ImageSize: TComboBox
        Left = 81
        Top = 50
        Width = 112
        Height = 20
        Style = csDropDownList
        ItemHeight = 12
        TabOrder = 9
      end
      object CB_BeginDrive: TComboBox
        Left = 200
        Top = 210
        Width = 40
        Height = 20
        Style = csDropDownList
        ItemHeight = 12
        TabOrder = 10
      end
      object CB_EndDrive: TComboBox
        Left = 272
        Top = 210
        Width = 40
        Height = 20
        Style = csDropDownList
        ItemHeight = 12
        TabOrder = 11
      end
      object CB_VideoFormat: TComboBox
        Left = 272
        Top = 163
        Width = 57
        Height = 20
        Style = csDropDownList
        ItemHeight = 12
        TabOrder = 12
      end
      object SE_Maxbps: TSpinEdit
        Left = 96
        Top = 186
        Width = 65
        Height = 21
        MaxValue = 100000
        MinValue = 0
        TabOrder = 13
        Value = 10000
      end
      object CB_CBR: TCheckBox
        Left = 176
        Top = 188
        Width = 49
        Height = 17
        Hint = #26159#21542#37319#29992#24658#23450#30721#29575
        Caption = 'CBR'
        TabOrder = 14
      end
    end
    object TabSheet_Alarm: TTabSheet
      Caption = #25253#35686
      ImageIndex = 2
      object SB_MotionSetAll: TSpeedButton
        Left = 88
        Top = 272
        Width = 144
        Height = 22
        Hint = #24449#23545#25253#35686#25152#26377#36890#36947#35774#32622#19982#25105#30456#21516
        Caption = #25152#26377#36890#36947#35774#32622#19982#25105#30456#21516'(&M)'
        OnClick = SB_MotionSetAllClick
      end
      object CB_Alarm_default: TSpeedButton
        Left = 240
        Top = 272
        Width = 86
        Height = 22
        Hint = #20351#29992#25512#33616#20540
        Caption = #32570#30465#20540'(&D)'
        OnClick = CB_Alarm_defaultClick
      end
      object Label9: TLabel
        Left = 127
        Top = 223
        Width = 36
        Height = 12
        Caption = #28789#25935#24230
      end
      object Label20: TLabel
        Left = 39
        Top = 204
        Width = 48
        Height = 12
        Caption = #36719#20214#20390#27979
      end
      object Label11: TLabel
        Left = 98
        Top = 182
        Width = 132
        Height = 12
        Caption = #65288#31186#65289#25253#35686#22768#38899#25345#32493#26102#38388
      end
      object SB_Alarm_SoftSound: TSpeedButton
        Left = 162
        Top = 155
        Width = 23
        Height = 22
        Flat = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF000300A4FFFFFFFFFFFFFFFFFFFFFF00
          03000707A4FFFFFFA4FFFFFFFFFF0003A4A4FFFFA4FFFFA4FFFFFFFFFF0003FB
          0007FFFFA4FFA4FFFFFFFF000003FBFF0007FFFFA4FFFFFFFFFF0003A4FBFFFB
          0000FFFFA4FFFFFFFFFF03FB07FFFBFF00A400FFA4FFA4A4A4A403FB07FBFFFB
          000700FFA4FFFFFFFFFF03FF07FFFBFF0000FFFFA4FFFFFFFFFFFF0303FBFFFB
          0007FFFFA4FFA4FFFFFFFFFFFF03FBFF0007FFFFA4FFFFA4FFFFFFFFFFFF03FB
          A4A407FFA4FFFFFFA4FFFFFFFFFFFF03FB000707FFFFFFFFFFFFFFFFFFFFFFFF
          03A400A4FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFF}
        OnClick = SB_Alarm_SoftSoundClick
      end
      object SB_Alarm_SoftSoundOpen: TSpeedButton
        Left = 186
        Top = 155
        Width = 23
        Height = 22
        Flat = True
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C000000000000000000000000000000000000000000001F7C1F7C
          1F7C1F7C1F7C0000000000420042004200420042004200420042004200001F7C
          1F7C1F7C1F7C0000E07F00000042004200420042004200420042004200420000
          1F7C1F7C1F7C0000FF7FE07F0000004200420042004200420042004200420042
          00001F7C1F7C0000E07FFF7FE07F000000420042004200420042004200420042
          004200001F7C0000FF7FE07FFF7FE07F00000000000000000000000000000000
          0000000000000000E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F00001F7C1F7C
          1F7C1F7C1F7C0000FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F00001F7C1F7C
          1F7C1F7C1F7C0000E07FFF7FE07F00000000000000000000000000001F7C1F7C
          1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C0000
          1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        OnClick = SB_Alarm_SoftSoundOpenClick
      end
      object Lab_Alarm_SoftSound: TLabel
        Left = 217
        Top = 160
        Width = 114
        Height = 12
        Caption = 'Lab_Alarm_SoftSound'
      end
      object Label10: TLabel
        Left = 313
        Top = 121
        Width = 12
        Height = 12
        Caption = #31186
      end
      object SB_Alarm_VideoSound: TSpeedButton
        Left = 166
        Top = 54
        Width = 23
        Height = 22
        Flat = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF000300A4FFFFFFFFFFFFFFFFFFFFFF00
          03000707A4FFFFFFA4FFFFFFFFFF0003A4A4FFFFA4FFFFA4FFFFFFFFFF0003FB
          0007FFFFA4FFA4FFFFFFFF000003FBFF0007FFFFA4FFFFFFFFFF0003A4FBFFFB
          0000FFFFA4FFFFFFFFFF03FB07FFFBFF00A400FFA4FFA4A4A4A403FB07FBFFFB
          000700FFA4FFFFFFFFFF03FF07FFFBFF0000FFFFA4FFFFFFFFFFFF0303FBFFFB
          0007FFFFA4FFA4FFFFFFFFFFFF03FBFF0007FFFFA4FFFFA4FFFFFFFFFFFF03FB
          A4A407FFA4FFFFFFA4FFFFFFFFFFFF03FB000707FFFFFFFFFFFFFFFFFFFFFFFF
          03A400A4FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFF}
        OnClick = SB_Alarm_VideoSoundClick
      end
      object SB_Alarm_VideoSoundOpen: TSpeedButton
        Left = 190
        Top = 54
        Width = 23
        Height = 22
        Flat = True
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C000000000000000000000000000000000000000000001F7C1F7C
          1F7C1F7C1F7C0000000000420042004200420042004200420042004200001F7C
          1F7C1F7C1F7C0000E07F00000042004200420042004200420042004200420000
          1F7C1F7C1F7C0000FF7FE07F0000004200420042004200420042004200420042
          00001F7C1F7C0000E07FFF7FE07F000000420042004200420042004200420042
          004200001F7C0000FF7FE07FFF7FE07F00000000000000000000000000000000
          0000000000000000E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F00001F7C1F7C
          1F7C1F7C1F7C0000FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F00001F7C1F7C
          1F7C1F7C1F7C0000E07FFF7FE07F00000000000000000000000000001F7C1F7C
          1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C0000
          1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        OnClick = SB_Alarm_VideoSoundOpenClick
      end
      object Lab_Alarm_VideoSound: TLabel
        Left = 216
        Top = 61
        Width = 120
        Height = 12
        Caption = 'Lab_Alarm_VideoSound'
      end
      object Panel3: TPanel
        Left = 16
        Top = 266
        Width = 310
        Height = 2
        BevelOuter = bvLowered
        TabOrder = 0
      end
      object CB_Alarm_Sensetive: TSpinEdit
        Left = 68
        Top = 218
        Width = 49
        Height = 21
        Hint = #25968#20540#36234#23567#28789#25935#24230#36234#39640
        MaxLength = 100
        MaxValue = 100
        MinValue = 1
        TabOrder = 1
        Value = 1
      end
      object Panel10: TPanel
        Left = 112
        Top = 208
        Width = 207
        Height = 2
        BevelOuter = bvLowered
        TabOrder = 2
      end
      object CB_Alarm_SoftAlarmContinuTime: TSpinEdit
        Left = 40
        Top = 177
        Width = 49
        Height = 21
        MaxValue = 1200
        MinValue = 5
        TabOrder = 3
        Value = 60
      end
      object CB_Alarm_SoftUseAudio: TCheckBox
        Left = 40
        Top = 158
        Width = 113
        Height = 17
        Caption = #24320#21551#25253#35686#22768#38899
        TabOrder = 4
      end
      object CB_Alarm_PreCapture: TCheckBox
        Left = 40
        Top = 141
        Width = 97
        Height = 17
        Hint = #20445#30041#25253#35686#21069#19968#27573#26102#38388#30340#24773#26223
        Caption = #24320#21551#39044#24405#20687
        TabOrder = 5
      end
      object Panel11: TPanel
        Left = 41
        Top = 137
        Width = 283
        Height = 2
        BevelOuter = bvLowered
        TabOrder = 6
      end
      object CB_Alarm_PreCaptureTime: TSpinEdit
        Left = 267
        Top = 116
        Width = 42
        Height = 21
        MaxValue = 999
        MinValue = 5
        TabOrder = 7
        Value = 10
      end
      object CB_Alarm_Capture: TCheckBox
        Left = 40
        Top = 117
        Width = 169
        Height = 17
        Hint = #20915#23450#25253#35686#26469#26102#35201#19981#35201#24405#20687
        Caption = #25253#35686#35302#21457#26102#24320#21551#25253#35686#24405#20687
        TabOrder = 8
      end
      object RB_Alarm_HardAlarm: TCheckBox
        Tag = 2
        Left = 248
        Top = 38
        Width = 73
        Height = 17
        Caption = #25506#22836#20390#27979
        TabOrder = 9
      end
      object RB_Alarm_SfotAlarm: TCheckBox
        Tag = 1
        Left = 144
        Top = 38
        Width = 81
        Height = 17
        Caption = #36719#20214#20390#27979
        TabOrder = 10
      end
      object CB_Alarm_VideoUseAudio: TCheckBox
        Left = 40
        Top = 58
        Width = 97
        Height = 17
        Caption = #24320#21551#25253#35686#22768#38899
        TabOrder = 11
      end
      object CB_Alarm_VideoLose: TCheckBox
        Left = 16
        Top = 39
        Width = 97
        Height = 16
        Hint = #38450#30772#22351#25253#35686
        Caption = #35270#39057#20002#22833#20390#27979
        TabOrder = 12
      end
      object CB_Motion: TCheckBox
        Left = 16
        Top = 16
        Width = 97
        Height = 17
        Caption = #26159#21542#21551#29992#25253#35686
        TabOrder = 13
        OnClick = CB_MotionClick
      end
    end
    object TabSheet_Auto: TTabSheet
      Caption = #33258#21160
      ImageIndex = 4
      object TV_AutoCapture: TTreeView
        Left = 0
        Top = 25
        Width = 344
        Height = 282
        Align = alClient
        Images = ImageList
        Indent = 19
        ReadOnly = True
        RowSelect = True
        SortType = stText
        TabOrder = 0
      end
      object ToolBar_Auto: TToolBar
        Left = 0
        Top = 0
        Width = 344
        Height = 25
        Caption = 'ToolBar_Auto'
        EdgeBorders = []
        Flat = True
        Images = ImageList
        TabOrder = 1
        object TB_New: TToolButton
          Left = 0
          Top = 0
          Hint = #28155#21152#19968#26102#38388#27573
          Caption = 'TB_New'
          Enabled = False
          ImageIndex = 0
        end
        object TB_Modify: TToolButton
          Left = 23
          Top = 0
          Hint = #20462#25913#19968#26102#38388#27573
          Caption = 'TB_Modify'
          Enabled = False
          ImageIndex = 1
        end
        object TB_Delete: TToolButton
          Left = 46
          Top = 0
          Hint = #21024#38500#19968#26102#38388#27573
          Caption = 'TB_Delete'
          Enabled = False
          ImageIndex = 2
        end
        object ToolButtonSp1: TToolButton
          Left = 69
          Top = 0
          Width = 8
          Caption = 'ToolButtonSp1'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object TB_Copy: TToolButton
          Left = 77
          Top = 0
          Hint = #25335#36125#24403#21069#36890#36947#30340#20840#37096#25968#25454
          Caption = 'TB_Copy'
          ImageIndex = 9
        end
        object TB_Paste: TToolButton
          Left = 100
          Top = 0
          Hint = #31896#36148#25152#25335#36125#30340#36890#36947#21040#30446#30340#36890#36947
          Caption = 'TB_Paste'
          ImageIndex = 10
        end
        object ToolButtonSp2: TToolButton
          Left = 123
          Top = 0
          Width = 8
          Caption = 'ToolButtonSp2'
          ImageIndex = 13
          Style = tbsSeparator
        end
        object TB_PasteAll: TToolButton
          Left = 131
          Top = 0
          Hint = #31896#36148#25152#25335#36125#30340#36890#36947#21040#25152#26377#36890#36947
          Caption = 'TB_PasteAll'
          ImageIndex = 13
        end
        object ToolButtonSp3: TToolButton
          Left = 154
          Top = 0
          Width = 8
          Caption = 'ToolButtonSp3'
          ImageIndex = 13
          Style = tbsSeparator
        end
        object TB_Collapse: TToolButton
          Left = 162
          Top = 0
          Hint = #25910#25314#24403#21069#36890#36947
          Caption = 'TB_Collapse'
          ImageIndex = 11
        end
        object TB_Expand: TToolButton
          Left = 185
          Top = 0
          Hint = #23637#24320#24403#21069#36890#36947
          Caption = 'TB_Expand'
          ImageIndex = 12
        end
      end
    end
    object TabSheet_YunTai: TTabSheet
      Caption = #20113#21488
      ImageIndex = 5
      object lv_YunTai: TListView
        Left = 0
        Top = 0
        Width = 344
        Height = 307
        Align = alClient
        Columns = <
          item
            Caption = #36890#36947
            Width = 40
          end
          item
            Caption = #22320#22336
            Width = 40
          end
          item
            Caption = #24555#29699#22320#22336
            Width = 60
          end
          item
            Caption = #20113#21488
            Width = 110
          end
          item
            Caption = #20018#21475
            Width = 40
          end
          item
            Caption = #27874#29305#29575
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object YTPanel: TPanel
        Left = -2
        Top = 50
        Width = 346
        Height = 55
        TabOrder = 1
        Visible = False
        object sb_OK: TSpeedButton
          Left = 95
          Top = 29
          Width = 75
          Height = 21
          Caption = #30830#23450
        end
        object sb_Cancel: TSpeedButton
          Left = 178
          Top = 29
          Width = 75
          Height = 21
          Caption = #21462#28040
        end
        object ed_YTPort: TEdit
          Left = 2
          Top = 4
          Width = 41
          Height = 20
          Enabled = False
          ImeName = #20013#25991' ('#31616#20307') - '#29579#30721#20116#31508#22411'86'#29256
          TabOrder = 0
        end
        object ed_YTBaudrate: TEdit
          Left = 294
          Top = 4
          Width = 50
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#29579#30721#20116#31508#22411'86'#29256
          TabOrder = 1
        end
        object cb_YTName: TComboBox
          Left = 143
          Top = 4
          Width = 110
          Height = 20
          Style = csDropDownList
          ImeName = #20013#25991' ('#31616#20307') - '#29579#30721#20116#31508#22411'86'#29256
          ItemHeight = 12
          Sorted = True
          TabOrder = 2
        end
        object cb_YTCOM: TComboBox
          Left = 253
          Top = 4
          Width = 41
          Height = 20
          Hint = #20219#36873#19968#20010#65292#27880#24847#19981#35201#19982#25253#35686#30418#20018#21475#20914#31361
          Style = csDropDownList
          ImeName = #20013#25991' ('#31616#20307') - '#29579#30721#20116#31508#22411'86'#29256
          ItemHeight = 12
          TabOrder = 3
        end
        object ed_YTAddress: TSpinEdit
          Left = 43
          Top = 4
          Width = 41
          Height = 21
          Hint = #19968#33324#35299#30721#22120#20351#29992#30340#22320#22336
          MaxValue = 255
          MinValue = 0
          TabOrder = 4
          Value = 0
        end
        object ed_YTAddress_2: TSpinEdit
          Left = 83
          Top = 4
          Width = 60
          Height = 21
          Hint = #26576#20123#24555#29699#20351#29992#30340#23567#22320#22336
          MaxValue = 255
          MinValue = 0
          TabOrder = 5
          Value = 0
        end
      end
    end
    object TabSheet_Net: TTabSheet
      Caption = #32593#32476
      ImageIndex = 6
      object PageControl_Net: TPageControl
        Left = 0
        Top = 0
        Width = 344
        Height = 307
        ActivePage = TabSheet_Net1
        Align = alClient
        TabOrder = 0
        object TabSheet_Net1: TTabSheet
          Caption = #20256#36755#26041#24335
          object LV_NetMode: TListView
            Left = 0
            Top = 0
            Width = 336
            Height = 280
            Align = alClient
            Columns = <
              item
                Caption = #36890#36947
                Width = 152
              end
              item
                Caption = #36830#25509#26041#24335
                Width = 90
              end
              item
                Caption = #26368#22823#36830#25509#25968
                Width = 90
              end>
            GridLines = True
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsReport
          end
          object NetPanel: TPanel
            Left = -10
            Top = 50
            Width = 347
            Height = 55
            TabOrder = 1
            Visible = False
            object SB_OK_NET: TSpeedButton
              Left = 105
              Top = 29
              Width = 75
              Height = 21
              Caption = #30830#23450
            end
            object SB_Cancel_NET: TSpeedButton
              Left = 188
              Top = 29
              Width = 75
              Height = 21
              Caption = #21462#28040
            end
            object SE_MaxConnetion: TSpinEdit
              Left = 253
              Top = 3
              Width = 92
              Height = 21
              MaxValue = 1000
              MinValue = 0
              TabOrder = 0
              Value = 0
            end
            object SE_ConnectMode: TSpinEdit
              Left = 163
              Top = 3
              Width = 90
              Height = 21
              MaxValue = 4
              MinValue = 0
              TabOrder = 1
              Value = 0
            end
          end
        end
        object TabSheet_Net2: TTabSheet
          Caption = #23458#25143#35748#35777
          ImageIndex = 1
          object ToolBar_Net: TToolBar
            Left = 0
            Top = 0
            Width = 336
            Height = 25
            Caption = 'ToolBar_Net'
            EdgeBorders = []
            Flat = True
            Images = ImageList
            TabOrder = 0
            object TB_Client_new: TToolButton
              Left = 0
              Top = 0
              Hint = #28155#21152#19968#20449#20219#29992#25143
              Caption = 'TB_Client_new'
              ImageIndex = 11
            end
            object TB_Client_delete: TToolButton
              Left = 23
              Top = 0
              Hint = #21024#38500#24403#21069#25351#31034#29992#25143
              Caption = 'TB_Client_delete'
              ImageIndex = 12
            end
            object ToolButtonSp4: TToolButton
              Left = 46
              Top = 0
              Width = 8
              Caption = 'ToolButtonSp4'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object TB_Client_Modify: TToolButton
              Left = 54
              Top = 0
              Hint = #20462#25913#24403#21069#29992#25143
              Caption = 'TB_Client_Modify'
              ImageIndex = 15
            end
            object CB_ClientStart: TCheckBox
              Left = 77
              Top = 0
              Width = 247
              Height = 22
              Hint = #36873#20013#34920#31034#21551#29992#32593#32476#29992#25143#36523#20221#39564#35777#65292#21542#21017#20219#24847#29992#25143#30342#21487#36830#25509#20027#26426
              Caption = #21551#29992#32593#32476#29992#25143#36523#20221#39564#35777
              TabOrder = 0
            end
          end
          object ListView_IP: TListView
            Left = 0
            Top = 25
            Width = 336
            Height = 255
            Align = alClient
            Checkboxes = True
            Columns = <
              item
                Caption = #21551#29992
                Width = 40
              end
              item
                Caption = #21517#31216
                Width = 100
              end
              item
                Caption = #23494#30721
                Width = 110
              end
              item
                Caption = #21487#36830#25509#36890#36947
                Width = 300
              end>
            RowSelect = True
            SortType = stText
            TabOrder = 1
            ViewStyle = vsReport
          end
        end
        object TabSheet_Net3: TTabSheet
          Caption = #20854#20182
          ImageIndex = 2
          object Label39: TLabel
            Left = 16
            Top = 24
            Width = 48
            Height = 12
            Caption = #26222#36890#26381#21153
          end
          object Label38: TLabel
            Left = 78
            Top = 42
            Width = 66
            Height = 12
            Caption = #36215#22987#31471#21475#21495':'
          end
          object Label40: TLabel
            Left = 16
            Top = 73
            Width = 42
            Height = 12
            Caption = 'Web'#26381#21153
          end
          object Label41: TLabel
            Left = 95
            Top = 133
            Width = 66
            Height = 12
            Caption = #30417#21548#31471#21475#21495':'
          end
          object Lab_EndPort: TLabel
            Left = 238
            Top = 42
            Width = 6
            Height = 12
          end
          object Panel16: TPanel
            Left = 80
            Top = 28
            Width = 228
            Height = 2
            BevelOuter = bvLowered
            TabOrder = 0
          end
          object SE_IniPort: TSpinEdit
            Left = 152
            Top = 38
            Width = 65
            Height = 21
            MaxValue = 65500
            MinValue = 5000
            TabOrder = 1
            Value = 5000
          end
          object CB_WebEnabled: TCheckBox
            Left = 80
            Top = 92
            Width = 67
            Height = 17
            Caption = #21551#29992
            TabOrder = 2
          end
          object Panel17: TPanel
            Left = 80
            Top = 77
            Width = 228
            Height = 2
            BevelOuter = bvLowered
            TabOrder = 3
          end
          object SE_WebPort: TSpinEdit
            Left = 170
            Top = 129
            Width = 65
            Height = 21
            MaxValue = 65500
            MinValue = 80
            TabOrder = 4
            Value = 80
          end
          object CB_SingleConnect: TCheckBox
            Left = 80
            Top = 172
            Width = 241
            Height = 17
            Caption = #21482#20801#35768#23458#25143#19968#27425#32852#25509#19968#36890#36947
            TabOrder = 5
          end
        end
      end
    end
    object TabSheet_Global: TTabSheet
      Caption = #20840#23616#35774#32622
      ImageIndex = 4
      object SB_OpenImage: TSpeedButton
        Left = 122
        Top = 43
        Width = 23
        Height = 22
        Flat = True
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C000000000000000000000000000000000000000000001F7C1F7C
          1F7C1F7C1F7C0000000000420042004200420042004200420042004200001F7C
          1F7C1F7C1F7C0000E07F00000042004200420042004200420042004200420000
          1F7C1F7C1F7C0000FF7FE07F0000004200420042004200420042004200420042
          00001F7C1F7C0000E07FFF7FE07F000000420042004200420042004200420042
          004200001F7C0000FF7FE07FFF7FE07F00000000000000000000000000000000
          0000000000000000E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F00001F7C1F7C
          1F7C1F7C1F7C0000FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F00001F7C1F7C
          1F7C1F7C1F7C0000E07FFF7FE07F00000000000000000000000000001F7C1F7C
          1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C0000
          1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        OnClick = SB_OpenImageClick
      end
      object SB_OpenFrame: TSpeedButton
        Left = 122
        Top = 75
        Width = 23
        Height = 22
        Flat = True
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C000000000000000000000000000000000000000000001F7C1F7C
          1F7C1F7C1F7C0000000000420042004200420042004200420042004200001F7C
          1F7C1F7C1F7C0000E07F00000042004200420042004200420042004200420000
          1F7C1F7C1F7C0000FF7FE07F0000004200420042004200420042004200420042
          00001F7C1F7C0000E07FFF7FE07F000000420042004200420042004200420042
          004200001F7C0000FF7FE07FFF7FE07F00000000000000000000000000000000
          0000000000000000E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F00001F7C1F7C
          1F7C1F7C1F7C0000FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F00001F7C1F7C
          1F7C1F7C1F7C0000E07FFF7FE07F00000000000000000000000000001F7C1F7C
          1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C0000
          1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        OnClick = SB_OpenFrameClick
      end
      object Label14: TLabel
        Left = 16
        Top = 16
        Width = 318
        Height = 12
        Caption = #24403#26368#21518#30340#30424#31526#31354#38388#23567#20110'            MB '#26102#65292#25191#34892#28165#30424#24037#20316#12290
      end
      object Label16: TLabel
        Left = 16
        Top = 48
        Width = 84
        Height = 12
        Caption = #25235#22270#20445#23384#30446#24405#65306
      end
      object Label17: TLabel
        Left = 16
        Top = 80
        Width = 84
        Height = 12
        Caption = #25235#24103#20445#23384#30446#24405#65306
      end
      object LB_CaptureImageDir: TLabel
        Left = 160
        Top = 48
        Width = 169
        Height = 12
        AutoSize = False
        Caption = 'LB_CaptureImageDir'
      end
      object LB_CaptureFrameDir: TLabel
        Left = 160
        Top = 80
        Width = 169
        Height = 12
        AutoSize = False
        Caption = 'LB_CaptureFrameDir'
      end
      object SE_DiskEndSize: TSpinEdit
        Left = 139
        Top = 12
        Width = 62
        Height = 21
        MaxValue = 3000
        MinValue = 10
        TabOrder = 0
        Value = 1000
      end
      object CB_DSPStatus: TCheckBox
        Left = 16
        Top = 108
        Width = 201
        Height = 17
        Caption = #26159#21542#24320#21551#36890#36947#26816#27979#26159#21542#27491#24120#24037#20316
        TabOrder = 1
      end
    end
  end
  object Bt_Save: TButton
    Left = 122
    Top = 340
    Width = 75
    Height = 21
    Caption = #30830#23450
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Bt_SaveClick
  end
  object Bt_Cancel: TButton
    Left = 202
    Top = 340
    Width = 75
    Height = 21
    Cancel = True
    Caption = #21462#28040
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Bt_CancelClick
  end
  object Bt_Application: TButton
    Left = 284
    Top = 340
    Width = 75
    Height = 21
    Caption = #24212#29992'(&A)'
    TabOrder = 3
    OnClick = Bt_ApplicationClick
  end
  object OD: TOpenDialog
    DefaultExt = 'wav'
    Filter = 'Wav '#25991#20214' (*.wav)|*.wav'
    Left = 6
    Top = 337
  end
  object MainMenu: TMainMenu
    AutoHotkeys = maManual
    Left = 64
    Top = 337
    object S_Channel: TMenuItem
      AutoCheck = True
      Caption = #36890#36947'(&C)'
    end
  end
  object ColorDialog: TColorDialog
    Left = 92
    Top = 337
  end
  object ImageList: TImageList
    ShareImages = True
    Left = 34
    Top = 337
    Bitmap = {
      494C010110001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
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
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084000000840000008400000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FFFF00008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084000000FFFFFF00FFFFFF0084000000FFFFFF0084000000840000008400
      000084000000FFFFFF0084000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084000000FFFF
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      840084000000FFFFFF008400000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFF00008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      840084000000FFFFFF00FFFFFF0084000000FFFFFF0084000000FFFFFF008400
      0000840000008400000084000000000000008484840000848400008484000084
      84000084840000848400008484000084840084000000FFFF0000840000008400
      0000008484000084840000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      840084000000FFFFFF008400000084000000FFFFFF00FFFFFF00FFFFFF008400
      0000FFFFFF0084000000000000000000000084848400C6C6C60000FFFF00C6C6
      C60084848400000000000000000084848400C6C6C60084000000840000000084
      840000FFFF000084840000000000000000000000000000000000000000000000
      0000848484008484840000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      840084000000FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF008400
      00008400000000000000000000000000000084848400C6C6C600C6C6C6008484
      8400C6C6C600FFFF0000C6C6C6000000000084848400008484000084840000FF
      FF00C6C6C6000084840000000000000000000000000000000000000000008484
      8400848484000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400008484008484
      840084000000FFFFFF00FFFFFF00840000008400000084000000840000008400
      00000084840000000000000000000000000084848400C6C6C60084848400C6C6
      C600FFFF0000C6C6C600FFFF0000C6C6C600000000000084840000FFFF00C6C6
      C60000FFFF000084840000000000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      8400840000008400000084000000840000008400000084000000840000000084
      84008484840000000000000000000000000084848400C6C6C60084848400FFFF
      0000C6C6C600FFFF0000C6C6C600FFFF00000000000000848400C6C6C60000FF
      FF00C6C6C6000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      84000084840000000000000000000000000084848400C6C6C60084848400C6C6
      C600FFFF0000C6C6C600FFFF0000C6C6C600000000008484840000FFFF00C6C6
      C60000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008484840000000000000000000000000084848400C6C6C600C6C6C6008484
      8400C6C6C600FFFF0000C6C6C600000000008484840000FFFF00C6C6C60000FF
      FF00C6C6C6000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000008484
      84000084840000000000000000000000000084848400C6C6C60000FFFF00C6C6
      C6008484840084848400000000008484840000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      84008484840000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C6008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000084840000848400008484000084840000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600FF000000C6C6C60000000000008484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084000000C6C6C600C6C6C600C6C6C600FFFFFF00FF000000FFFFFF000084
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF008400000084000000840000008400
      00008400000084000000FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000000000C6C6
      C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00008484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00C6C6C600FF00
      0000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
      0000000000008484840000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00840000008400000084000000FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00C6C6C600C6C6
      C600C6C6C600FFFFFF00FFFFFF0000000000C6C6C600C6C6C600C6C6C600FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0084000000C6C6
      C600C6C6C600FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00C6C6C600C6C6
      C600C6C6C600FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF00840000008400000084000000840000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008400
      0000C6C6C600FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF008400
      0000008484000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00C6C6
      C600FF000000C6C6C600FFFFFF0000000000FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF00C6C6C600C6C6C600C6C6C60084000000C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084848400848484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000008484
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFF000000000000000000000000000000000000848400000000000000
      0000848484000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000848484000084
      8400008484000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF00C6C6C6000000000000000000000000000000000000FFFF0000FFFF00C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C60000000000FFFF0000840000000000000000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000084000000000000000000
      0000840000000084000000840000008400000084000000840000008400008400
      0000840000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000216300000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000840000008400
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400008400000000000000000000000000000000000000000000000000
      84000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00002163000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      0000008400000084000000FF000000FF000000FF000000FF000000FF00000084
      0000008400000084000084000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6008484840084848400000000000000000000000000000000000000
      00000000FF000000FF000021E700002163000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      00000084000000FF0000000000000000000000000000000000000000000000FF
      0000008400000084000000840000840000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6008484840084848400000000000000000000000000000000000000
      FF000000FF000021E7000021E7000000FF000021630000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      000000FF00000084000000840000840000000000000000000000000000000000
      000000000000000084000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60084848400848484000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000021630000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000000000000000
      000000FF00008400000084000000840000000000000000000000000000000000
      000000000000000084000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000FF
      0000C6C6C60084848400848484000000000000000000004284000000FF000000
      FF000042E700000000000000FF000000FF000000FF0000216300000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000084000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6008484840000000000004284000000FF000042E7000000
      00000000000000000000000000000000FF000000FF0000216300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00002163000000
      00000000000000000000000000000000000000FF000084000000840000008400
      000000000000000000000000000000000000000000000000000000FF00000084
      0000008400000084000000840000840000000000000000000000000000000000
      0000000000000000000000000000000084000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00002163000000
      00000000000000000000000000000000000000FF000000840000008400008400
      00000000000000000000000000000000000000000000000000000000000000FF
      0000008400000084000000840000840000000000000000000000000000000000
      0000000000000000000000000000000084000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000021
      6300000000000000000000000000000000000000000000FF0000008400000084
      0000840000000000000000000000000000000000000000000000840000008400
      0000008400000084000000840000840000000000000000000000000000000000
      000000000000000000000000000000000000000084000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000042E7000000
      FF00002163000000000000000000000000000000000000FF0000008400000084
      0000008400008400000084000000840000008400000084000000008400000084
      0000008400000084000000840000840000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000042
      E7000000FF00002163000000000000000000000000000000000000FF00000084
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000FF000000FF0000840000000000000000000000000000000000
      00000000000000000000000000000000000000000000000084000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000021630000000000000000000000000000FF
      000000FF000000840000008400000084000000840000008400000084000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF0000FF
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF00000000
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
      0000F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      00000000000000000000000000000000000000000000000000000000FF0000FF
      FF000000FF000000840000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000C6C6C600FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF0000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840084848400FFFF0000C6C6C600C6C6
      C600FFFF00000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000008400000000000000000000000000000000000000
      FF00000084000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840084848400C6C6C600FFFF0000C6C6
      C600FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000840000000000000000000000FF000000
      84000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60084848400C6C6C600C6C6C60084848400FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF00000084000000FF00000084000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF0000000000000000000000000000000000FF000000FF0000000000
      0000000000000000000084848400C6C6C600C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000008400000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00000000000000
      000000000000000000000000000000000000848484000000000000000000FF00
      00000000000084848400C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF00000084000000FF00000084000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000840000000000000000000000FF000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000008400000000000000000000000000000000000000
      FF00000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF0000FF
      FF000000FF000000840000000000000000000000000000000000000000000000
      00000000FF000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      FF00848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFE01FFF3FFFFFFFFF001FFE1FFFF
      FFFF8001FFC1FFFFFFFF00018003FDFFFFFF00010001F8FFFFFF00030001F07F
      FFFF00030001E23FE00700030001E71FE00700030001FF8FFFFF00030001FFC7
      FFFF00030001FFE3FFFF00030001FFF3FFFF00030001FFFFFFFF80070003FFFF
      FFFFF87F80FFFFFFFFFFFFFFC1FFFFFFCFEFFFFFFFFFFFFFE00FFFFFFC00FFFF
      E00FFE008000FFFFC007FE000000FE7F8007FE000000FE7F800380000000FE7F
      800380000001FE7F800380000003E007800380000003E007800780010003FE7F
      C00780030003FE7FC00F80070003FE7FE017807F0003FE7F884780FF8007FFFF
      828781FFF87FFFFFC08FFFFFFFFFFFFFFFFFF81FFFFFFFFFFFFF3007E7FFFFFF
      F9FF0003E7FF0003F0FF0001FBFF0001F0FF03E0F9FF0001E07F07F0F9FF0001
      C07F03F0F9FF0001843F01FFFCFF80011E3FFFE0FE7FC001FE1F0FC0FE7FFFFF
      FF1F0FE0FE3FFFFFFF8F87C0FF1FFFFFFFC78000FF9FFFFFFFE3C000FF8FFFFF
      FFF8E007FFC7FFFFFFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFE003FFFFFFFFFFFF
      E003FFFFEFFD001FE003FFBFC7FF000FE003FF1FC3FB0007E003FF0FE3F70003
      E003FE07F1E70001E003FE07F8CF0000E003FC0FFC1F001FE0039C3FFE3F001F
      E00369FFFC1F001FE0177FFFF8CF8FF1E00F7FFFE1E7FFF9E01F9FFFC3F3FF75
      FFFFFFFFC7FDFF8FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
