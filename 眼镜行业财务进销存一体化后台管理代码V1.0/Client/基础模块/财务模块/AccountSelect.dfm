object AccountSelectFm: TAccountSelectFm
  Left = 72
  Top = 71
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #12304#24080#25143#31649#29702#12305
  ClientHeight = 430
  ClientWidth = 692
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 588
    Height = 430
    Align = alClient
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 586
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      Color = clGradientActiveCaption
      TabOrder = 0
      DesignSize = (
        586
        24)
      object Label1: TLabel
        Left = 8
        Top = 7
        Width = 48
        Height = 12
        Caption = #20998#31867#36335#24452
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 64
        Top = 3
        Width = 519
        Height = 18
        Anchors = [akLeft, akTop, akRight, akBottom]
      end
      object Label2: TLabel
        Left = 69
        Top = 5
        Width = 7
        Height = 13
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 25
      Width = 586
      Height = 404
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvLowered
      BorderWidth = 1
      Color = clGradientActiveCaption
      TabOrder = 1
      object Panel6: TPanel
        Left = 3
        Top = 3
        Width = 580
        Height = 398
        Align = alClient
        BevelWidth = 2
        BorderWidth = 2
        Color = cl3DLight
        TabOrder = 0
        object SupGrids1: TStringGrid
          Left = 4
          Top = 4
          Width = 572
          Height = 390
          Align = alClient
          BorderStyle = bsNone
          Color = clWhite
          ColCount = 4
          Ctl3D = False
          DefaultRowHeight = 17
          FixedColor = 16573127
          FixedCols = 0
          RowCount = 18
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goTabs, goRowSelect]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnDblClick = SupGrids1DblClick
          OnKeyDown = SupGrids1KeyDown
          OnMouseDown = SupGrids1MouseDown
          ColWidths = (
            30
            188
            138
            103)
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 588
    Top = 0
    Width = 104
    Height = 430
    Align = alRight
    BevelOuter = bvLowered
    Color = 16573127
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      104
      430)
    object Bevel3: TBevel
      Left = 7
      Top = 372
      Width = 89
      Height = 9
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsBottomLine
    end
    object BtnQuit: TSpeedButton
      Left = 16
      Top = 394
      Width = 75
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #36864#20986
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000000000007770330770000330777033077000033077703307700003
        30777033000000033077703333333333307770330000000330777030FFFFFFF0
        30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
        8077777CCC777700007777CCC77777777777777C777777777777}
      OnClick = BtnQuitClick
    end
    object BtnSelect: TSpeedButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = #36873#25321
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333FFF33F333FF3F330E0330FFFCCFCC33777FF7F3377F7730EEE030FFFC
        CFCC377777F7F33773770EEE0000FFFFFCCF777777773F33377FEEE0BFBF0FFF
        FCCF7777333373F337730E0BFBFBF0FFCCFF77733333373F77F330BFBFBFBF0F
        CCFF37F333333F7F773330FBFBFB0B0FFFFF37F3F33F737FFFFF30B0BF0FB000
        000037F73F73F777777730FB0BF0FB0FFFFF373F73F73F7F333F330030BF0F0F
        FF993F77373F737F3377CC33330BF00FFF9977FFF373F77F3F77CC993330009F
        99FF7777F337777F77F333993330F99F99FF3F77FF37F773773F993CC330FFF9
        9F9977F77F37F3377F77993CC330FFF99F997737733733377377}
      NumGlyphs = 2
      OnClick = BtnSelectClick
    end
    object BtnEdit: TSpeedButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = #20462#25913
      Flat = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555500005577777777777777777500005000000000000000007500005088
        80FFFFFF0FFFF0750000508180F4444F0F44F0750000508880FFFFFF0FFFF075
        0000508180F4444F0F44F0750000508880FFFFFF0FFFF0750000508180F4444F
        0F44F0750000508880FF0078088880750000508180F400007844807500005088
        80FF7008007880750000508180F4408FF80080750000508880FFF70FFF800075
        0000500000000008FF803007000050EEEEEEEE70880B43000000500000000000
        00FBB43000005555555555550BFFBB43000055555555555550BFFBB400005555
        55555555550BFFBB0000}
      Visible = False
      OnClick = BtnEditClick
    end
    object BtnAdd: TSpeedButton
      Left = 16
      Top = 48
      Width = 75
      Height = 23
      Caption = #28155#21152
      Flat = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000070000000000777777000000070FFFFFFFF0777777000000070FF
        FFFFFF0777777000000070F000000F0777777000000070F0FBFB000777777000
        000070F0BFBF0F0007777000000070F000000F0770077000000070FF0FF44444
        44444000000070FF0FF4FBFBFBFB4000000070FFF0F4BFBFBFBF4000000070FF
        F0F4FBFBFBFB4000000070000004BFBFBFBF4000000077777704444444444000
        000077777774F444444440000000777777744444444440000000777777777777
        777770000000}
      Visible = False
      OnClick = BtnEditClick
    end
    object BtnClassify: TSpeedButton
      Left = 16
      Top = 75
      Width = 75
      Height = 25
      Caption = #20998#31867
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000000000000070777777777777707078078078078070707F07F07F07
        F07070777777777777707078078078078070707F07F07F07F070707777777777
        777070700000000077707070FFFFFFF077707070000000007770707777777777
        7770770000000000000777777777777777777777777777777777}
      Visible = False
      OnClick = BtnEditClick
    end
    object Bevel2: TBevel
      Left = 11
      Top = 107
      Width = 89
      Height = 9
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsBottomLine
    end
    object SpeedButton1: TSpeedButton
      Left = 16
      Top = 123
      Width = 75
      Height = 25
      Caption = #21024#38500
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000000000000070777777777777707078078078078070707F07F07F07
        F07070777777777777707078078078078070707F07F07F07F070707777777777
        777070700000000077707070FFFFFFF077707070000000007770707777777777
        7770770000000000000777777777777777777777777777777777}
      Visible = False
      OnClick = SpeedButton1Click
    end
  end
  object ModifyExeCuter: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from MainTable'
    Params = <>
    ProviderName = 'ExeCuteProvder'
    Left = 48
    Top = 152
  end
end
