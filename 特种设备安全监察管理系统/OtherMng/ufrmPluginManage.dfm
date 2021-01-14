object frmPluginManage: TfrmPluginManage
  Left = 192
  Top = 133
  Width = 544
  Height = 375
  Caption = #25554#20214#31649#29702
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter
    Left = 265
    Top = 0
    Width = 3
    Height = 320
    Cursor = crSizeWE
  end
  object lbPlugins: TListBox
    Left = 0
    Top = 0
    Width = 265
    Height = 320
    Align = alLeft
    ItemHeight = 12
    MultiSelect = True
    TabOrder = 0
    OnClick = lbPluginsClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 320
    Width = 536
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object Panel2: TPanel
      Left = 381
      Top = 1
      Width = 154
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
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
    end
    object bbtnLoad: TBitBtn
      Left = 3
      Top = 3
      Width = 75
      Height = 22
      Caption = #36733#20837#25554#20214
      TabOrder = 0
      OnClick = bbtnLoadClick
    end
    object bbtnUnLoad: TBitBtn
      Left = 80
      Top = 3
      Width = 75
      Height = 22
      Caption = #21368#36733#25554#20214
      TabOrder = 1
      OnClick = bbtnUnLoadClick
    end
  end
  object mDescription: TMemo
    Left = 268
    Top = 0
    Width = 268
    Height = 320
    Align = alClient
    ReadOnly = True
    TabOrder = 1
  end
  object CSBarMDIChild1: TCSBarMDIChild
    Left = 28
    Top = 28
  end
  object opPlugins: TOpenDialog
    Filter = 'All files (*.*)|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Title = #35831#36873#25321#25554#20214
    Left = 60
    Top = 28
  end
  object PrgViewer: TCSPrgViewer
    ViewerType = pvt_textonly
    Left = 96
    Top = 28
  end
end
