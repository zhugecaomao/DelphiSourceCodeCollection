object SaleQuery: TSaleQuery
  Left = 249
  Top = 163
  Width = 486
  Height = 293
  Caption = #38144#21806#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 478
    Height = 89
    Align = alTop
    Style = bsRaised
  end
  object Label3: TLabel
    Left = 21
    Top = 12
    Width = 60
    Height = 13
    Caption = #26597#25214#23383#27573#65306
  end
  object Label4: TLabel
    Left = 21
    Top = 44
    Width = 60
    Height = 13
    Caption = #26597#25214#20869#23481#65306
  end
  object Panel1: TPanel
    Left = 0
    Top = 89
    Width = 478
    Height = 177
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 476
      Height = 175
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object ComboBox1: TComboBox
    Left = 96
    Top = 12
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = '------'#36873#25321#26597#25214#23383#27573'------'
    Items.Strings = (
      #21333#25454#32534#21495
      #24405#21333#26085#26399
      #23458#25143
      #32463#25163#20154
      #22791#27880)
  end
  object Edit1: TEdit
    Left = 96
    Top = 48
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object Button3: TButton
    Left = 278
    Top = 8
    Width = 75
    Height = 25
    Caption = #26597#25214
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button4: TButton
    Left = 374
    Top = 8
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    OnClick = Button4Click
  end
  object BitBtn1: TBitBtn
    Left = 280
    Top = 48
    Width = 75
    Height = 25
    Caption = #25171#21360#39044#35272
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 376
    Top = 48
    Width = 75
    Height = 25
    Caption = #36820#22238
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object Query1: TQuery
    DatabaseName = 'DRESS'
    Left = 352
    Top = 160
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 208
    Top = 176
  end
  object Query2: TQuery
    DatabaseName = 'DRESS'
    Left = 168
    Top = 120
  end
end
