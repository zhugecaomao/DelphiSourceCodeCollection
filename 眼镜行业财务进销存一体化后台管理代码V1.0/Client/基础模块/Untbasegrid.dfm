inherited fmBasegrid: TfmBasegrid
  Left = 183
  Top = 112
  Caption = #21333#25454#26639#30446#24067#23616
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 273
    Height = 345
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    object Gridbase: TStringGrid
      Left = 2
      Top = 0
      Width = 270
      Height = 342
      ColCount = 4
      Ctl3D = False
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      ParentCtl3D = False
      TabOrder = 0
      OnDblClick = GridbaseDblClick
      OnDrawCell = GridbaseDrawCell
      OnKeyPress = GridbaseKeyPress
      OnSelectCell = GridbaseSelectCell
      ColWidths = (
        64
        68
        61
        69)
    end
  end
  object Panel2: TPanel
    Left = 274
    Top = 0
    Width = 262
    Height = 345
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 1
    object RD: TRadioGroup
      Left = 8
      Top = 8
      Width = 249
      Height = 301
      Caption = #21333#25454#21517#31216
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #21830#21697#38656#27714
        #37319#36141#21512#21516
        #26469#36135#30331#35760
        #36136#37327#39564#25910
        #37319#36141#36864#36135
        #37319#36141#20837#24211
        #36130#21153#20837#24211
        #38750#33829#19994#24615#20986#24211
        #38750#33829#19994#24615#20837#24211
        #21830#21697#25253#25439
        #21830#21697#25253#28322
        #37197#36865#30003#35831
        #37197#36865#21333
        #26032#24215#38138#36135
        #24211#23384#36864#36135
        #36130#21153#36864#36135)
      TabOrder = 0
      OnClick = RDClick
    end
    object btnOk: TBitBtn
      Left = 99
      Top = 310
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
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
      Left = 179
      Top = 310
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 2
      OnClick = btnCancelClick
      Kind = bkCancel
    end
  end
end
