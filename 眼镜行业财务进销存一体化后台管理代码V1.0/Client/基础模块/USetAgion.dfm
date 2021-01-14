inherited fmSetAgion: TfmSetAgion
  Left = 200
  Top = 127
  Caption = #21592#24037#25240#25187#35774#32622
  ClientWidth = 527
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 201
    Height = 307
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object TreeBase: TTreeView
      Left = 0
      Top = 0
      Width = 201
      Height = 307
      Align = alClient
      BorderStyle = bsNone
      Color = clCream
      HotTrack = True
      Indent = 19
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      OnClick = TreeBaseClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 120
      Height = 19
      Caption = #20154#21592#25240#25187#35774#32622
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = #21326#25991#34892#26999
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object GroupBox1: TGroupBox
    Left = 201
    Top = 41
    Width = 326
    Height = 307
    Align = alClient
    Caption = #25240#25187#20449#24687
    TabOrder = 2
    object Label2: TLabel
      Left = 264
      Top = 59
      Width = 7
      Height = 13
      Caption = '%'
    end
    object Label3: TLabel
      Left = 262
      Top = 101
      Width = 13
      Height = 13
      Caption = #65509
    end
    object btnOk: TBitBtn
      Left = 171
      Top = 274
      Width = 75
      Height = 25
      Caption = #30830#23450
      Default = True
      TabOrder = 0
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
      Left = 247
      Top = 274
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btnCancelClick
      Kind = bkCancel
    end
    object edtagion: TLabeledEditint
      Left = 104
      Top = 56
      Width = 153
      Height = 21
      EditLabel.Width = 65
      EditLabel.Height = 13
      EditLabel.Caption = #26368#22823#25240#25187#29575
      EditLabel.Transparent = True
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 2
    end
    object edtmoney: TLabeledEditint
      Left = 104
      Top = 94
      Width = 153
      Height = 21
      EditLabel.Width = 78
      EditLabel.Height = 13
      EditLabel.Caption = #26368#22823#25240#25187#37329#39069
      EditLabel.Transparent = True
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 3
    end
  end
  object cdsdata: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 16
  end
end
