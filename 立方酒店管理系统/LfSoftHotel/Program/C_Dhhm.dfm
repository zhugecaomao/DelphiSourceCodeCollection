object DhhmForm: TDhhmForm
  Left = 192
  Top = 107
  Width = 544
  Height = 375
  ActiveControl = edtValue
  Caption = #30005#35805#21495#30721#31807
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'System'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      536
      73)
    object Label1: TLabel
      Left = 192
      Top = 8
      Width = 156
      Height = 29
      Anchors = [akTop]
      Caption = #30005#35805#21495#30721#31807
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cmbOption: TComboBox
      Left = 3
      Top = 48
      Width = 100
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 0
      Text = #21517#31216
      Items.Strings = (
        #21517#31216
        #21495#30721)
    end
    object cmbExpress: TComboBox
      Left = 103
      Top = 48
      Width = 100
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 1
      Text = #31561#20110
      Items.Strings = (
        #31561#20110)
    end
    object edtValue: TEdit
      Left = 203
      Top = 48
      Width = 150
      Height = 23
      TabOrder = 2
    end
    object btnLoca: TBitBtn
      Left = 357
      Top = 45
      Width = 75
      Height = 25
      Caption = #26597#25214'(&L)'
      TabOrder = 3
      OnClick = btnLocaClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888800000888880000080F000888880F00080F000888880F
        0008000000080000000800F000000F00000800F000800F00000800F000800F00
        00088000000000000088880F00080F0008888800000800000888888000888000
        88888880F08880F0888888800088800088888888888888888888}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 536
    Height = 240
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 536
      Height = 240
      Align = alClient
      DataSource = dsDhhm
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'D_DHHM'
          Title.Caption = #21495#30721
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_DWMC'
          Title.Caption = #21517#31216
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_BZ'
          Title.Caption = #22791#27880
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 313
    Width = 536
    Height = 35
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 2
    DesignSize = (
      536
      35)
    object btnClose: TBitBtn
      Left = 456
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #20851#38381'(&C)'
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
  end
  object qryDhhm: TQuery
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from DHHM')
    Left = 72
    Top = 16
  end
  object dsDhhm: TDataSource
    DataSet = qryDhhm
    Left = 112
    Top = 16
  end
  object DosMove1: TDosMove
    Active = True
    Left = 432
    Top = 24
  end
end
