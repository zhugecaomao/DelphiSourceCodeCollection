object frmbbsmx: Tfrmbbsmx
  Left = 206
  Top = 106
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #20844#21578#26495#20855#20307#20869#23481
  ClientHeight = 456
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 524
    Height = 456
    Align = alClient
    BevelOuter = bvNone
    Color = clCream
    TabOrder = 0
    object Panel2: TPanel
      Left = 16
      Top = 16
      Width = 495
      Height = 41
      BevelInner = bvRaised
      Color = 16772335
      TabOrder = 0
      object lzt: TLabel
        Left = 61
        Top = 15
        Width = 26
        Height = 13
        Caption = #20027#39064
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel
        Left = 15
        Top = 14
        Width = 48
        Height = 17
        Caption = #20027#39064#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = #21326#25991#34892#26999
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
    end
    object Panel3: TPanel
      Left = 16
      Top = 72
      Width = 497
      Height = 41
      BevelOuter = bvNone
      Color = 16772335
      TabOrder = 1
      object lfjname1: TLabel
        Left = 16
        Top = 16
        Width = 53
        Height = 17
        Caption = #38468#20214#21517':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = #21326#25991#34892#26999
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lfjname: TLabel
        Left = 75
        Top = 16
        Width = 46
        Height = 13
        Caption = #38468#20214#21517':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object SpeedButton1: TSpeedButton
        Left = 424
        Top = 10
        Width = 60
        Height = 22
        Caption = #19979#36733
        Enabled = False
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          000037777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
          FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF7777BBF
          FFF07F333777777F3FF70FFFFFFFB9BF1CC07F3FFF337F7377770F777FFFB99B
          C1C07F7773337F377F370FFFFFFFB9BBC1C07FFFFFFF7F337FF700000077B999
          B000777777777F33777733337377B9999B33333F733373F337FF3377377B99BB
          9BB33377F337F377377F3737377B9B79B9B737F73337F7F7F37F33733777BB7B
          BBB73373333377F37F3737333777BB777B9B3733333377F337F7333333777B77
          77BB3333333337333377333333333777337B3333333333333337}
        NumGlyphs = 2
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object Label1: TLabel
        Left = 240
        Top = 16
        Width = 69
        Height = 17
        Caption = #38468#20214#22823#23567':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = #21326#25991#34892#26999
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Lsize: TLabel
        Left = 315
        Top = 17
        Width = 59
        Height = 13
        Caption = #38468#20214#22823#23567':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
    end
    object Panel4: TPanel
      Left = 17
      Top = 128
      Width = 496
      Height = 313
      BevelOuter = bvNone
      Color = 16772335
      TabOrder = 2
      object Label4: TLabel
        Left = 16
        Top = 16
        Width = 48
        Height = 17
        Caption = #20869#23481#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = #21326#25991#34892#26999
        Font.Style = []
        ParentFont = False
      end
      object mmemo: TMemo
        Left = 8
        Top = 36
        Width = 481
        Height = 272
        BorderStyle = bsNone
        Color = 16772335
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object Save1: TSaveDialog
    Title = #19979#36733#33267
    Left = 488
    Top = 65528
  end
end
