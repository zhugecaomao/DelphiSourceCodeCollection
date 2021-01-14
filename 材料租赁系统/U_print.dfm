object frmPrint: TfrmPrint
  Left = 331
  Top = 277
  BorderStyle = bsDialog
  Caption = #25171#21360#36873#25321#31383#21475
  ClientHeight = 186
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 386
    Height = 126
    Align = alClient
    TabOrder = 0
    object edtTitle: TLabeledEdit
      Left = 56
      Top = 16
      Width = 305
      Height = 20
      EditLabel.Width = 36
      EditLabel.Height = 12
      EditLabel.Caption = #26631#39064#65306
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object edtPname: TLabeledEdit
      Left = 64
      Top = 56
      Width = 121
      Height = 20
      EditLabel.Width = 48
      EditLabel.Height = 12
      EditLabel.Caption = #21046#34920#20154#65306
      LabelPosition = lpLeft
      TabOrder = 1
    end
    object edtDate: TLabeledEdit
      Left = 72
      Top = 88
      Width = 121
      Height = 20
      EditLabel.Width = 60
      EditLabel.Height = 12
      EditLabel.Caption = #25171#21360#26085#26399#65306
      LabelPosition = lpLeft
      TabOrder = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 167
    Width = 386
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 126
    Width = 386
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnPrint: TBitBtn
      Left = 224
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btnPrintClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object btnCancel: TBitBtn
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btnCancelClick
      Kind = bkCancel
    end
  end
end
