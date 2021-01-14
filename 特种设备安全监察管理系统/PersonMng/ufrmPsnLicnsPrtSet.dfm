object frmPsnLicnsPrtSet: TfrmPsnLicnsPrtSet
  Left = 405
  Top = 316
  Width = 315
  Height = 186
  Caption = #36164#36136#25171#21360#35774#32622
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
  object scrbDetail: TScrollBox
    Left = 0
    Top = 0
    Width = 307
    Height = 131
    Align = alClient
    TabOrder = 0
    object Label14: TLabel
      Left = 32
      Top = 38
      Width = 108
      Height = 12
      Alignment = taRightJustify
      Caption = #36164#36136#39033#30446#25171#21360#20301#32622#65306
    end
    object Label1: TLabel
      Left = 32
      Top = 62
      Width = 108
      Height = 12
      Alignment = taRightJustify
      Caption = #32856#29992#24773#20917#25171#21360#24773#20917#65306
    end
    object Label2: TLabel
      Left = 32
      Top = 86
      Width = 108
      Height = 12
      Alignment = taRightJustify
      Caption = #23457#26597#22791#26696#25171#21360#20301#32622#65306
    end
    object Label3: TLabel
      Left = 56
      Top = 16
      Width = 84
      Height = 12
      Alignment = taRightJustify
      Caption = #26159#21542#25171#21360#39318#39029#65306
    end
    object Label4: TLabel
      Left = 190
      Top = 38
      Width = 12
      Height = 12
      Alignment = taRightJustify
      Caption = #39029
    end
    object Label5: TLabel
      Left = 259
      Top = 38
      Width = 12
      Height = 12
      Alignment = taRightJustify
      Caption = #34892
    end
    object Label6: TLabel
      Left = 190
      Top = 62
      Width = 12
      Height = 12
      Alignment = taRightJustify
      Caption = #39029
    end
    object Label7: TLabel
      Left = 259
      Top = 62
      Width = 12
      Height = 12
      Alignment = taRightJustify
      Caption = #34892
    end
    object Label8: TLabel
      Left = 190
      Top = 86
      Width = 12
      Height = 12
      Alignment = taRightJustify
      Caption = #39029
    end
    object Label9: TLabel
      Left = 259
      Top = 86
      Width = 12
      Height = 12
      Alignment = taRightJustify
      Caption = #34892
    end
    object cboPrjPage: TComboBox
      Left = 140
      Top = 34
      Width = 49
      Height = 20
      Enabled = False
      ItemHeight = 12
      TabOrder = 0
      Items.Strings = (
        '1'
        '2'
        '3')
    end
    object cboPrjLine: TComboBox
      Left = 208
      Top = 34
      Width = 49
      Height = 20
      Enabled = False
      ItemHeight = 12
      TabOrder = 1
      Items.Strings = (
        '1'
        '2'
        '3'
        '4')
    end
    object cboEngPage: TComboBox
      Left = 140
      Top = 58
      Width = 49
      Height = 20
      Enabled = False
      ItemHeight = 12
      TabOrder = 2
      Items.Strings = (
        '1'
        '2')
    end
    object cboEngLine: TComboBox
      Left = 208
      Top = 58
      Width = 49
      Height = 20
      Enabled = False
      ItemHeight = 12
      TabOrder = 3
      Items.Strings = (
        '1'
        '2'
        '3'
        '4')
    end
    object cboChkPage: TComboBox
      Left = 140
      Top = 82
      Width = 49
      Height = 20
      Enabled = False
      ItemHeight = 12
      TabOrder = 4
      Items.Strings = (
        '1'
        '2')
    end
    object cboChkLine: TComboBox
      Left = 208
      Top = 82
      Width = 49
      Height = 20
      Enabled = False
      ItemHeight = 12
      TabOrder = 5
      Items.Strings = (
        '1'
        '2'
        '3'
        '4')
    end
    object radYes: TRadioButton
      Left = 140
      Top = 14
      Width = 37
      Height = 17
      Caption = #26159
      TabOrder = 6
    end
    object radNo: TRadioButton
      Left = 180
      Top = 14
      Width = 37
      Height = 17
      Caption = #21542
      TabOrder = 7
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 131
    Width = 307
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel4: TPanel
      Left = 152
      Top = 1
      Width = 154
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbtnClose: TBitBtn
        Left = 77
        Top = 2
        Width = 75
        Height = 22
        Hint = #20851#38381#24403#21069#31383#21475
        Caption = #20851#38381'(&C)'
        TabOrder = 0
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
end
