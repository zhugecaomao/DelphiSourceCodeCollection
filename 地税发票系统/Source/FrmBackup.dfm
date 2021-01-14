object Backup: TBackup
  Left = 334
  Top = 250
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25968#25454#22791#20221
  ClientHeight = 242
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPageControl1: TAdvPageControl
    Left = 0
    Top = 0
    Width = 329
    Height = 241
    ActivePage = AdvTabSheet3
    ActiveFont.Charset = DEFAULT_CHARSET
    ActiveFont.Color = clWindowText
    ActiveFont.Height = -11
    ActiveFont.Name = 'Tahoma'
    ActiveFont.Style = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabBackGroundColor = clBtnFace
    TabMargin.RightMargin = 0
    TabOverlap = 0
    Version = '1.5.0.0'
    TabOrder = 0
    object AdvTabSheet1: TAdvTabSheet
      Caption = 'Access'#25968#25454#24211
      Color = clBtnFace
      ColorTo = clNone
      TabColor = clBtnFace
      TabColorTo = clNone
      object Label3: TLabel
        Left = 45
        Top = 146
        Width = 48
        Height = 13
        Caption = #36873#25321#22791#65306
      end
      object RichEdit2: TRichEdit
        Left = 24
        Top = 0
        Width = 273
        Height = 105
        Color = clScrollBar
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          #35828#26126':')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object RadioButton3: TRadioButton
        Left = 40
        Top = 115
        Width = 73
        Height = 17
        Caption = #22791#20221
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object RadioButton4: TRadioButton
        Left = 192
        Top = 115
        Width = 49
        Height = 17
        Caption = #36824#21407
        TabOrder = 2
      end
      object BitBtn5: TBitBtn
        Left = 170
        Top = 184
        Width = 75
        Height = 25
        Cancel = True
        Caption = #36864#20986
        ModalResult = 2
        TabOrder = 6
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
      object BitBtn6: TBitBtn
        Left = 44
        Top = 184
        Width = 75
        Height = 25
        Caption = #30830#23450
        Default = True
        ModalResult = 1
        TabOrder = 5
        OnClick = BitBtn6Click
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
      object Edit2: TEdit
        Left = 92
        Top = 144
        Width = 149
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 3
      end
      object Button2: TButton
        Left = 225
        Top = 145
        Width = 18
        Height = 18
        Caption = '......'
        TabOrder = 4
        OnClick = Button2Click
      end
    end
    object AdvTabSheet2: TAdvTabSheet
      Caption = 'SQL'#25968#25454#24211
      Color = clBtnFace
      ColorTo = clNone
      TabColor = clBtnFace
      TabColorTo = clNone
      object Label1: TLabel
        Left = 45
        Top = 146
        Width = 48
        Height = 13
        Caption = #36873#25321#22791#65306
      end
      object Edit1: TEdit
        Left = 92
        Top = 144
        Width = 149
        Height = 21
        TabOrder = 3
      end
      object Button1: TButton
        Left = 225
        Top = 145
        Width = 18
        Height = 18
        Caption = '......'
        TabOrder = 4
      end
      object RadioButton1: TRadioButton
        Left = 40
        Top = 115
        Width = 73
        Height = 17
        Caption = #22791#20221
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object RadioButton2: TRadioButton
        Left = 192
        Top = 115
        Width = 49
        Height = 17
        Caption = #36824#21407
        TabOrder = 2
      end
      object RichEdit1: TRichEdit
        Left = 24
        Top = 0
        Width = 273
        Height = 105
        Color = clScrollBar
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          #35828#26126':')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 44
        Top = 184
        Width = 75
        Height = 25
        Caption = #30830#23450
        Default = True
        ModalResult = 1
        TabOrder = 5
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
        Left = 170
        Top = 184
        Width = 75
        Height = 25
        Cancel = True
        Caption = #36864#20986
        ModalResult = 2
        TabOrder = 6
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
    object AdvTabSheet3: TAdvTabSheet
      Caption = #25968#25454#24211#21387#32553'(Access)'
      Color = clBtnFace
      ColorTo = clNone
      TabColor = clBtnFace
      TabColorTo = clNone
      object Label2: TLabel
        Left = 51
        Top = 61
        Width = 222
        Height = 17
        AutoSize = False
        Caption = #27491#22312#36827#34892#25968#25454#21387#32553'......'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object BitBtn3: TBitBtn
        Left = 64
        Top = 120
        Width = 75
        Height = 25
        Caption = #21387'    '#32553
        TabOrder = 0
        OnClick = BitBtn3Click
        Kind = bkOK
      end
      object BitBtn4: TBitBtn
        Left = 168
        Top = 120
        Width = 75
        Height = 25
        Caption = #36864'    '#20986
        TabOrder = 1
        OnClick = BitBtn4Click
        Kind = bkCancel
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 132
    Top = 56
  end
  object SaveDialog1: TSaveDialog
    Left = 164
    Top = 56
  end
end
