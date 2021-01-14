object Form1: TForm1
  Left = 199
  Top = 103
  Width = 813
  Height = 591
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 805
    Height = 89
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object bbtnSelect: TBitBtn
      Left = 272
      Top = 56
      Width = 90
      Height = 25
      Caption = #26597#35810'[&F]'
      TabOrder = 0
      OnClick = bbtnSelectClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF000000
        0000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF000000
        0000FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF000000
        0000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF000000
        0000FF00FF00FF00FF00FF00FF00000000000000000000000000FF00FF000000
        0000FFFFFF00FF00FF00FF00FF00FF00FF008484840000000000000000000000
        000084848400FF00FF00000000000000000000000000FF00FF00FF00FF000000
        0000FFFFFF00FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFF
        FF0000000000000000000000000000000000FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00FF00FF000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000008484840000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FFFFFF008484840000000000FFFF0000000000000000000000000000FFFF
        FF0000000000FF00FF000000000084848400FF00FF00FF00FF00FF00FF000000
        0000FFFFFF0000000000FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFF
        FF0000000000FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF000000
        0000FFFFFF0000000000FFFFFF0000000000000000000000000000000000FFFF
        FF0000000000FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF000000
        00000000000000000000FFFF0000FFFFFF00FFFF0000FFFFFF00FFFFFF00FFFF
        FF0000000000FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008484840000000000000000000000000000000000000000000000
        000000000000FF00FF000000000084848400FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008484840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00
        FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF008484840000000000000000000000
        000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object Edit1: TEdit
      Left = 100
      Top = 6
      Width = 153
      Height = 23
      TabOrder = 1
      Text = '3700000804001076'
      OnEnter = Edit1Enter
    end
    object RB01: TRadioButton
      Left = 16
      Top = 9
      Width = 81
      Height = 17
      Caption = #21307#30103#35777#21495
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object RB02: TRadioButton
      Left = 16
      Top = 32
      Width = 65
      Height = 17
      Caption = #22995#21517
      TabOrder = 3
    end
    object Edit2: TEdit
      Left = 100
      Top = 30
      Width = 153
      Height = 23
      TabOrder = 4
      Text = 'Edit2'
      OnEnter = Edit2Enter
    end
    object RB03: TRadioButton
      Left = 16
      Top = 56
      Width = 57
      Height = 17
      Caption = #20065#38215
      TabOrder = 5
    end
    object ComboBox1: TComboBox
      Left = 100
      Top = 54
      Width = 153
      Height = 23
      Style = csDropDownList
      ItemHeight = 15
      TabOrder = 6
      OnEnter = ComboBox1Enter
    end
    object RB04: TRadioButton
      Left = 272
      Top = 9
      Width = 81
      Height = 17
      Caption = #36523#20221#35777#21495
      TabOrder = 7
    end
    object Edit13: TEdit
      Left = 355
      Top = 6
      Width = 166
      Height = 23
      TabOrder = 8
      Text = 'Edit13'
      OnEnter = Edit13Enter
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 472
    Width = 805
    Height = 73
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bbtnPrint: TBitBtn
      Left = 24
      Top = 32
      Width = 90
      Height = 25
      Caption = #25171#21360'[&P]'
      TabOrder = 0
      OnClick = bbtnPrintClick
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B004000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000
        0000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFF5FFCD80FFBF49FFB646FFB646FFB6
        46FFA33EFFA33EFFA33EFF9438FF3C00000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000FFFFFFFFF2CEFFF2CEFFF2CEFFF2CEFFF2CEFFECC8
        FFDEBAFFDEBAFFA33EFF7A51FF3C00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF000000FFFFFFFFF7D3FFF7D3FFF7D3FFF7D3FFF7D3FFFCD80000FF00
        00FFFFBF49FF8E6AFF6943FF3C00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1
        BDFF916DFF7E5AFF390C000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFFFFF5FFFFF5FFFFFFFFE1BD
        FF805CFF3D10000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00FFFFFF000000000000000000000000000000000000000000000000FFA841FF
        3F11000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        000000F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2AEAEAE000000FFB591FF3F110000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFFFFFFFFFFFFFFFFFFFFF2F2F2CDCDCD000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
        FFFFFFFFFFFFFFF2F2F2F2F2F2000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFF2F2F2CDCDCD000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFF2F2F2F2F2F2000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
        00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
    end
    object CheckBox1: TCheckBox
      Left = 24
      Top = 8
      Width = 89
      Height = 17
      Caption = #35774#35745#27169#26495
      TabOrder = 1
    end
    object bbtnSave: TBitBtn
      Left = 168
      Top = 32
      Width = 90
      Height = 25
      Caption = #20445#23384'[&S]'
      TabOrder = 2
      OnClick = bbtnSaveClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbtnExit: TBitBtn
      Left = 664
      Top = 32
      Width = 90
      Height = 25
      Caption = #36864#20986'[&X]'
      TabOrder = 3
      OnClick = bbtnExitClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object bbtnClear: TBitBtn
      Left = 304
      Top = 32
      Width = 90
      Height = 25
      Caption = #26032#22686'[&C]'
      TabOrder = 4
      OnClick = bbtnClearClick
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B004000000000000000000000000000000000000FFFFFFFFFFFF
        FAFAFAF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FAFAFAFAFAFAFBFBFBFBFB
        FBFCFCFCFDFDFDFDFDFDFDFDFDFCFCFCFFFFFFFFFFFFFFFFFFD6D6D66868685F
        5F5F626262626262626262626262616161656666616262595959595959545454
        5252525050504E4E4E484848797979FFFFFFFDFDFDB9B9B98989897C7C7C7A7A
        7A7A7A7A7A7A7A797A7A8C86866C5757695E5E7D7E7E6666666161615A5A5A58
        58585757575757571C1C1C696969F8F8F8C5C5C5CFCFCFF9F9F9FFFFFFFEFEFE
        FEFEFEFFFFFFDAEFEF1587870A2929E6D7D7FFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FEB7B7B74646461F1F1FF9F9F9C4C4C4D3D3D3A7A7A7A2A2A2A3A3A3A2A3A3BC
        A9A9247F8088ECE93CCFCF001110857676B1B1B1A2A2A2A2A3A2A8A9A8BBBBBB
        525252313131F9F9F9C4C4C4D1D1D1BABABAB8B8B8B8B9B9C1BBBBA8B3B345B5
        B257EAEF71E2FA44C0C8153031B2A3A1D1CDD2CEBDCEC8BAC8BBBDBB62626245
        4545F9F9F9C4C4C4CFCFCFB5B5B5B4B4B4B5B4B4C2B9B945918EBCEAEB62C4E5
        7ADEEF6ED1ED1CA7B81433377D7E6D489149558F55CCBDCC6D6E6D5A5A5AF8F8
        F8BFBFBFDBDBDBD4D4D4D4D4D4E0DCDCB4C1C15CA7A79AD1F27AE3F162BFE072
        ECF94AC0E937AEB200370C0DE40046FB47F1CFF1868886676767FFFFFFCDCDCD
        BBBBBBE4E4E4D3D2D2DECDCD40918F9BE0E673E8F665C6E255E4F220BAE155CE
        FA41E2FA32B4CD1B1A45E2AED1B7BAB78787877D7D7DFFFFFFFFFFFFCECECE92
        9393968E8E6282821C9A9990FBFE61C1E254E0EE40BEE441E1F63CB9E552CAE7
        76C2D736B7BA0016117668677B7C7C797979FFFFFFFFFFFFFFFFFFD3D4D4C9C6
        C6464B4D004A4B6EE3E85AE6F63AC0E345CEED3FC5E851C0F061C1CB48ADCF53
        C3E744B9C718322FB2AAAAD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFDF9FEAA4138
        49000000666345E9FC30E7F436BCEA46DCF25BCBC250B8DE259EB67ADDFF2EB4
        B11E3836EDE5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCB9997D78E52FFD0BC4A
        091100595558D8EB56D5F065ABC051D3F020A7BA50BDE9008D8E321B1AFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC18481D38654F3C68AFFAC8B4903
        000069694ECECB4FDFF51793990AA8A431514E443C3BFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFAE5D57E3A970FBC189FF9F52D95B2A570809
        205D6000515B315550605C5CD2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFA34C61E1AD57FFE9A8DD5F36B7230CB318116F000000000074
        706FE9E5E5FDF8F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        A8555FE9B755FFF0BAC1300E2D0104051B1E021213667474FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1AEBAD1661CFF
        ECAAAF210239080ECCD6D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEBAC18621046611003A03
        06CCD6D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF5F5D5CBCFB8BFC4DEE3E4FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
    end
    object BitBtn2: TBitBtn
      Left = 440
      Top = 32
      Width = 90
      Height = 25
      Caption = #21024#38500'[&D]'
      TabOrder = 5
      OnClick = BitBtn2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 89
    Width = 805
    Height = 383
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Panel4: TPanel
      Left = 2
      Top = 208
      Width = 801
      Height = 173
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 150
        Width = 60
        Height = 15
        Caption = #26377#25928#26085#26399
      end
      object Label2: TLabel
        Left = 216
        Top = 150
        Width = 60
        Height = 15
        Caption = #21457#35777#26085#26399
      end
      object Label3: TLabel
        Left = 152
        Top = 16
        Width = 30
        Height = 15
        AutoSize = False
        Caption = #22995#21517
      end
      object Label4: TLabel
        Left = 272
        Top = 16
        Width = 30
        Height = 15
        Caption = #24615#21035
      end
      object Label5: TLabel
        Left = 352
        Top = 16
        Width = 30
        Height = 15
        Caption = #30005#35805
      end
      object Label6: TLabel
        Left = 512
        Top = 16
        Width = 30
        Height = 15
        Caption = #20065#38215
      end
      object Label7: TLabel
        Left = 624
        Top = 16
        Width = 30
        Height = 15
        Caption = #20303#22336
      end
      object Label8: TLabel
        Left = 8
        Top = 49
        Width = 60
        Height = 15
        Caption = #21307#30103#35777#21495
      end
      object Label9: TLabel
        Left = 280
        Top = 49
        Width = 60
        Height = 15
        Caption = #36523#20221#35777#21495
      end
      object Label10: TLabel
        Left = 8
        Top = 85
        Width = 60
        Height = 15
        Caption = #24930#24615#30149#31181
      end
      object Label11: TLabel
        Left = 712
        Top = 85
        Width = 76
        Height = 15
        Caption = '('#20998#21495#38548#24320')'
      end
      object Label12: TLabel
        Left = 40
        Top = 16
        Width = 30
        Height = 15
        Caption = #32534#21495
      end
      object Label13: TLabel
        Left = 576
        Top = 49
        Width = 60
        Height = 15
        Caption = #38376#35786#32534#21495
      end
      object DateTimePicker1: TDateTimePicker
        Left = 72
        Top = 146
        Width = 113
        Height = 23
        Date = 39589.797379456020000000
        Time = 39589.797379456020000000
        TabOrder = 10
      end
      object DateTimePicker2: TDateTimePicker
        Left = 288
        Top = 146
        Width = 113
        Height = 23
        Date = 39589.797458668980000000
        Time = 39589.797458668980000000
        TabOrder = 11
      end
      object Edit3: TEdit
        Left = 192
        Top = 12
        Width = 73
        Height = 23
        TabOrder = 1
        Text = 'Edit3'
      end
      object Edit4: TEdit
        Left = 392
        Top = 12
        Width = 113
        Height = 23
        TabOrder = 3
        Text = 'Edit4'
      end
      object Edit5: TEdit
        Left = 544
        Top = 12
        Width = 73
        Height = 23
        TabOrder = 4
        Text = 'Edit5'
      end
      object Edit6: TEdit
        Left = 656
        Top = 12
        Width = 121
        Height = 23
        TabOrder = 5
        Text = 'Edit6'
      end
      object Edit7: TEdit
        Left = 72
        Top = 45
        Width = 193
        Height = 23
        TabOrder = 6
        Text = 'Edit7'
      end
      object Edit8: TEdit
        Left = 352
        Top = 45
        Width = 209
        Height = 23
        TabOrder = 7
        Text = 'Edit8'
      end
      object Edit9: TEdit
        Left = 72
        Top = 81
        Width = 641
        Height = 23
        TabOrder = 8
        Text = 'Edit9'
      end
      object Edit10: TEdit
        Left = 304
        Top = 12
        Width = 41
        Height = 23
        TabOrder = 2
        Text = 'Edit10'
      end
      object Edit11: TEdit
        Left = 72
        Top = 12
        Width = 65
        Height = 23
        TabOrder = 0
        Text = 'Edit11'
      end
      object Edit12: TEdit
        Left = 640
        Top = 45
        Width = 137
        Height = 23
        TabOrder = 9
        Text = 'Edit12'
      end
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 801
      Height = 206
      Align = alClient
      Color = clInfoBk
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 545
    Width = 805
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 680
    Top = 32
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 712
    Top = 32
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsSelect
    UserName = 'DBPipeline1'
    Left = 552
    Top = 30
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 152400
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 256
    SaveAsTemplate = True
    Template.FileName = 'YLZP.rtm'
    Template.Format = ftASCII
    DeviceType = 'Screen'
    ModalPreview = False
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 600
    Top = 30
    Version = '7.03'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 128588
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'XingMing'
        DataPipeline = ppDBPipeline1
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #26999#20307'_GB2312'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5556
        mmLeft = 105834
        mmTop = 794
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'XingBie'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 105834
        mmTop = 9790
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'ChuShengNianYue'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 106098
        mmTop = 19315
        mmWidth = 28575
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DianHua'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 106363
        mmTop = 27517
        mmWidth = 28840
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'XiangZhen'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 105569
        mmTop = 36777
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'ZhuZhi'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 141288
        mmTop = 36777
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'mxb1'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 93134
        mmTop = 53446
        mmWidth = 29104
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'mxb2'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 127794
        mmTop = 53446
        mmWidth = 27252
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'mxb3'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 92869
        mmTop = 62706
        mmWidth = 29369
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'mxb4'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 127529
        mmTop = 63236
        mmWidth = 28840
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'ShenFenZheng'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 112448
        mmTop = 70115
        mmWidth = 42598
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'YiLiaoZhengHao'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 129911
        mmTop = 78846
        mmWidth = 34925
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'MenZhenBianHao'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 118534
        mmTop = 86784
        mmWidth = 43656
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'yx_yy'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 111654
        mmTop = 95779
        mmWidth = 9260
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'yx_mm'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 124354
        mmTop = 95779
        mmWidth = 6879
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'yx_dd'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 135467
        mmTop = 96044
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'fz_yyyy'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 106892
        mmTop = 110067
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'fz_mm'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 123825
        mmTop = 110067
        mmWidth = 6879
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'fz_dd'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 135202
        mmTop = 110067
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #22995#21517
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4498
        mmLeft = 87842
        mmTop = 1323
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #24615#21035
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 87842
        mmTop = 10054
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #20986#29983#24180#26376
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 76200
        mmTop = 20108
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #32852#31995#30005#35805
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 78317
        mmTop = 27781
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #20065#38215
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4763
        mmLeft = 85725
        mmTop = 36777
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #26449
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 127794
        mmTop = 37306
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #24930#24615#30149'1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 73025
        mmTop = 53181
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #24930#24615#30149'2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 111654
        mmTop = 53975
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #24930#24615#30149'3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 73025
        mmTop = 63236
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #24930#24615#30149'4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 111919
        mmTop = 63236
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #36523#20221#35777
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4498
        mmLeft = 92869
        mmTop = 70379
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #21307#30103#35777#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4498
        mmLeft = 93663
        mmTop = 78846
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #38376#35786#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4498
        mmLeft = 95779
        mmTop = 87048
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #26377#25928#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4498
        mmLeft = 89694
        mmTop = 96044
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #21457#35777#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4498
        mmLeft = 84667
        mmTop = 110067
        mmWidth = 18256
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 640
    Top = 30
  end
  object ADOQSelect: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = ADOQSelectAfterScroll
    Parameters = <>
    Left = 416
    Top = 30
  end
  object dsSelect: TDataSource
    DataSet = ADOQPrint2
    Left = 480
    Top = 30
  end
  object ADOQPrint2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 224
    Top = 416
  end
  object ADOQPrint: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 520
    Top = 30
  end
  object DataSource1: TDataSource
    DataSet = ADOQSelect
    Left = 448
    Top = 30
  end
  object ADOQSave: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 280
    Top = 480
  end
end
