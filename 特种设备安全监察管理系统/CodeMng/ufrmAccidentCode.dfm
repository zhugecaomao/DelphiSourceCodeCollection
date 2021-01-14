object frmAccidentCode: TfrmAccidentCode
  Left = 365
  Top = 282
  Width = 529
  Height = 373
  Caption = #20107#25925#20195#30721#31649#29702
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 12
  object baseMagPageCrt: TPageControl
    Left = 0
    Top = 0
    Width = 521
    Height = 289
    ActivePage = TabSheet6
    Align = alClient
    TabIndex = 4
    TabOrder = 0
    OnChange = baseMagPageCrtChange
    OnChanging = baseMagPageCrtChanging
    object TabSheet2: TTabSheet
      Caption = #20107#25925#31867#21035
      ImageIndex = 1
      object Splitter2: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 262
        Cursor = crSizeWE
      end
      object sgkindDBGridEh: TDBGridEh
        Left = 0
        Top = 0
        Width = 250
        Height = 262
        Align = alLeft
        DataSource = DataSsgkind
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        InternalSort = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'code'
            Footers = <>
            Title.Alignment = taCenter
            Width = 64
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.Alignment = taCenter
            Width = 170
          end>
      end
      object ScrollBox2: TScrollBox
        Left = 253
        Top = 0
        Width = 260
        Height = 262
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 1
        object Label12: TLabel
          Left = 8
          Top = 8
          Width = 60
          Height = 12
          Caption = #20195'    '#30721#65306
        end
        object Label13: TLabel
          Left = 8
          Top = 32
          Width = 60
          Height = 12
          Caption = #21517'    '#31216#65306
        end
        object kind_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 121
          Height = 18
          Alignment = taLeftJustify
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSsgkind
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object kind_name: TDBEditEh
          Left = 67
          Top = 28
          Width = 121
          Height = 18
          Alignment = taLeftJustify
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSsgkind
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #20107#25925#29305#24449
      ImageIndex = 2
      object Splitter5: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 262
        Cursor = crSizeWE
      end
      object sgattrDBGridEh: TDBGridEh
        Left = 0
        Top = 0
        Width = 250
        Height = 262
        Align = alLeft
        DataSource = DataSsgattr
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        InternalSort = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'code'
            Footers = <>
            Title.Alignment = taCenter
            Width = 64
          end
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.Alignment = taCenter
            Width = 170
          end>
      end
      object ScrollBox5: TScrollBox
        Left = 253
        Top = 0
        Width = 260
        Height = 262
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 1
        object Label6: TLabel
          Left = 8
          Top = 8
          Width = 60
          Height = 12
          Caption = #20195'    '#30721#65306
        end
        object Label7: TLabel
          Left = 8
          Top = 31
          Width = 60
          Height = 12
          Caption = #21517'    '#31216#65306
        end
        object attr_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSsgattr
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object attr_name: TDBEditEh
          Left = 67
          Top = 28
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSsgattr
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #20107#25925#24418#24335
      ImageIndex = 3
      object Splitter6: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 262
        Cursor = crSizeWE
      end
      object sgforDBGridEh: TDBGridEh
        Left = 0
        Top = 0
        Width = 250
        Height = 262
        Align = alLeft
        DataSource = DataSsgformat
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        InternalSort = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'code'
            Footers = <>
            Title.Alignment = taCenter
            Width = 64
          end
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.Alignment = taCenter
            Width = 170
          end>
      end
      object ScrollBox6: TScrollBox
        Left = 253
        Top = 0
        Width = 260
        Height = 262
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 1
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 60
          Height = 12
          Caption = #20195'    '#30721#65306
        end
        object Label4: TLabel
          Left = 8
          Top = 31
          Width = 60
          Height = 12
          Caption = #21517'    '#31216#65306
        end
        object format_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSsgformat
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object format_name: TDBEditEh
          Left = 67
          Top = 28
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSsgformat
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #20107#25925#21407#22240
      ImageIndex = 4
      object Splitter3: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 262
        Cursor = crSizeWE
      end
      object ScrollBox3: TScrollBox
        Left = 253
        Top = 0
        Width = 260
        Height = 262
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 0
        object Label10: TLabel
          Left = 8
          Top = 8
          Width = 60
          Height = 12
          Caption = #20195'    '#30721#65306
        end
        object Label11: TLabel
          Left = 8
          Top = 31
          Width = 60
          Height = 12
          Caption = #21517'    '#31216#65306
        end
        object reason_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSsgreason
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object reason_name: TDBEditEh
          Left = 67
          Top = 28
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSsgreason
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
      end
      object sgreaDBGridEh: TDBGridEh
        Left = 0
        Top = 0
        Width = 250
        Height = 262
        Align = alLeft
        DataSource = DataSsgreason
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        InternalSort = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'code'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.Alignment = taCenter
            Width = 170
          end>
      end
    end
    object TabSheet6: TTabSheet
      Caption = #20107#25925#20855#20307#21407#22240
      ImageIndex = 5
      object Splitter4: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 262
        Cursor = crSizeWE
      end
      object ScrollBox4: TScrollBox
        Left = 253
        Top = 0
        Width = 260
        Height = 262
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 0
        object Label8: TLabel
          Left = 8
          Top = 8
          Width = 60
          Height = 12
          Caption = #20195'    '#30721#65306
        end
        object Label9: TLabel
          Left = 8
          Top = 31
          Width = 60
          Height = 12
          Caption = #21517'    '#31216#65306
        end
        object jtreason_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 117
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSsgjtreason
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object jtreason_name: TDBEditEh
          Left = 67
          Top = 28
          Width = 117
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSsgjtreason
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
      end
      object sgjtrDBGridEh: TDBGridEh
        Left = 0
        Top = 0
        Width = 250
        Height = 262
        Align = alLeft
        DataSource = DataSsgjtreason
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        InternalSort = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'code'
            Footers = <>
            Title.Alignment = taCenter
            Width = 64
          end
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.Alignment = taCenter
            Width = 170
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 318
    Width = 521
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel5: TPanel
      Left = 226
      Top = 1
      Width = 294
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbtnPrint: TBitBtn
        Left = 78
        Top = 2
        Width = 60
        Height = 22
        Caption = #25171#21360
        TabOrder = 0
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00030888888888888880088888888888888000000000000000000F8F8F8F8F8F
          8F8008F8F8F8F8F8F9F00F8F8F8F8F8F8F8000000000000000003330FFFFFFFF
          03333330F0000F0F03333330FFFFFFFF03333330F00F000003333330FFFF0FF0
          33333330F08F0F0333333330FFFF003333333330000003333333}
      end
      object bbtnHelp: TBitBtn
        Left = 140
        Top = 2
        Width = 75
        Height = 22
        Hint = #33719#21462#30456#20851#24110#21161
        Caption = #24110#21161'(&H)'
        TabOrder = 1
        Glyph.Data = {
          36010000424D3601000000000000760000002800000010000000100000000100
          040002000000C0000000C40E0000C40E00000000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000ADD02D004DD
          00000ADD020004DD00000004DDD70477000870B07DDD000002DD060000080FF0
          07DD00000004D0FF06FB0006FFF07D0000000010D0FBFFF44FFBF07D00000010
          D0FFFBFFFBFFF07D00000010D0FBFFF47FFBF07D00000010D0FFFBF748FFF07D
          00000010D0FBFFFB747BF07D00000010D0FFF47FF44FF07D00000010D0FBF44B
          844BF07D00000006D0FFF800044400068FF07D0000000010D0FBFFFBFFFBF07D
          00000010D0FFFBFFFBFFF0DD000002DD0A0000040DDD00000001}
      end
      object bbtnClose: TBitBtn
        Left = 217
        Top = 2
        Width = 75
        Height = 22
        Hint = #20851#38381#24403#21069#31383#21475
        Caption = #20851#38381'(&C)'
        TabOrder = 2
        OnClick = bbtnCloseClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF000FFF
          FFFFFFFF005000FFFFFFFF0055500000FFFF0055555000000FFF055555507880
          00FF055555507770FFFF05555B5077700FF005555B507770B00B05555550770B
          BBBB05555550770BBBBB055555507770B00B0555555077700FF0055555007770
          FFFF055500777770FFFF050077777770FFFF000000000000FFFF}
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 289
    Width = 521
    Height = 29
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object bbtnFind: TBitBtn
      Left = 3
      Top = 3
      Width = 60
      Height = 22
      Hint = #26597#25214#35760#24405
      Caption = #26597#25214
      TabOrder = 0
      OnClick = bbtnFindClick
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C000000000000000000001F7C1F7C1F7C1F7C1F7C000000000000
        000000001F7C0000FF7F0000000000001F7C1F7C1F7C1F7C1F7C0000FF7F0000
        000000001F7C0000FF7F0000000000001F7C1F7C1F7C1F7C1F7C0000FF7F0000
        000000001F7C00000000000000000000000000001F7C00000000000000000000
        000000001F7C00000000FF7F000000000000000000000000FF7F000000000000
        000000001F7C00000000FF7F000000000000186300000000FF7F000000000000
        000000001F7C00000000FF7F000000000000186300000000FF7F000000000000
        000000001F7C1F7C000000000000000000000000000000000000000000000000
        00001F7C1F7C1F7C1F7C0000FF7F0000000000001F7C0000FF7F000000000000
        1F7C1F7C1F7C1F7C1F7C000000000000000000001F7C00000000000000000000
        1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C0000000000001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F00001F7C1F7C1F7C0000FF7F00001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C0000000000001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
    object Panel4: TPanel
      Left = 168
      Top = 1
      Width = 352
      Height = 27
      Align = alRight
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 1
      object navbasedata: TCSDBNavigator
        Left = 102
        Top = 2
        Width = 250
        Height = 22
        VisibleButtons = [nbPrior, nbNext, nbPost, nbCancel, nbRefresh]
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
        Captions.Strings = (
          #26368#21069
          #21518#36864
          #21069#36827
          #26368#21518
          #28155#21152
          #21024#38500
          #20462#25913
          #30830#35748
          #21462#28040
          #21047#26032)
      end
      object bbtnInsert: TBitBtn
        Left = 0
        Top = 2
        Width = 50
        Height = 22
        Hint = #28155#21152#35760#24405
        Caption = #28155#21152
        TabOrder = 0
        OnClick = bbtnInsertClick
        Glyph.Data = {
          46010000424D460100000000000076000000280000001C0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333300003333333333333333333FFFF333330000333330003333
          3333337333F3333300003333300033333333337333F333330000333330003333
          3333FF3333FFFF3300003300000000033337333333333F330000330000000003
          3337333333333F3300003300000000033337333333333F330000333330003333
          333777733337733300003333300033333333337333F333330000333330003333
          3333337333F33333000033333333333333333377773333330000333333333333
          33333333333333330000}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnDelete: TBitBtn
        Left = 51
        Top = 2
        Width = 50
        Height = 22
        Hint = #21512#24182#35760#24405
        Caption = #21512#24182
        TabOrder = 1
        OnClick = bbtnDeleteClick
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000000000
          00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F
          00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F1F001F001F00FF7F
          00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F
          00001F7C1F7C1F7C1F7C000000000000000000000000FF7F1F001F001F00FF7F
          00001F7C1F7C1F7C1F7C000018631863186318630000FF7FFF7FFF7FFF7FFF7F
          00001F7C1F7C00000000000018631F001F001F000000FF7F1F001F001F00FF7F
          00001F7C1F7C00001002000018631863186318630000FF7FFF7FFF7FFF7FFF7F
          00001F7C1F7C00001002000018631F001F001F00000000000000000000000000
          00001F7C1F7C0000100200001863186318631863186300001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C00001002000018631F001F001F00186300001F7C1F7C1F7C1F7C
          1F7C10001F7C0000100200001863186318631863186300001F7C1F7C1F7C1F7C
          1000100010000000100200000000000000000000000000001F7C1F7C1F7C1F7C
          1F7C10001F7C00001002100210021002100200001F7C1F7C1F7C10001F7C1F7C
          1F7C10001F7C00000000000000000000000000001F7C1F7C1F7C1F7C10001000
          10001F7C1F7C}
        Spacing = 2
      end
    end
  end
  object datasgformat: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = datasgformatBeforePost
    AfterScroll = datasgformatAfterScroll
    Parameters = <>
    Left = 398
    Top = 121
    object datasgformatcode: TStringField
      DisplayLabel = #20195'  '#30721
      FieldName = 'code'
      Size = 2
    end
    object datasgformatname: TStringField
      DisplayLabel = #21517'  '#31216
      FieldName = 'name'
    end
    object datasgformatid: TStringField
      FieldName = 'id'
      Size = 2
    end
    object datasgformatoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object datasgattr: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = datasgattrBeforePost
    AfterScroll = datasgattrAfterScroll
    Parameters = <>
    Left = 398
    Top = 93
    object datasgattrcode: TStringField
      DisplayLabel = #20195'  '#30721
      FieldName = 'code'
      Size = 2
    end
    object datasgattrname: TStringField
      DisplayLabel = #21517'  '#31216
      FieldName = 'name'
    end
    object datasgattrid: TStringField
      FieldName = 'id'
      Size = 2
    end
    object datasgattroutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object datasgkind: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = datasgkindBeforePost
    AfterScroll = datasgkindAfterScroll
    Parameters = <>
    Left = 398
    Top = 65
    object datasgkindcode: TStringField
      Alignment = taCenter
      DisplayLabel = #20195'  '#30721
      FieldName = 'code'
      Size = 2
    end
    object datasgkindname: TStringField
      Alignment = taCenter
      DisplayLabel = #21517'  '#31216
      FieldName = 'name'
    end
    object datasgkindid: TStringField
      FieldName = 'id'
      Size = 2
    end
    object datasgkindoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object datasgjtreason: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforePost = datasgjtreasonBeforePost
    AfterScroll = datasgjtreasonAfterScroll
    Parameters = <>
    Left = 398
    Top = 175
    object datasgjtreasoncode: TStringField
      DisplayLabel = #20195'  '#30721
      FieldName = 'code'
      Size = 2
    end
    object datasgjtreasonname: TStringField
      DisplayLabel = #21517'  '#31216
      FieldName = 'name'
    end
    object datasgjtreasonid: TStringField
      FieldName = 'id'
      Size = 2
    end
    object datasgjtreasonoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object datasgreason: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = datasgreasonBeforePost
    AfterScroll = datasgreasonAfterScroll
    Parameters = <>
    Left = 398
    Top = 149
    object datasgreasoncode: TStringField
      DisplayLabel = #20195'  '#30721
      DisplayWidth = 10
      FieldName = 'code'
      Size = 2
    end
    object datasgreasonname: TStringField
      DisplayLabel = #21517'  '#31216
      FieldName = 'name'
    end
    object datasgreasonid: TStringField
      FieldName = 'id'
      Size = 2
    end
    object datasgreasonoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object DataSsgformat: TDataSource
    DataSet = datasgformat
    Left = 426
    Top = 120
  end
  object DataSsgattr: TDataSource
    DataSet = datasgattr
    Left = 426
    Top = 92
  end
  object DataSsgjtreason: TDataSource
    DataSet = datasgjtreason
    Left = 426
    Top = 176
  end
  object DataSsgreason: TDataSource
    DataSet = datasgreason
    Left = 426
    Top = 148
  end
  object DataSsgkind: TDataSource
    DataSet = datasgkind
    Left = 426
    Top = 66
  end
  object Temp: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 358
    Top = 132
  end
  object CategoryFind: TCSDBFind
    Exclude.Strings = (
      'id'
      'outflag'
      '')
    Left = 358
    Top = 160
  end
  object ScrChild: TCSScrCtrlChild
    Left = 132
    Top = 224
  end
  object CSBarMDIChild1: TCSBarMDIChild
    Left = 104
    Top = 224
  end
end
