object frmBaseCode: TfrmBaseCode
  Left = 187
  Top = 211
  Width = 557
  Height = 386
  Caption = #22522#26412#20195#30721#32500#25252
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
    Top = 331
    Width = 549
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel5: TPanel
      Left = 254
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
    Top = 302
    Width = 549
    Height = 29
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
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
      Left = 197
      Top = 1
      Width = 351
      Height = 27
      Align = alRight
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 1
      object navbasedata: TCSDBNavigator
        Left = 101
        Top = 2
        Width = 250
        Height = 22
        DataSource = DataSArea
        VisibleButtons = [nbPrior, nbNext, nbPost, nbCancel, nbRefresh]
        DragCursor = crDefault
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 1
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
        TabOrder = 2
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
  object baseMagPageCrt: TPageControl
    Left = 0
    Top = 0
    Width = 549
    Height = 302
    ActivePage = TabSheet3
    Align = alClient
    TabIndex = 2
    TabOrder = 2
    OnChange = baseMagPageCrtChange
    OnChanging = baseMagPageCrtChanging
    object TabSheet1: TTabSheet
      Caption = #22320#21306#20195#30721
      object Splitter7: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 275
        Cursor = crSizeWE
      end
      object ScrollBox8: TScrollBox
        Left = 253
        Top = 0
        Width = 288
        Height = 275
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 0
        object Label2: TLabel
          Left = 8
          Top = 8
          Width = 60
          Height = 12
          Caption = #34892#25919#20195#30721#65306
        end
        object Label5: TLabel
          Left = 8
          Top = 30
          Width = 60
          Height = 12
          Caption = #21517'    '#31216#65306
        end
        object Label14: TLabel
          Left = 8
          Top = 52
          Width = 60
          Height = 12
          Caption = #20195'    '#30721#65306
        end
        object e_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSArea
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object e_name: TDBEditEh
          Left = 67
          Top = 27
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSArea
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
        object e_dm: TDBEditEh
          Left = 67
          Top = 49
          Width = 121
          Height = 18
          Color = clCaptionText
          Ctl3D = False
          DataField = 'dm'
          DataSource = DataSArea
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 2
          Visible = True
        end
      end
      object tvArea: TdxDBTreeView
        Left = 0
        Top = 0
        Width = 250
        Height = 275
        ShowNodeHint = True
        AutoExpand = True
        DataSource = DataSArea
        DisplayField = 'name'
        KeyField = 'id'
        ListField = 'name'
        ParentField = 'parent_id'
        SeparatedSt = '  '
        RaiseOnError = True
        ReadOnly = True
        DragMode = dmAutomatic
        Indent = 19
        OnChange = tvAreaChange
        OnGetImageIndex = tvAreaGetImageIndex
        OnGetSelectedIndex = tvAreaGetSelectedIndex
        Align = alLeft
        ParentColor = False
        Options = [trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
        SortType = stData
        SelectedIndex = -1
        TabOrder = 1
        OnDragOver = tvAreaDragOver
        ParentShowHint = False
        ShowHint = False
        Images = ImageList
      end
    end
    object TabSheet2: TTabSheet
      Caption = #21333#20301#32463#27982#31867#22411
      ImageIndex = 1
      object Splitter6: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 275
        Cursor = crSizeWE
      end
      object ScrollBox6: TScrollBox
        Left = 253
        Top = 0
        Width = 288
        Height = 275
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 0
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
        object OrgType_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSOrgKind
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object OrgType_name: TDBEditEh
          Left = 67
          Top = 28
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSOrgKind
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
      end
      object tvOrgKind: TdxDBTreeView
        Left = 0
        Top = 0
        Width = 250
        Height = 275
        ShowNodeHint = True
        AutoExpand = True
        DataSource = DataSOrgKind
        DisplayField = 'name'
        KeyField = 'id'
        ListField = 'name'
        ParentField = 'parent_id'
        SeparatedSt = '  '
        RaiseOnError = True
        ReadOnly = True
        DragMode = dmAutomatic
        Indent = 19
        OnChange = tvOrgKindChange
        OnGetImageIndex = tvOrgKindGetImageIndex
        OnGetSelectedIndex = tvOrgKindGetSelectedIndex
        Align = alLeft
        ParentColor = False
        Options = [trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
        SortType = stData
        SelectedIndex = -1
        TabOrder = 1
        OnDragOver = tvOrgKindDragOver
        ParentShowHint = False
        ShowHint = False
        Images = ImageList
      end
    end
    object TabSheet3: TTabSheet
      Caption = #27665#26063#20195#30721
      ImageIndex = 2
      object Splitter5: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 275
        Cursor = crSizeWE
      end
      object DBGridNation: TDBGridEh
        Left = 0
        Top = 0
        Width = 250
        Height = 275
        Align = alLeft
        DataSource = DataSNation
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        InternalSort = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
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
            Width = 47
          end
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.Alignment = taCenter
            Width = 77
          end
          item
            EditButtons = <>
            FieldName = 'pingyin'
            Footers = <>
            Title.Alignment = taCenter
            Width = 57
          end
          item
            EditButtons = <>
            FieldName = 'pingyincode'
            Footers = <>
            Title.Alignment = taCenter
            Width = 52
          end>
      end
      object ScrollBox5: TScrollBox
        Left = 253
        Top = 0
        Width = 288
        Height = 275
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
        object Label19: TLabel
          Left = 8
          Top = 77
          Width = 60
          Height = 12
          Caption = #25340#38899#20195#30721#65306
        end
        object Label20: TLabel
          Left = 8
          Top = 54
          Width = 60
          Height = 12
          Caption = #25340'    '#38899#65306
        end
        object nation_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSNation
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object nation_name: TDBEditEh
          Left = 67
          Top = 28
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSNation
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
        object nation_pingy: TDBEditEh
          Left = 67
          Top = 51
          Width = 121
          Height = 18
          Color = clWhite
          Ctl3D = False
          DataField = 'pingyin'
          DataSource = DataSNation
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 2
          Visible = True
        end
        object nation_pingydm: TDBEditEh
          Left = 67
          Top = 74
          Width = 121
          Height = 18
          Color = clWhite
          Ctl3D = False
          DataField = 'pingyincode'
          DataSource = DataSNation
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 3
          Visible = True
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #22312#32844#24773#20917
      ImageIndex = 3
      object Splitter4: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 275
        Cursor = crSizeWE
      end
      object DBGridWokInfo: TDBGridEh
        Left = 0
        Top = 0
        Width = 250
        Height = 275
        Align = alLeft
        DataSource = DataSWokInfo
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        InternalSort = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
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
      object ScrollBox4: TScrollBox
        Left = 253
        Top = 0
        Width = 288
        Height = 275
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 1
        object Label9: TLabel
          Left = 8
          Top = 32
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
        object WokInfo_name: TDBEditEh
          Left = 67
          Top = 29
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSWokInfo
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object WokInfo_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSWokInfo
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #23398#21382#20195#30721
      ImageIndex = 4
      object Splitter3: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 275
        Cursor = crSizeWE
      end
      object tvXl: TdxDBTreeView
        Left = 0
        Top = 0
        Width = 250
        Height = 275
        ShowNodeHint = True
        AutoExpand = True
        DataSource = DataSXl
        DisplayField = 'name'
        KeyField = 'id'
        ListField = 'name'
        ParentField = 'parent_id'
        SeparatedSt = '  '
        RaiseOnError = True
        ReadOnly = True
        DragMode = dmAutomatic
        Indent = 19
        OnChange = tvXlChange
        OnGetImageIndex = tvXlGetImageIndex
        OnGetSelectedIndex = tvXlGetSelectedIndex
        Align = alLeft
        ParentColor = False
        Options = [trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
        SortType = stData
        SelectedIndex = -1
        TabOrder = 0
        OnDragOver = tvXlDragOver
        ParentShowHint = False
        ShowHint = False
        Images = ImageList
      end
      object ScrollBox3: TScrollBox
        Left = 253
        Top = 0
        Width = 288
        Height = 275
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
        object xl_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSXl
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object xl_name: TDBEditEh
          Left = 67
          Top = 28
          Width = 121
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSXl
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = #23398#20301#20195#30721
      ImageIndex = 5
      object Splitter2: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 275
        Cursor = crSizeWE
      end
      object tvDegree: TdxDBTreeView
        Left = 0
        Top = 0
        Width = 250
        Height = 275
        ShowNodeHint = True
        AutoExpand = True
        DataSource = DataSDegree
        DisplayField = 'name'
        KeyField = 'id'
        ListField = 'name'
        ParentField = 'parent_id'
        SeparatedSt = '  '
        RaiseOnError = True
        ReadOnly = True
        DragMode = dmAutomatic
        Indent = 19
        OnGetImageIndex = tvDegreeGetImageIndex
        OnGetSelectedIndex = tvDegreeGetSelectedIndex
        Align = alLeft
        ParentColor = False
        Options = [trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
        SortType = stData
        SelectedIndex = -1
        TabOrder = 0
        OnDragOver = tvDegreeDragOver
        ParentShowHint = False
        ShowHint = False
        Images = ImageList
      end
      object ScrollBox2: TScrollBox
        Left = 253
        Top = 0
        Width = 288
        Height = 275
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
        object degree_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 121
          Height = 18
          Alignment = taLeftJustify
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSDegree
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object degree_name: TDBEditEh
          Left = 67
          Top = 28
          Width = 121
          Height = 18
          Alignment = taLeftJustify
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSDegree
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = #24615#21035#20195#30721
      ImageIndex = 6
      object Splitter1: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 275
        Cursor = crSizeWE
      end
      object DBGridSex: TDBGridEh
        Left = 0
        Top = 0
        Width = 250
        Height = 275
        Align = alLeft
        DataSource = DataSSex
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        InternalSort = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
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
      object ScrollBox1: TScrollBox
        Left = 253
        Top = 0
        Width = 288
        Height = 275
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 1
        object Label15: TLabel
          Left = 8
          Top = 8
          Width = 60
          Height = 12
          Caption = #20195'    '#30721#65306
        end
        object Label16: TLabel
          Left = 8
          Top = 31
          Width = 60
          Height = 12
          Caption = #21517'    '#31216#65306
        end
        object Sex_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 117
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSSex
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object Sex_name: TDBEditEh
          Left = 67
          Top = 28
          Width = 117
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSSex
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = #23130#23035#20195#30721
      ImageIndex = 7
      object Splitter8: TSplitter
        Left = 250
        Top = 0
        Width = 3
        Height = 275
        Cursor = crSizeWE
      end
      object DBGridMarry: TDBGridEh
        Left = 0
        Top = 0
        Width = 250
        Height = 275
        Align = alLeft
        Ctl3D = True
        DataSource = DataSMarry
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        InternalSort = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
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
      object ScrollBox7: TScrollBox
        Left = 253
        Top = 0
        Width = 288
        Height = 275
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 1
        object Label17: TLabel
          Left = 8
          Top = 8
          Width = 60
          Height = 12
          Caption = #20195'    '#30721#65306
        end
        object Label18: TLabel
          Left = 8
          Top = 31
          Width = 60
          Height = 12
          Caption = #21517'    '#31216#65306
        end
        object marry_code: TDBEditEh
          Left = 67
          Top = 5
          Width = 117
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'code'
          DataSource = DataSMarry
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 0
          Visible = True
        end
        object marry_name: TDBEditEh
          Left = 67
          Top = 28
          Width = 117
          Height = 18
          Color = clSkyBlue
          Ctl3D = False
          DataField = 'name'
          DataSource = DataSMarry
          EditButtons = <>
          ParentCtl3D = False
          TabOrder = 1
          Visible = True
        end
      end
    end
  end
  object dataOrgKind: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = dataOrgKindBeforePost
    AfterPost = dataOrgKindAfterPost
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_organ_type')
    Left = 466
    Top = 83
    object dataOrgKindid: TStringField
      DisplayLabel = #31995#32479'ID'
      FieldName = 'id'
      Size = 4
    end
    object dataOrgKindparent_id: TStringField
      DisplayLabel = #19978#32423#20195#30721
      FieldName = 'parent_id'
      Size = 4
    end
    object dataOrgKindname: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'name'
      Size = 30
    end
    object dataOrgKindcode: TStringField
      DisplayLabel = #20195#30721
      FieldName = 'code'
      Size = 5
    end
    object dataOrgKindoutflag: TIntegerField
      DisplayLabel = #23548#20986#26631#35760
      FieldName = 'outflag'
    end
    object dataOrgKindcode_level: TStringField
      DisplayLabel = #32423#21035
      FieldName = 'code_level'
      Size = 1
    end
  end
  object dataArea: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = dataAreaBeforePost
    AfterPost = dataAreaAfterPost
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_area')
    Left = 466
    Top = 55
    object dataAreaid: TStringField
      DisplayLabel = #31995#32479'ID'
      FieldName = 'id'
      Size = 6
    end
    object dataAreaparent_id: TStringField
      DisplayLabel = #19978#32423#20195#30721
      FieldName = 'parent_id'
      Size = 6
    end
    object dataAreaname: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'name'
      Size = 50
    end
    object dataAreacode: TStringField
      DisplayLabel = #34892#25919#20195#30721
      FieldName = 'code'
      Size = 6
    end
    object dataAreadm: TStringField
      DisplayLabel = #25340#38899#20195#30721
      FieldName = 'dm'
      Size = 5
    end
    object dataAreaoutflag: TIntegerField
      DisplayLabel = #23548#20986#26631#35760
      FieldName = 'outflag'
    end
    object dataAreacode_level: TStringField
      DisplayLabel = #32423#21035
      FieldName = 'code_level'
      Size = 1
    end
  end
  object dataNation: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = dataNationBeforePost
    AfterScroll = dataNationAfterScroll
    Parameters = <>
    Left = 466
    Top = 109
    object dataNationid: TStringField
      DisplayLabel = #31995#32479'ID'
      FieldName = 'id'
      Size = 4
    end
    object dataNationcode: TStringField
      DisplayLabel = #20195#30721
      FieldName = 'code'
      Size = 2
    end
    object dataNationname: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'name'
    end
    object dataNationpingyin: TStringField
      DisplayLabel = #25340#38899
      FieldName = 'pingyin'
      Size = 10
    end
    object dataNationpingyincode: TStringField
      DisplayLabel = #25340#38899#20195#30721
      FieldName = 'pingyincode'
      Size = 5
    end
    object dataNationoutflag: TIntegerField
      DisplayLabel = #23548#20986#26631#35760
      FieldName = 'outflag'
    end
  end
  object dataDegree: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = dataDegreeBeforePost
    AfterPost = dataDegreeAfterPost
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_degree')
    Left = 466
    Top = 197
    object dataDegreeid: TStringField
      DisplayLabel = #31995#32479'ID'
      FieldName = 'id'
      Size = 4
    end
    object dataDegreeparent_id: TStringField
      DisplayLabel = #19978#32423#20195#30721
      FieldName = 'parent_id'
      Size = 4
    end
    object dataDegreecode: TStringField
      DisplayLabel = #20195#30721
      FieldName = 'code'
      Size = 3
    end
    object dataDegreename: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'name'
    end
    object dataDegreeoutflag: TIntegerField
      DisplayLabel = #23548#20986#26631#35760
      FieldName = 'outflag'
    end
    object dataDegreecode_level: TStringField
      DisplayLabel = #32423#21035
      FieldName = 'code_level'
      Size = 1
    end
  end
  object dataWokInfo: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = dataWokInfoBeforePost
    AfterScroll = dataWokInfoAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_work_info')
    Left = 466
    Top = 137
    object dataWokInfoid: TStringField
      DisplayLabel = #31995#32479'ID'
      FieldName = 'id'
      Size = 2
    end
    object dataWokInfocode: TStringField
      DisplayLabel = #20195#30721
      FieldName = 'code'
      Size = 2
    end
    object dataWokInfoname: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'name'
    end
    object dataWokInfooutflag: TIntegerField
      DisplayLabel = #23548#20986#26631#35760
      FieldName = 'outflag'
    end
  end
  object dataXl: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = dataXlBeforePost
    AfterPost = dataXlAfterPost
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_xl')
    Left = 466
    Top = 165
    object dataXlid: TStringField
      DisplayLabel = #31995#32479'ID'
      FieldName = 'id'
      Size = 4
    end
    object dataXlparent_id: TStringField
      DisplayLabel = #19978#32423#20195#30721
      FieldName = 'parent_id'
      Size = 4
    end
    object dataXlcode: TStringField
      DisplayLabel = #20195#30721
      FieldName = 'code'
      Size = 2
    end
    object dataXlname: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'name'
    end
    object dataXloutflag: TIntegerField
      DisplayLabel = #23548#20986#26631#35760
      FieldName = 'outflag'
    end
    object dataXlcode_level: TStringField
      DisplayLabel = #32423#21035
      FieldName = 'code_level'
      Size = 1
    end
  end
  object DataSArea: TDataSource
    DataSet = dataArea
    Left = 494
    Top = 54
  end
  object DataSOrgKind: TDataSource
    DataSet = dataOrgKind
    Left = 494
    Top = 82
  end
  object DataSNation: TDataSource
    DataSet = dataNation
    Left = 494
    Top = 110
  end
  object DataSWokInfo: TDataSource
    DataSet = dataWokInfo
    Left = 494
    Top = 138
  end
  object DataSXl: TDataSource
    DataSet = dataXl
    Left = 494
    Top = 166
  end
  object DataSDegree: TDataSource
    DataSet = dataDegree
    Left = 494
    Top = 194
  end
  object CSBarMDIChild1: TCSBarMDIChild
    Left = 104
    Top = 224
  end
  object CategoryFind: TCSDBFind
    Exclude.Strings = (
      'parent_id'
      'id'
      'outflag'
      'code_level')
    Left = 76
    Top = 224
  end
  object ImageList: TImageList
    Left = 48
    Top = 224
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
  object dataSex: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = dataSexBeforePost
    AfterScroll = dataSexAfterScroll
    Parameters = <>
    Left = 466
    Top = 221
    object dataSexid: TStringField
      DisplayLabel = #31995#32479'ID'
      FieldName = 'id'
      Size = 2
    end
    object dataSexcode: TStringField
      DisplayLabel = #20195#30721
      FieldName = 'code'
      Size = 2
    end
    object dataSexname: TStringField
      DisplayLabel = #21517#31216' '
      FieldName = 'name'
    end
    object dataSexoutflag: TIntegerField
      DisplayLabel = #23548#20986#26631#35760
      FieldName = 'outflag'
    end
  end
  object DataSSex: TDataSource
    DataSet = dataSex
    Left = 494
    Top = 222
  end
  object dataMarry: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforePost = dataMarryBeforePost
    AfterScroll = dataMarryAfterScroll
    Parameters = <>
    Left = 468
    Top = 249
    object dataMarryid: TStringField
      DisplayLabel = #31995#32479'ID'
      FieldName = 'id'
      Size = 2
    end
    object dataMarrycode: TStringField
      DisplayLabel = #20195#30721
      FieldName = 'code'
      Size = 2
    end
    object dataMarryname: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'name'
      Size = 10
    end
    object dataMarryoutflag: TIntegerField
      DisplayLabel = #23548#20986#26631#35760
      FieldName = 'outflag'
    end
  end
  object DataSMarry: TDataSource
    DataSet = dataMarry
    Left = 494
    Top = 250
  end
  object Temp: TCSADOQuery
    Connection = dmData.adocon
    Parameters = <>
    Left = 438
    Top = 56
  end
  object ScrChild: TCSScrCtrlChild
    Left = 132
    Top = 224
  end
end
