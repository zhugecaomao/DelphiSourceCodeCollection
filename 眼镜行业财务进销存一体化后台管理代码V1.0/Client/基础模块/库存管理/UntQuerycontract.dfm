inherited fmQuerycontract: TfmQuerycontract
  Left = 116
  Top = 82
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #37319#36141#21512#21516#26597#35810
  ClientHeight = 399
  ClientWidth = 652
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 358
    Width = 652
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      652
      41)
    object BitBtn1: TBitBtn
      Left = 493
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #30830#23450
      Default = True
      ModalResult = 1
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
      Left = 569
      Top = 8
      Width = 74
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
      OnClick = BitBtn2Click
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
    object BitBtn11: TBitBtn
      Left = 421
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #26639#30446#24067#23616
      TabOrder = 2
      OnClick = BitBtn11Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADAD000000000ADADADA0FFFFFFF0DADA0000F00F
        00F0ADAD0FF0FFFFFFF0D0000F00F00F00F0A0FF0FF0FFFFFFF0D0F00F00F00F
        00F0A0FF0FF0FFFFFFF0D0F00F0000000000A0FF0FFFFFFF0DADD0F000000000
        0ADAA0FFFFFFF0ADADADD000000000DADADAADADADADADADADAD}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 358
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 652
      Height = 358
      Align = alClient
      DataSource = dsview
      FixedColor = clSkyBlue
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnTitleClick = DBGrid2TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Goods_NO'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#32534#21495
          Width = 192
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Goods_Name'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#21517#31216
          Width = 169
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Goods_amount'
          Title.Alignment = taCenter
          Title.Caption = #37319#36141#25968#37327
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Price'
          Title.Alignment = taCenter
          Title.Caption = #37319#36141#20215#26684
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BarCode'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#26465#30721
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Provider'
          Title.Alignment = taCenter
          Title.Caption = #29983#20135#21378#23478
          Visible = True
        end>
    end
  end
  object dsview: TDataSource
    DataSet = dmmain.CDSquery
    Left = 368
    Top = 128
  end
end
