object frmDeviceCode: TfrmDeviceCode
  Left = 343
  Top = 195
  Width = 555
  Height = 377
  Caption = #35774#22791#20195#30721
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 323
    Width = 547
    Height = 27
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel5: TPanel
      Left = 253
      Top = 1
      Width = 293
      Height = 25
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
        Left = 139
        Top = 2
        Width = 76
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
    Top = 294
    Width = 547
    Height = 29
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object bbtnFind: TBitBtn
      Left = 4
      Top = 4
      Width = 59
      Height = 21
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
      Left = 150
      Top = 1
      Width = 396
      Height = 27
      Align = alRight
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 1
      object navsbdata: TCSDBNavigator
        Left = 151
        Top = 2
        Width = 245
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
        Width = 51
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
        Left = 101
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
      object bbtnEdit: TBitBtn
        Left = 51
        Top = 2
        Width = 50
        Height = 22
        Hint = #28155#21152#35760#24405
        Caption = #32534#36753
        TabOrder = 3
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
        Spacing = 2
      end
    end
  end
  object baseMagPageCrt: TPageControl
    Left = 0
    Top = 0
    Width = 547
    Height = 294
    ActivePage = code_sb_use
    Align = alClient
    TabIndex = 4
    TabOrder = 2
    OnChange = baseMagPageCrtChange
    OnChanging = baseMagPageCrtChanging
    object code_device: TTabSheet
      Caption = #35774#22791#20195#30721
      ImageIndex = 4
      object Splitter3: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 267
        Cursor = crSizeWE
      end
      object tvdevice: TdxDBTreeView
        Left = 0
        Top = 0
        Width = 250
        Height = 267
        ShowNodeHint = True
        AutoExpand = True
        DataSource = DataSdevice
        DisplayField = 'name'
        KeyField = 'id'
        ListField = 'name'
        ParentField = 'parent_id'
        SeparatedSt = '  '
        RaiseOnError = True
        ReadOnly = True
        DragMode = dmAutomatic
        Indent = 19
        OnChange = tvdeviceChange
        OnGetImageIndex = tvdeviceGetImageIndex
        OnGetSelectedIndex = tvdeviceGetSelectedIndex
        Align = alLeft
        ParentColor = False
        Options = [trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
        SortType = stData
        SelectedIndex = -1
        TabOrder = 0
        OnDragOver = tvdeviceDragOver
        ParentShowHint = False
        ShowHint = False
        Images = ImageList
      end
      object ScrollBox3: TScrollBox
        Left = 253
        Top = 0
        Width = 286
        Height = 267
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 1
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
        object device_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 120
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSdevice
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object device_name: TDBEditEh
          Left = 67
          Top = 28
          Width = 120
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSdevice
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
      end
    end
    object code_verify_type: TTabSheet
      Caption = #26816#39564#31867#21035
      ImageIndex = 1
      object Splitter6: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 267
        Cursor = crSizeWE
      end
      object tvverifytype: TdxDBTreeView
        Left = 0
        Top = 0
        Width = 250
        Height = 267
        ShowNodeHint = True
        AutoExpand = True
        DataSource = DataSverifytype
        DisplayField = 'name'
        KeyField = 'id'
        ListField = 'name'
        ParentField = 'parent_id'
        SeparatedSt = '  '
        RaiseOnError = True
        ReadOnly = True
        DragMode = dmAutomatic
        Indent = 19
        OnChange = tvverifytypeChange
        OnGetImageIndex = tvverifytypeGetImageIndex
        OnGetSelectedIndex = tvverifytypeGetSelectedIndex
        Align = alLeft
        ParentColor = False
        Options = [trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
        SortType = stData
        SelectedIndex = -1
        TabOrder = 0
        OnDragOver = tvverifytypeDragOver
        ParentShowHint = False
        ShowHint = False
        Images = ImageList
      end
      object ScrollBox6: TScrollBox
        Left = 253
        Top = 0
        Width = 286
        Height = 267
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 1
        object Label4: TLabel
          Left = 8
          Top = 8
          Width = 60
          Height = 12
          Caption = #21517'    '#31216#65306
        end
        object verifytype_name: TDBEditEh
          Left = 67
          Top = 5
          Width = 120
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSverifytype
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
      end
    end
    object code_stwk_kind: TTabSheet
      Caption = #24320#24037#31867#21035
      object Splitter7: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 267
        Cursor = crSizeWE
      end
      object DBGridstwkkind: TDBGridEh
        Left = 0
        Top = 0
        Width = 250
        Height = 267
        Align = alLeft
        DataSource = DataSstwkkind
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        InternalSort = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
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
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.Alignment = taCenter
            Width = 170
          end>
      end
      object ScrollBox8: TScrollBox
        Left = 253
        Top = 0
        Width = 286
        Height = 267
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 1
        object Label5: TLabel
          Left = 8
          Top = 30
          Width = 60
          Height = 12
          Caption = #21517'    '#31216#65306
        end
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 60
          Height = 12
          Caption = #20195'    '#30721#65306
        end
        object stwkkind_name: TDBEditEh
          Left = 67
          Top = 28
          Width = 120
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSstwkkind
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object stwkkind_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 120
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSstwkkind
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
      end
    end
    object code_sb_state: TTabSheet
      Caption = #35774#22791#29366#24577
      ImageIndex = 3
      object Splitter4: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 267
        Cursor = crSizeWE
      end
      object DBGridsbstate: TDBGridEh
        Left = 0
        Top = 0
        Width = 250
        Height = 267
        Align = alLeft
        DataSource = DataSsbstate
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        InternalSort = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'code'
            Footer.Alignment = taCenter
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
      object ScrollBox4: TScrollBox
        Left = 253
        Top = 0
        Width = 286
        Height = 267
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 1
        object Label9: TLabel
          Left = 8
          Top = 31
          Width = 60
          Height = 12
          Caption = #21517'    '#31216#65306
        end
        object Label2: TLabel
          Left = 8
          Top = 8
          Width = 60
          Height = 12
          Caption = #20195'    '#30721#65306
        end
        object sbstate_name: TDBEditEh
          Left = 67
          Top = 28
          Width = 120
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSsbstate
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object sbstate_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 120
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSsbstate
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
      end
    end
    object code_sb_use: TTabSheet
      Caption = #35774#22791#29992#36884
      ImageIndex = 2
      object Splitter5: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 267
        Cursor = crSizeWE
      end
      object DBGridsbuse: TDBGridEh
        Left = 0
        Top = 0
        Width = 250
        Height = 267
        Align = alLeft
        DataSource = DataSsbuse
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        InternalSort = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'code'
            Footer.Alignment = taCenter
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
        Width = 286
        Height = 267
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 1
        object Label7: TLabel
          Left = 8
          Top = 31
          Width = 60
          Height = 12
          Caption = #21517'    '#31216#65306
        end
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 60
          Height = 12
          Caption = #20195'    '#30721#65306
        end
        object sbuse_name: TDBEditEh
          Left = 67
          Top = 28
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSsbuse
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object sbuse_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 120
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSsbuse
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
      end
    end
  end
  object dataverifytype: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = dataverifytypeBeforePost
    AfterPost = dataverifytypeAfterPost
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_verify_type')
    Left = 466
    Top = 81
    object dataverifytypeid: TStringField
      FieldName = 'id'
      Size = 4
    end
    object dataverifytypeparent_id: TStringField
      FieldName = 'parent_id'
      Size = 4
    end
    object dataverifytypename: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'name'
    end
    object dataverifytypeoutflag: TIntegerField
      FieldName = 'outflag'
    end
    object dataverifytypecode_level: TStringField
      DisplayLabel = #32423#21035
      FieldName = 'code_level'
      Size = 1
    end
  end
  object datadevice: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = datadeviceBeforePost
    AfterPost = datadeviceAfterPost
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_device')
    Left = 466
    Top = 53
    object datadeviceid: TStringField
      FieldName = 'id'
      Size = 4
    end
    object datadeviceparent_id: TStringField
      FieldName = 'parent_id'
      Size = 4
    end
    object datadevicecode: TStringField
      DisplayLabel = #20195#30721
      FieldName = 'code'
      Size = 6
    end
    object datadevicename: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'name'
      Size = 50
    end
    object datadevicecode_level: TStringField
      DisplayLabel = #32423#21035
      FieldName = 'code_level'
      Size = 1
    end
    object datadeviceoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object datastwkkind: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = datastwkkindBeforePost
    AfterScroll = datastwkkindAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_stwk_kind')
    Left = 468
    Top = 109
    object datastwkkindid: TStringField
      FieldName = 'id'
      Size = 2
    end
    object datastwkkindcode: TStringField
      DisplayLabel = #20195#30721
      FieldName = 'code'
      Size = 2
    end
    object datastwkkindname: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'name'
    end
    object datastwkkindoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object datasbstate: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = datasbstateBeforePost
    AfterScroll = datasbstateAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_dev_state')
    Left = 468
    Top = 137
    object datasbstateid: TStringField
      FieldName = 'id'
      Size = 2
    end
    object datasbstatecode: TStringField
      DisplayLabel = #20195#30721
      FieldName = 'code'
      Size = 2
    end
    object datasbstatename: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'name'
    end
    object datasbstateoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object datasbuse: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = datasbuseBeforePost
    AfterScroll = datasbuseAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_dev_use')
    Left = 468
    Top = 167
    object datasbuseid: TStringField
      FieldName = 'id'
      Size = 2
    end
    object datasbusecode: TStringField
      DisplayLabel = #20195#30721
      FieldName = 'code'
      Size = 2
    end
    object datasbusename: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'name'
    end
    object datasbuseoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object DataSdevice: TDataSource
    DataSet = datadevice
    Left = 494
    Top = 54
  end
  object DataSverifytype: TDataSource
    DataSet = dataverifytype
    Left = 494
    Top = 82
  end
  object DataSstwkkind: TDataSource
    DataSet = datastwkkind
    Left = 494
    Top = 110
  end
  object DataSsbstate: TDataSource
    DataSet = datasbstate
    Left = 494
    Top = 138
  end
  object DataSsbuse: TDataSource
    DataSet = datasbuse
    Left = 494
    Top = 166
  end
  object Temp: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 436
    Top = 52
  end
  object CSBarMDIChild1: TCSBarMDIChild
    Left = 104
    Top = 250
  end
  object CategoryFind: TCSDBFind
    Exclude.Strings = (
      'parent_id'
      'id'
      'outflag'
      'code_level')
    Left = 76
    Top = 250
  end
  object ImageList: TImageList
    Left = 48
    Top = 250
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
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
      000000000000000000000000000000000000B556082100000000000000000000
      0000000000000000000000000821B5560000B556082100000000000000000000
      0000000000000000000000000821B55600000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004000803180318031803180318031
      8031803180318031803180318031400000004000650165016501650165016501
      6501650165016501650165016501400000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008031206720672067206720672067
      206720672067206720672067803140000000C001F003F003F003F003F003F003
      F003F003F003F003F003F0036501400000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000604E206720672067206720672067
      206720672067206720672067803140000000C001F003F003F003F003F003F003
      F003F003F003F003F003F0036501400000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000604E20672067604E206720672067
      F97FF97FF97FF97FF97F20678031C0180000C001F003F003C001F003F003F003
      F97FF97FF97FF97FF97FF0036501C01800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002067206720678031206720672067
      206720672067F97FF97F20678031C0180000F003F003F0038031F003F003F003
      F003F003F003F97FF97FF0036501C01800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000604E20672067C018604E604E604E
      604E604E604E604EF97F20678031C0180000C001F003F003C018C001C001C001
      C001C001C001C001F97FF0036501C01800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000604E206720672067206720672067
      206720672067206720672067604EC0180000C001F003F003F003F003F003F003
      F003F003F003F003F003F0036501C01800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000604E206720672067206720672067
      206720672067206720672067604EC0180000C001F003F003F003F003F003F003
      F003F003F003F003F003F0036501C01800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008031F97FF97FF97FF97FF97FF97F
      F97FF97FF97FF97FF97FF97FF97FC01800006501F97FF97FF97FF97FF97FF97F
      F97FF97FF97FF97FF97FF97FF97FC01800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F97F206720672067604E604E
      0000000000000000000000000821B55600000000F97F00030003000365016501
      0000000000000000000000000821B55600000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F97F20672067604E0000
      00000000000000000000000000000000000000000000F97F0003000365010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C31000000008C310000
      000000000000000000000000000000000000000000008C31000000008C310000
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
      000000000000000000000000000000000000B556082100000000000000000000
      0000000000000000000000000821B5560000B556082100000000000000000000
      0000000000000000000000000821B5560000B556082100000000000000000000
      0000000000000000000000000821B5560000B556082100000000000000000000
      0000000000000000000000000821B5560000D318993199319931993199319931
      99319931993199319931993199310A0000000020804D804D804D804D804D804D
      804D804D804D804D804D804D804D002000000020C64CC64CC64CC64CC64CC64C
      C64CC64CC64CC64CC64CC64CC64C00200000D318993199319931993199319931
      99319931993199319931993199310A00000099313F679931CC18420842084208
      4208420842084208CC1800007F4E0A000000804D207F207F207F207F207F207F
      207F207F207F207F207F207F804D00200000C64C737E737E737E737E737E737E
      737E737E737E737E737E737E8C650020000099313F673F673F673F673F673F67
      3F673F673F673F673F673F6799310A0000007F4E3F67CC18F75EF75EF75EB556
      B556734E734E31468C31CC187F4E0A0000006066207F207F207F207F207F207F
      207F207F207F207F207F207F804D002000008C65737E737E737E737E737E737E
      737E737E737E737E737E737E8C65002000007F4E3F673F673F673F673F673F67
      3F673F673F673F673F673F6799310A0000007F4E3F67CC180000314639673967
      3967000000000000F75E00009931D31800006066207F207F6066207F207F207F
      F97FF97FF97FF97FF97F207F804DC03000008C65737E737E8C65737E737E737E
      397F397F397F397F397F737E8C65C63000007F4E3F673F677F4E3F673F673F67
      000000000000000000003F679931D31800003F673F67CC1800003146734E3146
      3146CE393146CE39CE3900009931D3180000207F207F207F804D207F207F207F
      207F207F207FF97FF97F207F804DC0300000737E737E737EC64C737E737E737E
      737E737E737E397F397F737E8C65C63000003F673F673F6799313F673F673F67
      3F673F673F67000000003F679931D31800007F4E3F67CC180000CE39CE398C31
      B5568C31CE39B5564A29CC189931D31800006066207F207FC030606660666066
      6066606660666066F97F207F804DC03000008C65737E737EC6308C658C658C65
      8C658C658C658C7D397F737E8C65C63000007F4E3F673F67D9187F4E7F4E7F4E
      7F4E7F4E7F4E7F4E00003F679931D31800007F4E3F67CC187B6F000000000000
      00007B6FCE394A2906007F4E9931D31800006066207F207F207F207F207F207F
      207F207F207F207F207F207F6066C03000008C65737E737E737E737E737E737E
      737E737E737E737E737E737E8C65C63000007F4E3F673F673F673F673F673F67
      3F673F673F673F673F673F677F4ED31800007F4E3F679931CC18841042084208
      420842084208CC187F4E3F679931D31800006066207F207F207F207F207F207F
      207F207F207F207F207F207F6066C03000008C65737E737E737E737E737E737E
      737E737E737E737E737E737E8C65C63000007F4E3F673F673F673F673F673F67
      3F673F673F673F673F673F677F4ED31800009931000000000000000000000000
      000000000000000000000000BD77CC180000804DF97FF97FF97FF97FF97FF97F
      F97FF97FF97FF97FF97FF97FBD7700200000C64C0000397F397F397F397F397F
      397F397F397F397F397F397FBD77002000009931000000000000000000000000
      000000000000000000000000BD77CC180000000000003F673F673F677F4E7F4E
      CC18000000000000000000000821B55600000000F97F207F207F207F60666066
      0000000000000000000000000821B55600000000397F737E737E737E8C658C65
      0000000000000000000000000821B5560000000000003F673F673F677F4E7F4E
      CC18000000000000000000000821B55600000000CC180000000000007F4ECC18
      00000000000000000000000000000000000000000000F97F207F207F60660000
      00000000000000000000000000000000000000000000397F737E737E8C650000
      0000000000000000000000000000000000000000CC180000000000007F4ECC18
      000000000000000000000000000000000000000000008C31000000008C310000
      000000000000000000000000000000000000000000008C31000000008C310000
      000000000000000000000000000000000000000000008C31000000008C310000
      000000000000000000000000000000000000000000008C31000000008C310000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000FFFFFFFF00000000
      0001000100000000000100010000000000010001000000000001000100000000
      0001000100000000000100010000000000010001000000000001000100000000
      00010001000000000001000100000000000100010000000081FF81FF00000000
      C3FFC3FF00000000FFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0001000100010001000100010001000100090001000100010001000100010001
      10E10001000101F1100100010001003110010001000100110F01000100010001
      00010001000100017FF9000140017FF94001000100014001B9FF81FF81FFB9FF
      C3FFC3FFC3FFC3FFFFFFFFFFFFFFFFFF}
  end
  object ScrChild: TCSScrCtrlChild
    Left = 132
    Top = 250
  end
end
