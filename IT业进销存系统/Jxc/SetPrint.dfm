object frmSetPrint: TfrmSetPrint
  Left = 159
  Top = 101
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = #36164#26009#25171#21360
  ClientHeight = 355
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    329
    355)
  PixelsPerInch = 120
  TextHeight = 15
  object Notebook1: TNotebook
    Left = 6
    Top = 6
    Width = 317
    Height = 343
    Anchors = [akLeft, akTop, akRight]
    PageIndex = 1
    TabOrder = 1
    object TPage
      Left = 0
      Top = 0
      Caption = '1'
      DesignSize = (
        317
        343)
      object Label66: TLabel
        Left = 143
        Top = 37
        Width = 15
        Height = 15
        Caption = #21040
        Visible = False
      end
      object Label68: TLabel
        Left = 15
        Top = 27
        Width = 38
        Height = 15
        Caption = #33539#22260':'
        Visible = False
      end
      object btnPreview: TBitBtn
        Left = 1
        Top = 312
        Width = 90
        Height = 31
        Caption = #39044#35272'(&V)'
        TabOrder = 1
        OnClick = btnPreviewClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF00000000000000000000000000000000000000000000
          0000000000000000000000000000FF00FFFF00FF000000000000000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00
          FF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF0000000000000000000000007F7F7F000000000000FF00FF000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FBFBFBFBFBFBF7F7F7F0000
          007F7F7FFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F
          7F7FBFBFBFBFBFBFFFFF007F7F7F7F7F7F000000FF00FFFF00FF000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBF7F7F7FBFBF
          BF000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BF
          BFBFFFFF00BFBFBFBFBFBF7F7F7FBFBFBF000000FF00FFFF00FF000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FFFFF00FFFF00BFBFBF7F7F7F7F7F
          7F000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          00007F7F7FBFBFBFBFBFBF7F7F7F000000FF00FFFF00FFFF00FF000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FF00
          FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FF00
          FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000BFBFBF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF00000000000000000000000000000000000000000000
          0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object btnPrint: TBitBtn
        Left = 113
        Top = 312
        Width = 90
        Height = 31
        Caption = #25171#21360'(&P)'
        TabOrder = 2
        OnClick = btnPrintClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000000000000000
          0000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF000000
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBF
          BF000000FF00FFFF00FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000BFBFBF000000FF00FF000000BFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00FFFF00FFFF00FFFFBFBFBFBFBFBF0000
          00000000000000FF00FF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F
          7F7F7F7F7F7F7F7FBFBFBFBFBFBF000000BFBFBF000000FF00FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00BFBFBFBFBFBF000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBF000000BFBFBF000000BFBFBF000000FF00FF000000
          000000000000000000000000000000000000000000000000000000BFBFBF0000
          00BFBFBF000000000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000BFBFBF000000BFBFBF000000FF00FFFF00FF
          FF00FF000000FFFFFF000000000000000000000000000000FFFFFF0000000000
          00000000000000FF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF000000FFFFFF000000000000000000000000000000FFFFFF0000
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF0000000000000000000000000000000000000000000000
          00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object btnNew: TBitBtn
        Left = 227
        Top = 0
        Width = 90
        Height = 31
        Anchors = [akTop, akRight]
        Caption = #26032#22686'(&A)'
        TabOrder = 3
        OnClick = btnNewClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADAADADADADADADADADDA00000000000ADAAD0FFFFFFFFF0DADDA0FFFFFFFFF
          0ADAAD0FFFFFFFFF0DADDA0FFFFFFFFF0ADAAD0FFFFFFFFF0DADDA0FFFFFFFFF
          0ADAAD0FFFFFFFFF0DADDA0FFFFFFFFF0ADAAD0FFFFFF0000DADDA0FFFFFF0F0
          DADAAD0FFFFFF00DADADDA00000000DADADAADADADADADADADAD}
      end
      object btnSet: TBitBtn
        Left = 227
        Top = 42
        Width = 90
        Height = 31
        Anchors = [akTop, akRight]
        Caption = #35774#32622'(&S)'
        TabOrder = 4
        OnClick = btnSetClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADAD7
          47DAADADADADA7447770DADADAD7DA44770AADADA747A744770DDADA744774C4
          770A00000744C74C770D0FF8FF8C77C4770A0FF8FF8FC74C770D088888888CCC
          770A0FF8FF8FF8CC770D0FF8FF8FF8FC770A088888888888870D0FF8FF8FF8FF
          0ADA0FF8FF8FF8FF0DAD4444444444444ADA4444444444444DAD}
      end
      object btnSaveAs: TBitBtn
        Left = 227
        Top = 84
        Width = 90
        Height = 31
        Anchors = [akTop, akRight]
        Caption = #21478#23384#20026' '
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
        OnClick = btnSaveAsClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADAADADADADADADADAD0000000000DADADA0FFFFFFFF0ADADAD0FFFFFFFF0D4
          DADA0F777777F04444AD0F7FFFF7F0D4DA4A0F7FFFF7F0ADAD4D0F777777F0DA
          DA4A0FFFFFFFF0ADADAD0FFFFF0000D000000FFFFF0F0DA0FFF00FFFFF00DAD0
          FFF00000000DADA0F000DADADADADAD0F00AADADADADADA000AD}
      end
      object btnDel: TBitBtn
        Left = 227
        Top = 126
        Width = 90
        Height = 31
        Anchors = [akTop, akRight]
        Caption = #21024#38500'(&D)'
        TabOrder = 6
        OnClick = btnDelClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADAADADADADADADADADDAD0000000000ADAADA0FFFFFFFF0DADDAD0FFFFFFFF
          0ADAA1F0F777777F0DAD11F0F75BFB7F0ADAA11F11BFBF7F0DADDA151877777F
          0ADAAD511FFFFFFF0DAD5111F1FFF0000ADA15A0FF1FF0F0ADADDAD0FFFFF00A
          DADAADA0000000ADADADDADADADADADADADAADADADADADADADAD}
      end
      object btnClose: TBitBtn
        Left = 227
        Top = 312
        Width = 90
        Height = 31
        Anchors = [akTop, akRight]
        Caption = #20851#38381'(&C)'
        TabOrder = 7
        Kind = bkCancel
      end
      object GroupBox12: TGroupBox
        Left = 0
        Top = 228
        Width = 317
        Height = 77
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
        object Label1: TLabel
          Left = 111
          Top = 19
          Width = 53
          Height = 15
          Caption = #25171#21360#26426':'
          FocusControl = cbDyj
        end
        object Label32: TLabel
          Left = 9
          Top = 50
          Width = 68
          Height = 15
          Caption = #40664#35748#25253#34920':'
          FocusControl = cbDyj
        end
        object Label35: TLabel
          Left = 9
          Top = 19
          Width = 38
          Height = 15
          Caption = #20221#25968':'
        end
        object cbDyj: TComboBox
          Tag = 1
          Left = 168
          Top = 15
          Width = 139
          Height = 23
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 0
          OnChange = cbDyjChange
        end
        object cbRpt: TComboBox
          Tag = 1
          Left = 78
          Top = 46
          Width = 229
          Height = 23
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 1
          OnChange = cbDyjChange
        end
        object edtCopies: TSpinEdit
          Tag = 1
          Left = 54
          Top = 14
          Width = 43
          Height = 24
          MaxValue = 100
          MinValue = 1
          TabOrder = 2
          Value = 1
          OnChange = SetPreviewPnl
        end
      end
      object rbPrintAll: TRadioButton
        Tag = 1
        Left = 54
        Top = 14
        Width = 55
        Height = 17
        Caption = #20840#37096
        Checked = True
        TabOrder = 9
        TabStop = True
        Visible = False
        OnClick = rbPrintAllClick
      end
      object rbPrintSelect: TRadioButton
        Tag = 1
        Left = 54
        Top = 36
        Width = 55
        Height = 17
        Caption = #39029#25968
        TabOrder = 10
        Visible = False
        OnClick = rbPrintAllClick
      end
      object edtFirstPage: TMaskEdit
        Tag = 1
        Left = 108
        Top = 33
        Width = 31
        Height = 23
        Enabled = False
        EditMask = '999;1; '
        MaxLength = 3
        TabOrder = 11
        Text = '1  '
        Visible = False
      end
      object edtLastPage: TMaskEdit
        Tag = 1
        Left = 162
        Top = 33
        Width = 31
        Height = 23
        Enabled = False
        EditMask = '999;1; '
        MaxLength = 3
        TabOrder = 12
        Text = '1  '
        Visible = False
      end
      object RptList: TListBox
        Tag = 1
        Left = 0
        Top = 0
        Width = 217
        Height = 229
        Style = lbOwnerDrawVariable
        ItemHeight = 22
        TabOrder = 0
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = '2'
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 660
        Height = 301
        ActivePage = TabSheet1
        TabOrder = 0
        OnChange = SetImageTop
        object TabSheet1: TTabSheet
          Caption = #34920#26684
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 652
            Height = 271
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel1'
            TabOrder = 0
            object PageControl2: TPageControl
              Left = 6
              Top = 6
              Width = 427
              Height = 259
              ActivePage = TabSheet7
              MultiLine = True
              PopupMenu = pmnXm
              TabOrder = 0
              OnChange = SetImageTop
              object TabSheet5: TTabSheet
                Caption = #39029#30473
                object Bevel2: TBevel
                  Left = 2
                  Top = 180
                  Width = 416
                  Height = 13
                  Shape = bsTopLine
                end
                object Label4: TLabel
                  Left = 6
                  Top = 186
                  Width = 301
                  Height = 15
                  Caption = #25552#31034': '#27492#21306#22495#21482#20250#22312#31532#19968#39029#30340#39029#22836#36827#34892#25171#21360#12290
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clNavy
                  Font.Height = -15
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object Label5: TLabel
                  Left = 52
                  Top = 210
                  Width = 180
                  Height = 15
                  Caption = #20363#22914#25171#21360#20844#21496#21517#31216#31561#36164#26009#12290
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clNavy
                  Font.Height = -15
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object Panel4: TPanel
                  Left = -4
                  Top = 115
                  Width = 423
                  Height = 63
                  BevelOuter = bvNone
                  TabOrder = 0
                  object ToolBar1: TToolBar
                    Left = 0
                    Top = 0
                    Width = 423
                    Height = 4
                    AutoSize = True
                    BorderWidth = 1
                    ButtonHeight = 23
                    EdgeInner = esNone
                    EdgeOuter = esNone
                    Flat = True
                    Images = ToolbarImages
                    Indent = 4
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    Wrapable = False
                    object ToolButton1: TToolButton
                      Left = 4
                      Top = 0
                      Width = 8
                      ImageIndex = 8
                      Style = tbsSeparator
                    end
                    object ToolButton4: TToolButton
                      Left = 12
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton2'
                      ImageIndex = 15
                      Style = tbsSeparator
                    end
                    object ToolButton8: TToolButton
                      Left = 20
                      Top = 0
                      Width = 8
                      ImageIndex = 12
                      Style = tbsDivider
                    end
                    object ToolButton9: TToolButton
                      Left = 28
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton3'
                      ImageIndex = 15
                      Style = tbsSeparator
                    end
                  end
                end
                object Panel6: TPanel
                  Left = 0
                  Top = 0
                  Width = 419
                  Height = 179
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Bevel20: TBevel
                    Left = 2
                    Top = 150
                    Width = 415
                    Height = 13
                    Shape = bsTopLine
                  end
                  object YmRich: TRichEdit
                    Left = 0
                    Top = 0
                    Width = 419
                    Height = 123
                    Align = alTop
                    Font.Charset = GB2312_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -24
                    Font.Name = #23435#20307
                    Font.Style = [fsBold]
                    ParentFont = False
                    ScrollBars = ssHorizontal
                    TabOrder = 0
                    WordWrap = False
                    OnSelectionChange = RichSelectionChange
                  end
                  object ToolBar2: TToolBar
                    Left = 0
                    Top = 123
                    Width = 419
                    Height = 26
                    AutoSize = True
                    BorderWidth = 1
                    EdgeInner = esNone
                    EdgeOuter = esNone
                    Flat = True
                    Images = ToolbarImages
                    Indent = 4
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 1
                    Wrapable = False
                    object YmDy: TCheckBox
                      Left = 4
                      Top = 0
                      Width = 81
                      Height = 22
                      Caption = #26159#21542#25171#21360
                      Checked = True
                      State = cbChecked
                      TabOrder = 0
                    end
                    object ToolButton5: TToolButton
                      Left = 85
                      Top = 0
                      Width = 8
                      ImageIndex = 8
                      Style = tbsSeparator
                    end
                    object Label30: TLabel
                      Left = 93
                      Top = 0
                      Width = 38
                      Height = 15
                      Caption = #24213#33394':'
                      Layout = tlCenter
                    end
                    object YmColor: TPanel
                      Left = 131
                      Top = 0
                      Width = 23
                      Height = 22
                      Cursor = crHandPoint
                      BevelInner = bvRaised
                      BevelOuter = bvLowered
                      Color = clWhite
                      TabOrder = 1
                      OnClick = ColorClick
                    end
                    object ToolButton6: TToolButton
                      Left = 154
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton2'
                      ImageIndex = 15
                      Style = tbsSeparator
                    end
                    object YmLeftAlign: TToolButton
                      Left = 162
                      Top = 0
                      Hint = #24038#23545#40784
                      Grouped = True
                      ImageIndex = 11
                      Style = tbsCheck
                      OnClick = SetPreviewPnl
                    end
                    object YmCenterAlign: TToolButton
                      Tag = 2
                      Left = 185
                      Top = 0
                      Hint = #20013#38388#23545#40784
                      Down = True
                      Grouped = True
                      ImageIndex = 12
                      Style = tbsCheck
                      OnClick = SetPreviewPnl
                    end
                    object YmRightAlign: TToolButton
                      Tag = 1
                      Left = 208
                      Top = 0
                      Hint = #21491#23545#40784
                      Grouped = True
                      ImageIndex = 13
                      Style = tbsCheck
                      OnClick = SetPreviewPnl
                    end
                    object ToolButton3: TToolButton
                      Left = 231
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton3'
                      ImageIndex = 14
                      Style = tbsSeparator
                    end
                    object Label31: TLabel
                      Left = 239
                      Top = 0
                      Width = 38
                      Height = 15
                      Caption = #36793#26694':'
                      Layout = tlCenter
                    end
                    object YmHx: TComboBox
                      Left = 277
                      Top = 0
                      Width = 96
                      Height = 23
                      Style = csDropDownList
                      ItemHeight = 0
                      TabOrder = 2
                      Items.Strings = (
                        #22235#21608#30011#32447
                        #19978#19979#30011#32447
                        #24038#21491#30011#32447
                        #19981#30011#32447)
                    end
                    object ToolButton14: TToolButton
                      Left = 373
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton14'
                      ImageIndex = 15
                      Style = tbsSeparator
                    end
                    object ToolButton19: TToolButton
                      Left = 381
                      Top = 0
                      Hint = #22686#21152#31995#32479#36164#26009
                      Caption = 'ToolButton19'
                      ImageIndex = 15
                      OnClick = AddSysItemClick
                    end
                  end
                  object StandardToolBar: TToolBar
                    Left = 0
                    Top = 153
                    Width = 419
                    Height = 26
                    Align = alBottom
                    AutoSize = True
                    BorderWidth = 1
                    EdgeInner = esNone
                    EdgeOuter = esNone
                    Flat = True
                    Images = ToolbarImages
                    Indent = 4
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 2
                    Wrapable = False
                    object Label2: TLabel
                      Left = 4
                      Top = 0
                      Width = 38
                      Height = 15
                      Caption = #23383#20307':'
                      Layout = tlCenter
                    end
                    object YmFontName: TComboBox
                      Tag = 1
                      Left = 42
                      Top = 0
                      Width = 199
                      Height = 23
                      Ctl3D = False
                      DropDownCount = 10
                      ItemHeight = 0
                      ParentCtl3D = False
                      TabOrder = 0
                      OnChange = FontNameChange
                    end
                    object ToolButton11: TToolButton
                      Left = 241
                      Top = 0
                      Width = 8
                      ImageIndex = 8
                      Style = tbsSeparator
                    end
                    object YmFontSize: TEdit
                      Tag = 1
                      Left = 249
                      Top = 0
                      Width = 26
                      Height = 22
                      Hint = #23383#20307#22823#23567
                      TabOrder = 1
                      Text = '0'
                      OnChange = FontSizeChange
                    end
                    object UpDown1: TUpDown
                      Left = 275
                      Top = 0
                      Width = 21
                      Height = 22
                      Associate = YmFontSize
                      TabOrder = 2
                    end
                    object ToolButton2: TToolButton
                      Left = 296
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton2'
                      ImageIndex = 15
                      Style = tbsSeparator
                    end
                    object YmBoldButton: TToolButton
                      Tag = 1
                      Left = 304
                      Top = 0
                      Hint = #31895#20307
                      ImageIndex = 8
                      Style = tbsCheck
                      OnClick = BoldButtonClick
                    end
                    object YmItalicButton: TToolButton
                      Tag = 1
                      Left = 327
                      Top = 0
                      Hint = #26012#20307
                      ImageIndex = 9
                      Style = tbsCheck
                      OnClick = ItalicButtonClick
                    end
                    object YmUnderlineButton: TToolButton
                      Tag = 1
                      Left = 350
                      Top = 0
                      Hint = #19979#21010#32447
                      ImageIndex = 10
                      Style = tbsCheck
                      OnClick = UnderlineButtonClick
                    end
                    object ToolButton16: TToolButton
                      Left = 373
                      Top = 0
                      Width = 8
                      ImageIndex = 12
                      Style = tbsDivider
                    end
                    object YmFontColor: TPanel
                      Tag = 1
                      Left = 381
                      Top = 0
                      Width = 23
                      Height = 22
                      Cursor = crHandPoint
                      Hint = #39068#33394
                      BevelInner = bvRaised
                      BevelOuter = bvLowered
                      Color = clWhite
                      TabOrder = 3
                      OnClick = FontColorClick
                    end
                  end
                end
              end
              object TabSheet6: TTabSheet
                Caption = #26631#39064
                ImageIndex = 1
                object Bevel4: TBevel
                  Left = 2
                  Top = 180
                  Width = 416
                  Height = 13
                  Shape = bsTopLine
                end
                object Label6: TLabel
                  Left = 6
                  Top = 186
                  Width = 286
                  Height = 15
                  Caption = #25552#31034': '#27492#21306#22495#20250#22312#27599#19968#39029#30340#39029#22836#36827#34892#25171#21360#12290
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clNavy
                  Font.Height = -15
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object Label7: TLabel
                  Left = 52
                  Top = 210
                  Width = 180
                  Height = 15
                  Caption = #20363#22914#25171#21360#34920#26684#21517#31216#31561#36164#26009#12290
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clNavy
                  Font.Height = -15
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object Panel5: TPanel
                  Left = 0
                  Top = 0
                  Width = 419
                  Height = 179
                  Align = alTop
                  BevelOuter = bvNone
                  Caption = #23601#32490
                  TabOrder = 0
                  object Bevel21: TBevel
                    Left = 2
                    Top = 150
                    Width = 415
                    Height = 13
                    Shape = bsTopLine
                  end
                  object BtRich: TRichEdit
                    Left = 0
                    Top = 0
                    Width = 419
                    Height = 123
                    Align = alTop
                    Font.Charset = GB2312_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -21
                    Font.Name = #23435#20307
                    Font.Style = [fsBold]
                    ParentFont = False
                    PopupMenu = pmnXm
                    TabOrder = 0
                    WordWrap = False
                    OnSelectionChange = RichSelectionChange
                  end
                  object ToolBar3: TToolBar
                    Left = 0
                    Top = 123
                    Width = 419
                    Height = 27
                    AutoSize = True
                    BorderWidth = 1
                    ButtonHeight = 23
                    EdgeInner = esNone
                    EdgeOuter = esNone
                    Flat = True
                    Images = ToolbarImages
                    Indent = 4
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 1
                    Wrapable = False
                    object BtDy: TCheckBox
                      Left = 4
                      Top = 0
                      Width = 81
                      Height = 23
                      Caption = #26159#21542#25171#21360
                      Checked = True
                      State = cbChecked
                      TabOrder = 0
                    end
                    object ToolButton7: TToolButton
                      Left = 85
                      Top = 0
                      Width = 8
                      ImageIndex = 8
                      Style = tbsSeparator
                    end
                    object Label36: TLabel
                      Left = 93
                      Top = 0
                      Width = 38
                      Height = 15
                      Caption = #24213#33394':'
                      Layout = tlCenter
                    end
                    object BtColor: TPanel
                      Left = 131
                      Top = 0
                      Width = 23
                      Height = 23
                      Cursor = crHandPoint
                      BevelInner = bvRaised
                      BevelOuter = bvLowered
                      Color = clWhite
                      TabOrder = 1
                      OnClick = ColorClick
                    end
                    object ToolButton10: TToolButton
                      Left = 154
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton2'
                      ImageIndex = 15
                      Style = tbsSeparator
                    end
                    object BtLeftAlign: TToolButton
                      Left = 162
                      Top = 0
                      Hint = #24038#23545#40784
                      Grouped = True
                      ImageIndex = 11
                      Style = tbsCheck
                      OnClick = SetPreviewPnl
                    end
                    object BtCenterAlign: TToolButton
                      Tag = 2
                      Left = 185
                      Top = 0
                      Hint = #20013#38388#23545#40784
                      Down = True
                      Grouped = True
                      ImageIndex = 12
                      Style = tbsCheck
                      OnClick = SetPreviewPnl
                    end
                    object BtRightAlign: TToolButton
                      Tag = 1
                      Left = 208
                      Top = 0
                      Hint = #21491#23545#40784
                      Grouped = True
                      ImageIndex = 13
                      Style = tbsCheck
                      OnClick = SetPreviewPnl
                    end
                    object ToolButton20: TToolButton
                      Left = 231
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton20'
                      ImageIndex = 15
                      Style = tbsSeparator
                    end
                    object Label37: TLabel
                      Left = 239
                      Top = 0
                      Width = 38
                      Height = 15
                      Caption = #36793#26694':'
                      Layout = tlCenter
                    end
                    object BtHx: TComboBox
                      Left = 277
                      Top = 0
                      Width = 96
                      Height = 23
                      Style = csDropDownList
                      ItemHeight = 0
                      TabOrder = 2
                      Items.Strings = (
                        #22235#21608#30011#32447
                        #19978#19979#30011#32447
                        #24038#21491#30011#32447
                        #19981#30011#32447)
                    end
                    object ToolButton15: TToolButton
                      Left = 373
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton3'
                      ImageIndex = 14
                      Style = tbsSeparator
                    end
                    object ToolButton25: TToolButton
                      Left = 381
                      Top = 0
                      Hint = #22686#21152#31995#32479#36164#26009
                      Caption = 'ToolButton25'
                      ImageIndex = 15
                      OnClick = AddSysItemClick
                    end
                  end
                  object ToolBar4: TToolBar
                    Left = 0
                    Top = 152
                    Width = 419
                    Height = 27
                    Align = alBottom
                    AutoSize = True
                    BorderWidth = 1
                    ButtonHeight = 23
                    EdgeInner = esNone
                    EdgeOuter = esNone
                    Flat = True
                    Images = ToolbarImages
                    Indent = 4
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 2
                    Wrapable = False
                    object Label38: TLabel
                      Left = 4
                      Top = 0
                      Width = 38
                      Height = 15
                      Caption = #23383#20307':'
                      Layout = tlCenter
                    end
                    object BtFontName: TComboBox
                      Tag = 1
                      Left = 42
                      Top = 0
                      Width = 199
                      Height = 23
                      Ctl3D = False
                      DropDownCount = 10
                      ItemHeight = 0
                      ParentCtl3D = False
                      TabOrder = 0
                      OnChange = FontNameChange
                    end
                    object ToolButton17: TToolButton
                      Left = 241
                      Top = 0
                      Width = 8
                      ImageIndex = 8
                      Style = tbsSeparator
                    end
                    object BtFontSize: TEdit
                      Tag = 1
                      Left = 249
                      Top = 0
                      Width = 26
                      Height = 23
                      Hint = #23383#20307#22823#23567
                      TabOrder = 1
                      Text = '0'
                      OnChange = FontSizeChange
                    end
                    object UpDown2: TUpDown
                      Left = 275
                      Top = 0
                      Width = 21
                      Height = 23
                      Associate = BtFontSize
                      TabOrder = 2
                    end
                    object ToolButton18: TToolButton
                      Left = 296
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton2'
                      ImageIndex = 15
                      Style = tbsSeparator
                    end
                    object BtBoldButton: TToolButton
                      Tag = 1
                      Left = 304
                      Top = 0
                      Hint = #31895#20307
                      ImageIndex = 8
                      Style = tbsCheck
                      OnClick = BoldButtonClick
                    end
                    object BtItalicButton: TToolButton
                      Tag = 1
                      Left = 327
                      Top = 0
                      Hint = #26012#20307
                      ImageIndex = 9
                      Style = tbsCheck
                      OnClick = ItalicButtonClick
                    end
                    object BtUnderlineButton: TToolButton
                      Tag = 1
                      Left = 350
                      Top = 0
                      Hint = #19979#21010#32447
                      ImageIndex = 10
                      Style = tbsCheck
                      OnClick = UnderlineButtonClick
                    end
                    object ToolButton22: TToolButton
                      Left = 373
                      Top = 0
                      Width = 8
                      ImageIndex = 12
                      Style = tbsDivider
                    end
                    object BtFontColor: TPanel
                      Tag = 1
                      Left = 381
                      Top = 0
                      Width = 23
                      Height = 23
                      Cursor = crHandPoint
                      Hint = #39068#33394
                      BevelInner = bvRaised
                      BevelOuter = bvLowered
                      Color = clWhite
                      TabOrder = 3
                      OnClick = FontColorClick
                    end
                  end
                end
              end
              object TabSheet7: TTabSheet
                Caption = #34920#22836
                ImageIndex = 2
                object Bevel5: TBevel
                  Left = 2
                  Top = 180
                  Width = 416
                  Height = 13
                  Shape = bsTopLine
                end
                object Label8: TLabel
                  Left = 6
                  Top = 186
                  Width = 316
                  Height = 15
                  Caption = #25552#31034': '#27492#21306#22495#20250#22312#27599#19968#39029#30340#26631#39064#19979#38754#36827#34892#25171#21360#12290
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clNavy
                  Font.Height = -15
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object Label9: TLabel
                  Left = 52
                  Top = 210
                  Width = 165
                  Height = 15
                  Caption = #20363#22914#25171#21360#26085#26399#12289#26102#38388#31561#12290
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clNavy
                  Font.Height = -15
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object Panel11: TPanel
                  Left = 0
                  Top = 0
                  Width = 419
                  Height = 179
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Bevel22: TBevel
                    Left = 2
                    Top = 150
                    Width = 415
                    Height = 13
                    Shape = bsTopLine
                  end
                  object BgbtRich: TRichEdit
                    Left = 0
                    Top = 0
                    Width = 419
                    Height = 123
                    Align = alTop
                    Font.Charset = GB2312_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = #23435#20307
                    Font.Style = []
                    ParentFont = False
                    PopupMenu = pmnXm
                    TabOrder = 0
                    WordWrap = False
                    OnSelectionChange = RichSelectionChange
                  end
                  object ToolBar5: TToolBar
                    Left = 0
                    Top = 123
                    Width = 419
                    Height = 26
                    AutoSize = True
                    BorderWidth = 1
                    EdgeInner = esNone
                    EdgeOuter = esNone
                    Flat = True
                    Images = ToolbarImages
                    Indent = 4
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 1
                    Wrapable = False
                    object BgbtDy: TCheckBox
                      Left = 4
                      Top = 0
                      Width = 81
                      Height = 22
                      Caption = #26159#21542#25171#21360
                      Checked = True
                      State = cbChecked
                      TabOrder = 0
                    end
                    object ToolButton23: TToolButton
                      Left = 85
                      Top = 0
                      Width = 8
                      ImageIndex = 8
                      Style = tbsSeparator
                    end
                    object Label40: TLabel
                      Left = 93
                      Top = 0
                      Width = 38
                      Height = 22
                      Caption = #24213#33394':'
                      Layout = tlCenter
                    end
                    object BgbtColor: TPanel
                      Left = 131
                      Top = 0
                      Width = 23
                      Height = 22
                      Cursor = crHandPoint
                      BevelInner = bvRaised
                      BevelOuter = bvLowered
                      Color = clWhite
                      TabOrder = 1
                      OnClick = ColorClick
                    end
                    object ToolButton24: TToolButton
                      Left = 154
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton2'
                      ImageIndex = 15
                      Style = tbsSeparator
                    end
                    object BgbtLeftAlign: TToolButton
                      Left = 162
                      Top = 0
                      Hint = #24038#23545#40784
                      Down = True
                      Grouped = True
                      ImageIndex = 11
                      Style = tbsCheck
                      OnClick = SetPreviewPnl
                    end
                    object BgbtCenterAlign: TToolButton
                      Tag = 2
                      Left = 185
                      Top = 0
                      Hint = #20013#38388#23545#40784
                      Grouped = True
                      ImageIndex = 12
                      Style = tbsCheck
                      OnClick = SetPreviewPnl
                    end
                    object BgbtRightAlign: TToolButton
                      Tag = 1
                      Left = 208
                      Top = 0
                      Hint = #21491#23545#40784
                      Grouped = True
                      ImageIndex = 13
                      Style = tbsCheck
                      OnClick = SetPreviewPnl
                    end
                    object ToolButton28: TToolButton
                      Left = 231
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton3'
                      ImageIndex = 14
                      Style = tbsSeparator
                    end
                    object Label41: TLabel
                      Left = 239
                      Top = 0
                      Width = 38
                      Height = 22
                      Caption = #36793#26694':'
                      Layout = tlCenter
                    end
                    object BgbtHx: TComboBox
                      Left = 277
                      Top = 0
                      Width = 96
                      Height = 23
                      Style = csDropDownList
                      ItemHeight = 15
                      TabOrder = 2
                      Items.Strings = (
                        #22235#21608#30011#32447
                        #19978#19979#30011#32447
                        #24038#21491#30011#32447
                        #19981#30011#32447)
                    end
                    object ToolButton26: TToolButton
                      Left = 373
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton26'
                      ImageIndex = 16
                      Style = tbsSeparator
                    end
                    object ToolButton13: TToolButton
                      Left = 381
                      Top = 0
                      Hint = #22686#21152#31995#32479#36164#26009
                      Caption = 'ToolButton13'
                      ImageIndex = 15
                      OnClick = AddSysItemClick
                    end
                  end
                  object ToolBar6: TToolBar
                    Left = 0
                    Top = 153
                    Width = 419
                    Height = 26
                    Align = alBottom
                    AutoSize = True
                    BorderWidth = 1
                    EdgeInner = esNone
                    EdgeOuter = esNone
                    Flat = True
                    Images = ToolbarImages
                    Indent = 4
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 2
                    Wrapable = False
                    object Label42: TLabel
                      Left = 4
                      Top = 0
                      Width = 38
                      Height = 22
                      Caption = #23383#20307':'
                      Layout = tlCenter
                    end
                    object BgbtFontName: TComboBox
                      Tag = 1
                      Left = 42
                      Top = 0
                      Width = 199
                      Height = 23
                      Ctl3D = False
                      DropDownCount = 10
                      ItemHeight = 15
                      ParentCtl3D = False
                      TabOrder = 0
                      OnChange = FontNameChange
                    end
                    object ToolButton29: TToolButton
                      Left = 241
                      Top = 0
                      Width = 8
                      ImageIndex = 8
                      Style = tbsSeparator
                    end
                    object BgbtFontSize: TEdit
                      Tag = 1
                      Left = 249
                      Top = 0
                      Width = 26
                      Height = 22
                      Hint = #23383#20307#22823#23567
                      TabOrder = 1
                      Text = '0'
                      OnChange = FontSizeChange
                    end
                    object UpDown3: TUpDown
                      Left = 275
                      Top = 0
                      Width = 21
                      Height = 22
                      Associate = BgbtFontSize
                      TabOrder = 2
                    end
                    object ToolButton30: TToolButton
                      Left = 296
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton2'
                      ImageIndex = 15
                      Style = tbsSeparator
                    end
                    object BgbtBoldButton: TToolButton
                      Tag = 1
                      Left = 304
                      Top = 0
                      Hint = #31895#20307
                      ImageIndex = 8
                      Style = tbsCheck
                      OnClick = BoldButtonClick
                    end
                    object BgbtItalicButton: TToolButton
                      Tag = 1
                      Left = 327
                      Top = 0
                      Hint = #26012#20307
                      ImageIndex = 9
                      Style = tbsCheck
                      OnClick = ItalicButtonClick
                    end
                    object BgbtUnderlineButton: TToolButton
                      Tag = 1
                      Left = 350
                      Top = 0
                      Hint = #19979#21010#32447
                      ImageIndex = 10
                      Style = tbsCheck
                      OnClick = UnderlineButtonClick
                    end
                    object ToolButton34: TToolButton
                      Left = 373
                      Top = 0
                      Width = 8
                      ImageIndex = 12
                      Style = tbsDivider
                    end
                    object BgbtFontColor: TPanel
                      Tag = 1
                      Left = 381
                      Top = 0
                      Width = 23
                      Height = 22
                      Cursor = crHandPoint
                      Hint = #39068#33394
                      BevelInner = bvRaised
                      BevelOuter = bvLowered
                      Color = clWhite
                      TabOrder = 3
                      OnClick = FontColorClick
                    end
                  end
                end
              end
              object TabSheet9: TTabSheet
                Caption = #20869#23481
                ImageIndex = 4
                object Memo1: TMemo
                  Left = 63
                  Top = 43
                  Width = 31
                  Height = 36
                  BorderStyle = bsNone
                  Lines.Strings = (
                    #21306#22495
                    #32534
                    #21495)
                  TabOrder = 2
                  Visible = False
                end
                object GroupBox4: TGroupBox
                  Left = 6
                  Top = 6
                  Width = 139
                  Height = 217
                  Caption = #26639#30446#26631#39064
                  TabOrder = 0
                  object btnLmFont: TSpeedButton
                    Left = 10
                    Top = 69
                    Width = 55
                    Height = 25
                    Hint = 'Lm'
                    Caption = #23383#20307
                    OnClick = btnBgBtFontClick
                  end
                  object btnLmColor: TSpeedButton
                    Left = 72
                    Top = 69
                    Width = 55
                    Height = 25
                    Hint = 'Lm'
                    Caption = #24213#33394
                    OnClick = btnBgBtColorClick
                  end
                  object Label19: TLabel
                    Left = 12
                    Top = 112
                    Width = 38
                    Height = 15
                    Caption = #34892#36317':'
                  end
                  object Label20: TLabel
                    Left = 96
                    Top = 112
                    Width = 15
                    Height = 15
                    Caption = #20493
                  end
                  object Bevel9: TBevel
                    Left = 12
                    Top = 99
                    Width = 115
                    Height = 13
                    Shape = bsTopLine
                  end
                  object Bevel8: TBevel
                    Left = 12
                    Top = 135
                    Width = 115
                    Height = 13
                    Shape = bsTopLine
                  end
                  object Label28: TLabel
                    Left = 12
                    Top = 142
                    Width = 53
                    Height = 15
                    Caption = #32593#26684#32447':'
                  end
                  object edtLmXj: TMaskEdit
                    Left = 54
                    Top = 108
                    Width = 37
                    Height = 23
                    EditMask = '9.9;1; '
                    MaxLength = 3
                    TabOrder = 0
                    Text = '1.5'
                  end
                  object cbLmHx: TComboBox
                    Left = 12
                    Top = 162
                    Width = 115
                    Height = 23
                    Style = csDropDownList
                    ItemHeight = 15
                    TabOrder = 1
                    Items.Strings = (
                      #22235#21608#30011#32447
                      #19978#19979#30011#32447
                      #24038#21491#30011#32447
                      #19981#30011#32447)
                  end
                  object rbLmSx: TRadioButton
                    Left = 12
                    Top = 192
                    Width = 55
                    Height = 17
                    Caption = #23454#32447
                    Checked = True
                    TabOrder = 2
                    TabStop = True
                  end
                  object RadioButton2: TRadioButton
                    Left = 78
                    Top = 192
                    Width = 55
                    Height = 17
                    Caption = #34394#32447
                    TabOrder = 3
                  end
                  object mmoLm: TPanel
                    Left = 12
                    Top = 24
                    Width = 115
                    Height = 37
                    Hint = 'Lm'
                    BevelInner = bvRaised
                    BevelOuter = bvLowered
                    Caption = #23383#20307#39044#35272
                    Color = clWhite
                    TabOrder = 4
                  end
                end
                object GroupBox5: TGroupBox
                  Left = 158
                  Top = 6
                  Width = 257
                  Height = 217
                  Caption = #27491#25991
                  TabOrder = 1
                  object btnNyFont: TSpeedButton
                    Left = 12
                    Top = 69
                    Width = 55
                    Height = 25
                    Hint = 'Ny'
                    Caption = #23383#20307
                    OnClick = btnBgBtFontClick
                  end
                  object btnNyColor: TSpeedButton
                    Left = 72
                    Top = 69
                    Width = 55
                    Height = 25
                    Hint = 'Ny'
                    Caption = #24213#33394
                    OnClick = btnBgBtColorClick
                  end
                  object Label21: TLabel
                    Left = 12
                    Top = 112
                    Width = 38
                    Height = 15
                    Caption = #34892#36317':'
                  end
                  object Label22: TLabel
                    Left = 96
                    Top = 112
                    Width = 15
                    Height = 15
                    Caption = #20493
                  end
                  object Bevel10: TBevel
                    Left = 12
                    Top = 99
                    Width = 235
                    Height = 13
                    Shape = bsTopLine
                  end
                  object Bevel11: TBevel
                    Left = 12
                    Top = 135
                    Width = 115
                    Height = 7
                    Shape = bsTopLine
                  end
                  object Label33: TLabel
                    Left = 12
                    Top = 142
                    Width = 53
                    Height = 15
                    Caption = #32593#26684#32447':'
                  end
                  object Bevel14: TBevel
                    Left = 138
                    Top = 105
                    Width = 13
                    Height = 106
                    Shape = bsLeftLine
                  end
                  object Label52: TLabel
                    Left = 150
                    Top = 56
                    Width = 68
                    Height = 15
                    Caption = #21452#34892#39068#33394':'
                  end
                  object Label53: TLabel
                    Left = 150
                    Top = 13
                    Width = 68
                    Height = 15
                    Caption = #21333#34892#39068#33394':'
                  end
                  object btnOdd: TSpeedButton
                    Left = 225
                    Top = 31
                    Width = 22
                    Height = 19
                    Hint = 'Ny'
                    Caption = #8230
                    OnClick = btnOddClick
                  end
                  object btnEven: TSpeedButton
                    Left = 225
                    Top = 75
                    Width = 22
                    Height = 19
                    Hint = 'Ny'
                    Caption = #8230
                    OnClick = btnEvenClick
                  end
                  object Bevel15: TBevel
                    Left = 138
                    Top = 15
                    Width = 13
                    Height = 79
                    Shape = bsLeftLine
                  end
                  object Bevel16: TBevel
                    Left = 150
                    Top = 184
                    Width = 97
                    Height = 7
                    Shape = bsTopLine
                  end
                  object Label55: TLabel
                    Left = 150
                    Top = 135
                    Width = 38
                    Height = 15
                    Caption = #26639#23485':'
                    FocusControl = edtLmsl
                  end
                  object Label54: TLabel
                    Left = 150
                    Top = 111
                    Width = 38
                    Height = 15
                    Caption = #20998#26639':'
                    FocusControl = edtLmsl
                  end
                  object Bevel19: TBevel
                    Left = 150
                    Top = 158
                    Width = 97
                    Height = 7
                    Shape = bsTopLine
                  end
                  object edtNyXj: TMaskEdit
                    Left = 54
                    Top = 108
                    Width = 37
                    Height = 23
                    EditMask = '9.9;1; '
                    MaxLength = 3
                    TabOrder = 0
                    Text = '0.8'
                  end
                  object cbNyHx: TComboBox
                    Left = 12
                    Top = 162
                    Width = 115
                    Height = 23
                    Style = csDropDownList
                    ItemHeight = 15
                    TabOrder = 1
                    Items.Strings = (
                      #22235#21608#30011#32447
                      #19978#19979#30011#32447
                      #24038#21491#30011#32447
                      #19981#30011#32447)
                  end
                  object rbNySx: TRadioButton
                    Left = 12
                    Top = 192
                    Width = 55
                    Height = 17
                    Caption = #23454#32447
                    Checked = True
                    TabOrder = 2
                    TabStop = True
                  end
                  object RadioButton3: TRadioButton
                    Left = 78
                    Top = 192
                    Width = 55
                    Height = 17
                    Caption = #34394#32447
                    TabOrder = 3
                  end
                  object mmoNy: TPanel
                    Left = 12
                    Top = 24
                    Width = 115
                    Height = 37
                    BevelInner = bvRaised
                    BevelOuter = bvLowered
                    Caption = #23383#20307#39044#35272
                    Color = clWhite
                    TabOrder = 4
                  end
                  object pnlEven: TPanel
                    Left = 150
                    Top = 75
                    Width = 75
                    Height = 19
                    Cursor = crHandPoint
                    BevelInner = bvRaised
                    BevelOuter = bvLowered
                    Color = clWhite
                    TabOrder = 5
                    OnClick = btnEvenClick
                  end
                  object pnlOdd: TPanel
                    Left = 150
                    Top = 31
                    Width = 75
                    Height = 19
                    Cursor = crHandPoint
                    BevelInner = bvRaised
                    BevelOuter = bvLowered
                    Color = clWhite
                    TabOrder = 6
                    OnClick = btnOddClick
                  end
                  object cbXh: TCheckBox
                    Left = 150
                    Top = 164
                    Width = 85
                    Height = 17
                    Caption = #25171#21360#24207#21495
                    Checked = True
                    State = cbChecked
                    TabOrder = 7
                  end
                  object edtLf: TSpinEdit
                    Left = 198
                    Top = 130
                    Width = 49
                    Height = 24
                    MaxValue = 0
                    MinValue = 0
                    TabOrder = 9
                    Value = 0
                    OnChange = SetPreviewPnl
                  end
                  object edtLmsl: TSpinEdit
                    Left = 198
                    Top = 106
                    Width = 49
                    Height = 24
                    MaxValue = 20
                    MinValue = 1
                    TabOrder = 8
                    Value = 1
                    OnChange = edtLmslChange
                  end
                  object cbHh: TCheckBox
                    Left = 150
                    Top = 191
                    Width = 85
                    Height = 17
                    Caption = #26410#39029#31354#34892
                    Checked = True
                    State = cbChecked
                    TabOrder = 10
                  end
                end
              end
              object TabSheet10: TTabSheet
                Caption = #21512#35745
                ImageIndex = 5
                object Label59: TLabel
                  Left = 282
                  Top = 6
                  Width = 68
                  Height = 15
                  Caption = #21512#35745#26639#30446':'
                end
                object Label60: TLabel
                  Left = 282
                  Top = 183
                  Width = 46
                  Height = 15
                  Caption = #25552#31034': '
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clNavy
                  Font.Height = -15
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object Image1: TImage
                  Left = 324
                  Top = 204
                  Width = 16
                  Height = 16
                  AutoSize = True
                  Picture.Data = {
                    07544269746D6170F6000000424DF60000000000000076000000280000001000
                    000010000000010004000000000080000000120B0000120B0000100000001000
                    000000000000000080000080000000808000800000008000800080800000C0C0
                    C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                    FF00777777777777777777777777777777777FFFFFFFFFFFFF77787777777777
                    7F77780FFFFFFFFF7F7778077707777F7F7778077000777F7F7778070000077F
                    7F7778070070007F7F7778070777000F7F7778077777700F7F7778077777770F
                    7F777807777777777F777800000000007F777888888888888F77777777777777
                    7777}
                end
                object Image2: TImage
                  Left = 324
                  Top = 183
                  Width = 16
                  Height = 16
                  AutoSize = True
                  Picture.Data = {
                    07544269746D6170F6000000424DF60000000000000076000000280000001000
                    000010000000010004000000000080000000120B0000120B0000100000001000
                    000000000000000080000080000000808000800000008000800080800000C0C0
                    C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                    FF00777777777777777777777777777777777FFFFFFFFFFFFF77787777777777
                    7F77780FFFFFFFFF7F7778077777777F7F7778077777777F7F7778077777777F
                    7F7778077777777F7F7778077777777F7F7778077777777F7F7778077777777F
                    7F7778077777777F7F777800000000007F777888888888888F77777777777777
                    7777}
                end
                object Label61: TLabel
                  Left = 342
                  Top = 183
                  Width = 75
                  Height = 15
                  Caption = #19981#25171#21360#21512#35745
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clNavy
                  Font.Height = -15
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object Label62: TLabel
                  Left = 342
                  Top = 205
                  Width = 60
                  Height = 15
                  Caption = #25171#21360#21512#35745
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clNavy
                  Font.Height = -15
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object GroupBox6: TGroupBox
                  Left = 144
                  Top = 6
                  Width = 133
                  Height = 217
                  TabOrder = 0
                  object btnHjFont: TSpeedButton
                    Left = 10
                    Top = 69
                    Width = 55
                    Height = 25
                    Hint = 'Hj'
                    Caption = #23383#20307
                    OnClick = btnBgBtFontClick
                  end
                  object btnHjColor: TSpeedButton
                    Left = 66
                    Top = 69
                    Width = 55
                    Height = 25
                    Hint = 'Hj'
                    Caption = #24213#33394
                    OnClick = btnBgBtColorClick
                  end
                  object Label18: TLabel
                    Left = 12
                    Top = 112
                    Width = 38
                    Height = 15
                    Caption = #34892#36317':'
                  end
                  object Label23: TLabel
                    Left = 96
                    Top = 112
                    Width = 15
                    Height = 15
                    Caption = #20493
                  end
                  object Bevel12: TBevel
                    Left = 12
                    Top = 99
                    Width = 109
                    Height = 10
                    Shape = bsTopLine
                  end
                  object Bevel13: TBevel
                    Left = 12
                    Top = 136
                    Width = 109
                    Height = 13
                    Shape = bsTopLine
                  end
                  object Label34: TLabel
                    Left = 12
                    Top = 142
                    Width = 53
                    Height = 15
                    Caption = #32593#26684#32447':'
                  end
                  object edtHjXj: TMaskEdit
                    Left = 54
                    Top = 108
                    Width = 37
                    Height = 23
                    EditMask = '9.9;1; '
                    MaxLength = 3
                    TabOrder = 0
                    Text = '1.0'
                  end
                  object cbHjHx: TComboBox
                    Left = 12
                    Top = 162
                    Width = 109
                    Height = 23
                    Style = csDropDownList
                    ItemHeight = 15
                    TabOrder = 1
                    Items.Strings = (
                      #22235#21608#30011#32447
                      #19978#19979#30011#32447
                      #24038#21491#30011#32447
                      #19981#30011#32447)
                  end
                  object rbHjSx: TRadioButton
                    Left = 12
                    Top = 192
                    Width = 55
                    Height = 17
                    Caption = #23454#32447
                    Checked = True
                    TabOrder = 2
                    TabStop = True
                  end
                  object RadioButton4: TRadioButton
                    Left = 72
                    Top = 192
                    Width = 55
                    Height = 17
                    Caption = #34394#32447
                    TabOrder = 3
                  end
                  object mmoHj: TPanel
                    Left = 12
                    Top = 24
                    Width = 109
                    Height = 37
                    Hint = 'Lm'
                    BevelInner = bvRaised
                    BevelOuter = bvLowered
                    Caption = #23383#20307#39044#35272
                    Color = clWhite
                    TabOrder = 4
                  end
                  object cbHj: TCheckBox
                    Left = 10
                    Top = 0
                    Width = 51
                    Height = 17
                    Caption = #21512#35745
                    Checked = True
                    State = cbChecked
                    TabOrder = 5
                  end
                end
                object GroupBox11: TGroupBox
                  Left = 6
                  Top = 6
                  Width = 133
                  Height = 217
                  TabOrder = 1
                  object btnXjFont: TSpeedButton
                    Left = 10
                    Top = 69
                    Width = 55
                    Height = 25
                    Hint = 'Xj'
                    Caption = #23383#20307
                    OnClick = btnBgBtFontClick
                  end
                  object btnXjColor: TSpeedButton
                    Left = 66
                    Top = 69
                    Width = 55
                    Height = 25
                    Hint = 'Xj'
                    Caption = #24213#33394
                    OnClick = btnBgBtColorClick
                  end
                  object Label56: TLabel
                    Left = 12
                    Top = 112
                    Width = 38
                    Height = 15
                    Caption = #34892#36317':'
                  end
                  object Label57: TLabel
                    Left = 96
                    Top = 112
                    Width = 15
                    Height = 15
                    Caption = #20493
                  end
                  object Bevel17: TBevel
                    Left = 12
                    Top = 99
                    Width = 109
                    Height = 10
                    Shape = bsTopLine
                  end
                  object Bevel18: TBevel
                    Left = 12
                    Top = 135
                    Width = 109
                    Height = 13
                    Shape = bsTopLine
                  end
                  object Label58: TLabel
                    Left = 12
                    Top = 142
                    Width = 53
                    Height = 15
                    Caption = #32593#26684#32447':'
                  end
                  object edtXjXj: TMaskEdit
                    Left = 54
                    Top = 108
                    Width = 37
                    Height = 23
                    EditMask = '9.9;1; '
                    MaxLength = 3
                    TabOrder = 0
                    Text = '1.0'
                  end
                  object cbXjHx: TComboBox
                    Left = 12
                    Top = 162
                    Width = 109
                    Height = 23
                    Style = csDropDownList
                    ItemHeight = 15
                    TabOrder = 1
                    Items.Strings = (
                      #22235#21608#30011#32447
                      #19978#19979#30011#32447
                      #24038#21491#30011#32447
                      #19981#30011#32447)
                  end
                  object rbXjSx: TRadioButton
                    Left = 12
                    Top = 192
                    Width = 55
                    Height = 17
                    Caption = #23454#32447
                    Checked = True
                    TabOrder = 2
                    TabStop = True
                  end
                  object RadioButton5: TRadioButton
                    Left = 72
                    Top = 192
                    Width = 55
                    Height = 17
                    Caption = #34394#32447
                    TabOrder = 3
                  end
                  object mmoXj: TPanel
                    Left = 12
                    Top = 24
                    Width = 109
                    Height = 37
                    Hint = 'Lm'
                    BevelInner = bvRaised
                    BevelOuter = bvLowered
                    Caption = #23383#20307#39044#35272
                    Color = clWhite
                    TabOrder = 4
                  end
                  object cbXj: TCheckBox
                    Left = 10
                    Top = 0
                    Width = 67
                    Height = 17
                    Caption = #39029#23567#35745
                    TabOrder = 5
                  end
                end
                object TotalList: TCheckListBox
                  Left = 282
                  Top = 24
                  Width = 133
                  Height = 151
                  ItemHeight = 20
                  Style = lbOwnerDrawFixed
                  TabOrder = 2
                end
              end
              object TabSheet8: TTabSheet
                Caption = #34920#23614
                ImageIndex = 5
                object Bevel6: TBevel
                  Left = 2
                  Top = 180
                  Width = 416
                  Height = 13
                  Shape = bsTopLine
                end
                object Label10: TLabel
                  Left = 6
                  Top = 186
                  Width = 346
                  Height = 15
                  Caption = #25552#31034': '#27492#21306#22495#20250#22312#27599#19968#39029#30340#20869#23481#21306#22495#19979#38754#36827#34892#25171#21360#12290
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clNavy
                  Font.Height = -15
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object Label11: TLabel
                  Left = 52
                  Top = 210
                  Width = 225
                  Height = 15
                  Caption = #20363#22914#25171#21360#21046#34920#20154#12289#23457#26680#20154#31561#36164#26009#12290
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clNavy
                  Font.Height = -15
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object Panel14: TPanel
                  Left = 0
                  Top = 0
                  Width = 419
                  Height = 179
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Bevel23: TBevel
                    Left = 2
                    Top = 150
                    Width = 415
                    Height = 13
                    Shape = bsTopLine
                  end
                  object BwRich: TRichEdit
                    Left = 0
                    Top = 0
                    Width = 419
                    Height = 123
                    Align = alTop
                    Font.Charset = GB2312_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = #23435#20307
                    Font.Style = []
                    ParentFont = False
                    PopupMenu = pmnXm
                    TabOrder = 0
                    WordWrap = False
                    OnSelectionChange = RichSelectionChange
                  end
                  object ToolBar7: TToolBar
                    Left = 0
                    Top = 123
                    Width = 419
                    Height = 27
                    AutoSize = True
                    BorderWidth = 1
                    ButtonHeight = 23
                    EdgeInner = esNone
                    EdgeOuter = esNone
                    Flat = True
                    Images = ToolbarImages
                    Indent = 4
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 1
                    Wrapable = False
                    object BwDy: TCheckBox
                      Left = 4
                      Top = 0
                      Width = 81
                      Height = 23
                      Caption = #26159#21542#25171#21360
                      Checked = True
                      State = cbChecked
                      TabOrder = 0
                    end
                    object ToolButton35: TToolButton
                      Left = 85
                      Top = 0
                      Width = 8
                      ImageIndex = 8
                      Style = tbsSeparator
                    end
                    object Label44: TLabel
                      Left = 93
                      Top = 0
                      Width = 38
                      Height = 15
                      Caption = #24213#33394':'
                      Layout = tlCenter
                    end
                    object BwColor: TPanel
                      Left = 131
                      Top = 0
                      Width = 23
                      Height = 23
                      Cursor = crHandPoint
                      BevelInner = bvRaised
                      BevelOuter = bvLowered
                      Color = clWhite
                      TabOrder = 1
                      OnClick = ColorClick
                    end
                    object ToolButton36: TToolButton
                      Left = 154
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton2'
                      ImageIndex = 15
                      Style = tbsSeparator
                    end
                    object BwLeftAlign: TToolButton
                      Left = 162
                      Top = 0
                      Hint = #24038#23545#40784
                      Down = True
                      Grouped = True
                      ImageIndex = 11
                      Style = tbsCheck
                      OnClick = SetPreviewPnl
                    end
                    object BwCenterAlign: TToolButton
                      Tag = 2
                      Left = 185
                      Top = 0
                      Hint = #20013#38388#23545#40784
                      Grouped = True
                      ImageIndex = 12
                      Style = tbsCheck
                      OnClick = SetPreviewPnl
                    end
                    object BwRightAlign: TToolButton
                      Tag = 1
                      Left = 208
                      Top = 0
                      Hint = #21491#23545#40784
                      Grouped = True
                      ImageIndex = 13
                      Style = tbsCheck
                      OnClick = SetPreviewPnl
                    end
                    object ToolButton40: TToolButton
                      Left = 231
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton3'
                      ImageIndex = 14
                      Style = tbsSeparator
                    end
                    object Label45: TLabel
                      Left = 239
                      Top = 0
                      Width = 38
                      Height = 15
                      Caption = #36793#26694':'
                      Layout = tlCenter
                    end
                    object BwHx: TComboBox
                      Left = 277
                      Top = 0
                      Width = 96
                      Height = 23
                      Style = csDropDownList
                      ItemHeight = 0
                      TabOrder = 2
                      Items.Strings = (
                        #22235#21608#30011#32447
                        #19978#19979#30011#32447
                        #24038#21491#30011#32447
                        #19981#30011#32447)
                    end
                    object ToolButton27: TToolButton
                      Left = 373
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton27'
                      ImageIndex = 15
                      Style = tbsSeparator
                    end
                    object ToolButton31: TToolButton
                      Left = 381
                      Top = 0
                      Hint = #22686#21152#31995#32479#36164#26009
                      Caption = 'ToolButton31'
                      ImageIndex = 15
                      OnClick = AddSysItemClick
                    end
                  end
                  object ToolBar8: TToolBar
                    Left = 0
                    Top = 152
                    Width = 419
                    Height = 27
                    Align = alBottom
                    AutoSize = True
                    BorderWidth = 1
                    ButtonHeight = 23
                    EdgeInner = esNone
                    EdgeOuter = esNone
                    Flat = True
                    Images = ToolbarImages
                    Indent = 4
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 2
                    Wrapable = False
                    object Label46: TLabel
                      Left = 4
                      Top = 0
                      Width = 38
                      Height = 15
                      Caption = #23383#20307':'
                      Layout = tlCenter
                    end
                    object BwFontName: TComboBox
                      Tag = 1
                      Left = 42
                      Top = 0
                      Width = 199
                      Height = 23
                      Ctl3D = False
                      DropDownCount = 10
                      ItemHeight = 0
                      ParentCtl3D = False
                      TabOrder = 0
                      OnChange = FontNameChange
                    end
                    object ToolButton41: TToolButton
                      Left = 241
                      Top = 0
                      Width = 8
                      ImageIndex = 8
                      Style = tbsSeparator
                    end
                    object BwFontSize: TEdit
                      Tag = 1
                      Left = 249
                      Top = 0
                      Width = 26
                      Height = 23
                      Hint = #23383#20307#22823#23567
                      TabOrder = 1
                      Text = '0'
                      OnChange = FontSizeChange
                    end
                    object UpDown4: TUpDown
                      Left = 275
                      Top = 0
                      Width = 21
                      Height = 23
                      Associate = BwFontSize
                      TabOrder = 2
                    end
                    object ToolButton42: TToolButton
                      Left = 296
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton2'
                      ImageIndex = 15
                      Style = tbsSeparator
                    end
                    object BwBoldButton: TToolButton
                      Tag = 1
                      Left = 304
                      Top = 0
                      Hint = #31895#20307
                      ImageIndex = 8
                      Style = tbsCheck
                      OnClick = BoldButtonClick
                    end
                    object BwItalicButton: TToolButton
                      Tag = 1
                      Left = 327
                      Top = 0
                      Hint = #26012#20307
                      ImageIndex = 9
                      Style = tbsCheck
                      OnClick = ItalicButtonClick
                    end
                    object BwUnderlineButton: TToolButton
                      Tag = 1
                      Left = 350
                      Top = 0
                      Hint = #19979#21010#32447
                      ImageIndex = 10
                      Style = tbsCheck
                      OnClick = UnderlineButtonClick
                    end
                    object ToolButton46: TToolButton
                      Left = 373
                      Top = 0
                      Width = 8
                      ImageIndex = 12
                      Style = tbsDivider
                    end
                    object BwFontColor: TPanel
                      Tag = 1
                      Left = 381
                      Top = 0
                      Width = 23
                      Height = 23
                      Cursor = crHandPoint
                      Hint = #39068#33394
                      BevelInner = bvRaised
                      BevelOuter = bvLowered
                      Color = clWhite
                      TabOrder = 3
                      OnClick = FontColorClick
                    end
                  end
                end
              end
              object TabSheet11: TTabSheet
                Caption = #39029#33050
                ImageIndex = 6
                object Bevel7: TBevel
                  Left = 2
                  Top = 180
                  Width = 416
                  Height = 13
                  Shape = bsTopLine
                end
                object Label12: TLabel
                  Left = 6
                  Top = 186
                  Width = 316
                  Height = 15
                  Caption = #25552#31034': '#27492#21306#22495#21482#20250#22312#26368#21518#19968#39029#30340#39029#23614#36827#34892#25171#21360#12290
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clNavy
                  Font.Height = -15
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object Label13: TLabel
                  Left = 52
                  Top = 210
                  Width = 180
                  Height = 15
                  Caption = #20363#22914#25171#21360#38468#21152#35828#26126#31561#36164#26009#12290
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clNavy
                  Font.Height = -15
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object Panel17: TPanel
                  Left = 0
                  Top = 0
                  Width = 419
                  Height = 179
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Bevel24: TBevel
                    Left = 2
                    Top = 150
                    Width = 415
                    Height = 13
                    Shape = bsTopLine
                  end
                  object YjRich: TRichEdit
                    Left = 0
                    Top = 0
                    Width = 419
                    Height = 123
                    Align = alTop
                    Font.Charset = GB2312_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = #23435#20307
                    Font.Style = []
                    ParentFont = False
                    PopupMenu = pmnXm
                    TabOrder = 0
                    WordWrap = False
                    OnSelectionChange = RichSelectionChange
                  end
                  object ToolBar9: TToolBar
                    Left = 0
                    Top = 123
                    Width = 419
                    Height = 26
                    AutoSize = True
                    BorderWidth = 1
                    EdgeInner = esNone
                    EdgeOuter = esNone
                    Flat = True
                    Images = ToolbarImages
                    Indent = 4
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 1
                    Wrapable = False
                    object YjDy: TCheckBox
                      Left = 4
                      Top = 0
                      Width = 81
                      Height = 22
                      Caption = #26159#21542#25171#21360
                      Checked = True
                      State = cbChecked
                      TabOrder = 0
                    end
                    object ToolButton47: TToolButton
                      Left = 85
                      Top = 0
                      Width = 8
                      ImageIndex = 8
                      Style = tbsSeparator
                    end
                    object Label48: TLabel
                      Left = 93
                      Top = 0
                      Width = 38
                      Height = 15
                      Caption = #24213#33394':'
                      Layout = tlCenter
                    end
                    object YjColor: TPanel
                      Left = 131
                      Top = 0
                      Width = 23
                      Height = 22
                      Cursor = crHandPoint
                      BevelInner = bvRaised
                      BevelOuter = bvLowered
                      Color = clWhite
                      TabOrder = 1
                      OnClick = ColorClick
                    end
                    object ToolButton48: TToolButton
                      Left = 154
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton2'
                      ImageIndex = 15
                      Style = tbsSeparator
                    end
                    object YjLeftAlign: TToolButton
                      Left = 162
                      Top = 0
                      Hint = #24038#23545#40784
                      Down = True
                      Grouped = True
                      ImageIndex = 11
                      Style = tbsCheck
                      OnClick = SetPreviewPnl
                    end
                    object YjCenterAlign: TToolButton
                      Tag = 2
                      Left = 185
                      Top = 0
                      Hint = #20013#38388#23545#40784
                      Grouped = True
                      ImageIndex = 12
                      Style = tbsCheck
                      OnClick = SetPreviewPnl
                    end
                    object YjRightAlign: TToolButton
                      Tag = 1
                      Left = 208
                      Top = 0
                      Hint = #21491#23545#40784
                      Grouped = True
                      ImageIndex = 13
                      Style = tbsCheck
                      OnClick = SetPreviewPnl
                    end
                    object ToolButton52: TToolButton
                      Left = 231
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton3'
                      ImageIndex = 14
                      Style = tbsSeparator
                    end
                    object Label49: TLabel
                      Left = 239
                      Top = 0
                      Width = 38
                      Height = 15
                      Caption = #36793#26694':'
                      Layout = tlCenter
                    end
                    object YjHx: TComboBox
                      Left = 277
                      Top = 0
                      Width = 96
                      Height = 23
                      Style = csDropDownList
                      ItemHeight = 0
                      TabOrder = 2
                      Items.Strings = (
                        #22235#21608#30011#32447
                        #19978#19979#30011#32447
                        #24038#21491#30011#32447
                        #19981#30011#32447)
                    end
                    object ToolButton32: TToolButton
                      Left = 373
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton32'
                      ImageIndex = 15
                      Style = tbsSeparator
                    end
                    object ToolButton33: TToolButton
                      Left = 381
                      Top = 0
                      Hint = #22686#21152#31995#32479#36164#26009
                      Caption = 'ToolButton33'
                      ImageIndex = 15
                      OnClick = AddSysItemClick
                    end
                  end
                  object ToolBar10: TToolBar
                    Left = 0
                    Top = 153
                    Width = 419
                    Height = 26
                    Align = alBottom
                    AutoSize = True
                    BorderWidth = 1
                    EdgeInner = esNone
                    EdgeOuter = esNone
                    Flat = True
                    Images = ToolbarImages
                    Indent = 4
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 2
                    Wrapable = False
                    object Label50: TLabel
                      Left = 4
                      Top = 0
                      Width = 38
                      Height = 15
                      Caption = #23383#20307':'
                      Layout = tlCenter
                    end
                    object YjFontName: TComboBox
                      Tag = 1
                      Left = 42
                      Top = 0
                      Width = 199
                      Height = 23
                      Ctl3D = False
                      DropDownCount = 10
                      ItemHeight = 0
                      ParentCtl3D = False
                      TabOrder = 0
                      OnChange = FontNameChange
                    end
                    object ToolButton53: TToolButton
                      Left = 241
                      Top = 0
                      Width = 8
                      ImageIndex = 8
                      Style = tbsSeparator
                    end
                    object YjFontSize: TEdit
                      Tag = 1
                      Left = 249
                      Top = 0
                      Width = 26
                      Height = 22
                      Hint = #23383#20307#22823#23567
                      TabOrder = 1
                      Text = '0'
                      OnChange = FontSizeChange
                    end
                    object UpDown5: TUpDown
                      Left = 275
                      Top = 0
                      Width = 21
                      Height = 22
                      Associate = YjFontSize
                      TabOrder = 2
                    end
                    object ToolButton54: TToolButton
                      Left = 296
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton2'
                      ImageIndex = 15
                      Style = tbsSeparator
                    end
                    object YjBoldButton: TToolButton
                      Tag = 1
                      Left = 304
                      Top = 0
                      Hint = #31895#20307
                      ImageIndex = 8
                      Style = tbsCheck
                      OnClick = BoldButtonClick
                    end
                    object YjItalicButton: TToolButton
                      Tag = 1
                      Left = 327
                      Top = 0
                      Hint = #26012#20307
                      ImageIndex = 9
                      Style = tbsCheck
                      OnClick = ItalicButtonClick
                    end
                    object YjUnderlineButton: TToolButton
                      Tag = 1
                      Left = 350
                      Top = 0
                      Hint = #19979#21010#32447
                      ImageIndex = 10
                      Style = tbsCheck
                      OnClick = UnderlineButtonClick
                    end
                    object ToolButton58: TToolButton
                      Left = 373
                      Top = 0
                      Width = 8
                      ImageIndex = 12
                      Style = tbsDivider
                    end
                    object YjFontColor: TPanel
                      Tag = 1
                      Left = 381
                      Top = 0
                      Width = 23
                      Height = 22
                      Cursor = crHandPoint
                      Hint = #39068#33394
                      BevelInner = bvRaised
                      BevelOuter = bvLowered
                      Color = clWhite
                      TabOrder = 3
                      OnClick = FontColorClick
                    end
                  end
                end
              end
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = #26639#30446
          ImageIndex = 1
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 652
            Height = 271
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object SrcLabel: TLabel
              Left = 6
              Top = 9
              Width = 68
              Height = 15
              Caption = #21487#36873#26639#30446':'
            end
            object DstLabel: TLabel
              Left = 246
              Top = 9
              Width = 143
              Height = 15
              Caption = #25171#21360#26639#30446#21450#25171#21360#39034#24207':'
            end
            object btnUp: TSpeedButton
              Left = 206
              Top = 108
              Width = 23
              Height = 22
              Hint = #23558#26639#30446#19978#31227#19968#34892' (Ctrl+Up)'
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                04000000000080000000120B0000120B00001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
                DADAADADADADADADADADDADADADADADADADAADADADADADADADADDADAD00000DA
                DADAADADA06660ADADADDADAD06660DADADAADADA06660ADADADDA0000666000
                0ADAADA066666660ADADDADA0666660ADADAADADA06660ADADADDADADA060ADA
                DADAADADADA0ADADADADDADADADADADADADAADADADADADADADAD}
              ParentShowHint = False
              ShowHint = True
              OnClick = btnUpClick
            end
            object btnDown: TSpeedButton
              Left = 206
              Top = 138
              Width = 23
              Height = 22
              Hint = #23558#26639#30446#19979#31227#19968#34892' (Ctrl+Down)'
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                04000000000080000000120B0000120B00001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
                DADAADADADADADADADADDADADADADADADADAADADADADADADADADDADADAD0DADA
                DADAADADAD060DADADADDADAD06660DADADAADAD0666660DADADDAD066666660
                DADAAD00006660000DADDADAD06660DADADAADADA06660ADADADDADAD06660DA
                DADAADADA00000ADADADDADADADADADADADAADADADADADADADAD}
              ParentShowHint = False
              ShowHint = True
              OnClick = btnDownClick
            end
            object btnRight: TSpeedButton
              Left = 206
              Top = 60
              Width = 23
              Height = 22
              Hint = #22686#21152#19968#20010#25171#21360#26639#30446' (Ctrl+Right)'
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                04000000000080000000120B0000120B00001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
                DADAADADADADADADADADDADADADADADADADAADADADA0ADADADADDADADAD00ADA
                DADAADADADA060ADADADDAD00000660ADADAADA066666660ADADDAD066666666
                0ADAADA066666660ADADDAD00000660ADADAADADADA060ADADADDADADAD00ADA
                DADAADADADA0ADADADADDADADADADADADADAADADADADADADADAD}
              ParentShowHint = False
              ShowHint = True
              OnClick = btnRightClick
            end
            object btnLeft: TSpeedButton
              Left = 206
              Top = 30
              Width = 23
              Height = 22
              Hint = #21462#28040#24403#21069#25152#36873#23450#30340#25171#21360#26639#30446' (Ctrl+Left)'
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                04000000000080000000120B0000120B00001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
                DADAADADADADADADADADDADADADADADADADAADADADA0ADADADADDADADA00DADA
                DADAADADA060ADADADADDADA06600000DADAADA066666660ADADDA0666666660
                DADAADA066666660ADADDADA06600000DADAADADA060ADADADADDADADA00DADA
                DADAADADADA0ADADADADDADADADADADADADAADADADADADADADAD}
              ParentShowHint = False
              ShowHint = True
              OnClick = btnLeftClick
            end
            object Bevel1: TBevel
              Left = 192
              Top = 96
              Width = 49
              Height = 4
              ParentShowHint = False
              Shape = bsTopLine
              ShowHint = True
            end
            object Bevel3: TBevel
              Left = 192
              Top = 171
              Width = 49
              Height = 7
              ParentShowHint = False
              Shape = bsTopLine
              ShowHint = True
            end
            object btnColWidth: TSpeedButton
              Left = 206
              Top = 186
              Width = 23
              Height = 22
              Hint = #35774#32622#26639#30446#23485#24230
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                04000000000080000000120B0000120B00001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
                DADAA0F88888888880ADD0F88888888880DAA0F88888888880ADD0F888888888
                80DAA0F88888888880ADD0F88888888880DAA0FFFFFFFFFFF0ADD00000000000
                00DAADADADADADADADADDADADADADADADADAADA4ADADADA4ADADDA44DADADAD4
                4ADAA44444ADA44444ADDA44DADADAD44ADAADA4ADADADA4ADAD}
              Layout = blGlyphTop
              ParentShowHint = False
              ShowHint = True
              OnClick = btnColWidthClick
            end
            object DstList: TListBox
              Left = 246
              Top = 30
              Width = 181
              Height = 235
              Style = lbOwnerDrawFixed
              DragMode = dmAutomatic
              ItemHeight = 20
              Items.Strings = (
                'Item1'
                'Item2'
                'Item3'
                'Item4'
                'Item5')
              MultiSelect = True
              TabOrder = 1
              OnDblClick = btnLeftClick
              OnDragDrop = DstListDragDrop
              OnDragOver = DstListDragOver
            end
            object SrcList: TListBox
              Left = 6
              Top = 30
              Width = 181
              Height = 235
              Style = lbOwnerDrawFixed
              DragMode = dmAutomatic
              ItemHeight = 20
              Items.Strings = (
                'Item1'
                'Item2'
                'Item3'
                'Item4'
                'Item5')
              MultiSelect = True
              TabOrder = 0
              OnDblClick = btnRightClick
              OnDragDrop = SrcListDragDrop
              OnDragOver = SrcListDragOver
            end
          end
        end
        object TabSheet4: TTabSheet
          Caption = #32440#24352#21450#39029#30721
          ImageIndex = 3
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 652
            Height = 271
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object GroupBox2: TGroupBox
              Left = 6
              Top = 6
              Width = 253
              Height = 109
              Caption = #32440#24352
              TabOrder = 0
              object Label3: TLabel
                Left = 18
                Top = 24
                Width = 62
                Height = 15
                Caption = #22823#23567'(&Z):'
                FocusControl = cbPageSize
              end
              object Label14: TLabel
                Left = 18
                Top = 54
                Width = 62
                Height = 15
                Caption = #23485#24230'(&W):'
              end
              object Label15: TLabel
                Left = 18
                Top = 84
                Width = 62
                Height = 15
                Caption = #38271#24230'(&L):'
              end
              object Label16: TLabel
                Left = 144
                Top = 54
                Width = 30
                Height = 15
                Caption = #27627#31859
              end
              object Label17: TLabel
                Left = 144
                Top = 84
                Width = 30
                Height = 15
                Caption = #27627#31859
              end
              object cbPageSize: TComboBox
                Left = 84
                Top = 20
                Width = 151
                Height = 23
                Style = csDropDownList
                ItemHeight = 15
                TabOrder = 0
                OnChange = cbPageSizeChange
                Items.Strings = (
                  'A3'
                  'A4'
                  'A5'
                  'B4'
                  'B5'
                  #33258#23450#20041)
              end
              object edtPageWidth: TSpinEdit
                Left = 84
                Top = 49
                Width = 55
                Height = 24
                MaxValue = 0
                MinValue = 0
                TabOrder = 1
                Value = 210
                OnChange = SetPreviewPnl
              end
              object edtPageLength: TSpinEdit
                Left = 84
                Top = 79
                Width = 55
                Height = 24
                MaxValue = 0
                MinValue = 0
                TabOrder = 2
                Value = 297
                OnChange = SetPreviewPnl
              end
            end
            object GroupBox3: TGroupBox
              Left = 270
              Top = 6
              Width = 163
              Height = 109
              Caption = #26041#21521
              TabOrder = 1
              object img2: TImage
                Left = 18
                Top = 42
                Width = 32
                Height = 32
                AutoSize = True
                Picture.Data = {
                  055449636F6E0000010003002020020000000000300100003600000020200800
                  00000000E8020000660100002020100000000000E80200004E04000028000000
                  2000000040000000010001000000000000000000000000000000000000000000
                  0000000000000000FFFFFF000000000000000000000000000000000000000000
                  000000007FFFFFFC7FFFFFFC7FFFFFFC781F807C7E7FE1FC7F7FE3FC7F3FC3FC
                  7FBFC7FC7F8007FC7FDF8FFC7FCF0FFC7FEF1FFC7FE61FFC7FF63FFC7FF23FFC
                  7FF87F007FF87F787FFCFF707FFCFF607FFFFF407FFFFF000000000000000000
                  000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000100000003000000070000000F0000001F0000003F0000007FFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFF2800000020000000400000000100040000000000
                  0000000000000000000000000000000000000000000000000000800000800000
                  0080800080000000800080008080000080808000C0C0C0000000FF0000FF0000
                  00FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFF000FFFF000000FFFFFF00000000FFFFF000FFFFFF00FFFFFFFFFF0000F
                  FFFFFF000FFFFFFF0FFFFFFFFFF000FFFFFFFF000FFFFFFF00FFFFFFFF0000FF
                  FFFFFF000FFFFFFFF0FFFFFFFF000FFFFFFFFF000FFFFFFFF000000000000FFF
                  FFFFFF000FFFFFFFFF0FFFFFF000FFFFFFFFFF000FFFFFFFFF00FFFF0000FFFF
                  FFFFFF000FFFFFFFFFF0FFFF000FFFFFFFFFFF000FFFFFFFFFF00FF0000FFFFF
                  FFFFFF000FFFFFFFFFFF0FF000FFFFFFFFFFFF000FFFFFFFFFFF00F000FFFFFF
                  FFFFFF000FFFFFFFFFFFF0000FFFFFFF000000000FFFFFFFFFFFF0000FFFFFFF
                  0FFFF0000FFFFFFFFFFFFF00FFFFFFFF0FFF00000FFFFFFFFFFFFF00FFFFFFFF
                  0FF000000FFFFFFFFFFFFFFFFFFFFFFF0F0000000FFFFFFFFFFFFFFFFFFFFFFF
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF80000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000100000003000000070000000F0000001F0000003F
                  0000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF280000002000000040000000
                  0100040000000000000000000000000000000000000000000000000000000000
                  00008000008000000080800080000000800080008080000080808000C0C0C000
                  0000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000008888888
                  888888888888888888888888000000000000000000000000000000080FFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF080FFFFFFFFFFFFFFFFFFFFFFFFFFFFF080FFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF080FFFF000000FFFFFF00000000FFFFF080FFFFFF0
                  0FFFFFFFFFF0000FFFFFFF080FFFFFFF0FFFFFFFFFF000FFFFFFFF080FFFFFFF
                  00FFFFFFFF0000FFFFFFFF080FFFFFFFF0FFFFFFFF000FFFFFFFFF080FFFFFFF
                  F000000000000FFFFFFFFF080FFFFFFFFF0FFFFFF000FFFFFFFFFF080FFFFFFF
                  FF00FFFF0000FFFFFFFFFF080FFFFFFFFFF0FFFF000FFFFFFFFFFF080FFFFFFF
                  FFF00FF0000FFFFFFFFFFF080FFFFFFFFFFF0FF000FFFFFFFFFFFF080FFFFFFF
                  FFFF00F000FFFFFFFFFFFF080FFFFFFFFFFFF0000FFFFFFF000000000FFFFFFF
                  FFFFF0000FFFFFFF0FFFF0000FFFFFFFFFFFFF00FFFFFFFF0FFF00000FFFFFFF
                  FFFFFF00FFFFFFFF0FF000000FFFFFFFFFFFFFFFFFFFFFFF0F0000000FFFFFFF
                  FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000000FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFF8000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000100000003000000070000000F
                  0000001F0000003F0000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              end
              object img1: TImage
                Left = 18
                Top = 42
                Width = 32
                Height = 32
                AutoSize = True
                Picture.Data = {
                  055449636F6E0000010003002020020000000000300100003600000020200800
                  00000000E8020000660100002020100000000000E80200004E04000028000000
                  2000000040000000010001000000000000000000000000000000000000000000
                  0000000000000000FFFFFF0000000000000000000FFFFFE00FFFFFE00FFFFFE0
                  0FFFFFE00FFFFFE00FFFFFE00FFFFFE00C0FC0200F3FF0E00FBFF1E00F9FE1E0
                  0FDFE3E00FC003E00FEFC7E00FE787E00FF78FE00FF30FE00FFB1FE00FF91FE0
                  0FFC3FE00FFC3FE00FFE7FE00FFE7FE00FFFF8000FFFFBC00FFFFB800FFFFB00
                  0FFFFA000FFFF80000000000F0000007E0000007E0000007E0000007E0000007
                  E0000007E0000007E0000007E0000007E0000007E0000007E0000007E0000007
                  E0000007E0000007E0000007E0000007E0000007E0000007E0000007E0000007
                  E0000007E0000007E0000007E0000007E000000FE000001FE000003FE000007F
                  E00000FFE00001FFE00003FF2800000020000000400000000100040000000000
                  0000000000000000000000000000000000000000000000000000800000800000
                  0080800080000000800080008080000080808000C0C0C0000000FF0000FF0000
                  00FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000000000000000
                  00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
                  FFF000000000FFFFFFFFFFFFFFFFFFFFFFF000000000FFFFFFFFFFFFFFFFFFFF
                  FFF000000000FFFFFFFFFFFFFFFFFFFFFFF000000000FFFFFFFFFFFFFFFFFFFF
                  FFF000000000FFFFFFFFFFFFFFFFFFFFFFF000000000FFFFFFFFFFFFFFFFFFFF
                  FFF000000000FF000000FFFFFF00000000F000000000FFFF00FFFFFFFFFF0000
                  FFF000000000FFFFF0FFFFFFFFFF000FFFF000000000FFFFF00FFFFFFFF0000F
                  FFF000000000FFFFFF0FFFFFFFF000FFFFF000000000FFFFFF000000000000FF
                  FFF000000000FFFFFFF0FFFFFF000FFFFFF000000000FFFFFFF00FFFF0000FFF
                  FFF000000000FFFFFFFF0FFFF000FFFFFFF000000000FFFFFFFF00FF0000FFFF
                  FFF000000000FFFFFFFFF0FF000FFFFFFFF000000000FFFFFFFFF00F000FFFFF
                  FFF000000000FFFFFFFFFF0000FFFFFFFFF000000000FFFFFFFFFF0000FFFFFF
                  FFF000000000FFFFFFFFFFF00FFFFFFFFFF000000000FFFFFFFFFFF00FFFFFFF
                  FFF000000000FFFFFFFFFFFFFFFFF000000000000000FFFFFFFFFFFFFFFFF0FF
                  FF0000000000FFFFFFFFFFFFFFFFF0FFF00000000000FFFFFFFFFFFFFFFFF0FF
                  000000000000FFFFFFFFFFFFFFFFF0F0000000000000FFFFFFFFFFFFFFFFF000
                  0000000000000000000000000000000000000000F0000007E0000007E0000007
                  E0000007E0000007E0000007E0000007E0000007E0000007E0000007E0000007
                  E0000007E0000007E0000007E0000007E0000007E0000007E0000007E0000007
                  E0000007E0000007E0000007E0000007E0000007E0000007E000000FE000001F
                  E000003FE000007FE00000FFE00001FFE00003FF280000002000000040000000
                  0100040000000000000000000000000000000000000000000000000000000000
                  00008000008000000080800080000000800080008080000080808000C0C0C000
                  0000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000008888
                  888888888888888888888000000000000000000000000000000080000000FFFF
                  FFFFFFFFFFFFFFFFFFF080000000FFFFFFFFFFFFFFFFFFFFFFF080000000FFFF
                  FFFFFFFFFFFFFFFFFFF080000000FFFFFFFFFFFFFFFFFFFFFFF080000000FFFF
                  FFFFFFFFFFFFFFFFFFF080000000FFFFFFFFFFFFFFFFFFFFFFF080000000FFFF
                  FFFFFFFFFFFFFFFFFFF080000000FF000000FFFFFF00000000F080000000FFFF
                  00FFFFFFFFFF0000FFF080000000FFFFF0FFFFFFFFFF000FFFF080000000FFFF
                  F00FFFFFFFF0000FFFF080000000FFFFFF0FFFFFFFF000FFFFF080000000FFFF
                  FF000000000000FFFFF080000000FFFFFFF0FFFFFF000FFFFFF080000000FFFF
                  FFF00FFFF0000FFFFFF080000000FFFFFFFF0FFFF000FFFFFFF080000000FFFF
                  FFFF00FF0000FFFFFFF080000000FFFFFFFFF0FF000FFFFFFFF080000000FFFF
                  FFFFF00F000FFFFFFFF080000000FFFFFFFFFF0000FFFFFFFFF080000000FFFF
                  FFFFFF0000FFFFFFFFF080000000FFFFFFFFFFF00FFFFFFFFFF080000000FFFF
                  FFFFFFF00FFFFFFFFFF080000000FFFFFFFFFFFFFFFFF000000000000000FFFF
                  FFFFFFFFFFFFF0FFFF0000000000FFFFFFFFFFFFFFFFF0FFF00000000000FFFF
                  FFFFFFFFFFFFF0FF000000000000FFFFFFFFFFFFFFFFF0F0000000000000FFFF
                  FFFFFFFFFFFFF0000000000000000000000000000000000000000000F0000007
                  E0000007E0000007E0000007E0000007E0000007E0000007E0000007E0000007
                  E0000007E0000007E0000007E0000007E0000007E0000007E0000007E0000007
                  E0000007E0000007E0000007E0000007E0000007E0000007E0000007E0000007
                  E000000FE000001FE000003FE000007FE00000FFE00001FFE00003FF}
              end
              object rbPortrait: TRadioButton
                Left = 66
                Top = 36
                Width = 73
                Height = 17
                Caption = #32437#21521'(&O)'
                Checked = True
                TabOrder = 0
                TabStop = True
                OnClick = rbPortraitClick
              end
              object rbPortrait1: TRadioButton
                Left = 66
                Top = 72
                Width = 73
                Height = 17
                Caption = #27178#21521'(&A)'
                TabOrder = 1
                OnClick = rbPortraitClick
              end
            end
            object GroupBox8: TGroupBox
              Left = 6
              Top = 120
              Width = 253
              Height = 145
              Caption = #39029#36793#36317
              TabOrder = 2
              object Label25: TLabel
                Left = 18
                Top = 57
                Width = 47
                Height = 15
                Caption = #19978'(&T):'
                FocusControl = edtPageTop
              end
              object Label24: TLabel
                Left = 18
                Top = 89
                Width = 47
                Height = 15
                Caption = #19979'(&B):'
                FocusControl = edtPageBottom
              end
              object Label26: TLabel
                Left = 132
                Top = 57
                Width = 47
                Height = 15
                Caption = #24038'(&F):'
                FocusControl = edtPageLeft
              end
              object Label27: TLabel
                Left = 132
                Top = 89
                Width = 47
                Height = 15
                Caption = #21491'(&G):'
                FocusControl = edtPageRight
              end
              object Label29: TLabel
                Left = 19
                Top = 117
                Width = 76
                Height = 15
                Caption = #21333#20301': '#27627#31859
              end
              object edtPageTop: TSpinEdit
                Left = 66
                Top = 52
                Width = 55
                Height = 24
                MaxValue = 0
                MinValue = 0
                TabOrder = 0
                Value = 10
                OnChange = SetPreviewPnl
              end
              object edtPageBottom: TSpinEdit
                Left = 66
                Top = 84
                Width = 55
                Height = 24
                MaxValue = 0
                MinValue = 0
                TabOrder = 1
                Value = 20
                OnChange = SetPreviewPnl
              end
              object edtPageLeft: TSpinEdit
                Left = 180
                Top = 52
                Width = 55
                Height = 24
                MaxValue = 0
                MinValue = 0
                TabOrder = 2
                Value = 10
                OnChange = SetPreviewPnl
              end
              object edtPageRight: TSpinEdit
                Left = 180
                Top = 84
                Width = 55
                Height = 24
                MaxValue = 0
                MinValue = 0
                TabOrder = 3
                Value = 10
                OnChange = SetPreviewPnl
              end
              object cbBj: TCheckBox
                Left = 18
                Top = 24
                Width = 145
                Height = 17
                Caption = #33258#21160#35843#25972#24038#21491#36793#36317
                Checked = True
                State = cbChecked
                TabOrder = 4
                OnClick = cbBjClick
              end
            end
            object GroupBox10: TGroupBox
              Left = 270
              Top = 120
              Width = 163
              Height = 145
              Caption = #39029#30721
              TabOrder = 3
              object Label63: TLabel
                Left = 13
                Top = 119
                Width = 38
                Height = 15
                Caption = #23545#40784':'
              end
              object Label64: TLabel
                Left = 13
                Top = 59
                Width = 38
                Height = 15
                Caption = #23383#20307':'
              end
              object Label65: TLabel
                Left = 13
                Top = 89
                Width = 38
                Height = 15
                Caption = #39068#33394':'
              end
              object cbYmfs: TComboBox
                Left = 12
                Top = 24
                Width = 139
                Height = 23
                ItemHeight = 15
                TabOrder = 0
                OnChange = cbDyjChange
                Items.Strings = (
                  #183'[X]'#183
                  '-[X]-'
                  #31532'[X]'#39029
                  'Page:[X]'
                  '[X]'
                  #19981#25171#21360)
              end
              object ToolBar11: TToolBar
                Left = 53
                Top = 113
                Width = 93
                Height = 26
                Align = alNone
                AutoSize = True
                BorderWidth = 1
                EdgeInner = esNone
                EdgeOuter = esNone
                Flat = True
                Images = ToolbarImages
                Indent = 4
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                Wrapable = False
                object YmdyLeftAlign: TToolButton
                  Left = 4
                  Top = 0
                  Hint = #24038#23545#40784
                  Grouped = True
                  ImageIndex = 11
                  Style = tbsCheck
                  OnClick = SetPreviewPnl
                end
                object ToolButton21: TToolButton
                  Left = 27
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton3'
                  ImageIndex = 14
                  Style = tbsSeparator
                end
                object YmdyCenterAlign: TToolButton
                  Tag = 2
                  Left = 35
                  Top = 0
                  Hint = #20013#38388#23545#40784
                  Grouped = True
                  ImageIndex = 12
                  Style = tbsCheck
                  OnClick = SetPreviewPnl
                end
                object ToolButton12: TToolButton
                  Left = 58
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton12'
                  ImageIndex = 14
                  Style = tbsSeparator
                end
                object YmdyRightAlign: TToolButton
                  Tag = 1
                  Left = 66
                  Top = 0
                  Hint = #21491#23545#40784
                  Down = True
                  Grouped = True
                  ImageIndex = 13
                  Style = tbsCheck
                  OnClick = SetPreviewPnl
                end
              end
              object YmdyFont: TPanel
                Left = 59
                Top = 54
                Width = 86
                Height = 25
                Cursor = crHandPoint
                Hint = 'Lm'
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Caption = #23383#20307#39044#35272
                Color = clWhite
                TabOrder = 2
                OnClick = YmdyFontClick
              end
              object YmdyColor: TPanel
                Left = 59
                Top = 84
                Width = 86
                Height = 25
                Cursor = crHandPoint
                Hint = 'Lm'
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Color = clWhite
                TabOrder = 3
                OnClick = ColorClick
              end
            end
          end
        end
      end
      object btnSave: TBitBtn
        Left = 354
        Top = 312
        Width = 90
        Height = 31
        Caption = #20445#23384'(&S)'
        TabOrder = 1
        OnClick = btnSaveClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000000000000000
          0000000000000000000000000000000000000000000000FF00FFFF00FF000000
          008080008080000000000000000000000000000000000000C0C0C0C0C0C00000
          00008080000000FF00FFFF00FF00000000808000808000000000000000000000
          0000000000000000C0C0C0C0C0C0000000008080000000FF00FFFF00FF000000
          008080008080000000000000000000000000000000000000C0C0C0C0C0C00000
          00008080000000FF00FFFF00FF00000000808000808000000000000000000000
          0000000000000000000000000000000000008080000000FF00FFFF00FF000000
          0080800080800080800080800080800080800080800080800080800080800080
          80008080000000FF00FFFF00FF00000000808000808000000000000000000000
          0000000000000000000000000000008080008080000000FF00FFFF00FF000000
          008080000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000
          00008080000000FF00FFFF00FF000000008080000000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000008080000000FF00FFFF00FF000000
          008080000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000
          00008080000000FF00FFFF00FF000000008080000000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000008080000000FF00FFFF00FF000000
          008080000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000
          00000000000000FF00FFFF00FF000000008080000000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0000000FF00FFFF00FF000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object btnIni: TBitBtn
        Left = 462
        Top = 312
        Width = 90
        Height = 31
        Caption = #21021#22987#21270' '
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnIniClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADAAD0000000000000DDA0FFF0FFF0FFF0AAD0FFF0FFF0FFF0DDA0FFF0FFF0F
          FF0AAD0FFF0FFF0FFF0DDA0FFF0FFF0FFF0AAD0FFF0FFF0FFF0DDA0FFF0FFF0F
          FF0AAD0FFF0FFF0FFF0DDA0FFF0FFF0FFF0AAD0000000000000DDA0888088808
          880AAD0888088808880DDA0000000000000AADADADADADADADAD}
      end
      object btnCancelSet: TBitBtn
        Left = 570
        Top = 312
        Width = 90
        Height = 31
        Cancel = True
        Caption = #21462#28040'(&C)'
        TabOrder = 3
        OnClick = btnCancelSetClick
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
      object GroupBox7: TGroupBox
        Left = 450
        Top = 30
        Width = 199
        Height = 261
        Caption = #39044#35272
        TabOrder = 4
        object imgRight: TImage
          Left = 2
          Top = 25
          Width = 16
          Height = 16
          AutoSize = True
          Picture.Data = {
            07544269746D6170F6000000424DF60000000000000076000000280000001000
            000010000000010004000000000080000000120B0000120B0000100000001000
            000000000000000080000080000000808000800000008000800080800000C0C0
            C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00777777777777777777777777777777777777777777777777777777777777
            7777777777477777777777777744777777777777774447777777777777444477
            7777777777444447777777777744447777777777774447777777777777447777
            7777777777477777777777777777777777777777777777777777777777777777
            7777}
        end
        object imgLeft: TImage
          Left = 181
          Top = 25
          Width = 16
          Height = 16
          AutoSize = True
          Picture.Data = {
            07544269746D6170F6000000424DF60000000000000076000000280000001000
            000010000000010004000000000080000000120B0000120B0000100000001000
            000000000000000080000080000000808000800000008000800080800000C0C0
            C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00777777777777777777777777777777777777777777777777777777777777
            7777777777777477777777777777447777777777777444777777777777444477
            7777777774444477777777777744447777777777777444777777777777774477
            7777777777777477777777777777777777777777777777777777777777777777
            7777}
        end
        object pnlPage: TPanel
          Left = 18
          Top = 27
          Width = 163
          Height = 219
          Cursor = crHandPoint
          Color = clHighlightText
          TabOrder = 0
          OnClick = pnlPageClick
          DesignSize = (
            163
            219)
          object pnlClient: TPanel
            Left = 10
            Top = 10
            Width = 142
            Height = 189
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelInner = bvLowered
            Color = clWhite
            TabOrder = 0
            OnResize = pnlClientResize
            object pnlYm: TPanel
              Left = 2
              Top = 2
              Width = 138
              Height = 23
              Cursor = crHandPoint
              Align = alTop
              BevelOuter = bvNone
              Caption = '  '#39029#30473'  '
              Color = clWhite
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = pnlYmClick
            end
            object pnlBt: TPanel
              Left = 2
              Top = 25
              Width = 138
              Height = 23
              Cursor = crHandPoint
              Align = alTop
              BevelOuter = bvNone
              Caption = '  '#26631#39064'  '
              Color = clWhite
              TabOrder = 1
              OnClick = pnlBtClick
            end
            object pnlBgbt: TPanel
              Left = 2
              Top = 48
              Width = 138
              Height = 23
              Cursor = crHandPoint
              Align = alTop
              BevelOuter = bvNone
              Caption = '  '#34920#22836'  '
              Color = clWhite
              TabOrder = 2
              OnClick = pnlBgbtClick
            end
            object pnlLm: TPanel
              Left = 2
              Top = 71
              Width = 138
              Height = 23
              Cursor = crHandPoint
              Align = alTop
              BevelOuter = bvNone
              Caption = '  '#26639#30446#26631#39064'  '
              Color = clWhite
              TabOrder = 3
              OnClick = pnlLmClick
            end
            object pnlNy: TPanel
              Left = 2
              Top = 94
              Width = 138
              Height = 23
              Cursor = crHandPoint
              Align = alTop
              BevelOuter = bvNone
              Caption = '  '#27491#25991'  '
              Color = clWhite
              TabOrder = 4
              OnClick = pnlNyClick
            end
            object pnlHj: TPanel
              Left = 2
              Top = 117
              Width = 138
              Height = 23
              Cursor = crHandPoint
              Align = alTop
              BevelOuter = bvNone
              Caption = '  '#21512#35745'  '
              Color = clWhite
              TabOrder = 5
              OnClick = pnlHjClick
            end
            object pnlBw: TPanel
              Left = 2
              Top = 140
              Width = 138
              Height = 23
              Cursor = crHandPoint
              Align = alTop
              BevelOuter = bvNone
              Caption = '  '#34920#23614'  '
              Color = clWhite
              TabOrder = 6
              OnClick = pnlBwClick
            end
            object pnlYj: TPanel
              Left = 2
              Top = 163
              Width = 138
              Height = 24
              Cursor = crHandPoint
              Align = alClient
              BevelOuter = bvNone
              Caption = '  '#39029#33050'  '
              Color = clWhite
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              OnClick = pnlYjClick
            end
          end
        end
      end
      object btnPreivewNotLoad: TBitBtn
        Left = 1
        Top = 312
        Width = 90
        Height = 31
        Caption = #39044#35272'(&V)'
        TabOrder = 5
        OnClick = btnPreviewClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF00000000000000000000000000000000000000000000
          0000000000000000000000000000FF00FFFF00FF000000000000000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00
          FF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF0000000000000000000000007F7F7F000000000000FF00FF000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FBFBFBFBFBFBF7F7F7F0000
          007F7F7FFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F
          7F7FBFBFBFBFBFBFFFFF007F7F7F7F7F7F000000FF00FFFF00FF000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBF7F7F7FBFBF
          BF000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BF
          BFBFFFFF00BFBFBFBFBFBF7F7F7FBFBFBF000000FF00FFFF00FF000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FFFFF00FFFF00BFBFBF7F7F7F7F7F
          7F000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          00007F7F7FBFBFBFBFBFBF7F7F7F000000FF00FFFF00FFFF00FF000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FF00
          FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FF00
          FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000BFBFBF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF00000000000000000000000000000000000000000000
          0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
    end
  end
  object pnlColWidth: TPanel
    Tag = 1
    Left = 3
    Top = 363
    Width = 596
    Height = 172
    BevelOuter = bvNone
    Caption = 'pnlColWidth'
    TabOrder = 0
    object Panel7: TPanel
      Left = 0
      Top = 131
      Width = 596
      Height = 41
      Align = alBottom
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = #25552#31034': '#29992#40736#26631#25302#21160#26639#30446#26631#39064#38388#30340#22362#32447#65292#21363#21487#35843#25972#23485#24230#12290
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        596
        41)
      object btnSaveColWidth: TButton
        Left = 521
        Top = 9
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #30830#35748
        Default = True
        TabOrder = 0
        OnClick = btnSaveColWidthClick
      end
    end
    object Panel8: TPanel
      Left = 0
      Top = 0
      Width = 596
      Height = 41
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = #26639#30446#23485#24230#35774#32622': '
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object dbgColWidth: TDBGrid
      Left = 0
      Top = 41
      Width = 596
      Height = 90
      Align = alClient
      Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
    end
  end
  object FileListBox1: TFileListBox
    Left = 606
    Top = 360
    Width = 145
    Height = 169
    ItemHeight = 15
    TabOrder = 2
  end
  object YmRich_P: TRichEdit
    Tag = 1
    Left = 192
    Top = 366
    Width = 49
    Height = 25
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssHorizontal
    TabOrder = 3
    WordWrap = False
    OnSelectionChange = RichSelectionChange
  end
  object mmoTmp: TMemo
    Tag = 1
    Left = 132
    Top = 366
    Width = 55
    Height = 25
    Lines.Strings = (
      'mmoTmp')
    TabOrder = 4
  end
  object BtRich_P: TRichEdit
    Tag = 1
    Left = 246
    Top = 366
    Width = 49
    Height = 25
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssHorizontal
    TabOrder = 5
    WordWrap = False
    OnSelectionChange = RichSelectionChange
  end
  object BgbtRich_P: TRichEdit
    Tag = 1
    Left = 300
    Top = 366
    Width = 49
    Height = 25
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssHorizontal
    TabOrder = 6
    WordWrap = False
    OnSelectionChange = RichSelectionChange
  end
  object BwRich_P: TRichEdit
    Tag = 1
    Left = 354
    Top = 366
    Width = 49
    Height = 25
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssHorizontal
    TabOrder = 7
    WordWrap = False
    OnSelectionChange = RichSelectionChange
  end
  object YjRich_P: TRichEdit
    Tag = 1
    Left = 408
    Top = 366
    Width = 49
    Height = 25
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssHorizontal
    TabOrder = 8
    WordWrap = False
    OnSelectionChange = RichSelectionChange
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 708
    Top = 6
  end
  object ColorDialog1: TColorDialog
    Left = 738
    Top = 6
  end
  object pmnXm: TPopupMenu
    AutoHotkeys = maManual
    Left = 648
    Top = 6
  end
  object ToolbarImages: TImageList
    Left = 618
    Top = 6
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000840000000000000000000000FFFF
      0000FFFFFF00FFFF0000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008400000084000000840000008400000000000000FFFF
      FF00FFFF0000FFFFFF00FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00000000000000000000000000FFFF
      FF00840000008400000084000000840000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF00840000008400000084000000840000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000840000008400
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      8400008484000000000000000000000000000000000000000000840000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF03FF
      FFFFFFFF8FFF03FFC007C0078C0303FFFFFFFFFF8FFF03FFF83FF807FFFF03FF
      FFFFFFFFFFFF03FFC007C0078FFF0340FFFFFFFF8C03FE40F01FF8078FFFFC00
      FFFFFFFFFFFFFE40C007C007FFFF037FFFFFFFFF8FFF03FFF83FF8078C0303FF
      FFFFFFFF8FFF03FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFE00FFFFFFFFFFFFFFFFFC007F00F81FFF83FFFFFF8C7E3FFF39FC03F
      F8C7F1FFF39FFFFFF8C7F8FFF39FC007F80FFC7FF39FFFFFF8C7FE3FF39FC03F
      F8C7FF1FF39FFFFFF8C7FF8FF39FC007F00FFF03E10FFFFFFFFFFFFFFFFFC03F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FFFFFFFC00
      FFFFF6CFFE008000FFFFF6B7FE000000FFFFF6B7FE000000FFF7F8B780000000
      C1F7FE8F80000001C3FBFE3F80000003C7FBFF7F80000003CBFBFE3F80010003
      DCF7FEBF80030003FF0FFC9F80070FC3FFFFFDDF807F0003FFFFFDDF80FF8007
      FFFFFDDF81FFF87FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC001C007
      C007001F8031BFEBC007000F80310005C007000780317E31C007000380017E35
      C007000180010006C007000080017FEAC007001F8FF18014C007001F8FF1C00A
      C007001F8FF1E001C0078FF18FF1E007C00FFFF98FF1F007C01FFF758FF5F003
      C03FFF8F8001F803FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object pmnAdd: TPopupMenu
    AutoHotkeys = maManual
    Left = 678
    Top = 6
  end
end
