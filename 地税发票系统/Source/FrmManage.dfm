object AdminMan: TAdminMan
  Left = 267
  Top = 194
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #29992#25143#31649#29702
  ClientHeight = 379
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainPan: TPanel
    Left = 0
    Top = 0
    Width = 483
    Height = 379
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object EditPan: TPanel
      Left = 0
      Top = 0
      Width = 393
      Height = 113
      BevelOuter = bvNone
      Color = 15794160
      TabOrder = 0
      object Bevel4: TBevel
        Left = 0
        Top = 2
        Width = 2
        Height = 109
        Align = alLeft
      end
      object Bevel5: TBevel
        Left = 0
        Top = 0
        Width = 393
        Height = 2
        Align = alTop
      end
      object Bevel7: TBevel
        Left = 0
        Top = 111
        Width = 393
        Height = 2
        Align = alBottom
      end
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 128
        Height = 16
        Caption = #27880#20876#31246#21153#20154#21592#36134#21495
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 40
        Top = 40
        Width = 48
        Height = 12
        Caption = #29992#25143#21517#31216
      end
      object Label3: TLabel
        Left = 40
        Top = 64
        Width = 48
        Height = 12
        Caption = #23494'    '#30721
      end
      object Label4: TLabel
        Left = 40
        Top = 88
        Width = 48
        Height = 12
        Caption = #24615'    '#21035
      end
      object Label5: TLabel
        Left = 208
        Top = 40
        Width = 48
        Height = 12
        Caption = #27880#20876#26085#26399
      end
      object Label6: TLabel
        Left = 208
        Top = 64
        Width = 48
        Height = 12
        Caption = #36523#20221#35777#21495
      end
      object Label7: TLabel
        Left = 208
        Top = 88
        Width = 48
        Height = 12
        Caption = #22791'    '#27880
      end
      object cxTextEdit6: TcxTextEdit
        Left = 614
        Top = 21
        Width = 1
        Height = 220
        AutoSize = False
        Style.Color = clMenuText
        TabOrder = 0
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 96
        Top = 40
        Width = 105
        Height = 20
        DataBinding.DataField = #29992#25143#21517
        DataBinding.DataSource = DataSource1
        TabOrder = 1
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 96
        Top = 64
        Width = 105
        Height = 20
        DataBinding.DataField = #23494#30721
        DataBinding.DataSource = DataSource1
        Properties.EchoMode = eemPassword
        TabOrder = 3
      end
      object cxDBComboBox1: TcxDBComboBox
        Left = 96
        Top = 88
        Width = 105
        Height = 20
        DataBinding.DataField = #24615#21035
        DataBinding.DataSource = DataSource1
        TabOrder = 5
      end
      object cxDBDateEdit1: TcxDBDateEdit
        Left = 264
        Top = 40
        Width = 113
        Height = 20
        DataBinding.DataField = #26085#26399
        DataBinding.DataSource = DataSource1
        Properties.Kind = ckDateTime
        TabOrder = 2
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 264
        Top = 64
        Width = 113
        Height = 20
        DataBinding.DataField = #36523#20221#35777#21495
        DataBinding.DataSource = DataSource1
        TabOrder = 4
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 264
        Top = 88
        Width = 113
        Height = 20
        DataBinding.DataField = #22791#27880
        DataBinding.DataSource = DataSource1
        TabOrder = 6
      end
    end
    object Pan: TPanel
      Left = 392
      Top = 0
      Width = 91
      Height = 113
      BevelOuter = bvNone
      TabOrder = 1
      object Bevel2: TBevel
        Left = 0
        Top = 2
        Width = 2
        Height = 109
        Align = alLeft
      end
      object Bevel1: TBevel
        Left = 89
        Top = 2
        Width = 2
        Height = 109
        Align = alRight
      end
      object Bevel3: TBevel
        Left = 0
        Top = 111
        Width = 91
        Height = 2
        Align = alBottom
      end
      object Bevel6: TBevel
        Left = 0
        Top = 0
        Width = 91
        Height = 2
        Align = alTop
      end
      object cxButton1: TcxButton
        Left = 4
        Top = 53
        Width = 75
        Height = 25
        Caption = #20462'  '#25913
        TabOrder = 2
        OnClick = cxButton1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
          300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
          330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
          333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
          339977FF777777773377000BFB03333333337773FF733333333F333000333333
          3300333777333333337733333333333333003333333333333377333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
      end
      object cxButton5: TcxButton
        Left = 4
        Top = 29
        Width = 75
        Height = 25
        Caption = #20445'  '#23384
        TabOrder = 1
        OnClick = cxButton5Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
      end
      object cxButton2: TcxButton
        Left = 4
        Top = 78
        Width = 75
        Height = 25
        Caption = #21024'  '#38500
        TabOrder = 3
        OnClick = cxButton2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0000377777777777777703030303030303037F7F7F7F7F7F7F7F000000000000
          00007777777777777777933393303933337073F37F37F73F3377393393303393
          379037FF7F37F37FF777379793303379793037777337F3777737339933303339
          93303377F3F7F3F77F3733993930393993303377F737F7377FF7399993303399
          999037777337F377777793993330333393307377FF37F3337FF7333993303333
          993033377F37F33377F7333993303333993033377337F3337737333333303333
          33303FFFFFF7FFFFFFF700000000000000007777777777777777030303030303
          03037F7F7F7F7F7F7F7F00000000000000007777777777777777}
        NumGlyphs = 2
      end
      object cxButton3: TcxButton
        Left = 4
        Top = 5
        Width = 75
        Height = 25
        Caption = #26032'  '#22686
        TabOrder = 0
        OnClick = cxButton3Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
          0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
          33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 120
      Width = 481
      Height = 257
      DataSource = DataSource1
      TabOrder = 2
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = #29992#25143#21517
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24615#21035
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26085#26399
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36523#20221#35777#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = #31649#29702#21592
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22791#27880
          Width = 100
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = ADOQuery1
    Left = 16
    Top = 88
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From Admin')
    Left = 16
    Top = 56
  end
end
