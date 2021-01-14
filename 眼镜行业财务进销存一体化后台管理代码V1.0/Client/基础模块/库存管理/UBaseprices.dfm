inherited fmBaseprices: TfmBaseprices
  Left = 181
  Top = 120
  Caption = #20215#26684#26041#24335#35774#32622
  ClientWidth = 402
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Pc1: TPageControl
    Left = 0
    Top = 0
    Width = 402
    Height = 348
    ActivePage = TabShop
    Align = alClient
    TabIndex = 1
    TabOrder = 0
    object TabManager: TTabSheet
      Caption = #24635#20844#21496#35774#23450
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 394
        Height = 131
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 22
          Top = 64
          Width = 104
          Height = 13
          Caption = #12304#38646#21806#20215#26684#35774#32622#12305
        end
        object Gridbase1: TStringGrid
          Left = 136
          Top = 2
          Width = 255
          Height = 127
          ColCount = 2
          Ctl3D = False
          RowCount = 11
          ParentCtl3D = False
          TabOrder = 0
          OnDblClick = Gridbase1DblClick
          OnDrawCell = Gridbase1DrawCell
          OnSelectCell = Gridbase1SelectCell
          RowHeights = (
            24
            24
            24
            24
            24
            24
            24
            24
            24
            24
            24)
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 131
        Width = 394
        Height = 189
        Align = alClient
        TabOrder = 1
        object Label2: TLabel
          Left = 25
          Top = 48
          Width = 104
          Height = 13
          Caption = #12304#25209#21457#20215#26684#35774#32622#12305
        end
        object Gridbase2: TStringGrid
          Left = 136
          Top = 2
          Width = 255
          Height = 157
          ColCount = 2
          Ctl3D = False
          RowCount = 10
          ParentCtl3D = False
          TabOrder = 0
          OnDblClick = Gridbase2DblClick
          OnDrawCell = Gridbase1DrawCell
          OnSelectCell = Gridbase1SelectCell
          RowHeights = (
            24
            24
            24
            24
            24
            24
            24
            24
            24
            24)
        end
        object btnOk: TBitBtn
          Left = 238
          Top = 161
          Width = 75
          Height = 25
          Caption = #30830#23450
          Default = True
          TabOrder = 1
          OnClick = btnOkClick
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
        object btnCancel: TBitBtn
          Left = 312
          Top = 161
          Width = 75
          Height = 25
          Caption = #21462#28040
          TabOrder = 2
          OnClick = btnCancelClick
          Kind = bkCancel
        end
      end
    end
    object TabShop: TTabSheet
      Caption = #38376#24215#21333#29420#35774#23450
      ImageIndex = 1
      object BitBtn1: TBitBtn
        Left = 246
        Top = 284
        Width = 75
        Height = 25
        Caption = #30830#23450
        Default = True
        TabOrder = 0
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
      object BitBtn2: TBitBtn
        Left = 320
        Top = 284
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 1
        OnClick = btnCancelClick
        Kind = bkCancel
      end
      object Pc2: TPageControl
        Left = 0
        Top = 0
        Width = 394
        Height = 320
        ActivePage = Tabpart
        Align = alClient
        MultiLine = True
        TabIndex = 0
        TabOrder = 2
        TabPosition = tpLeft
        object Tabpart: TTabSheet
          Caption = #36873#25321#37096#38376#25110#38376#24215
          object Cmd_JSR: TSpeedButton
            Left = 274
            Top = 88
            Width = 29
            Height = 20
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333333333333333333333333333333333333333333FF333333333333
              3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
              E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
              E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
              E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
              000033333373FF77777733333330003333333333333777333333333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = Cmd_JSRClick
          end
          object Label5: TLabel
            Left = 40
            Top = 16
            Width = 288
            Height = 16
            Caption = #38024#23545#29305#27530#24773#20917#65292#29992#20110#38376#24215#25311#20215#19981#21516#30340#36816#29992
            Font.Charset = GB2312_CHARSET
            Font.Color = clNavy
            Font.Height = -16
            Font.Name = #38582#20070
            Font.Style = []
            ParentFont = False
          end
          object Cmd_Storage_Up: TSpeedButton
            Left = 70
            Top = 217
            Width = 75
            Height = 25
            Caption = #19978#19968#27493
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333FF3333333333333003333333333333F77F33333333333009033
              333333333F7737F333333333009990333333333F773337FFFFFF330099999000
              00003F773333377777770099999999999990773FF33333FFFFF7330099999000
              000033773FF33777777733330099903333333333773FF7F33333333333009033
              33333333337737F3333333333333003333333333333377333333333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
          end
          object Cmd_Storage_Down: TSpeedButton
            Left = 153
            Top = 217
            Width = 75
            Height = 25
            Caption = #19979#19968#27493
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333FF3333333333333003333
              3333333333773FF3333333333309003333333333337F773FF333333333099900
              33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
              99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
              33333333337F3F77333333333309003333333333337F77333333333333003333
              3333333333773333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = Cmd_Storage_DownClick
          end
          object SpeedButton3: TSpeedButton
            Left = 251
            Top = 217
            Width = 75
            Height = 25
            Caption = #21462#28040
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
            OnClick = btnCancelClick
          end
          object Edit_Storage_Name: TLabeledEdit
            Left = 97
            Top = 88
            Width = 174
            Height = 21
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = #36873#25321#20179#24211#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ReadOnly = True
            TabOrder = 0
          end
          object Edit_Storage_NO: TEdit
            Left = 97
            Top = 136
            Width = 175
            Height = 21
            Enabled = False
            ReadOnly = True
            TabOrder = 1
            Visible = False
          end
          object edtshop: TEdit
            Left = 98
            Top = 112
            Width = 174
            Height = 21
            ReadOnly = True
            TabOrder = 2
          end
        end
        object Tabprice: TTabSheet
          Caption = #20215#26684#27169#24335
          ImageIndex = 2
          object Label4: TLabel
            Left = 146
            Top = 8
            Width = 64
            Height = 16
            Caption = #20215#26684#35774#32622
            Font.Charset = GB2312_CHARSET
            Font.Color = clNavy
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object SpeedButton8: TSpeedButton
            Left = 40
            Top = 273
            Width = 75
            Height = 25
            Caption = #19978#19968#27493
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333FF3333333333333003333333333333F77F33333333333009033
              333333333F7737F333333333009990333333333F773337FFFFFF330099999000
              00003F773333377777770099999999999990773FF33333FFFFF7330099999000
              000033773FF33777777733330099903333333333773FF7F33333333333009033
              33333333337737F3333333333333003333333333333377333333333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = SpeedButton8Click
          end
          object Sgridbase: TStringGrid
            Left = 7
            Top = 34
            Width = 354
            Height = 228
            ColCount = 2
            Ctl3D = False
            RowCount = 11
            ParentCtl3D = False
            TabOrder = 0
            OnDblClick = SgridbaseDblClick
            OnDrawCell = Gridbase1DrawCell
            OnSelectCell = Gridbase1SelectCell
            RowHeights = (
              24
              24
              24
              24
              24
              24
              24
              24
              24
              24
              24)
          end
          object BitBtn3: TBitBtn
            Left = 128
            Top = 273
            Width = 75
            Height = 25
            Caption = #23436#25104
            Default = True
            TabOrder = 1
            OnClick = BitBtn3Click
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
          object BitBtn4: TBitBtn
            Left = 250
            Top = 273
            Width = 75
            Height = 25
            Caption = #21462#28040
            TabOrder = 2
            OnClick = btnCancelClick
            Kind = bkCancel
          end
        end
      end
    end
  end
  object cdsdata: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 8
  end
end
