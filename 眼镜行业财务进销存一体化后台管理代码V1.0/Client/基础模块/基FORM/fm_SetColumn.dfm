object fmSetColumn: TfmSetColumn
  Left = 246
  Top = 158
  Width = 257
  Height = 342
  BorderIcons = [biSystemMenu]
  Caption = #26639#30446#24067#23616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CheckListBox1: TCheckListBox
    Left = 0
    Top = 0
    Width = 145
    Height = 315
    Align = alLeft
    Color = clCream
    DragMode = dmAutomatic
    ItemHeight = 13
    TabOrder = 0
    OnDragDrop = CheckListBox1DragDrop
    OnDragOver = CheckListBox1DragOver
  end
  object Panel1: TPanel
    Left = 145
    Top = 0
    Width = 104
    Height = 315
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label3: TLabel
      Left = 12
      Top = 103
      Width = 38
      Height = 15
      Caption = #25552#31034':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 35
      Top = 127
      Width = 45
      Height = 15
      Caption = #19981#26174#31034
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 36
      Top = 152
      Width = 30
      Height = 15
      Caption = #26174#31034
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Image1: TImage
      Left = 11
      Top = 151
      Width = 16
      Height = 16
      AutoSize = True
      Enabled = False
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
      Left = 11
      Top = 127
      Width = 16
      Height = 16
      AutoSize = True
      Enabled = False
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
    object Bevel1: TBevel
      Left = 8
      Top = 95
      Width = 88
      Height = 2
    end
    object Bevel2: TBevel
      Left = 7
      Top = 176
      Width = 88
      Height = 2
    end
    object btnUp: TBitBtn
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = #19978#31227
      TabOrder = 0
      OnClick = btnUpClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADADADADAADADADADADADADADDADAD00000DA
        DADAADADA06660ADADADDADAD06660DADADAADADA06660ADADADDA0000666000
        0ADAADA066666660ADADDADA0666660ADADAADADA06660ADADADDADADA060ADA
        DADAADADADA0ADADADADDADADADADADADADAADADADADADADADAD}
    end
    object btnDown: TBitBtn
      Left = 16
      Top = 48
      Width = 75
      Height = 25
      Caption = #19979#31227
      TabOrder = 1
      OnClick = btnDownClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADADADADAADADADADADADADADDADADAD0DADA
        DADAADADAD060DADADADDADAD06660DADADAADAD0666660DADADDAD066666660
        DADAAD00006660000DADDADAD06660DADADAADADA06660ADADADDADAD06660DA
        DADAADADA00000ADADADDADADADADADADADAADADADADADADADAD}
    end
    object btnOk: TBitBtn
      Left = 16
      Top = 205
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 2
      OnClick = btnOkClick
      Kind = bkOK
    end
    object btnCancel: TBitBtn
      Left = 16
      Top = 237
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 3
      Kind = bkCancel
    end
  end
end
