object CddmForm: TCddmForm
  Left = 32
  Top = 70
  Width = 700
  Height = 450
  Caption = #31995#32479#35774#32622
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 31
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 0
    object lblTitle: TLabel
      Left = 264
      Top = 5
      Width = 93
      Height = 21
      Caption = #33756#21333#23450#20041
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 31
    Width = 692
    Height = 357
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 682
      Height = 347
      Align = alClient
      DataSource = dsCddm
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_MJ'
          PickList.Strings = (
            'T'
            'F')
          Title.Alignment = taCenter
          Title.Caption = #26159#21542#26411#32423
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_CDBH'
          Title.Alignment = taCenter
          Title.Caption = #33756#21333#32534#21495
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_CDMC'
          Title.Alignment = taCenter
          Title.Caption = #33756#21333#21517#31216
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_DJ1'
          Title.Alignment = taCenter
          Title.Caption = #21333#20215#65288#22823#65289
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_DJ2'
          Title.Alignment = taCenter
          Title.Caption = #21333#20215#65288#20013#65289
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_DJ3'
          Title.Alignment = taCenter
          Title.Caption = #21333#20215#65288#23567#65289
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XMMC'
          Title.Alignment = taCenter
          Title.Caption = #39033#30446#31867#21035
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_DM'
          Title.Alignment = taCenter
          Title.Caption = #20195#30721
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 388
    Width = 692
    Height = 35
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      692
      35)
    object btnClose: TBitBtn
      Left = 612
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object btnPrint: TBitBtn
      Left = 532
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360'(&P)'
      TabOrder = 1
      OnClick = btnPrintClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888F8800000000000888808888888880808800000000000008080888888BBB88
        0008088888877788080800000000000008800888888888808080800000000008
        0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
        088888880FFFFFFFF08888888000000000888888888888888888}
    end
  end
  object tblCddm: TTable
    BeforePost = tblCddmBeforePost
    OnNewRecord = tblCddmNewRecord
    DatabaseName = 'LfHotelUser'
    TableName = 'CDDM'
    Left = 168
    Top = 136
    object tblCddmD_XMMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XMMC'
      LookupDataSet = CtData.tblCtxm
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
    object tblCddmD_CDBH: TStringField
      FieldName = 'D_CDBH'
      Required = True
      Size = 5
    end
    object tblCddmD_MJ: TStringField
      FieldName = 'D_MJ'
      FixedChar = True
      Size = 1
    end
    object tblCddmD_CDMC: TStringField
      FieldName = 'D_CDMC'
    end
    object tblCddmD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Size = 5
    end
    object tblCddmD_DJ1: TFloatField
      FieldName = 'D_DJ1'
      DisplayFormat = '0.00'
    end
    object tblCddmD_DJ2: TFloatField
      FieldName = 'D_DJ2'
      DisplayFormat = '0.00'
    end
    object tblCddmD_DJ3: TFloatField
      FieldName = 'D_DJ3'
      DisplayFormat = '0.00'
    end
    object tblCddmD_DM: TStringField
      FieldName = 'D_DM'
      Size = 10
    end
    object tblCddmD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
  end
  object dsCddm: TDataSource
    DataSet = tblCddm
    OnStateChange = dsCddmStateChange
    Left = 208
    Top = 136
  end
  object DosMove1: TDosMove
    Active = True
    Options = [moEnter]
    Left = 136
    Top = 136
  end
end
