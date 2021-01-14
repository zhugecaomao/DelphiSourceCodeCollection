object frmBeginWorkManageBase: TfrmBeginWorkManageBase
  Left = 50
  Top = 38
  Width = 739
  Height = 534
  Caption = 'frmBeginWorkManageBase'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object spList: TSplitter
    Left = 0
    Top = 305
    Width = 731
    Height = 3
    Cursor = crSizeNS
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 479
    Width = 731
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel3: TPanel
      Left = 576
      Top = 1
      Width = 154
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 5
      object bbtnClose: TBitBtn
        Left = 77
        Top = 2
        Width = 75
        Height = 22
        Caption = #20851#38381'(&C)'
        TabOrder = 1
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
      object bbtnHelp: TBitBtn
        Left = 0
        Top = 2
        Width = 75
        Height = 22
        Caption = #24110#21161'(&H)'
        TabOrder = 0
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
    end
    object bbtnConfirm: TBitBtn
      Left = 127
      Top = 3
      Width = 60
      Height = 22
      Caption = #30830#35748
      TabOrder = 2
      OnClick = bbtnConfirmClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333FF3333333333333344333333
        3333333F88F333333333333422433333333333F8338F33333333334222243333
        33333F833F38F333333334222A224333333338F3F8F38F3333333222A3A22433
        333338FF838F38F333333A2A333A2243333338F83338F38F333333A33333A224
        3333338333338F38F333333333333A2243333333333338F38F333333333333A2
        243333333333338F38F333333333333A2243333333333338F383333333333333
        A2233333333333338F833333333333333A233333333333333883333333333333
        33A3333333333333338333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbtnSave: TBitBtn
      Left = 3
      Top = 3
      Width = 60
      Height = 22
      Caption = #20445#23384
      Enabled = False
      TabOrder = 0
      OnClick = bbtnSaveClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E00000001000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFD00000000000000000000000000FDFD00E4E40000
        00000000070700E400FDFD00E4E4000000000000070700E400FDFD00E4E40000
        00000000070700E400FDFD00E4E4000000000000000000E400FDFD00E4E4E4E4
        E4E4E4E4E4E4E4E400FDFD00E4E40000000000000000E4E400FDFD00E4000707
        07070707070700E400FDFD00E400070707070707070700E400FDFD00E4000707
        07070707070700E400FDFD00E400070707070707070700E400FDFD00E4000707
        070707070707000000FDFD00E4000707070707070707000700FDFD0000000000
        000000000000000000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
    end
    object bbtnCancel: TBitBtn
      Left = 65
      Top = 3
      Width = 60
      Height = 22
      Caption = #21462#28040
      Enabled = False
      TabOrder = 1
      OnClick = bbtnCancelClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333331333333333
        3133338333333333383331113333333331333838333333333833311113333333
        1333383383333333833333111333333133333383833333383333333111333311
        3333333838333388333333331113311333333333838338833333333331111133
        3333333338388833333333333311133333333333338383333333333331111133
        3333333338388833333333331113311333333333838338833333331111333311
        3333338838333388333331111333333113333833833333388333311133333333
        3133388833333333383333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbtnDeleteConfirm: TBitBtn
      Left = 189
      Top = 3
      Width = 80
      Height = 22
      Caption = #21024#38500#30830#35748
      TabOrder = 3
      OnClick = bbtnDeleteConfirmClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333FF3333333333333344333333
        3333333F88F333333333333422433333333333F8338F33333333334222243333
        33333F833F38F333333334222A224333333338F3F8F38F3333333222A3A22433
        333338FF838F38F333333A2A333A2243333338F83338F38F333333A33333A224
        3333338333338F38F333333333333A2243333333333338F38F333333333333A2
        243333333333338F38F333333333333A2243333333333338F383333333333333
        A2233333333333338F833333333333333A233333333333333883333333333333
        33A3333333333333338333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbtnPrint: TBitBtn
      Left = 271
      Top = 3
      Width = 60
      Height = 22
      Hint = #25171#21360#21015#34920#21306#22495#30340#20869#23481
      Caption = #25171#21360
      TabOrder = 4
      OnMouseUp = bbtnPrintMouseUp
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 308
    Width = 731
    Height = 171
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 729
      Height = 169
      ActivePage = TabSheet1
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #35774#22791#24773#20917
        object grdDeviceDetail: TdxDBGrid
          Left = 0
          Top = 0
          Width = 721
          Height = 114
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'sysid'
          SummaryGroups = <>
          SummarySeparator = ', '
          Align = alClient
          TabOrder = 0
          DataSource = DeviceDetaild
          Filter.Criteria = {00000000}
          LookAndFeel = lfFlat
          OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSort, edgoTabThrough, edgoVertThrough]
          OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoBandHeaderWidth, edgoIndicator, edgoShowButtonAlways, edgoUseBitmap]
          OnChangeColumn = grdDeviceDetailChangeColumn
          object grdDeviceDetaildev_kind: TdxDBGridMaskColumn
            DisableEditor = True
            HeaderAlignment = taCenter
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'dev_kind'
          end
          object grdDeviceDetaildev_category: TdxDBGridPickColumn
            HeaderAlignment = taCenter
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'dev_category'
            OnCloseUp = grdDeviceDetaildev_categoryCloseUp
          end
          object grdDeviceDetaildev_level: TdxDBGridPickColumn
            HeaderAlignment = taCenter
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'dev_level'
            OnCloseUp = grdDeviceDetaildev_levelCloseUp
          end
          object grdDeviceDetaildev_model: TdxDBGridPickColumn
            HeaderAlignment = taCenter
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'dev_model'
          end
          object grdDeviceDetaildev_name: TdxDBGridMaskColumn
            HeaderAlignment = taCenter
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'dev_name'
          end
          object grdDeviceDetaildev_type: TdxDBGridMaskColumn
            HeaderAlignment = taCenter
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'dev_type'
          end
          object grdDeviceDetaildev_reg_no: TdxDBGridMaskColumn
            HeaderAlignment = taCenter
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'dev_reg_no'
          end
          object grdDeviceDetaildev_inner_no: TdxDBGridMaskColumn
            HeaderAlignment = taCenter
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'dev_inner_no'
          end
          object grdDeviceDetaildev_address: TdxDBGridMaskColumn
            HeaderAlignment = taCenter
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'dev_address'
          end
          object grdDeviceDetailmanu_no: TdxDBGridMaskColumn
            HeaderAlignment = taCenter
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'manu_no'
          end
          object grdDeviceDetailmanu_date: TdxDBGridMaskColumn
            HeaderAlignment = taCenter
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'manu_date'
          end
          object grdDeviceDetailmanu_reg_no: TdxDBGridMaskColumn
            HeaderAlignment = taCenter
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'manu_reg_no'
          end
          object grdDeviceDetailmanu_name: TdxDBGridMaskColumn
            HeaderAlignment = taCenter
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'manu_name'
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 114
          Width = 721
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object Panel5: TPanel
            Left = 367
            Top = 1
            Width = 353
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object bbtnAddDeviceDetail: TBitBtn
              Left = 2
              Top = 2
              Width = 50
              Height = 22
              Caption = #28155#21152
              TabOrder = 0
              OnClick = bbtnAddDeviceDetailClick
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
            end
            object bbtnDeleteDeviceDetail: TBitBtn
              Left = 52
              Top = 2
              Width = 50
              Height = 22
              Caption = #21024#38500
              TabOrder = 1
              OnClick = bbtnDeleteDeviceDetailClick
              Glyph.Data = {
                46010000424D460100000000000076000000280000001C0000000D0000000100
                040000000000D000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                3337FFFFFFFFFFF3000033000000000033373333333333F30000330000000000
                33373333333333F3000033000000000033373333333333F30000333333333333
                33377777777777F3000033333333333333333333333333330000333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                33333333333333330000}
              NumGlyphs = 2
            end
            object navDeviceDetail: TCSdxDBNavigator
              Left = 102
              Top = 2
              Width = 250
              Height = 22
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
              TabOrder = 2
              BeforeAction = navDeviceDetailBeforeAction
              Captions.Strings = (
                #26368#21069
                #21518#36864
                #21069#36827
                #26368#21518
                #28155#21152
                #21024#38500
                #20462#25913
                #20445#23384
                #21462#28040
                #21047#26032)
            end
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = #29616#22330#31649#29702#12289#19987#19994#12289#20316#19994#20154#21592
        ImageIndex = 1
        object grdPersonDetail: TdxDBGrid
          Left = 0
          Top = 0
          Width = 721
          Height = 114
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'sysid'
          SummaryGroups = <>
          SummarySeparator = ', '
          Align = alClient
          TabOrder = 0
          DataSource = PersonDetaild
          Filter.Criteria = {00000000}
          LookAndFeel = lfFlat
          OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSort, edgoTabThrough, edgoVertThrough]
          OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoBandHeaderWidth, edgoIndicator, edgoShowButtonAlways, edgoUseBitmap]
          object grdPersonDetailcard_no: TdxDBGridButtonColumn
            HeaderAlignment = taCenter
            BandIndex = 0
            RowIndex = 0
            FieldName = 'card_no'
            Buttons = <
              item
                Default = True
              end>
            OnButtonClick = grdPersonDetailcard_noButtonClick
          end
          object grdPersonDetailname: TdxDBGridColumn
            HeaderAlignment = taCenter
            BandIndex = 0
            RowIndex = 0
            FieldName = 'name'
          end
          object grdPersonDetailwork_kind: TdxDBGridColumn
            HeaderAlignment = taCenter
            Sorted = csUp
            BandIndex = 0
            RowIndex = 0
            FieldName = 'work_kind'
          end
          object grdPersonDetailwork_item: TdxDBGridColumn
            HeaderAlignment = taCenter
            BandIndex = 0
            RowIndex = 0
            FieldName = 'work_item'
          end
          object grdPersonDetailwork_level: TdxDBGridColumn
            HeaderAlignment = taCenter
            BandIndex = 0
            RowIndex = 0
            FieldName = 'work_level'
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 114
          Width = 721
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object Panel8: TPanel
            Left = 367
            Top = 1
            Width = 353
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object bbtnAddPersonDetail: TBitBtn
              Left = 2
              Top = 2
              Width = 50
              Height = 22
              Caption = #28155#21152
              TabOrder = 0
              OnClick = bbtnAddPersonDetailClick
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
            end
            object bbtnDeletePersonDetail: TBitBtn
              Left = 52
              Top = 2
              Width = 50
              Height = 22
              Caption = #21024#38500
              TabOrder = 1
              OnClick = bbtnDeletePersonDetailClick
              Glyph.Data = {
                46010000424D460100000000000076000000280000001C0000000D0000000100
                040000000000D000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                3337FFFFFFFFFFF3000033000000000033373333333333F30000330000000000
                33373333333333F3000033000000000033373333333333F30000333333333333
                33377777777777F3000033333333333333333333333333330000333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                33333333333333330000}
              NumGlyphs = 2
            end
            object navPersonDetail: TCSdxDBNavigator
              Left = 102
              Top = 2
              Width = 250
              Height = 22
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
              TabOrder = 2
              BeforeAction = navDeviceDetailBeforeAction
              Captions.Strings = (
                #26368#21069
                #21518#36864
                #21069#36827
                #26368#21518
                #28155#21152
                #21024#38500
                #20462#25913
                #20445#23384
                #21462#28040
                #21047#26032)
            end
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #26045#24037#20998#21253
        ImageIndex = 2
        object grdConstDetail: TdxDBGrid
          Left = 0
          Top = 0
          Width = 721
          Height = 114
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'sysid'
          SummaryGroups = <>
          SummarySeparator = ', '
          Align = alClient
          TabOrder = 0
          DataSource = ConstDetaild
          Filter.Criteria = {00000000}
          LookAndFeel = lfFlat
          OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSort, edgoTabThrough, edgoVertThrough]
          OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoBandHeaderWidth, edgoIndicator, edgoShowButtonAlways, edgoUseBitmap]
          object grdConstDetailreg_no: TdxDBGridColumn
            HeaderAlignment = taCenter
            Width = 100
            BandIndex = 0
            RowIndex = 0
            FieldName = 'reg_no'
          end
          object grdConstDetailcom_name: TdxDBGridButtonColumn
            HeaderAlignment = taCenter
            Width = 250
            BandIndex = 0
            RowIndex = 0
            FieldName = 'com_name'
            Buttons = <
              item
                Default = True
              end>
            OnButtonClick = grdConstDetailcom_nameButtonClick
          end
          object grdConstDetailitem_name: TdxDBGridColumn
            HeaderAlignment = taCenter
            Width = 250
            BandIndex = 0
            RowIndex = 0
            FieldName = 'item_name'
          end
        end
        object Panel9: TPanel
          Left = 0
          Top = 114
          Width = 721
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object Panel10: TPanel
            Left = 367
            Top = 1
            Width = 353
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object bbtnAddConstDetail: TBitBtn
              Left = 2
              Top = 2
              Width = 50
              Height = 22
              Caption = #28155#21152
              TabOrder = 0
              OnClick = bbtnAddConstDetailClick
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
            end
            object bbtnDeleteConstDetail: TBitBtn
              Left = 52
              Top = 2
              Width = 50
              Height = 22
              Caption = #21024#38500
              TabOrder = 1
              OnClick = bbtnDeleteConstDetailClick
              Glyph.Data = {
                46010000424D460100000000000076000000280000001C0000000D0000000100
                040000000000D000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                3337FFFFFFFFFFF3000033000000000033373333333333F30000330000000000
                33373333333333F3000033000000000033373333333333F30000333333333333
                33377777777777F3000033333333333333333333333333330000333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                33333333333333330000}
              NumGlyphs = 2
            end
            object navConstDetail: TCSdxDBNavigator
              Left = 102
              Top = 2
              Width = 250
              Height = 22
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
              TabOrder = 2
              BeforeAction = navConstDetailBeforeAction
              Captions.Strings = (
                #26368#21069
                #21518#36864
                #21069#36827
                #26368#21518
                #28155#21152
                #21024#38500
                #20462#25913
                #20445#23384
                #21462#28040
                #21047#26032)
            end
          end
        end
      end
      object TabSheet7: TTabSheet
        Caption = #22303#24314#24037#31243#26045#24037#21333#20301
        ImageIndex = 3
        object grdBuildDetail: TdxDBGrid
          Left = 0
          Top = 0
          Width = 721
          Height = 114
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'sysid'
          SummaryGroups = <>
          SummarySeparator = ', '
          Align = alClient
          TabOrder = 0
          DataSource = BuildDetaild
          Filter.Criteria = {00000000}
          LookAndFeel = lfFlat
          OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSort, edgoTabThrough, edgoVertThrough]
          OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoBandHeaderWidth, edgoIndicator, edgoShowButtonAlways, edgoUseBitmap]
          object grdBuildDetailreg_no: TdxDBGridColumn
            HeaderAlignment = taCenter
            Width = 100
            BandIndex = 0
            RowIndex = 0
            FieldName = 'reg_no'
          end
          object grdBuildDetailcom_name: TdxDBGridButtonColumn
            HeaderAlignment = taCenter
            Width = 250
            BandIndex = 0
            RowIndex = 0
            FieldName = 'com_name'
            Buttons = <
              item
                Default = True
              end>
            OnButtonClick = grdBuildDetailcom_nameButtonClick
          end
          object grdBuildDetailitem_name: TdxDBGridColumn
            HeaderAlignment = taCenter
            Width = 250
            BandIndex = 0
            RowIndex = 0
            FieldName = 'item_name'
          end
        end
        object Panel11: TPanel
          Left = 0
          Top = 114
          Width = 721
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object Panel12: TPanel
            Left = 367
            Top = 1
            Width = 353
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object bbtnAddBuildDetail: TBitBtn
              Left = 2
              Top = 2
              Width = 50
              Height = 22
              Caption = #28155#21152
              TabOrder = 0
              OnClick = bbtnAddBuildDetailClick
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
            end
            object bbtnDeleteBuildDetail: TBitBtn
              Left = 52
              Top = 2
              Width = 50
              Height = 22
              Caption = #21024#38500
              TabOrder = 1
              OnClick = bbtnDeleteBuildDetailClick
              Glyph.Data = {
                46010000424D460100000000000076000000280000001C0000000D0000000100
                040000000000D000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                3337FFFFFFFFFFF3000033000000000033373333333333F30000330000000000
                33373333333333F3000033000000000033373333333333F30000333333333333
                33377777777777F3000033333333333333333333333333330000333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                33333333333333330000}
              NumGlyphs = 2
            end
            object navBuildDetail: TCSdxDBNavigator
              Left = 102
              Top = 2
              Width = 250
              Height = 22
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
              TabOrder = 2
              BeforeAction = navBuildDetailBeforeAction
              Captions.Strings = (
                #26368#21069
                #21518#36864
                #21069#36827
                #26368#21518
                #28155#21152
                #21024#38500
                #20462#25913
                #20445#23384
                #21462#28040
                #21047#26032)
            end
          end
        end
      end
      object TabSheet8: TTabSheet
        Caption = #22303#24314#24037#31243#30417#29702#25110#39564#25910#21333#20301
        ImageIndex = 4
        object grdSuprDetail: TdxDBGrid
          Left = 0
          Top = 0
          Width = 721
          Height = 114
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'sysid'
          SummaryGroups = <>
          SummarySeparator = ', '
          Align = alClient
          TabOrder = 0
          DataSource = SuprDetaild
          Filter.Criteria = {00000000}
          LookAndFeel = lfFlat
          OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSort, edgoTabThrough, edgoVertThrough]
          OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoBandHeaderWidth, edgoIndicator, edgoShowButtonAlways, edgoUseBitmap]
          object grdSuprDetailreg_no: TdxDBGridColumn
            HeaderAlignment = taCenter
            Width = 100
            BandIndex = 0
            RowIndex = 0
            FieldName = 'reg_no'
          end
          object grdSuprDetailcom_name: TdxDBGridButtonColumn
            HeaderAlignment = taCenter
            Width = 250
            BandIndex = 0
            RowIndex = 0
            FieldName = 'com_name'
            Buttons = <
              item
                Default = True
              end>
            OnButtonClick = grdSuprDetailcom_nameButtonClick
          end
          object grdSuprDetailitem_name: TdxDBGridColumn
            HeaderAlignment = taCenter
            Width = 250
            BandIndex = 0
            RowIndex = 0
            FieldName = 'item_name'
          end
        end
        object Panel13: TPanel
          Left = 0
          Top = 114
          Width = 721
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object Panel14: TPanel
            Left = 367
            Top = 1
            Width = 353
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object bbtnAddSuprDetail: TBitBtn
              Left = 2
              Top = 2
              Width = 50
              Height = 22
              Caption = #28155#21152
              TabOrder = 0
              OnClick = bbtnAddSuprDetailClick
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
            end
            object bbtnDeleteSuprDetail: TBitBtn
              Left = 52
              Top = 2
              Width = 50
              Height = 22
              Caption = #21024#38500
              TabOrder = 1
              OnClick = bbtnDeleteSuprDetailClick
              Glyph.Data = {
                46010000424D460100000000000076000000280000001C0000000D0000000100
                040000000000D000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                3337FFFFFFFFFFF3000033000000000033373333333333F30000330000000000
                33373333333333F3000033000000000033373333333333F30000333333333333
                33377777777777F3000033333333333333333333333333330000333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                33333333333333330000}
              NumGlyphs = 2
            end
            object navSuprDetail: TCSdxDBNavigator
              Left = 102
              Top = 2
              Width = 250
              Height = 22
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
              TabOrder = 2
              BeforeAction = navSuprDetailBeforeAction
              Captions.Strings = (
                #26368#21069
                #21518#36864
                #21069#36827
                #26368#21518
                #28155#21152
                #21024#38500
                #20462#25913
                #20445#23384
                #21462#28040
                #21047#26032)
            end
          end
        end
      end
      object TabSheet9: TTabSheet
        Caption = #25991#20214#36164#26009
        ImageIndex = 5
        object grdDocDetail: TdxDBGrid
          Left = 0
          Top = 0
          Width = 721
          Height = 114
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'sysid'
          SummaryGroups = <>
          SummarySeparator = ', '
          Align = alClient
          TabOrder = 0
          DataSource = DocDetaild
          Filter.Criteria = {00000000}
          LookAndFeel = lfFlat
          OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSort, edgoTabThrough, edgoVertThrough]
          OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoBandHeaderWidth, edgoIndicator, edgoShowButtonAlways, edgoUseBitmap]
          object grdDocDetaildoc_name: TdxDBGridColumn
            HeaderAlignment = taCenter
            Width = 364
            BandIndex = 0
            RowIndex = 0
            FieldName = 'doc_name'
          end
          object grdDocDetailpages: TdxDBGridColumn
            HeaderAlignment = taCenter
            Width = 82
            BandIndex = 0
            RowIndex = 0
            FieldName = 'pages'
          end
        end
        object Panel15: TPanel
          Left = 0
          Top = 114
          Width = 721
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object Panel16: TPanel
            Left = 367
            Top = 1
            Width = 353
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object bbtnAddDocDetail: TBitBtn
              Left = 2
              Top = 2
              Width = 50
              Height = 22
              Caption = #28155#21152
              TabOrder = 0
              OnClick = bbtnAddDocDetailClick
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
            end
            object bbtnDeleteDocDetail: TBitBtn
              Left = 52
              Top = 2
              Width = 50
              Height = 22
              Caption = #21024#38500
              TabOrder = 1
              OnClick = bbtnDeleteDocDetailClick
              Glyph.Data = {
                46010000424D460100000000000076000000280000001C0000000D0000000100
                040000000000D000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                3337FFFFFFFFFFF3000033000000000033373333333333F30000330000000000
                33373333333333F3000033000000000033373333333333F30000333333333333
                33377777777777F3000033333333333333333333333333330000333333333333
                3333333333333333000033333333333333333333333333330000333333333333
                33333333333333330000}
              NumGlyphs = 2
            end
            object navDocDetail: TCSdxDBNavigator
              Left = 102
              Top = 2
              Width = 250
              Height = 22
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
              TabOrder = 2
              BeforeAction = navDocDetailBeforeAction
              Captions.Strings = (
                #26368#21069
                #21518#36864
                #21069#36827
                #26368#21518
                #28155#21152
                #21024#38500
                #20462#25913
                #20445#23384
                #21462#28040
                #21047#26032)
            end
          end
        end
      end
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 731
    Height = 305
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 2
    object pagGeneralInfo: TPageControl
      Left = 1
      Top = 1
      Width = 729
      Height = 303
      ActivePage = TabSheet2
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = #24320#24037#21578#30693#22522#26412#20449#24687
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 721
          Height = 276
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 0
          object Label3: TLabel
            Left = 10
            Top = 6
            Width = 60
            Height = 12
            Caption = #23457#25209#32534#21495#65306
          end
          object Label1: TLabel
            Left = 178
            Top = 6
            Width = 60
            Height = 12
            Caption = #35774#22791#31181#31867#65306
          end
          object Label16: TLabel
            Left = 10
            Top = 208
            Width = 36
            Height = 12
            Caption = #22791#27880#65306
          end
          object Label7: TLabel
            Left = 345
            Top = 6
            Width = 60
            Height = 12
            Caption = #26045#24037#31867#21035#65306
          end
          object Label5: TLabel
            Left = 515
            Top = 6
            Width = 60
            Height = 12
            Caption = #21578#30693#26085#26399#65306
          end
          object eReportNo: TDBEditEh
            Left = 70
            Top = 3
            Width = 98
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'report_no'
            DataSource = Generald
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 0
            Visible = True
          end
          object GroupBox3: TGroupBox
            Left = 10
            Top = 26
            Width = 689
            Height = 133
            Caption = ' '#24037#31243#24773#20917' '
            TabOrder = 4
            object Label10: TLabel
              Left = 8
              Top = 39
              Width = 60
              Height = 12
              Caption = #24314#35774#21333#20301#65306
            end
            object Label12: TLabel
              Left = 320
              Top = 39
              Width = 60
              Height = 12
              Caption = #20855#20307#22320#22336#65306
            end
            object Label18: TLabel
              Left = 8
              Top = 16
              Width = 60
              Height = 12
              Caption = #24037#31243#21517#31216#65306
            end
            object Label19: TLabel
              Left = 8
              Top = 62
              Width = 60
              Height = 12
              Caption = #24037#31243#36127#36131#65306
            end
            object Label20: TLabel
              Left = 175
              Top = 62
              Width = 36
              Height = 12
              Caption = #30005#35805#65306
            end
            object Label22: TLabel
              Left = 320
              Top = 62
              Width = 60
              Height = 12
              Caption = #35774#35745#21333#20301#65306
            end
            object Label25: TLabel
              Left = 8
              Top = 108
              Width = 60
              Height = 12
              Caption = #21512#21516#26085#26399#65306
            end
            object Label26: TLabel
              Left = 8
              Top = 85
              Width = 60
              Height = 12
              Caption = #21512#21516#32534#21495#65306
            end
            object Label28: TLabel
              Left = 174
              Top = 85
              Width = 84
              Height = 12
              Caption = #20027#35201#26045#24037#39033#30446#65306
            end
            object Label35: TLabel
              Left = 198
              Top = 108
              Width = 60
              Height = 12
              Caption = #35774#22791#25968#37327#65306
            end
            object Label33: TLabel
              Left = 353
              Top = 108
              Width = 60
              Height = 12
              Caption = #24320#24037#26085#26399#65306
            end
            object Label34: TLabel
              Left = 521
              Top = 108
              Width = 60
              Height = 12
              Caption = #31459#24037#26085#26399#65306
            end
            object ePropertyCom: TDBEditEh
              Left = 68
              Top = 36
              Width = 244
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'property_com'
              DataSource = Generald
              EditButtons = <
                item
                  Style = ebsEllipsisEh
                  OnClick = ePropertyComEditButtons0Click
                end>
              ParentCtl3D = False
              TabOrder = 1
              Visible = True
            end
            object ePropertyAddress: TDBEditEh
              Left = 380
              Top = 36
              Width = 299
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'property_address'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 2
              Visible = True
            end
            object eProjectName: TDBEditEh
              Left = 68
              Top = 13
              Width = 243
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'project_name'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 0
              Visible = True
            end
            object ePropertyManager: TDBEditEh
              Left = 68
              Top = 59
              Width = 100
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'property_manager'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 3
              Visible = True
            end
            object eManagerTel: TDBEditEh
              Left = 211
              Top = 59
              Width = 100
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'manager_tel'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 4
              Visible = True
            end
            object ePrjDesignCom: TDBEditEh
              Left = 380
              Top = 59
              Width = 299
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'prj_design_com'
              DataSource = Generald
              EditButtons = <
                item
                  Style = ebsEllipsisEh
                  OnClick = ePrjDesignComEditButtons0Click
                end>
              ParentCtl3D = False
              TabOrder = 5
              Visible = True
            end
            object deContractDate: TCSdxDBDateEdit
              Left = 67
              Top = 104
              Width = 102
              Style.BorderStyle = xbsSingle
              Style.ButtonStyle = btsFlat
              TabOrder = 7
              Alignment = taLeftJustify
              DataField = 'contract_date'
              DataSource = Generald
              DateOnError = deToday
              FixedDateFormat = 'yyyy-MM-dd'
              StoredValues = 5
            end
            object eContractNo: TDBEditEh
              Left = 68
              Top = 82
              Width = 100
              Height = 18
              Ctl3D = False
              DataField = 'contract_no'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 6
              Visible = True
            end
            object eBuildProject: TDBEditEh
              Left = 258
              Top = 82
              Width = 421
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'build_project'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 8
              Visible = True
            end
            object eDevNum: TDBEditEh
              Left = 258
              Top = 105
              Width = 87
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'dev_num'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 9
              Visible = True
            end
            object deStartDate: TCSdxDBDateEdit
              Left = 412
              Top = 104
              Width = 100
              Color = clSkyBlue
              Style.BorderStyle = xbsSingle
              Style.ButtonStyle = btsFlat
              TabOrder = 10
              DataField = 'start_date'
              DataSource = Generald
              DateOnError = deToday
              FixedDateFormat = 'yyyy-MM-dd'
              StoredValues = 4
            end
            object deEndDate: TCSdxDBDateEdit
              Left = 580
              Top = 104
              Width = 100
              Color = clSkyBlue
              Style.BorderStyle = xbsSingle
              Style.ButtonStyle = btsFlat
              TabOrder = 11
              DataField = 'end_date'
              DataSource = Generald
              DateOnError = deToday
              FixedDateFormat = 'yyyy-MM-dd'
              StoredValues = 4
            end
          end
          object mRemark: TdxDBMemo
            Left = 10
            Top = 222
            Width = 687
            Style.BorderStyle = xbsSingle
            Style.ButtonStyle = btsFlat
            TabOrder = 6
            DataField = 'remark'
            DataSource = Generald
            ScrollBars = ssBoth
            Height = 50
          end
          object peDevKind: TdxDBPickEdit
            Left = 237
            Top = 2
            Width = 100
            Color = clSkyBlue
            Style.BorderStyle = xbsSingle
            Style.ButtonStyle = btsFlat
            TabOrder = 1
            DataField = 'dev_kind'
            DataSource = Generald
            OnChange = peDevKindChange
            DropDownListStyle = True
            Items.Strings = (
              #26032#35013
              #25913#36896
              #22823#20462)
          end
          object peConstKind: TdxDBPickEdit
            Left = 404
            Top = 2
            Width = 100
            Color = clSkyBlue
            Style.BorderStyle = xbsSingle
            Style.ButtonStyle = btsFlat
            TabOrder = 2
            DataField = 'const_kind'
            DataSource = Generald
            OnChange = peConstKindChange
            DropDownListStyle = True
            Items.Strings = (
              #30005#26799
              #36215#37325#26426#26800)
          end
          object deAppraiseDate: TCSdxDBDateEdit
            Left = 574
            Top = 2
            Width = 100
            Color = clSkyBlue
            Style.BorderStyle = xbsSingle
            Style.ButtonStyle = btsFlat
            TabOrder = 3
            DataField = 'appraise_date'
            DataSource = Generald
            DateOnError = deToday
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object GroupBox1: TGroupBox
            Left = 10
            Top = 163
            Width = 455
            Height = 41
            Caption = ' '#24037#31243#24635#39044#31639' '
            TabOrder = 5
            object Label14: TLabel
              Left = 8
              Top = 16
              Width = 60
              Height = 12
              Caption = #22303#24314#39044#31639#65306
            end
            object Label36: TLabel
              Left = 234
              Top = 16
              Width = 60
              Height = 12
              Caption = #35774#22791#39044#31639#65306
            end
            object eBuildCharge: TDBEditEh
              Left = 68
              Top = 13
              Width = 149
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'build_charge'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 0
              Visible = True
            end
            object eDevCharge: TDBEditEh
              Left = 294
              Top = 13
              Width = 149
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'dev_charge'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 1
              Visible = True
            end
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = #26045#24037#21333#20301#22522#26412#24773#20917
        ImageIndex = 2
        object GroupBox4: TGroupBox
          Left = 10
          Top = 3
          Width = 689
          Height = 85
          Caption = ' '#26045#24037#21333#20301#22522#26412#24773#20917' '
          TabOrder = 0
          object Label29: TLabel
            Left = 8
            Top = 16
            Width = 60
            Height = 12
            Caption = #26045#24037#21333#20301#65306
          end
          object Label30: TLabel
            Left = 320
            Top = 16
            Width = 60
            Height = 12
            Caption = #20855#20307#22320#22336#65306
          end
          object Label27: TLabel
            Left = 8
            Top = 62
            Width = 60
            Height = 12
            Caption = #35777#20070#32534#21495#65306
          end
          object Label6: TLabel
            Left = 320
            Top = 62
            Width = 60
            Height = 12
            Caption = #26377#25928#26085#26399#65306
          end
          object Label31: TLabel
            Left = 320
            Top = 39
            Width = 60
            Height = 12
            Caption = #27861#23450#20195#34920#65306
          end
          object Label32: TLabel
            Left = 8
            Top = 39
            Width = 60
            Height = 12
            Caption = #26426#26500#20195#30721#65306
          end
          object eConstCom: TDBEditEh
            Left = 68
            Top = 13
            Width = 244
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'const_com'
            DataSource = Generald
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = eConstComEditButtons0Click
              end>
            ParentCtl3D = False
            TabOrder = 0
            Visible = True
          end
          object eConstAddress: TDBEditEh
            Left = 380
            Top = 13
            Width = 299
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'const_address'
            DataSource = Generald
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 1
            Visible = True
          end
          object eConstLicsNo: TDBEditEh
            Left = 68
            Top = 59
            Width = 245
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'const_lics_no'
            DataSource = Generald
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 4
            Visible = True
          end
          object deConstLicsDate: TCSdxDBDateEdit
            Left = 379
            Top = 58
            Width = 125
            Color = clSkyBlue
            Style.BorderStyle = xbsSingle
            Style.ButtonStyle = btsFlat
            TabOrder = 5
            DataField = 'const_lics_date'
            DataSource = Generald
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object eConstDeputy: TDBEditEh
            Left = 380
            Top = 36
            Width = 123
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'const_deputy'
            DataSource = Generald
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 3
            Visible = True
          end
          object eConstRegNo: TDBEditEh
            Left = 68
            Top = 36
            Width = 245
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'const_reg_no'
            DataSource = Generald
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 2
            Visible = True
          end
        end
        object GroupBox5: TGroupBox
          Left = 10
          Top = 92
          Width = 689
          Height = 85
          Caption = ' '#29616#22330#26045#24037#32452#32455
          TabOrder = 1
          object Label21: TLabel
            Left = 8
            Top = 16
            Width = 60
            Height = 12
            Caption = #26045#24037#26426#26500#65306
          end
          object Label8: TLabel
            Left = 175
            Top = 39
            Width = 36
            Height = 12
            Caption = #30005#35805#65306
          end
          object Label4: TLabel
            Left = 175
            Top = 62
            Width = 36
            Height = 12
            Caption = #30005#35805#65306
          end
          object Label13: TLabel
            Left = 8
            Top = 39
            Width = 60
            Height = 12
            Caption = #29616#22330#36127#36131#65306
          end
          object Label24: TLabel
            Left = 320
            Top = 16
            Width = 60
            Height = 12
            Caption = #20855#20307#22320#22336#65306
          end
          object Label2: TLabel
            Left = 8
            Top = 62
            Width = 60
            Height = 12
            Caption = #25216#26415#36127#36131#65306
          end
          object Label17: TLabel
            Left = 320
            Top = 39
            Width = 60
            Height = 12
            Caption = #21333#20301#30005#35805#65306
          end
          object Label23: TLabel
            Left = 501
            Top = 39
            Width = 60
            Height = 12
            Caption = #21333#20301#20256#30495#65306
          end
          object eConstManagerTel: TDBEditEh
            Left = 211
            Top = 36
            Width = 100
            Height = 18
            Ctl3D = False
            DataField = 'const_manager_tel'
            DataSource = Generald
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 3
            Visible = True
          end
          object eConstInstructor: TDBEditEh
            Left = 68
            Top = 59
            Width = 100
            Height = 18
            Ctl3D = False
            DataField = 'const_instructor'
            DataSource = Generald
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 4
            Visible = True
          end
          object eConstInstructorTel: TDBEditEh
            Left = 211
            Top = 59
            Width = 100
            Height = 18
            Ctl3D = False
            DataField = 'const_instructor_tel'
            DataSource = Generald
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 5
            Visible = True
          end
          object eConstManager: TDBEditEh
            Left = 68
            Top = 36
            Width = 100
            Height = 18
            Ctl3D = False
            DataField = 'const_manager'
            DataSource = Generald
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 2
            Visible = True
          end
          object eConstGroupAddress: TDBEditEh
            Left = 380
            Top = 13
            Width = 299
            Height = 18
            Ctl3D = False
            DataField = 'const_group_address'
            DataSource = Generald
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 1
            Visible = True
          end
          object eConstGroup: TDBEditEh
            Left = 68
            Top = 13
            Width = 244
            Height = 18
            Ctl3D = False
            DataField = 'const_group'
            DataSource = Generald
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = eConstGroupEditButtons0Click
              end>
            ParentCtl3D = False
            TabOrder = 0
            Visible = True
          end
          object eConstGroupTel: TDBEditEh
            Left = 380
            Top = 36
            Width = 117
            Height = 18
            Ctl3D = False
            DataField = 'const_group_tel'
            DataSource = Generald
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 6
            Visible = True
          end
          object eConstGroupFax: TDBEditEh
            Left = 561
            Top = 36
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'const_group_fax'
            DataSource = Generald
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 7
            Visible = True
          end
        end
      end
      object TabSheet6: TTabSheet
        Caption = #23433#20840#30417#23519#26426#26500#24847#35265
        ImageIndex = 3
        object GroupBox2: TGroupBox
          Left = 10
          Top = 3
          Width = 688
          Height = 124
          Caption = ' '#23433#20840#30417#23519#26426#26500#24847#35265' '
          TabOrder = 0
          object Label11: TLabel
            Left = 484
            Top = 100
            Width = 96
            Height = 12
            Caption = #21457#20986#24847#35265#20070#26085#26399#65306
          end
          object Label9: TLabel
            Left = 204
            Top = 101
            Width = 96
            Height = 12
            Caption = #24847#35265#36890#30693#20070#32534#21495#65306
          end
          object mIdeaContent: TdxDBMemo
            Left = 8
            Top = 13
            Width = 671
            Style.BorderStyle = xbsSingle
            Style.ButtonStyle = btsFlat
            TabOrder = 0
            DataField = 'idea_content'
            DataSource = Generald
            ScrollBars = ssBoth
            Height = 80
          end
          object deNoticeDate: TCSdxDBDateEdit
            Left = 579
            Top = 96
            Width = 100
            Style.BorderStyle = xbsSingle
            Style.ButtonStyle = btsFlat
            TabOrder = 2
            DataField = 'notice_date'
            DataSource = Generald
            DateOnError = deToday
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object eNoticeNo: TDBEditEh
            Left = 300
            Top = 97
            Width = 171
            Height = 18
            Ctl3D = False
            DataField = 'notice_no'
            DataSource = Generald
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 1
            Visible = True
          end
        end
      end
    end
  end
  object Generald: TDataSource
    DataSet = General
    OnDataChange = GeneraldDataChange
    Left = 164
    Top = 411
  end
  object ScrChild: TCSScrCtrlChild
    Left = 220
    Top = 467
  end
  object Temp: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 192
    Top = 467
  end
  object DetailDevCode: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 192
    Top = 411
  end
  object DetailDevCoded: TDataSource
    DataSet = DetailDevCode
    Left = 220
    Top = 411
  end
  object frBeginWork: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbPrint, pbFind, pbExit, pbPageSetup]
    Left = 192
    Top = 439
    ReportForm = {18000000}
  end
  object frDBBeginWork: TfrDBDataSet
    Left = 220
    Top = 439
  end
  object DeviceDetail: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = DeviceDetailBeforeOpen
    AfterOpen = DeviceDetailAfterOpen
    AfterInsert = DeviceDetailAfterInsert
    AfterScroll = DeviceDetailAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM device.equipment_stwk_device')
    Left = 24
    Top = 411
    object DeviceDetailsysid: TStringField
      FieldName = 'sysid'
    end
    object DeviceDetailstwk_id: TStringField
      FieldName = 'stwk_id'
    end
    object DeviceDetaildev_kind: TStringField
      DisplayLabel = #35774#22791#31181#31867
      DisplayWidth = 50
      FieldName = 'dev_kind'
      Size = 50
    end
    object DeviceDetaildev_category: TStringField
      DisplayLabel = #35774#22791#31867#21035
      FieldName = 'dev_category'
      Size = 50
    end
    object DeviceDetaildev_level: TStringField
      DisplayLabel = #35774#22791#32423#21035
      FieldName = 'dev_level'
      Size = 50
    end
    object DeviceDetaildev_model: TStringField
      DisplayLabel = #35774#22791#21697#31181#65288#22411#24335#65289
      FieldName = 'dev_model'
      Size = 50
    end
    object DeviceDetaildev_name: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'dev_name'
      Size = 30
    end
    object DeviceDetaildev_type: TStringField
      DisplayLabel = #35774#22791#22411#21495#65288#21442#25968#65289
      FieldName = 'dev_type'
      Size = 30
    end
    object DeviceDetaildev_reg_no: TStringField
      DisplayLabel = #35774#22791#20195#30721
      FieldName = 'dev_reg_no'
      Size = 30
    end
    object DeviceDetaildev_inner_no: TStringField
      DisplayLabel = #21333#20301#20869#32534#21495
      FieldName = 'dev_inner_no'
    end
    object DeviceDetaildev_address: TStringField
      DisplayLabel = #35774#22791#22320#28857
      FieldName = 'dev_address'
      Size = 100
    end
    object DeviceDetailmanu_no: TStringField
      DisplayLabel = #21046#36896#32534#21495
      FieldName = 'manu_no'
    end
    object DeviceDetailmanu_date: TStringField
      DisplayLabel = #21046#36896#26085#26399
      FieldName = 'manu_date'
      Size = 10
    end
    object DeviceDetailmanu_reg_no: TStringField
      DisplayLabel = #32452#32455#26426#26500#20195#30721
      FieldName = 'manu_reg_no'
      Size = 12
    end
    object DeviceDetailmanu_name: TStringField
      DisplayLabel = #35774#22791#21046#36896#21333#20301
      FieldName = 'manu_name'
      Size = 60
    end
    object DeviceDetailoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object DeviceDetaild: TDataSource
    DataSet = DeviceDetail
    Left = 52
    Top = 411
  end
  object PersonDetail: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterInsert = PersonDetailAfterInsert
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM device.equipment_stwk_person')
    Left = 24
    Top = 439
    object PersonDetailsysid: TStringField
      FieldName = 'sysid'
    end
    object PersonDetailstwk_id: TStringField
      FieldName = 'stwk_id'
    end
    object PersonDetailcard_no: TStringField
      DisplayLabel = #36523#20221#35777#32534#21495
      FieldName = 'card_no'
    end
    object PersonDetailname: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'name'
      Size = 30
    end
    object PersonDetailwork_kind: TStringField
      DisplayLabel = #20316#19994#39033#30446
      FieldName = 'work_kind'
      Size = 30
    end
    object PersonDetailwork_item: TStringField
      DisplayLabel = #31867#21035#65288#26041#27861#65289
      FieldName = 'work_item'
      Size = 30
    end
    object PersonDetailwork_level: TStringField
      DisplayLabel = #32423#21035#65288#39033#30446#65289
      FieldName = 'work_level'
      Size = 30
    end
    object PersonDetailoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object PersonDetaild: TDataSource
    DataSet = PersonDetail
    Left = 52
    Top = 439
  end
  object BuildDetail: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterInsert = BuildDetailAfterInsert
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM device.equipment_stwk_build')
    Left = 24
    Top = 467
    object BuildDetailsysid: TStringField
      FieldName = 'sysid'
    end
    object BuildDetailstwk_id: TStringField
      FieldName = 'stwk_id'
    end
    object BuildDetailreg_no: TStringField
      DisplayLabel = #32452#32455#26426#26500#20195#30721
      FieldName = 'reg_no'
      Size = 12
    end
    object BuildDetailcom_name: TStringField
      DisplayLabel = #21333#20301#21517#31216
      FieldName = 'com_name'
      Size = 60
    end
    object BuildDetailitem_name: TStringField
      DisplayLabel = #39033#30446#21517#31216
      FieldName = 'item_name'
      Size = 60
    end
    object BuildDetailoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object BuildDetaild: TDataSource
    DataSet = BuildDetail
    Left = 52
    Top = 467
  end
  object DocDetail: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterInsert = DocDetailAfterInsert
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM device.equipment_stwk_doc')
    Left = 82
    Top = 411
    object DocDetailsysid: TStringField
      FieldName = 'sysid'
    end
    object DocDetailstwk_id: TStringField
      FieldName = 'stwk_id'
    end
    object DocDetaildoc_name: TStringField
      DisplayLabel = #25991#20214#36164#26009#21517#31216
      FieldName = 'doc_name'
      Size = 60
    end
    object DocDetailpages: TIntegerField
      DisplayLabel = #31687#24133#25110#39029#25968
      FieldName = 'pages'
    end
    object DocDetailoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object DocDetaild: TDataSource
    DataSet = DocDetail
    Left = 108
    Top = 411
  end
  object SuprDetail: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterInsert = SuprDetailAfterInsert
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM device.equipment_stwk_supr')
    Left = 80
    Top = 439
    object SuprDetailsysid: TStringField
      FieldName = 'sysid'
    end
    object SuprDetailstwk_id: TStringField
      FieldName = 'stwk_id'
    end
    object SuprDetailreg_no: TStringField
      DisplayLabel = #32452#32455#26426#26500#20195#30721
      FieldName = 'reg_no'
      Size = 12
    end
    object SuprDetailcom_name: TStringField
      DisplayLabel = #21333#20301#21517#31216
      FieldName = 'com_name'
      Size = 60
    end
    object SuprDetailitem_name: TStringField
      DisplayLabel = #30417#29702#25110#39564#25910#39033#30446
      FieldName = 'item_name'
      Size = 60
    end
    object SuprDetailoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object SuprDetaild: TDataSource
    DataSet = SuprDetail
    Left = 108
    Top = 439
  end
  object ConstDetail: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterInsert = ConstDetailAfterInsert
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM device.equipment_stwk_const')
    Left = 80
    Top = 467
    object ConstDetailsysid: TStringField
      FieldName = 'sysid'
    end
    object ConstDetailstwk_id: TStringField
      FieldName = 'stwk_id'
    end
    object ConstDetailreg_no: TStringField
      DisplayLabel = #32452#32455#26426#26500#20195#30721
      FieldName = 'reg_no'
      Size = 12
    end
    object ConstDetailcom_name: TStringField
      DisplayLabel = #20998#21253#21333#20301#21517#31216
      FieldName = 'com_name'
      Size = 60
    end
    object ConstDetailitem_name: TStringField
      DisplayLabel = #26045#24037#39033#30446
      FieldName = 'item_name'
      Size = 60
    end
    object ConstDetailoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object ConstDetaild: TDataSource
    DataSet = ConstDetail
    Left = 108
    Top = 467
  end
  object General: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    CursorType = ctStatic
    AfterInsert = GeneralAfterInsert
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM device.equipment_stwk_report')
    Left = 136
    Top = 411
    object Generalsysid: TStringField
      FieldName = 'sysid'
    end
    object Generalreport_no: TStringField
      DisplayLabel = #25253#21578#32534#21495
      FieldName = 'report_no'
    end
    object Generaldev_kind: TStringField
      FieldName = 'dev_kind'
      Size = 50
    end
    object Generalconst_kind: TStringField
      DisplayLabel = #26045#24037#31867#21035
      FieldName = 'const_kind'
      Size = 10
    end
    object Generalappraise_date: TStringField
      DisplayLabel = #21578#30693#26085#26399
      FieldName = 'appraise_date'
      Size = 10
    end
    object Generalproject_name: TStringField
      DisplayLabel = #24037#31243#21517#31216
      FieldName = 'project_name'
      Size = 60
    end
    object Generalproperty_com: TStringField
      DisplayLabel = #24314#35774#21333#20301#21517#31216
      FieldName = 'property_com'
      Size = 60
    end
    object Generalproperty_address: TStringField
      DisplayLabel = #24314#35774#21333#20301#22320#22336
      FieldName = 'property_address'
      Size = 100
    end
    object Generalproperty_manager: TStringField
      DisplayLabel = #24037#31243#36127#36131#20154
      FieldName = 'property_manager'
      Size = 30
    end
    object Generalmanager_tel: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'manager_tel'
      Size = 30
    end
    object Generalprj_design_com: TStringField
      DisplayLabel = #24037#31243#35774#35745#21333#20301
      FieldName = 'prj_design_com'
      Size = 60
    end
    object Generalcontract_no: TStringField
      DisplayLabel = #21512#21516#32534#21495
      FieldName = 'contract_no'
      Size = 30
    end
    object Generalcontract_date: TStringField
      DisplayLabel = #21512#21516#31614#35746#26085#26399
      FieldName = 'contract_date'
      Size = 10
    end
    object Generalbuild_project: TStringField
      DisplayLabel = #20027#35201#26045#24037#39033#30446
      FieldName = 'build_project'
      Size = 60
    end
    object Generaldev_num: TIntegerField
      DisplayLabel = #35774#22791#25968
      FieldName = 'dev_num'
    end
    object Generalstart_date: TStringField
      DisplayLabel = #24320#24037#26085#26399
      FieldName = 'start_date'
      Size = 10
    end
    object Generalend_date: TStringField
      DisplayLabel = #31459#24037#26085#26399
      FieldName = 'end_date'
      Size = 10
    end
    object Generalbuild_charge: TBCDField
      DisplayLabel = #22303#24314#39044#31639
      FieldName = 'build_charge'
      Precision = 18
      Size = 3
    end
    object Generaldev_charge: TBCDField
      DisplayLabel = #35774#22791#39044#31639
      FieldName = 'dev_charge'
      Precision = 18
      Size = 3
    end
    object Generalconst_com: TStringField
      DisplayLabel = #26045#24037#21333#20301
      FieldName = 'const_com'
      Size = 60
    end
    object Generalconst_address: TStringField
      DisplayLabel = #26045#24037#21333#20301#22320#22336
      FieldName = 'const_address'
      Size = 100
    end
    object Generalconst_reg_no: TStringField
      DisplayLabel = #32452#32455#26426#26500#20195#30721
      FieldName = 'const_reg_no'
      Size = 12
    end
    object Generalconst_deputy: TStringField
      DisplayLabel = #27861#23450#20195#34920#20154
      FieldName = 'const_deputy'
      Size = 30
    end
    object Generalconst_lics_no: TStringField
      DisplayLabel = #35768#21487#35777#32534#21495
      FieldName = 'const_lics_no'
      Size = 50
    end
    object Generalconst_lics_date: TStringField
      DisplayLabel = #35768#21487#35777#26377#25928#26399
      FieldName = 'const_lics_date'
      Size = 10
    end
    object Generalconst_group: TStringField
      DisplayLabel = #26045#24037#26426#26500#21517#31216
      FieldName = 'const_group'
      Size = 60
    end
    object Generalconst_group_address: TStringField
      DisplayLabel = #26045#24037#26426#26500#22320#22336
      FieldName = 'const_group_address'
      Size = 100
    end
    object Generalconst_group_tel: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'const_group_tel'
      Size = 30
    end
    object Generalconst_group_fax: TStringField
      DisplayLabel = #20256#30495
      FieldName = 'const_group_fax'
      Size = 30
    end
    object Generalconst_manager: TStringField
      DisplayLabel = #26045#24037#29616#22330#36127#36131#20154
      FieldName = 'const_manager'
      Size = 30
    end
    object Generalconst_manager_tel: TStringField
      DisplayLabel = #31227#21160#30005#35805
      FieldName = 'const_manager_tel'
      Size = 30
    end
    object Generalconst_instructor: TStringField
      DisplayLabel = #29616#22330#25216#26415#36127#36131#20154
      FieldName = 'const_instructor'
      Size = 30
    end
    object Generalconst_instructor_tel: TStringField
      DisplayLabel = #31227#21160#30005#35805
      FieldName = 'const_instructor_tel'
      Size = 30
    end
    object Generalidea_content: TStringField
      DisplayLabel = #24847#35265
      FieldName = 'idea_content'
      Size = 300
    end
    object Generalnotice_no: TStringField
      DisplayLabel = #24847#35265#36890#30693#20070#32534#21495
      FieldName = 'notice_no'
    end
    object Generalnotice_date: TStringField
      DisplayLabel = #21457#20986#24847#35265#20070#26085#26399
      FieldName = 'notice_date'
      Size = 10
    end
    object Generalremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 300
    end
    object Generaloutflag: TIntegerField
      FieldName = 'outflag'
    end
    object Generalstate: TIntegerField
      FieldName = 'state'
    end
  end
end
