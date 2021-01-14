object CtthForm: TCtthForm
  Left = 193
  Top = 107
  Width = 400
  Height = 375
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
    Width = 392
    Height = 31
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 0
    object lblTitle: TLabel
      Left = 120
      Top = 5
      Width = 139
      Height = 21
      Caption = #39184#21381#21488#21495#23450#20041
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
    Width = 392
    Height = 282
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 382
      Height = 272
      Align = alClient
      DataSource = dsCtdm
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
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
          FieldName = 'D_CTLB'
          PickList.Strings = (
            #39184#21381
            #21488#21495)
          Title.Alignment = taCenter
          Title.Caption = #31867#21035
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_CTBH'
          Title.Alignment = taCenter
          Title.Caption = #32534#21495
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_CTMC'
          Title.Alignment = taCenter
          Title.Caption = #21517#31216
          Width = 100
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_DM'
          Title.Alignment = taCenter
          Title.Caption = #20195#30721
          Width = 100
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 313
    Width = 392
    Height = 35
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      392
      35)
    object btnClose: TBitBtn
      Left = 312
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
      Left = 233
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
  object DosMove1: TDosMove
    Active = True
    Options = [moEnter]
    Left = 120
    Top = 72
  end
  object tblCtdm: TTable
    AfterPost = tblCtdmAfterPost
    BeforeDelete = tblCtdmBeforeDelete
    OnNewRecord = tblCtdmNewRecord
    DatabaseName = 'LfHotelUser'
    TableName = 'CTDM'
    Left = 176
    Top = 80
    object tblCtdmD_CTBH: TStringField
      FieldName = 'D_CTBH'
      Required = True
      Size = 5
    end
    object tblCtdmD_CTLB: TStringField
      FieldName = 'D_CTLB'
      Required = True
      Size = 4
    end
    object tblCtdmD_CTMC: TStringField
      FieldName = 'D_CTMC'
      Required = True
      Size = 10
    end
    object tblCtdmD_DM: TStringField
      FieldName = 'D_DM'
      Size = 10
    end
  end
  object dsCtdm: TDataSource
    DataSet = tblCtdm
    OnStateChange = dsCtdmStateChange
    Left = 208
    Top = 80
  end
  object tblCtzt: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'CTZT'
    Left = 240
    Top = 80
    object tblCtztD_CTBH: TStringField
      FieldName = 'D_CTBH'
      Required = True
      Size = 5
    end
    object tblCtztD_CTMC: TStringField
      FieldName = 'D_CTMC'
      Required = True
      Size = 10
    end
    object tblCtztD_CTZT: TStringField
      FieldName = 'D_CTZT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tblCtztD_DCBH: TStringField
      FieldName = 'D_DCBH'
      Size = 12
    end
    object tblCtztD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Size = 30
    end
    object tblCtztD_KRSL: TIntegerField
      FieldName = 'D_KRSL'
    end
    object tblCtztD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
    end
    object tblCtztD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
    end
    object tblCtztD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
    end
    object tblCtztD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
    end
  end
end
