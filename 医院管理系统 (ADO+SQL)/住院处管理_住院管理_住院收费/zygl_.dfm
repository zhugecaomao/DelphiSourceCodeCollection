object zygl: Tzygl
  Left = 23
  Top = 13
  Width = 749
  Height = 541
  Caption = #20303#38498#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 33
    Width = 741
    Height = 481
    ActivePage = TabSheet2
    Align = alClient
    TabIndex = 1
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #20837#38498#31649#29702
      ParentShowHint = False
      ShowHint = False
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 733
        Height = 41
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 24
          Width = 41
          Height = 13
          AutoSize = False
          Caption = #30149#20154'id'
          FocusControl = DBEdit1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 168
          Top = 24
          Width = 81
          Height = 13
          AutoSize = False
          Caption = #21307#30103#20184#27454#26041#24335
          FocusControl = DBEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 624
          Top = 24
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #25276#37329
          FocusControl = DBEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 64
          Top = 16
          Width = 65
          Height = 21
          DataField = #30149#20154'id'
          DataSource = DMzygl.DSbab
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 256
          Top = 16
          Width = 56
          Height = 21
          DataField = #21307#30103#20184#27454#26041#24335
          DataSource = DMzygl.DSbab
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 656
          Top = 16
          Width = 129
          Height = 21
          DataField = #25276#37329
          DataSource = DMzygl.DSbab
          MaxLength = 10
          ReadOnly = True
          TabOrder = 2
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 41
        Width = 733
        Height = 240
        Align = alTop
        TabOrder = 1
        object Label4: TLabel
          Left = 32
          Top = 16
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #22995#21517
          FocusControl = DBEdit4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 32
          Top = 40
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #24615#21035
          FocusControl = DBEdit5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 8
          Top = 64
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #20986#29983#24180#26376
          FocusControl = DBEdit6
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 32
          Top = 88
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #24180#40836
          FocusControl = DBEdit7
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 32
          Top = 112
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #23130#23035
          FocusControl = DBEdit8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 32
          Top = 136
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #32844#19994
          FocusControl = DBEdit9
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 16
          Top = 160
          Width = 41
          Height = 13
          AutoSize = False
          Caption = #20986#29983#22320
          FocusControl = DBEdit10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 32
          Top = 184
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #27665#26063
          FocusControl = DBEdit11
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 32
          Top = 208
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #22269#31821
          FocusControl = DBEdit12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 192
          Top = 16
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #36523#20221#35777#21495
          FocusControl = DBEdit13
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 168
          Top = 40
          Width = 89
          Height = 13
          AutoSize = False
          Caption = #24037#20316#21333#20301#22320#22336
          FocusControl = DBEdit14
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 224
          Top = 64
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #30005#35805
          FocusControl = DBEdit15
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 192
          Top = 112
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #37038#25919#32534#21495
          FocusControl = DBEdit16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 192
          Top = 88
          Width = 65
          Height = 13
          AutoSize = False
          Caption = #25143#21475#22320#22336
          FocusControl = DBEdit17
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 192
          Top = 136
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #20837#38498#26085#26399
          FocusControl = DBEdit18
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 192
          Top = 160
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #20837#38498#31185#21035
          FocusControl = DBEdit19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 192
          Top = 184
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #20837#38498#30149#23460
          FocusControl = DBEdit20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 192
          Top = 208
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #36716#31185#24773#20917
          FocusControl = DBEdit21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 424
          Top = 16
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #20986#38498#26085#26399
          FocusControl = DBEdit22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 424
          Top = 40
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #20986#38498#31185#21035
          FocusControl = DBEdit23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 424
          Top = 64
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #20986#38498#30149#23460
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 400
          Top = 88
          Width = 89
          Height = 13
          AutoSize = False
          Caption = #23454#38469#20303#38498#22825#25968
          FocusControl = DBEdit25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 576
          Top = 8
          Width = 73
          Height = 13
          AutoSize = False
          Caption = #38376'_'#24613#35786#35786#26029
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 416
          Top = 112
          Width = 73
          Height = 13
          AutoSize = False
          Caption = #20837#38498#26102#24773#20917
          FocusControl = DBEdit27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 576
          Top = 88
          Width = 65
          Height = 13
          AutoSize = False
          Caption = #20837#38498#35786#26029
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 400
          Top = 136
          Width = 84
          Height = 13
          AutoSize = False
          Caption = #20837#38498#21518#30830#35786#26085#26399
          FocusControl = DBEdit29
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 400
          Top = 192
          Width = 89
          Height = 13
          AutoSize = False
          Caption = #20986#38498#20027#35201#35786#26029
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 424
          Top = 160
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #20986#38498#24773#20917
          FocusControl = DBEdit31
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit4: TDBEdit
          Left = 64
          Top = 8
          Width = 81
          Height = 21
          DataField = #22995#21517
          DataSource = DMzygl.DSbab
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 64
          Top = 32
          Width = 81
          Height = 21
          DataField = #24615#21035
          DataSource = DMzygl.DSbab
          TabOrder = 1
        end
        object DBEdit6: TDBEdit
          Left = 64
          Top = 56
          Width = 81
          Height = 21
          DataField = #20986#29983#24180#26376
          DataSource = DMzygl.DSbab
          MaxLength = 10
          TabOrder = 2
        end
        object DBEdit7: TDBEdit
          Left = 64
          Top = 80
          Width = 81
          Height = 21
          DataField = #24180#40836
          DataSource = DMzygl.DSbab
          TabOrder = 3
        end
        object DBEdit8: TDBEdit
          Left = 64
          Top = 104
          Width = 81
          Height = 21
          DataField = #23130#23035
          DataSource = DMzygl.DSbab
          TabOrder = 4
        end
        object DBEdit9: TDBEdit
          Left = 64
          Top = 128
          Width = 81
          Height = 21
          DataField = #32844#19994
          DataSource = DMzygl.DSbab
          TabOrder = 5
        end
        object DBEdit10: TDBEdit
          Left = 64
          Top = 152
          Width = 81
          Height = 21
          DataField = #20986#29983#22320
          DataSource = DMzygl.DSbab
          TabOrder = 6
        end
        object DBEdit11: TDBEdit
          Left = 64
          Top = 176
          Width = 81
          Height = 21
          DataField = #27665#26063
          DataSource = DMzygl.DSbab
          TabOrder = 7
        end
        object DBEdit12: TDBEdit
          Left = 64
          Top = 200
          Width = 81
          Height = 21
          DataField = #22269#31821
          DataSource = DMzygl.DSbab
          TabOrder = 8
        end
        object DBEdit13: TDBEdit
          Left = 256
          Top = 8
          Width = 137
          Height = 21
          DataField = #36523#20221#35777#21495
          DataSource = DMzygl.DSbab
          TabOrder = 9
        end
        object DBEdit14: TDBEdit
          Left = 256
          Top = 32
          Width = 137
          Height = 21
          DataField = #24037#20316#21333#20301#22320#22336
          DataSource = DMzygl.DSbab
          TabOrder = 10
        end
        object DBEdit15: TDBEdit
          Left = 256
          Top = 56
          Width = 137
          Height = 21
          DataField = #30005#35805
          DataSource = DMzygl.DSbab
          TabOrder = 11
        end
        object DBEdit16: TDBEdit
          Left = 256
          Top = 104
          Width = 137
          Height = 21
          DataField = #37038#25919#32534#21495
          DataSource = DMzygl.DSbab
          TabOrder = 12
        end
        object DBEdit17: TDBEdit
          Left = 256
          Top = 80
          Width = 137
          Height = 21
          DataField = #25143#21475#22320#22336
          DataSource = DMzygl.DSbab
          TabOrder = 13
        end
        object DBEdit18: TDBEdit
          Left = 256
          Top = 128
          Width = 137
          Height = 21
          DataField = #20837#38498#26085#26399
          DataSource = DMzygl.DSbab
          MaxLength = 10
          TabOrder = 14
        end
        object DBEdit19: TDBEdit
          Left = 256
          Top = 152
          Width = 137
          Height = 21
          DataField = #20837#38498#31185#21035
          DataSource = DMzygl.DSbab
          TabOrder = 15
        end
        object DBEdit20: TDBEdit
          Left = 256
          Top = 176
          Width = 137
          Height = 21
          DataField = #20837#38498#30149#23460
          DataSource = DMzygl.DSbab
          TabOrder = 16
        end
        object DBEdit21: TDBEdit
          Left = 256
          Top = 200
          Width = 137
          Height = 21
          DataField = #36716#31185#24773#20917
          DataSource = DMzygl.DSbab
          TabOrder = 17
        end
        object DBEdit22: TDBEdit
          Left = 488
          Top = 8
          Width = 81
          Height = 21
          DataField = #20986#38498#26085#26399
          DataSource = DMzygl.DSbab
          MaxLength = 10
          TabOrder = 18
        end
        object DBEdit23: TDBEdit
          Left = 488
          Top = 32
          Width = 81
          Height = 21
          DataField = #20986#38498#31185#21035
          DataSource = DMzygl.DSbab
          TabOrder = 19
        end
        object DBEdit25: TDBEdit
          Left = 488
          Top = 80
          Width = 81
          Height = 21
          DataField = #23454#38469#20303#38498#22825#25968
          DataSource = DMzygl.DSbab
          TabOrder = 20
        end
        object DBEdit27: TDBEdit
          Left = 488
          Top = 104
          Width = 81
          Height = 21
          DataField = #20837#38498#26102#24773#20917
          DataSource = DMzygl.DSbab
          TabOrder = 21
        end
        object DBEdit29: TDBEdit
          Left = 488
          Top = 128
          Width = 81
          Height = 21
          DataField = #20837#38498#21518#30830#35786#26085#26399
          DataSource = DMzygl.DSbab
          MaxLength = 10
          TabOrder = 22
        end
        object DBEdit31: TDBEdit
          Left = 488
          Top = 152
          Width = 81
          Height = 21
          DataField = #20986#38498#24773#20917
          DataSource = DMzygl.DSbab
          TabOrder = 23
        end
        object DBMemo1: TDBMemo
          Left = 576
          Top = 24
          Width = 209
          Height = 57
          DataField = #38376'_'#24613#35786#35786#26029
          DataSource = DMzygl.DSbab
          MaxLength = 50
          TabOrder = 24
        end
        object DBMemo2: TDBMemo
          Left = 576
          Top = 104
          Width = 209
          Height = 65
          DataField = #20837#38498#35786#26029
          DataSource = DMzygl.DSbab
          MaxLength = 50
          TabOrder = 25
        end
        object DBMemo3: TDBMemo
          Left = 488
          Top = 176
          Width = 297
          Height = 57
          DataField = #20986#38498#20027#35201#35786#26029
          DataSource = DMzygl.DSbab
          MaxLength = 100
          TabOrder = 26
        end
        object DBEdit24: TDBEdit
          Left = 488
          Top = 56
          Width = 81
          Height = 21
          DataField = #20986#38498#30149#23460
          DataSource = DMzygl.DSbab
          TabOrder = 27
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 281
        Width = 733
        Height = 64
        Align = alTop
        TabOrder = 2
        object Label32: TLabel
          Left = 48
          Top = 16
          Width = 73
          Height = 13
          AutoSize = False
          Caption = #32852#31995#20154#22995#21517
          FocusControl = DBEdit32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 296
          Top = 16
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #20851#31995
          FocusControl = DBEdit33
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 88
          Top = 40
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #22320#22336
          FocusControl = DBEdit34
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label35: TLabel
          Left = 456
          Top = 16
          Width = 73
          Height = 13
          AutoSize = False
          Caption = #32852#31995#20154#30005#35805
          FocusControl = DBEdit35
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit32: TDBEdit
          Left = 120
          Top = 8
          Width = 108
          Height = 21
          DataField = #32852#31995#20154#22995#21517
          DataSource = DMzygl.DSbab
          TabOrder = 0
        end
        object DBEdit33: TDBEdit
          Left = 328
          Top = 8
          Width = 89
          Height = 21
          DataField = #20851#31995
          DataSource = DMzygl.DSbab
          TabOrder = 1
        end
        object DBEdit34: TDBEdit
          Left = 120
          Top = 32
          Width = 609
          Height = 21
          DataField = #22320#22336
          DataSource = DMzygl.DSbab
          TabOrder = 2
        end
        object DBEdit35: TDBEdit
          Left = 544
          Top = 8
          Width = 185
          Height = 21
          DataField = #32852#31995#20154#30005#35805
          DataSource = DMzygl.DSbab
          TabOrder = 3
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 345
        Width = 733
        Height = 108
        Align = alClient
        TabOrder = 3
        object Label36: TLabel
          Left = 32
          Top = 72
          Width = 38
          Height = 13
          AutoSize = False
          Caption = #30149#20154'id'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label37: TLabel
          Left = 32
          Top = 16
          Width = 193
          Height = 33
          AutoSize = False
          Caption = #30149#20154#36164#26009#26597#35810
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clOlive
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 16
          Top = 104
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #30149#20154#22995#21517
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Button1: TButton
          Left = 160
          Top = 64
          Width = 75
          Height = 25
          Caption = #26597#35810
          TabOrder = 0
          OnClick = Button1Click
        end
        object Erycx_id: TEdit
          Left = 80
          Top = 64
          Width = 65
          Height = 21
          TabOrder = 1
          OnKeyPress = Erycx_idKeyPress
        end
        object DBGrid1: TDBGrid
          Left = 256
          Top = 8
          Width = 521
          Height = 81
          DataSource = DMzygl.DSbab
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object Erycx_xm: TEdit
          Left = 80
          Top = 96
          Width = 65
          Height = 21
          TabOrder = 3
          OnKeyPress = Erycx_xmKeyPress
        end
        object Button2: TButton
          Left = 160
          Top = 96
          Width = 75
          Height = 25
          Caption = #26597#35810
          TabOrder = 4
          OnClick = Button2Click
        end
        object DBNavigator1: TDBNavigator
          Left = 256
          Top = 96
          Width = 310
          Height = 25
          DataSource = DMzygl.DSbab
          VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
          TabOrder = 5
        end
        object Button3: TButton
          Left = 704
          Top = 96
          Width = 75
          Height = 25
          Caption = #25253#34920
          TabOrder = 6
          OnClick = Button3Click
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #20303#38498#22788#31649#29702
      ImageIndex = 1
      object TPanel
        Left = 0
        Top = 0
        Width = 733
        Height = 49
        Align = alTop
        TabOrder = 0
        object Label39: TLabel
          Left = 16
          Top = 16
          Width = 97
          Height = 25
          AutoSize = False
          Caption = #19968#26085#28165#21333
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clOlive
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 632
          Top = 24
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #25276#37329#21097#20313
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Eyjsy: TEdit
          Left = 704
          Top = 16
          Width = 73
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object BitBtn3: TBitBtn
          Left = 248
          Top = 16
          Width = 89
          Height = 25
          Caption = #19968#26085#28165#21333#25253#34920
          TabOrder = 1
          OnClick = BitBtn3Click
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 49
        Width = 733
        Height = 232
        Align = alTop
        TabOrder = 1
        object Label40: TLabel
          Left = 8
          Top = 16
          Width = 41
          Height = 13
          AutoSize = False
          Caption = #30149#20154'id'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 8
          Top = 48
          Width = 89
          Height = 13
          AutoSize = False
          Caption = #39033#30446#36153#29992#21517#31216
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label42: TLabel
          Left = 184
          Top = 48
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #25968#37327
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 224
          Top = 48
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #21333#20301
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label44: TLabel
          Left = 288
          Top = 48
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #36153#29992
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label45: TLabel
          Left = 384
          Top = 48
          Width = 41
          Height = 13
          AutoSize = False
          Caption = #26085#26399
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 344
          Top = 72
          Width = 17
          Height = 13
          AutoSize = False
          Caption = #20803
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label58: TLabel
          Left = 472
          Top = 48
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #22791#27880
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Ebrid: TEdit
          Left = 56
          Top = 8
          Width = 57
          Height = 21
          TabOrder = 0
          OnChange = EbridChange
          OnKeyPress = EbridKeyPress
        end
        object Exmfymc: TEdit
          Left = 8
          Top = 64
          Width = 153
          Height = 21
          Enabled = False
          TabOrder = 1
          OnKeyPress = ExmfymcKeyPress
        end
        object Esl: TEdit
          Left = 184
          Top = 64
          Width = 25
          Height = 21
          Enabled = False
          TabOrder = 2
          OnChange = EslChange
          OnKeyPress = EslKeyPress
        end
        object Edw: TEdit
          Left = 224
          Top = 64
          Width = 41
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 3
        end
        object Efy: TEdit
          Left = 288
          Top = 64
          Width = 49
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 4
        end
        object Erq: TEdit
          Left = 384
          Top = 64
          Width = 73
          Height = 21
          Enabled = False
          TabOrder = 5
        end
        object Button4: TButton
          Left = 632
          Top = 60
          Width = 75
          Height = 25
          Caption = #25552#20132
          Enabled = False
          TabOrder = 6
          OnClick = Button4Click
        end
        object DBGrid3: TDBGrid
          Left = 8
          Top = 96
          Width = 777
          Height = 113
          DataSource = DMzygl.DSyrqdXG
          FixedColor = clSilver
          ReadOnly = True
          TabOrder = 7
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = #30149#20154'id'
              Visible = True
            end
            item
              Expanded = False
              FieldName = #39033#30446#36153#29992#21517#31216
              Visible = True
            end
            item
              Expanded = False
              FieldName = #25968#37327
              Visible = True
            end
            item
              Expanded = False
              FieldName = #21333#20301
              Visible = True
            end
            item
              Expanded = False
              FieldName = #36153#29992
              Visible = True
            end
            item
              Expanded = False
              FieldName = #26085#26399
              Visible = True
            end
            item
              Expanded = False
              FieldName = #22791#27880
              Visible = True
            end>
        end
        object Ebz: TEdit
          Left = 472
          Top = 64
          Width = 137
          Height = 21
          MaxLength = 100
          TabOrder = 8
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 281
        Width = 733
        Height = 225
        Align = alTop
        Color = cl3DLight
        TabOrder = 2
        object Label48: TLabel
          Left = 584
          Top = 16
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #21333#20301#36153#29992
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label49: TLabel
          Left = 712
          Top = 16
          Width = 17
          Height = 13
          AutoSize = False
          Caption = #20803
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label50: TLabel
          Left = 264
          Top = 8
          Width = 145
          Height = 24
          AutoSize = False
          Caption = #19968#26085#28165#21333#20462#25913
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label51: TLabel
          Left = 8
          Top = 40
          Width = 41
          Height = 13
          AutoSize = False
          Caption = #30149#20154'id'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label52: TLabel
          Left = 112
          Top = 40
          Width = 97
          Height = 13
          AutoSize = False
          Caption = #39033#30446#36153#29992#21517#31216
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label53: TLabel
          Left = 8
          Top = 88
          Width = 41
          Height = 13
          AutoSize = False
          Caption = #25968#37327
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label55: TLabel
          Left = 112
          Top = 88
          Width = 41
          Height = 13
          AutoSize = False
          Caption = #36153#29992
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label54: TLabel
          Left = 165
          Top = 112
          Width = 17
          Height = 13
          AutoSize = False
          Caption = #20803
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label56: TLabel
          Left = 192
          Top = 88
          Width = 41
          Height = 13
          AutoSize = False
          Caption = #26085#26399
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label57: TLabel
          Left = 56
          Top = 88
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #21333#20301
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label59: TLabel
          Left = 8
          Top = 144
          Width = 33
          Height = 13
          AutoSize = False
          Caption = #22791#27880
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBGqdXG: TDBGrid
          Left = 304
          Top = 40
          Width = 465
          Height = 153
          Color = clMoneyGreen
          DataSource = DMzygl.DSyrqdXG1
          FixedColor = clInfoBk
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGqdXGCellClick
          Columns = <
            item
              Expanded = False
              FieldName = #30149#20154'id'
              Visible = True
            end
            item
              Expanded = False
              FieldName = #39033#30446#36153#29992#21517#31216
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = #25968#37327
              Visible = True
            end
            item
              Expanded = False
              FieldName = #21333#20301
              Visible = True
            end
            item
              Expanded = False
              FieldName = #36153#29992
              Visible = True
            end
            item
              Expanded = False
              FieldName = #26085#26399
              Visible = True
            end
            item
              Expanded = False
              FieldName = #22791#27880
              Visible = True
            end>
        end
        object Button5: TButton
          Left = 8
          Top = 8
          Width = 97
          Height = 25
          Caption = #20462#25913#30149#20154#28165#21333
          TabOrder = 1
          OnClick = Button5Click
        end
        object Button6: TButton
          Left = 120
          Top = 8
          Width = 75
          Height = 25
          Caption = #36864#20986#20462#25913
          Enabled = False
          TabOrder = 2
          OnClick = Button6Click
        end
        object Edwfy: TEdit
          Left = 648
          Top = 8
          Width = 57
          Height = 21
          Color = clMoneyGreen
          ReadOnly = True
          TabOrder = 3
        end
        object Button7: TButton
          Left = 8
          Top = 176
          Width = 73
          Height = 25
          Caption = #25552#20132#20462#25913
          Enabled = False
          TabOrder = 4
          OnClick = Button7Click
        end
        object EbridXG: TEdit
          Left = 8
          Top = 56
          Width = 81
          Height = 21
          TabOrder = 5
          OnKeyPress = EbridXGKeyPress
        end
        object ExmfymcXG: TEdit
          Left = 112
          Top = 56
          Width = 169
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 6
        end
        object EfyXG: TEdit
          Left = 112
          Top = 104
          Width = 49
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 7
        end
        object EslXG: TEdit
          Left = 8
          Top = 104
          Width = 41
          Height = 21
          Enabled = False
          TabOrder = 8
        end
        object DTPrqXG: TDateTimePicker
          Left = 192
          Top = 104
          Width = 89
          Height = 21
          CalAlignment = dtaLeft
          Date = 37726
          Time = 37726
          DateFormat = dfShort
          DateMode = dmComboBox
          Enabled = False
          Kind = dtkDate
          ParseInput = False
          TabOrder = 9
        end
        object Button8: TButton
          Left = 96
          Top = 176
          Width = 65
          Height = 25
          Caption = #21024#38500#25968#25454
          Enabled = False
          TabOrder = 10
          OnClick = Button8Click
        end
        object EdwXG: TEdit
          Left = 56
          Top = 104
          Width = 33
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 11
        end
        object EbzXG: TEdit
          Left = 40
          Top = 136
          Width = 241
          Height = 21
          MaxLength = 100
          TabOrder = 12
        end
      end
    end
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 741
    Height = 33
    Align = alTop
    Picture.Data = {
      07544269746D617066320100424D66320100000000003600000028000000AA01
      00002E0000000100200000000000303201000000000000000000000000000000
      0000ECECEC00ECECEC00F1F1F100F1F1F100EEEEEE00EAEAEA00EDEDED00EDED
      ED00EBEBEB00EDEDED00EEEEEE00EEEEEE00F0F0F000EEEEEE00EDEDED00ECEC
      EC00EDEDED00EFEFEF00F0F0F000EFEFEF00EEEEEE00F1F1F100EBEBEB00EDED
      ED00F1F1F100EDEDED00E8E8E800EBEBEB00EFEFEF00F0F0F000F3F3F300EAEA
      EA00F2F2F200EAEAEA00EBEBEB00EBEBEB00ECECEC00EFEFEF00ECECEC00E7E7
      E700F2F2F200EFEFEF00E4E4E400ECECEC00ECECEC00F2F2F200EDEDED00E4E4
      E400E7E7E700E7E7E700F1F1F100EAEAEA00EFEFEF00EEEEEE00ECECEC00EEEE
      EE00E7E7E700E8E8E800F0F0F000EFEFEF00F0F0F000EDEDED00EEEEEE00EEEE
      EE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EEEEEE00EEEEEE00EEEE
      EE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0F000EFEF
      EF00EFEFEF00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F1F1F100F0F0F000F0F0F000EFEFEF00EEEEEE00EBEBEB00ECECEC00EDED
      ED00EEEEEE00EFEFEF00EFEFEF00F0F0F000F0F0F000EFEFEF00F0F0F000EFEF
      EF00F3F3F300EEEEEE00EBEBEB00EFEFEF00E8E8E800EDEDED00F2F2F200E3E3
      E300F6F6F600F1F1F100EDEDED00E8E8E800EDEDED00EDEDED00EDEDED00ECEC
      EC00EEEEEE00F1F1F100EFEFEF00EEEEEE00F2F2F200F0F0F000ECECEC00EEEE
      EE00EFEFEF00ECECEC00F1F1F100F3F3F300EBEBEB00EBEBEB00EFEFEF00EBEB
      EB00ECECEC00EFEFEF00EFEFEF00ECECEC00ECECEC00F1F1F100F1F1F100EEEE
      EE00EAEAEA00EDEDED00EDEDED00EBEBEB00EDEDED00EEEEEE00EEEEEE00F0F0
      F000EEEEEE00EDEDED00ECECEC00EDEDED00EFEFEF00F0F0F000EFEFEF00EEEE
      EE00F1F1F100EBEBEB00EDEDED00F1F1F100EDEDED00E8E8E800EBEBEB00EFEF
      EF00F0F0F000F3F3F300EAEAEA00F2F2F200EAEAEA00EBEBEB00EBEBEB00ECEC
      EC00EFEFEF00ECECEC00E7E7E700F2F2F200EFEFEF00E4E4E400ECECEC00ECEC
      EC00F2F2F200EDEDED00E4E4E400E7E7E700E7E7E700F1F1F100EAEAEA00EFEF
      EF00EEEEEE00ECECEC00EEEEEE00E7E7E700E8E8E800F0F0F000EFEFEF00F0F0
      F000EDEDED00EEEEEE00EEEEEE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EEEEEE00EEEEEE00EEEEEE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00F0F0F000F0F0F000EFEFEF00EFEFEF00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F1F1F100F0F0F000F0F0F000EFEFEF00EEEE
      EE00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEFEF00EFEFEF00F0F0F000F0F0
      F000EFEFEF00F0F0F000EFEFEF00F3F3F300EEEEEE00EBEBEB00EFEFEF00E8E8
      E800EDEDED00F2F2F200E3E3E300F6F6F600F1F1F100EDEDED00E8E8E800EDED
      ED00EDEDED00EDEDED00ECECEC00EEEEEE00F1F1F100EFEFEF00EEEEEE00F2F2
      F200F0F0F000ECECEC00EEEEEE00EFEFEF00ECECEC00F1F1F100F3F3F300EBEB
      EB00EBEBEB00EFEFEF00EBEBEB00ECECEC00EFEFEF00EFEFEF00ECECEC00ECEC
      EC00F1F1F100F1F1F100EEEEEE00EAEAEA00EDEDED00EDEDED00EBEBEB00EDED
      ED00EEEEEE00EEEEEE00F0F0F000EEEEEE00EDEDED00ECECEC00EDEDED00EFEF
      EF00F0F0F000EFEFEF00EEEEEE00F1F1F100EBEBEB00EDEDED00F1F1F100EDED
      ED00E8E8E800EBEBEB00EFEFEF00F0F0F000F3F3F300EAEAEA00F2F2F200EAEA
      EA00EBEBEB00EBEBEB00ECECEC00EFEFEF00ECECEC00E7E7E700F2F2F200EFEF
      EF00E4E4E400ECECEC00ECECEC00F2F2F200EDEDED00E4E4E400E7E7E700E7E7
      E700F1F1F100EAEAEA00EFEFEF00EEEEEE00ECECEC00EEEEEE00E7E7E700E8E8
      E800F0F0F000EFEFEF00F0F0F000EDEDED00EEEEEE00EEEEEE00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EEEEEE00EEEEEE00EEEEEE00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0F000EFEFEF00EFEFEF00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F1F1F100F0F0
      F000F0F0F000EFEFEF00EEEEEE00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEF
      EF00EFEFEF00F0F0F000EBEBEB00EBEBEB00ECECEC00ECECEC00EBEBEB00EFEF
      EF00ECECEC00ECECEC00EDEDED00EDEDED00EDEDED00EEEEEE00EDEDED00F0F0
      F000EFEFEF00EFEFEF00EFEFEF00EEEEEE00EDEDED00EBEBEB00E9E9E900EFEF
      EF00EDEDED00EDEDED00F0F0F000F1F1F100EAEAEA00E9E9E900EFEFEF00EAEA
      EA00F0F0F000E8E8E800EFEFEF00EBEBEB00EFEFEF00EEEEEE00EDEDED00F3F3
      F300F0F0F000EBEBEB00F1F1F100F5F5F500EFEFEF00ECECEC00EDEDED00F0F0
      F000F3F3F300E2E2E200E6E6E600EBEBEB00F1F1F100EAEAEA00ECECEC00EEEE
      EE00EDEDED00F1F1F100EDEDED00EDEDED00F2F2F200EFEFEF00F1F1F100EEEE
      EE00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0F000EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F1F1F100F0F0F000F0F0F000EFEFEF00EEEEEE00EFEF
      EF00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000EFEFEF00EFEFEF00F1F1
      F100F1F1F100EFEFEF00F2F2F200EEEEEE00EBEBEB00F0F0F000E9E9E900EAEA
      EA00EEEEEE00EBEBEB00EFEFEF00ECECEC00E7E7E700E8E8E800F2F2F200EDED
      ED00E7E7E700E7E7E700EDEDED00EEEEEE00EEEEEE00EFEFEF00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EDEDED00ECECEC00EFEFEF00EFEFEF00EBEBEB00ECEC
      EC00F0F0F000EBEBEB00EBEBEB00ECECEC00ECECEC00EBEBEB00EBEBEB00ECEC
      EC00ECECEC00EBEBEB00EFEFEF00ECECEC00ECECEC00EDEDED00EDEDED00EDED
      ED00EEEEEE00EDEDED00F0F0F000EFEFEF00EFEFEF00EFEFEF00EEEEEE00EDED
      ED00EBEBEB00E9E9E900EFEFEF00EDEDED00EDEDED00F0F0F000F1F1F100EAEA
      EA00E9E9E900EFEFEF00EAEAEA00F0F0F000E8E8E800EFEFEF00EBEBEB00EFEF
      EF00EEEEEE00EDEDED00F3F3F300F0F0F000EBEBEB00F1F1F100F5F5F500EFEF
      EF00ECECEC00EDEDED00F0F0F000F3F3F300E2E2E200E6E6E600EBEBEB00F1F1
      F100EAEAEA00ECECEC00EEEEEE00EDEDED00F1F1F100EDEDED00EDEDED00F2F2
      F200EFEFEF00F1F1F100EEEEEE00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0F0
      F000F0F0F000F0F0F000EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F1F1F100F0F0F000F0F0
      F000EFEFEF00EEEEEE00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0
      F000EFEFEF00EFEFEF00F1F1F100F1F1F100EFEFEF00F2F2F200EEEEEE00EBEB
      EB00F0F0F000E9E9E900EAEAEA00EEEEEE00EBEBEB00EFEFEF00ECECEC00E7E7
      E700E8E8E800F2F2F200EDEDED00E7E7E700E7E7E700EDEDED00EEEEEE00EEEE
      EE00EFEFEF00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EDEDED00ECECEC00EFEF
      EF00EFEFEF00EBEBEB00ECECEC00F0F0F000EBEBEB00EBEBEB00ECECEC00ECEC
      EC00EBEBEB00EBEBEB00ECECEC00ECECEC00EBEBEB00EFEFEF00ECECEC00ECEC
      EC00EDEDED00EDEDED00EDEDED00EEEEEE00EDEDED00F0F0F000EFEFEF00EFEF
      EF00EFEFEF00EEEEEE00EDEDED00EBEBEB00E9E9E900EFEFEF00EDEDED00EDED
      ED00F0F0F000F1F1F100EAEAEA00E9E9E900EFEFEF00EAEAEA00F0F0F000E8E8
      E800EFEFEF00EBEBEB00EFEFEF00EEEEEE00EDEDED00F3F3F300F0F0F000EBEB
      EB00F1F1F100F5F5F500EFEFEF00ECECEC00EDEDED00F0F0F000F3F3F300E2E2
      E200E6E6E600EBEBEB00F1F1F100EAEAEA00ECECEC00EEEEEE00EDEDED00F1F1
      F100EDEDED00EDEDED00F2F2F200EFEFEF00F1F1F100EEEEEE00EFEFEF00EFEF
      EF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0F000EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F1F1F100F0F0F000F0F0F000EFEFEF00EEEEEE00EFEFEF00EFEFEF00F0F0
      F000F0F0F000F0F0F000F0F0F000EFEFEF00EDEDED00ECECEC00EAEAEA00E9E9
      E900E9E9E900EAEAEA00E5E5E500E6E6E600EAEAEA00EAEAEA00ECECEC00EEEE
      EE00EDEDED00EEEEEE00EDEDED00EBEBEB00EAEAEA00EAEAEA00EBEBEB00EBEB
      EB00EBEBEB00ECECEC00ECECEC00EAEAEA00EDEDED00F0F0F000E8E8E800E3E3
      E300EBEBEB00EAEAEA00F1F1F100E6E6E600ECECEC00EAEAEA00EDEDED00EAEA
      EA00E9E9E900F0F0F000EFEFEF00EDEDED00EDEDED00F1F1F100ECECEC00E3E3
      E300E9E9E900E4E4E400EFEFEF00DDDDDD00E6E6E600EFEFEF00F1F1F100E8E8
      E800E5E5E500ECECEC00EBEBEB00F0F0F000ECECEC00ECECEC00F0F0F000EDED
      ED00F0F0F000EFEFEF00EFEFEF00F0F0F000F1F1F100F1F1F100F1F1F100F1F1
      F100F0F0F000EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F1F1F100F0F0F000F0F0F000EFEF
      EF00EEEEEE00EFEFEF00F0F0F000F0F0F000F1F1F100F0F0F000F0F0F000EFEF
      EF00EEEEEE00F2F2F200F1F1F100EFEFEF00F2F2F200EEEEEE00EBEBEB00F0F0
      F000EAEAEA00ECECEC00EDEDED00F1F1F100EEEEEE00F2F2F200EBEBEB00EAEA
      EA00F2F2F200EBEBEB00E5E5E500E9E9E900F0F0F000EBEBEB00E9E9E900EEEE
      EE00EFEFEF00EFEFEF00F2F2F200F0F0F000EDEDED00EFEFEF00F0F0F000EEEE
      EE00EDEDED00EDEDED00F0F0F000EBEBEB00EAEAEA00EAEAEA00EBEBEB00EDED
      ED00ECECEC00EAEAEA00E9E9E900E9E9E900EAEAEA00E5E5E500E6E6E600EAEA
      EA00EAEAEA00ECECEC00EEEEEE00EDEDED00EEEEEE00EDEDED00EBEBEB00EAEA
      EA00EAEAEA00EBEBEB00EBEBEB00EBEBEB00ECECEC00ECECEC00EAEAEA00EDED
      ED00F0F0F000E8E8E800E3E3E300EBEBEB00EAEAEA00F1F1F100E6E6E600ECEC
      EC00EAEAEA00EDEDED00EAEAEA00E9E9E900F0F0F000EFEFEF00EDEDED00EDED
      ED00F1F1F100ECECEC00E3E3E300E9E9E900E4E4E400EFEFEF00DDDDDD00E6E6
      E600EFEFEF00F1F1F100E8E8E800E5E5E500ECECEC00EBEBEB00F0F0F000ECEC
      EC00ECECEC00F0F0F000EDEDED00F0F0F000EFEFEF00EFEFEF00F0F0F000F1F1
      F100F1F1F100F1F1F100F1F1F100F0F0F000EFEFEF00EFEFEF00EFEFEF00F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000EFEFEF00EFEFEF00EFEFEF00F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F1F1
      F100F0F0F000F0F0F000EFEFEF00EEEEEE00EFEFEF00F0F0F000F0F0F000F1F1
      F100F0F0F000F0F0F000EFEFEF00EEEEEE00F2F2F200F1F1F100EFEFEF00F2F2
      F200EEEEEE00EBEBEB00F0F0F000EAEAEA00ECECEC00EDEDED00F1F1F100EEEE
      EE00F2F2F200EBEBEB00EAEAEA00F2F2F200EBEBEB00E5E5E500E9E9E900F0F0
      F000EBEBEB00E9E9E900EEEEEE00EFEFEF00EFEFEF00F2F2F200F0F0F000EDED
      ED00EFEFEF00F0F0F000EEEEEE00EDEDED00EDEDED00F0F0F000EBEBEB00EAEA
      EA00EAEAEA00EBEBEB00EDEDED00ECECEC00EAEAEA00E9E9E900E9E9E900EAEA
      EA00E5E5E500E6E6E600EAEAEA00EAEAEA00ECECEC00EEEEEE00EDEDED00EEEE
      EE00EDEDED00EBEBEB00EAEAEA00EAEAEA00EBEBEB00EBEBEB00EBEBEB00ECEC
      EC00ECECEC00EAEAEA00EDEDED00F0F0F000E8E8E800E3E3E300EBEBEB00EAEA
      EA00F1F1F100E6E6E600ECECEC00EAEAEA00EDEDED00EAEAEA00E9E9E900F0F0
      F000EFEFEF00EDEDED00EDEDED00F1F1F100ECECEC00E3E3E300E9E9E900E4E4
      E400EFEFEF00DDDDDD00E6E6E600EFEFEF00F1F1F100E8E8E800E5E5E500ECEC
      EC00EBEBEB00F0F0F000ECECEC00ECECEC00F0F0F000EDEDED00F0F0F000EFEF
      EF00EFEFEF00F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0F000EFEF
      EF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000EFEF
      EF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F1F1F100F0F0F000F0F0F000EFEFEF00EEEEEE00EFEF
      EF00F0F0F000F0F0F000F1F1F100F0F0F000F0F0F000EFEFEF00EFEFEF00EEEE
      EE00EBEBEB00E8E8E800E7E7E700E8E8E800E6E6E600E6E6E600E9E9E900ECEC
      EC00EFEFEF00F0F0F000F0F0F000F0F0F000EEEEEE00ECECEC00ECECEC00EDED
      ED00EFEFEF00F0F0F000F0F0F000EFEFEF00F0F0F000EDEDED00EFEFEF00F0F0
      F000E8E8E800E3E3E300EBEBEB00E7E7E700EEEEEE00E2E2E200E8E8E800E8E8
      E800EAEAEA00E6E6E600E8E8E800EFEFEF00EDEDED00EBEBEB00ECECEC00F0F0
      F000E9E9E900E1E1E100E8E8E800E8E8E800F1F1F100DDDDDD00E6E6E600EFEF
      EF00F0F0F000E9E9E900E9E9E900ECECEC00EBEBEB00EDEDED00E8E8E800E8E8
      E800EFEFEF00EDEDED00EFEFEF00EFEFEF00EFEFEF00F0F0F000F1F1F100F1F1
      F100F1F1F100F1F1F100F0F0F000EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F1F1F100F0F0
      F000F0F0F000EFEFEF00EEEEEE00EBEBEB00ECECEC00EEEEEE00EFEFEF00F0F0
      F000F0F0F000EFEFEF00EEEEEE00F2F2F200F1F1F100EFEFEF00F2F2F200EEEE
      EE00EBEBEB00F0F0F000EAEAEA00E1E1E100E3E3E300EAEAEA00EBEBEB00EFEF
      EF00E4E4E400E0E0E000E7E7E700EAEAEA00E2E2E200E7E7E700EFEFEF00ECEC
      EC00EAEAEA00EFEFEF00F1F1F100EEEEEE00F0F0F000EEEEEE00EBEBEB00EDED
      ED00EFEFEF00EDEDED00EBEBEB00EDEDED00EFEFEF00EBEBEB00E8E8E800E9E9
      E900ECECEC00EFEFEF00EEEEEE00EBEBEB00E8E8E800E7E7E700E8E8E800E6E6
      E600E6E6E600E9E9E900ECECEC00EFEFEF00F0F0F000F0F0F000F0F0F000EEEE
      EE00ECECEC00ECECEC00EDEDED00EFEFEF00F0F0F000F0F0F000EFEFEF00F0F0
      F000EDEDED00EFEFEF00F0F0F000E8E8E800E3E3E300EBEBEB00E7E7E700EEEE
      EE00E2E2E200E8E8E800E8E8E800EAEAEA00E6E6E600E8E8E800EFEFEF00EDED
      ED00EBEBEB00ECECEC00F0F0F000E9E9E900E1E1E100E8E8E800E8E8E800F1F1
      F100DDDDDD00E6E6E600EFEFEF00F0F0F000E9E9E900E9E9E900ECECEC00EBEB
      EB00EDEDED00E8E8E800E8E8E800EFEFEF00EDEDED00EFEFEF00EFEFEF00EFEF
      EF00F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0F000EFEFEF00EFEF
      EF00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000EFEFEF00EFEF
      EF00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F1F1F100F0F0F000F0F0F000EFEFEF00EEEEEE00EBEBEB00ECEC
      EC00EEEEEE00EFEFEF00F0F0F000F0F0F000EFEFEF00EEEEEE00F2F2F200F1F1
      F100EFEFEF00F2F2F200EEEEEE00EBEBEB00F0F0F000EAEAEA00E1E1E100E3E3
      E300EAEAEA00EBEBEB00EFEFEF00E4E4E400E0E0E000E7E7E700EAEAEA00E2E2
      E200E7E7E700EFEFEF00ECECEC00EAEAEA00EFEFEF00F1F1F100EEEEEE00F0F0
      F000EEEEEE00EBEBEB00EDEDED00EFEFEF00EDEDED00EBEBEB00EDEDED00EFEF
      EF00EBEBEB00E8E8E800E9E9E900ECECEC00EFEFEF00EEEEEE00EBEBEB00E8E8
      E800E7E7E700E8E8E800E6E6E600E6E6E600E9E9E900ECECEC00EFEFEF00F0F0
      F000F0F0F000F0F0F000EEEEEE00ECECEC00ECECEC00EDEDED00EFEFEF00F0F0
      F000F0F0F000EFEFEF00F0F0F000EDEDED00EFEFEF00F0F0F000E8E8E800E3E3
      E300EBEBEB00E7E7E700EEEEEE00E2E2E200E8E8E800E8E8E800EAEAEA00E6E6
      E600E8E8E800EFEFEF00EDEDED00EBEBEB00ECECEC00F0F0F000E9E9E900E1E1
      E100E8E8E800E8E8E800F1F1F100DDDDDD00E6E6E600EFEFEF00F0F0F000E9E9
      E900E9E9E900ECECEC00EBEBEB00EDEDED00E8E8E800E8E8E800EFEFEF00EDED
      ED00EFEFEF00EFEFEF00EFEFEF00F0F0F000F1F1F100F1F1F100F1F1F100F1F1
      F100F0F0F000EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F1F1F100F0F0F000F0F0F000EFEF
      EF00EEEEEE00EBEBEB00ECECEC00EEEEEE00EFEFEF00F0F0F000F0F0F000EFEF
      EF00E9E9E900E9E9E900E8E8E800E5E5E500E2E2E200E4E4E400E9E9E900E7E7
      E700E5E5E500EBEBEB00EEEEEE00EDEDED00EEEEEE00EEEEEE00ECECEC00EAEA
      EA00ECECEC00EFEFEF00F1F1F100EFEFEF00EDEDED00EFEFEF00EDEDED00ECEC
      EC00EEEEEE00EBEBEB00E4E4E400E3E3E300ECECEC00E4E4E400EAEAEA00DEDE
      DE00E6E6E600E8E8E800E8E8E800E5E5E500EDEDED00F1F1F100EAEAEA00E6E6
      E600EEEEEE00F3F3F300EAEAEA00E7E7E700EBEBEB00EAEAEA00ECECEC00DEDE
      DE00E8E8E800EDEDED00EDEDED00E3E3E300E5E5E500EEEEEE00ECECEC00ECEC
      EC00E3E3E300E5E5E500F0F0F000EFEFEF00EFEFEF00EEEEEE00EFEFEF00EFEF
      EF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0F000EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F1F1F100F0F0F000F0F0F000EFEFEF00EEEEEE00E7E7E700E8E8E800EBEB
      EB00EEEEEE00EFEFEF00F0F0F000EFEFEF00EFEFEF00F1F1F100F1F1F100EFEF
      EF00F2F2F200EEEEEE00EBEBEB00F0F0F000E9E9E900DEDEDE00E3E3E300E7E7
      E700F2F2F200F0F0F000E3E3E300DDDDDD00E5E5E500E5E5E500DBDBDB00DBDB
      DB00E6E6E600EBEBEB00EAEAEA00EAEAEA00ECECEC00ECECEC00EAEAEA00E9E9
      E900E8E8E800E9E9E900EDEDED00ECECEC00E6E6E600EDEDED00EEEEEE00E9E9
      E900E1E1E100E4E4E400E7E7E700E9E9E900E9E9E900E8E8E800E5E5E500E2E2
      E200E4E4E400E9E9E900E7E7E700E5E5E500EBEBEB00EEEEEE00EDEDED00EEEE
      EE00EEEEEE00ECECEC00EAEAEA00ECECEC00EFEFEF00F1F1F100EFEFEF00EDED
      ED00EFEFEF00EDEDED00ECECEC00EEEEEE00EBEBEB00E4E4E400E3E3E300ECEC
      EC00E4E4E400EAEAEA00DEDEDE00E6E6E600E8E8E800E8E8E800E5E5E500EDED
      ED00F1F1F100EAEAEA00E6E6E600EEEEEE00F3F3F300EAEAEA00E7E7E700EBEB
      EB00EAEAEA00ECECEC00DEDEDE00E8E8E800EDEDED00EDEDED00E3E3E300E5E5
      E500EEEEEE00ECECEC00ECECEC00E3E3E300E5E5E500F0F0F000EFEFEF00EFEF
      EF00EEEEEE00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0
      F000EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F1F1F100F0F0F000F0F0F000EFEFEF00EEEE
      EE00E7E7E700E8E8E800EBEBEB00EEEEEE00EFEFEF00F0F0F000EFEFEF00EFEF
      EF00F1F1F100F1F1F100EFEFEF00F2F2F200EEEEEE00EBEBEB00F0F0F000E9E9
      E900DEDEDE00E3E3E300E7E7E700F2F2F200F0F0F000E3E3E300DDDDDD00E5E5
      E500E5E5E500DBDBDB00DBDBDB00E6E6E600EBEBEB00EAEAEA00EAEAEA00ECEC
      EC00ECECEC00EAEAEA00E9E9E900E8E8E800E9E9E900EDEDED00ECECEC00E6E6
      E600EDEDED00EEEEEE00E9E9E900E1E1E100E4E4E400E7E7E700E9E9E900E9E9
      E900E8E8E800E5E5E500E2E2E200E4E4E400E9E9E900E7E7E700E5E5E500EBEB
      EB00EEEEEE00EDEDED00EEEEEE00EEEEEE00ECECEC00EAEAEA00ECECEC00EFEF
      EF00F1F1F100EFEFEF00EDEDED00EFEFEF00EDEDED00ECECEC00EEEEEE00EBEB
      EB00E4E4E400E3E3E300ECECEC00E4E4E400EAEAEA00DEDEDE00E6E6E600E8E8
      E800E8E8E800E5E5E500EDEDED00F1F1F100EAEAEA00E6E6E600EEEEEE00F3F3
      F300EAEAEA00E7E7E700EBEBEB00EAEAEA00ECECEC00DEDEDE00E8E8E800EDED
      ED00EDEDED00E3E3E300E5E5E500EEEEEE00ECECEC00ECECEC00E3E3E300E5E5
      E500F0F0F000EFEFEF00EFEFEF00EEEEEE00EFEFEF00EFEFEF00F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00F0F0F000F0F0F000F0F0F000EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F1F1F100F0F0
      F000F0F0F000EFEFEF00EEEEEE00E7E7E700E8E8E800EBEBEB00EEEEEE00EFEF
      EF00F0F0F000EFEFEF00E6E6E600E7E7E700E9E9E900E8E8E800E3E3E300DBDB
      DB00EAEAEA00E5E5E500DDDDDD00E6E6E600EBEBEB00E7E7E700EBEBEB00EBEB
      EB00E6E6E600E2E2E200E4E4E400EAEAEA00EEEEEE00EDEDED00EBEBEB00EBEB
      EB00E7E7E700E8E8E800EAEAEA00E3E3E300DEDEDE00E4E4E400ECECEC00ECEC
      EC00F0F0F000E1E1E100EAEAEA00EAEAEA00E5E5E500E3E3E300F1F1F100EEEE
      EE00E7E7E700E2E2E200F1F1F100EEEEEE00DFDFDF00E7E7E700EBEBEB00E3E3
      E300DEDEDE00DEDEDE00ECECEC00ECECEC00EBEBEB00DCDCDC00E0E0E000EDED
      ED00EDEDED00EAEAEA00DEDEDE00E1E1E100F1F1F100F0F0F000EBEBEB00EDED
      ED00EEEEEE00EEEEEE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EEEE
      EE00EEEEEE00EEEEEE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0F0
      F000F0F0F000EFEFEF00EFEFEF00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F1F1F100F0F0F000F0F0F000EFEFEF00EEEEEE00E5E5
      E500E7E7E700EAEAEA00EDEDED00EFEFEF00F0F0F000EFEFEF00EFEFEF00EFEF
      EF00F0F0F000EFEFEF00F3F3F300EEEEEE00EBEBEB00EFEFEF00E8E8E800DADA
      DA00DDDDDD00D3D3D300EDEDED00E8E8E800DCDCDC00D3D3D300DADADA00E6E6
      E600DFDFDF00DCDCDC00E5E5E500ECECEC00E7E7E700E5E5E500ECECEC00EFEF
      EF00E9E9E900E9E9E900EBEBEB00EAEAEA00F0F0F000F1F1F100E6E6E600ECEC
      EC00ECECEC00E7E7E700E1E1E100E6E6E600E8E8E800E6E6E600E7E7E700E9E9
      E900E8E8E800E3E3E300DBDBDB00EAEAEA00E5E5E500DDDDDD00E6E6E600EBEB
      EB00E7E7E700EBEBEB00EBEBEB00E6E6E600E2E2E200E4E4E400EAEAEA00EEEE
      EE00EDEDED00EBEBEB00EBEBEB00E7E7E700E8E8E800EAEAEA00E3E3E300DEDE
      DE00E4E4E400ECECEC00ECECEC00F0F0F000E1E1E100EAEAEA00EAEAEA00E5E5
      E500E3E3E300F1F1F100EEEEEE00E7E7E700E2E2E200F1F1F100EEEEEE00DFDF
      DF00E7E7E700EBEBEB00E3E3E300DEDEDE00DEDEDE00ECECEC00ECECEC00EBEB
      EB00DCDCDC00E0E0E000EDEDED00EDEDED00EAEAEA00DEDEDE00E1E1E100F1F1
      F100F0F0F000EBEBEB00EDEDED00EEEEEE00EEEEEE00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EEEEEE00EEEEEE00EEEEEE00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00F0F0F000F0F0F000EFEFEF00EFEFEF00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F1F1F100F0F0F000F0F0
      F000EFEFEF00EEEEEE00E5E5E500E7E7E700EAEAEA00EDEDED00EFEFEF00F0F0
      F000EFEFEF00EFEFEF00EFEFEF00F0F0F000EFEFEF00F3F3F300EEEEEE00EBEB
      EB00EFEFEF00E8E8E800DADADA00DDDDDD00D3D3D300EDEDED00E8E8E800DCDC
      DC00D3D3D300DADADA00E6E6E600DFDFDF00DCDCDC00E5E5E500ECECEC00E7E7
      E700E5E5E500ECECEC00EFEFEF00E9E9E900E9E9E900EBEBEB00EAEAEA00F0F0
      F000F1F1F100E6E6E600ECECEC00ECECEC00E7E7E700E1E1E100E6E6E600E8E8
      E800E6E6E600E7E7E700E9E9E900E8E8E800E3E3E300DBDBDB00EAEAEA00E5E5
      E500DDDDDD00E6E6E600EBEBEB00E7E7E700EBEBEB00EBEBEB00E6E6E600E2E2
      E200E4E4E400EAEAEA00EEEEEE00EDEDED00EBEBEB00EBEBEB00E7E7E700E8E8
      E800EAEAEA00E3E3E300DEDEDE00E4E4E400ECECEC00ECECEC00F0F0F000E1E1
      E100EAEAEA00EAEAEA00E5E5E500E3E3E300F1F1F100EEEEEE00E7E7E700E2E2
      E200F1F1F100EEEEEE00DFDFDF00E7E7E700EBEBEB00E3E3E300DEDEDE00DEDE
      DE00ECECEC00ECECEC00EBEBEB00DCDCDC00E0E0E000EDEDED00EDEDED00EAEA
      EA00DEDEDE00E1E1E100F1F1F100F0F0F000EBEBEB00EDEDED00EEEEEE00EEEE
      EE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EEEEEE00EEEEEE00EEEE
      EE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0F000EFEF
      EF00EFEFEF00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F1F1F100F0F0F000F0F0F000EFEFEF00EEEEEE00E5E5E500E7E7E700EAEA
      EA00EDEDED00EFEFEF00F0F0F000EFEFEF00E2E2E200E2E2E200E8E8E800E9E9
      E900E3E3E300D6D6D600EBEBEB00E5E5E500DADADA00E7E7E700EDEDED00E8E8
      E800EDEDED00ECECEC00E4E4E400DCDCDC00DDDDDD00E5E5E500EEEEEE00F2F2
      F200F1F1F100EAEAEA00E4E4E400E8E8E800EAEAEA00E0E0E000DDDDDD00E8E8
      E800F0F0F000DEDEDE00E1E1E100D5D5D500E2E2E200E5E5E500E1E1E100E2E2
      E200F5F5F500E7E7E700E4E4E400E2E2E200F2F2F200E4E4E400CDCDCD00E0E0
      E000E8E8E800E3E3E300D7D7D700DDDDDD00ECECEC00EAEAEA00ECECEC00DEDE
      DE00E6E6E600EAEAEA00EBEBEB00E7E7E700D9D9D900DEDEDE00F1F1F100EEEE
      EE00E6E6E600ECECEC00EDEDED00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EFEFEF00EFEF
      EF00EFEFEF00F0F0F000F0F0F000EFEFEF00EFEFEF00EEEEEE00EDEDED00EDED
      ED00EDEDED00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F1F1F100F0F0F000F0F0F000EFEF
      EF00EEEEEE00E5E5E500E7E7E700EBEBEB00EEEEEE00F0F0F000F0F0F000F0F0
      F000EFEFEF00EEEEEE00EFEFEF00EFEFEF00F3F3F300EFEFEF00EBEBEB00EEEE
      EE00E7E7E700DCDCDC00D8D8D800BFBFBF00E4E4E400E2E2E200DADADA00CDCD
      CD00CFCFCF00E4E4E400E3E3E300E1E1E100E6E6E600E8E8E800DEDEDE00DCDC
      DC00E9E9E900EAEAEA00E0E0E000E2E2E200E5E5E500E3E3E300EBEBEB00EDED
      ED00DFDFDF00EBEBEB00EBEBEB00E6E6E600E0E0E000E6E6E600E6E6E600E2E2
      E200E2E2E200E8E8E800E9E9E900E3E3E300D6D6D600EBEBEB00E5E5E500DADA
      DA00E7E7E700EDEDED00E8E8E800EDEDED00ECECEC00E4E4E400DCDCDC00DDDD
      DD00E5E5E500EEEEEE00F2F2F200F1F1F100EAEAEA00E4E4E400E8E8E800EAEA
      EA00E0E0E000DDDDDD00E8E8E800F0F0F000DEDEDE00E1E1E100D5D5D500E2E2
      E200E5E5E500E1E1E100E2E2E200F5F5F500E7E7E700E4E4E400E2E2E200F2F2
      F200E4E4E400CDCDCD00E0E0E000E8E8E800E3E3E300D7D7D700DDDDDD00ECEC
      EC00EAEAEA00ECECEC00DEDEDE00E6E6E600EAEAEA00EBEBEB00E7E7E700D9D9
      D900DEDEDE00F1F1F100EEEEEE00E6E6E600ECECEC00EDEDED00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EFEFEF00EFEFEF00EFEFEF00F0F0F000F0F0F000EFEFEF00EFEF
      EF00EEEEEE00EDEDED00EDEDED00EDEDED00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F1F1
      F100F0F0F000F0F0F000EFEFEF00EEEEEE00E5E5E500E7E7E700EBEBEB00EEEE
      EE00F0F0F000F0F0F000F0F0F000EFEFEF00EEEEEE00EFEFEF00EFEFEF00F3F3
      F300EFEFEF00EBEBEB00EEEEEE00E7E7E700DCDCDC00D8D8D800BFBFBF00E4E4
      E400E2E2E200DADADA00CDCDCD00CFCFCF00E4E4E400E3E3E300E1E1E100E6E6
      E600E8E8E800DEDEDE00DCDCDC00E9E9E900EAEAEA00E0E0E000E2E2E200E5E5
      E500E3E3E300EBEBEB00EDEDED00DFDFDF00EBEBEB00EBEBEB00E6E6E600E0E0
      E000E6E6E600E6E6E600E2E2E200E2E2E200E8E8E800E9E9E900E3E3E300D6D6
      D600EBEBEB00E5E5E500DADADA00E7E7E700EDEDED00E8E8E800EDEDED00ECEC
      EC00E4E4E400DCDCDC00DDDDDD00E5E5E500EEEEEE00F2F2F200F1F1F100EAEA
      EA00E4E4E400E8E8E800EAEAEA00E0E0E000DDDDDD00E8E8E800F0F0F000DEDE
      DE00E1E1E100D5D5D500E2E2E200E5E5E500E1E1E100E2E2E200F5F5F500E7E7
      E700E4E4E400E2E2E200F2F2F200E4E4E400CDCDCD00E0E0E000E8E8E800E3E3
      E300D7D7D700DDDDDD00ECECEC00EAEAEA00ECECEC00DEDEDE00E6E6E600EAEA
      EA00EBEBEB00E7E7E700D9D9D900DEDEDE00F1F1F100EEEEEE00E6E6E600ECEC
      EC00EDEDED00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EFEFEF00EFEFEF00EFEFEF00F0F0
      F000F0F0F000EFEFEF00EFEFEF00EEEEEE00EDEDED00EDEDED00EDEDED00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F1F1F100F0F0F000F0F0F000EFEFEF00EEEEEE00E5E5
      E500E7E7E700EBEBEB00EEEEEE00F0F0F000F0F0F000F0F0F000DFDFDF00E4E4
      E400E8E8E800E0E0E000D2D2D200DADADA00E6E6E600E7E7E700D2D2D200EBEB
      EB00EAEAEA00ECECEC00E9E9E900ECECEC00E6E6E600E8E8E800E7E7E700ECEC
      EC00E9E9E900EBEBEB00EEEEEE00ECECEC00EEEEEE00EFEFEF00F1F1F100DADA
      DA00DCDCDC00E5E5E500EFEFEF00D6D6D600E0E0E000C9C9C900EEEEEE00E4E4
      E400C4C4C400EAEAEA00F1F1F100E6E6E600E5E5E500EAEAEA00EAEAEA00DFDF
      DF00D9D9D900EAEAEA00EDEDED00E8E8E800DEDEDE00E4E4E400F2F2F200E8E8
      E800EFEFEF00E9E9E900E5E5E500EAEAEA00ECECEC00EAEAEA00C8C8C800E9E9
      E900E7E7E700EDEDED00ECECEC00E7E7E700E8E8E800E9E9E900F0F0F000E8E8
      E800F0F0F000EFEFEF00ECECEC00E9E9E900EDEDED00EDEDED00EFEFEF00EDED
      ED00E9E9E900EFEFEF00F0F0F000EEEEEE00F0F0F000F1F1F100F0F0F000F0F0
      F000F0F0F000ECECEC00E6E6E600EFEFEF00EDEDED00EBEBEB00F0F0F000F2F2
      F200EFEFEF00EEEEEE00EFEFEF00EBEBEB00F5F5F500EDEDED00F1F1F100EDED
      ED00F1F1F100EEEEEE00EBEBEB00EEEEEE00EEEEEE00F0F0F000F4F4F400F0F0
      F000EFEFEF00F0F0F000E8E8E800E3E3E300E2E2E200E5E5E500E6E6E600EDED
      ED00F2F2F200EEEEEE00F5F5F500ECECEC00EDEDED00EFEFEF00F1F1F100EDED
      ED00E0E0E000EFEFEF00E2E2E200D3D3D300F8F8F800B8B8B800C5C5C500E0E0
      E000DADADA00E1E1E100C0C0C000D8D8D800DCDCDC00F2F2F200E0E0E000DBDB
      DB00DFDFDF00DBDBDB00EAEAEA00EBEBEB00D7D7D700E9E9E900E5E5E500DFDF
      DF00F4F4F400E3E3E300DBDBDB00EBEBEB00EFEFEF00E5E5E500E2E2E200DEDE
      DE00DDDDDD00DFDFDF00E4E4E400E8E8E800E0E0E000D2D2D200DADADA00E6E6
      E600E7E7E700D2D2D200EBEBEB00EAEAEA00ECECEC00E9E9E900ECECEC00E6E6
      E600E8E8E800E7E7E700ECECEC00E9E9E900EBEBEB00EEEEEE00ECECEC00EEEE
      EE00EFEFEF00F1F1F100DADADA00DCDCDC00E5E5E500EFEFEF00D6D6D600E0E0
      E000C9C9C900EEEEEE00E4E4E400C4C4C400EAEAEA00F1F1F100E6E6E600E5E5
      E500EAEAEA00EAEAEA00DFDFDF00D9D9D900EAEAEA00EDEDED00E8E8E800DEDE
      DE00E4E4E400F2F2F200E8E8E800EFEFEF00E9E9E900E5E5E500EAEAEA00ECEC
      EC00EAEAEA00C8C8C800E9E9E900E7E7E700EDEDED00ECECEC00E7E7E700E8E8
      E800E9E9E900F0F0F000E8E8E800F0F0F000EFEFEF00ECECEC00E9E9E900EDED
      ED00EDEDED00EFEFEF00EDEDED00E9E9E900EFEFEF00F0F0F000EEEEEE00F0F0
      F000F1F1F100F0F0F000F0F0F000F0F0F000ECECEC00E6E6E600EFEFEF00EDED
      ED00EBEBEB00F0F0F000F2F2F200EFEFEF00EEEEEE00EFEFEF00EBEBEB00F5F5
      F500EDEDED00F1F1F100EDEDED00F1F1F100EEEEEE00EBEBEB00EEEEEE00EEEE
      EE00F0F0F000F4F4F400F0F0F000EFEFEF00F0F0F000E8E8E800E3E3E300E2E2
      E200E5E5E500E6E6E600EDEDED00F2F2F200EEEEEE00F5F5F500ECECEC00EDED
      ED00EFEFEF00F1F1F100EDEDED00E0E0E000EFEFEF00E2E2E200D3D3D300F8F8
      F800B8B8B800C5C5C500E0E0E000DADADA00E1E1E100C0C0C000D8D8D800DCDC
      DC00F2F2F200E0E0E000DBDBDB00DFDFDF00DBDBDB00EAEAEA00EBEBEB00D7D7
      D700E9E9E900E5E5E500DFDFDF00F4F4F400E3E3E300DBDBDB00EBEBEB00EFEF
      EF00E5E5E500E2E2E200DEDEDE00DDDDDD00DFDFDF00E4E4E400E8E8E800E0E0
      E000D2D2D200DADADA00E6E6E600E7E7E700D2D2D200EBEBEB00EAEAEA00ECEC
      EC00E9E9E900ECECEC00E6E6E600E8E8E800E7E7E700ECECEC00E9E9E900EBEB
      EB00EEEEEE00ECECEC00EEEEEE00EFEFEF00F1F1F100DADADA00DCDCDC00E5E5
      E500EFEFEF00D6D6D600E0E0E000C9C9C900EEEEEE00E4E4E400C4C4C400EAEA
      EA00F1F1F100E6E6E600E5E5E500EAEAEA00EAEAEA00DFDFDF00D9D9D900EAEA
      EA00EDEDED00E8E8E800DEDEDE00E4E4E400F2F2F200E8E8E800EFEFEF00E9E9
      E900E5E5E500EAEAEA00ECECEC00EAEAEA00C8C8C800E9E9E900E7E7E700EDED
      ED00ECECEC00E7E7E700E8E8E800E9E9E900F0F0F000E8E8E800F0F0F000EFEF
      EF00ECECEC00E9E9E900EDEDED00EDEDED00EFEFEF00EDEDED00E9E9E900EFEF
      EF00F0F0F000EEEEEE00F0F0F000F1F1F100F0F0F000F0F0F000F0F0F000ECEC
      EC00E6E6E600EFEFEF00EDEDED00EBEBEB00F0F0F000F2F2F200EFEFEF00EEEE
      EE00EFEFEF00EBEBEB00F5F5F500EDEDED00F1F1F100EDEDED00F1F1F100EEEE
      EE00EBEBEB00EEEEEE00EEEEEE00F0F0F000F4F4F400F0F0F000EFEFEF00F0F0
      F000E8E8E800E3E3E300E2E2E200E5E5E500E6E6E600EDEDED00F2F2F200EEEE
      EE00DDDDDD00E2E2E200E6E6E600DEDEDE00D2D2D200DDDDDD00E6E6E600E6E6
      E600CCCCCC00E3E3E300E4E4E400E8E8E800E9E9E900E7E7E700E8E8E800E0E0
      E000E5E5E500E6E6E600E8E8E800EDEDED00EBEBEB00EAEAEA00ECECEC00EEEE
      EE00EAEAEA00D9D9D900DFDFDF00E6E6E600EFEFEF00D2D2D200DEDEDE00D0D0
      D000EBEBEB00D3D3D300C8C8C800EBEBEB00EDEDED00DFDFDF00DBDBDB00E8E8
      E800EAEAEA00D9D9D900DFDFDF00EFEFEF00EEEEEE00E8E8E800DCDCDC00DBDB
      DB00E7E7E700E7E7E700EAEAEA00E5E5E500E1E1E100E5E5E500EBEBEB00E4E4
      E400C2C2C200E6E6E600E8E8E800EDEDED00E7E7E700E9E9E900E8E8E800E6E6
      E600EFEFEF00E9E9E900F1F1F100EFEFEF00EDEDED00E8E8E800EBEBEB00EDED
      ED00EFEFEF00ECECEC00E8E8E800ECECEC00EFEFEF00EEEEEE00ECECEC00ECEC
      EC00ECECEC00ECECEC00EAEAEA00E8E8E800E7E7E700EBEBEB00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EBEBEB00E9E9E900EAEAEA00E8E8E800F1F1F100EDED
      ED00EDEDED00EEEEEE00F2F2F200E7E7E700F3F3F300EDEDED00E8E8E800EDED
      ED00F1F1F100EBEBEB00EBEBEB00EAEAEA00DCDCDC00E1E1E100E4E4E400E4E4
      E400DEDEDE00E5E5E500ECECEC00E7E7E700ECECEC00E8E8E800E5E5E500F1F1
      F100F3F3F300E8E8E800DDDDDD00DEDEDE00B4B4B400C0C0C000D9D9D900DEDE
      DE00ABABAB00CDCDCD00D0D0D000D5D5D500C0C0C000D2D2D200DADADA00EBEB
      EB00E2E2E200DBDBDB00E2E2E200DCDCDC00ECECEC00EAEAEA00D5D5D500E0E0
      E000DEDEDE00D5D5D500F2F2F200DFDFDF00DADADA00EBEBEB00E7E7E700DDDD
      DD00E6E6E600E3E3E300DFDFDF00DDDDDD00E2E2E200E6E6E600DEDEDE00D2D2
      D200DDDDDD00E6E6E600E6E6E600CCCCCC00E3E3E300E4E4E400E8E8E800E9E9
      E900E7E7E700E8E8E800E0E0E000E5E5E500E6E6E600E8E8E800EDEDED00EBEB
      EB00EAEAEA00ECECEC00EEEEEE00EAEAEA00D9D9D900DFDFDF00E6E6E600EFEF
      EF00D2D2D200DEDEDE00D0D0D000EBEBEB00D3D3D300C8C8C800EBEBEB00EDED
      ED00DFDFDF00DBDBDB00E8E8E800EAEAEA00D9D9D900DFDFDF00EFEFEF00EEEE
      EE00E8E8E800DCDCDC00DBDBDB00E7E7E700E7E7E700EAEAEA00E5E5E500E1E1
      E100E5E5E500EBEBEB00E4E4E400C2C2C200E6E6E600E8E8E800EDEDED00E7E7
      E700E9E9E900E8E8E800E6E6E600EFEFEF00E9E9E900F1F1F100EFEFEF00EDED
      ED00E8E8E800EBEBEB00EDEDED00EFEFEF00ECECEC00E8E8E800ECECEC00EFEF
      EF00EEEEEE00ECECEC00ECECEC00ECECEC00ECECEC00EAEAEA00E8E8E800E7E7
      E700EBEBEB00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EBEBEB00E9E9E900EAEA
      EA00E8E8E800F1F1F100EDEDED00EDEDED00EEEEEE00F2F2F200E7E7E700F3F3
      F300EDEDED00E8E8E800EDEDED00F1F1F100EBEBEB00EBEBEB00EAEAEA00DCDC
      DC00E1E1E100E4E4E400E4E4E400DEDEDE00E5E5E500ECECEC00E7E7E700ECEC
      EC00E8E8E800E5E5E500F1F1F100F3F3F300E8E8E800DDDDDD00DEDEDE00B4B4
      B400C0C0C000D9D9D900DEDEDE00ABABAB00CDCDCD00D0D0D000D5D5D500C0C0
      C000D2D2D200DADADA00EBEBEB00E2E2E200DBDBDB00E2E2E200DCDCDC00ECEC
      EC00EAEAEA00D5D5D500E0E0E000DEDEDE00D5D5D500F2F2F200DFDFDF00DADA
      DA00EBEBEB00E7E7E700DDDDDD00E6E6E600E3E3E300DFDFDF00DDDDDD00E2E2
      E200E6E6E600DEDEDE00D2D2D200DDDDDD00E6E6E600E6E6E600CCCCCC00E3E3
      E300E4E4E400E8E8E800E9E9E900E7E7E700E8E8E800E0E0E000E5E5E500E6E6
      E600E8E8E800EDEDED00EBEBEB00EAEAEA00ECECEC00EEEEEE00EAEAEA00D9D9
      D900DFDFDF00E6E6E600EFEFEF00D2D2D200DEDEDE00D0D0D000EBEBEB00D3D3
      D300C8C8C800EBEBEB00EDEDED00DFDFDF00DBDBDB00E8E8E800EAEAEA00D9D9
      D900DFDFDF00EFEFEF00EEEEEE00E8E8E800DCDCDC00DBDBDB00E7E7E700E7E7
      E700EAEAEA00E5E5E500E1E1E100E5E5E500EBEBEB00E4E4E400C2C2C200E6E6
      E600E8E8E800EDEDED00E7E7E700E9E9E900E8E8E800E6E6E600EFEFEF00E9E9
      E900F1F1F100EFEFEF00EDEDED00E8E8E800EBEBEB00EDEDED00EFEFEF00ECEC
      EC00E8E8E800ECECEC00EFEFEF00EEEEEE00ECECEC00ECECEC00ECECEC00ECEC
      EC00EAEAEA00E8E8E800E7E7E700EBEBEB00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EBEBEB00E9E9E900EAEAEA00E8E8E800F1F1F100EDEDED00EDEDED00EEEE
      EE00F2F2F200E7E7E700F3F3F300EDEDED00E8E8E800EDEDED00F1F1F100EBEB
      EB00EBEBEB00EAEAEA00DCDCDC00E1E1E100E4E4E400E4E4E400DEDEDE00E5E5
      E500ECECEC00E7E7E700D4D4D400DBDBDB00DCDCDC00D2D2D200C8C8C800DEDE
      DE00E4E4E400E5E5E500C7C7C700DFDFDF00E5E5E500E6E6E600E9E9E900E4E4
      E400EBEBEB00DCDCDC00E6E6E600E1E1E100ECECEC00EDEDED00E9E9E900EFEF
      EF00EFEFEF00F1F1F100E1E1E100D6D6D600DEDEDE00E1E1E100E8E8E800D7D7
      D700E2E2E200DEDEDE00EFEFEF00C9C9C900DCDCDC00F1F1F100E7E7E700E2E2
      E200D7D7D700E8E8E800E4E4E400C8C8C800E0E0E000EDEDED00E8E8E800EBEB
      EB00DCDCDC00D5D5D500DDDDDD00E5E5E500E1E1E100DFDFDF00DDDDDD00DFDF
      DF00EBEBEB00DDDDDD00B8B8B800E3E3E300E7E7E700EAEAEA00DADADA00DDDD
      DD00DFDFDF00E1E1E100EDEDED00E9E9E900EFEFEF00EDEDED00EFEFEF00E7E7
      E700E6E6E600ECECEC00EFEFEF00ECECEC00E7E7E700E6E6E600EEEEEE00F1F1
      F100ECECEC00ECECEC00EDEDED00EEEEEE00E6E6E600E7E7E700EDEDED00E2E2
      E200E5E5E500EEEEEE00EEEEEE00EEEEEE00EBEBEB00EBEBEB00EAEAEA00EAEA
      EA00E9E9E900ECECEC00EEEEEE00EBEBEB00F0F0F000E3E3E300F3F3F300E9E9
      E900E4E4E400EEEEEE00F4F4F400E9E9E900E3E3E300E4E4E400E3E3E300D5D5
      D500E3E3E300E6E6E600D6D6D600DCDCDC00EDEDED00EDEDED00EFEFEF00EFEF
      EF00E6E6E600EEEEEE00EDEDED00EBEBEB00E8E8E800E9E9E900CECECE00C0C0
      C000DFDFDF00E9E9E900BBBBBB00B4B4B400D5D5D500E1E1E100C5C5C500CCCC
      CC00DADADA00E2E2E200DCDCDC00CFCFCF00DADADA00D6D6D600E6E6E600E9E9
      E900D3D3D300D5D5D500D8D8D800C8C8C800EDEDED00D8D8D800D7D7D700ECEC
      EC00E7E7E700DFDFDF00D8D8D800D9D9D900D4D4D400D4D4D400DBDBDB00DCDC
      DC00D2D2D200C8C8C800DEDEDE00E4E4E400E5E5E500C7C7C700DFDFDF00E5E5
      E500E6E6E600E9E9E900E4E4E400EBEBEB00DCDCDC00E6E6E600E1E1E100ECEC
      EC00EDEDED00E9E9E900EFEFEF00EFEFEF00F1F1F100E1E1E100D6D6D600DEDE
      DE00E1E1E100E8E8E800D7D7D700E2E2E200DEDEDE00EFEFEF00C9C9C900DCDC
      DC00F1F1F100E7E7E700E2E2E200D7D7D700E8E8E800E4E4E400C8C8C800E0E0
      E000EDEDED00E8E8E800EBEBEB00DCDCDC00D5D5D500DDDDDD00E5E5E500E1E1
      E100DFDFDF00DDDDDD00DFDFDF00EBEBEB00DDDDDD00B8B8B800E3E3E300E7E7
      E700EAEAEA00DADADA00DDDDDD00DFDFDF00E1E1E100EDEDED00E9E9E900EFEF
      EF00EDEDED00EFEFEF00E7E7E700E6E6E600ECECEC00EFEFEF00ECECEC00E7E7
      E700E6E6E600EEEEEE00F1F1F100ECECEC00ECECEC00EDEDED00EEEEEE00E6E6
      E600E7E7E700EDEDED00E2E2E200E5E5E500EEEEEE00EEEEEE00EEEEEE00EBEB
      EB00EBEBEB00EAEAEA00EAEAEA00E9E9E900ECECEC00EEEEEE00EBEBEB00F0F0
      F000E3E3E300F3F3F300E9E9E900E4E4E400EEEEEE00F4F4F400E9E9E900E3E3
      E300E4E4E400E3E3E300D5D5D500E3E3E300E6E6E600D6D6D600DCDCDC00EDED
      ED00EDEDED00EFEFEF00EFEFEF00E6E6E600EEEEEE00EDEDED00EBEBEB00E8E8
      E800E9E9E900CECECE00C0C0C000DFDFDF00E9E9E900BBBBBB00B4B4B400D5D5
      D500E1E1E100C5C5C500CCCCCC00DADADA00E2E2E200DCDCDC00CFCFCF00DADA
      DA00D6D6D600E6E6E600E9E9E900D3D3D300D5D5D500D8D8D800C8C8C800EDED
      ED00D8D8D800D7D7D700ECECEC00E7E7E700DFDFDF00D8D8D800D9D9D900D4D4
      D400D4D4D400DBDBDB00DCDCDC00D2D2D200C8C8C800DEDEDE00E4E4E400E5E5
      E500C7C7C700DFDFDF00E5E5E500E6E6E600E9E9E900E4E4E400EBEBEB00DCDC
      DC00E6E6E600E1E1E100ECECEC00EDEDED00E9E9E900EFEFEF00EFEFEF00F1F1
      F100E1E1E100D6D6D600DEDEDE00E1E1E100E8E8E800D7D7D700E2E2E200DEDE
      DE00EFEFEF00C9C9C900DCDCDC00F1F1F100E7E7E700E2E2E200D7D7D700E8E8
      E800E4E4E400C8C8C800E0E0E000EDEDED00E8E8E800EBEBEB00DCDCDC00D5D5
      D500DDDDDD00E5E5E500E1E1E100DFDFDF00DDDDDD00DFDFDF00EBEBEB00DDDD
      DD00B8B8B800E3E3E300E7E7E700EAEAEA00DADADA00DDDDDD00DFDFDF00E1E1
      E100EDEDED00E9E9E900EFEFEF00EDEDED00EFEFEF00E7E7E700E6E6E600ECEC
      EC00EFEFEF00ECECEC00E7E7E700E6E6E600EEEEEE00F1F1F100ECECEC00ECEC
      EC00EDEDED00EEEEEE00E6E6E600E7E7E700EDEDED00E2E2E200E5E5E500EEEE
      EE00EEEEEE00EEEEEE00EBEBEB00EBEBEB00EAEAEA00EAEAEA00E9E9E900ECEC
      EC00EEEEEE00EBEBEB00F0F0F000E3E3E300F3F3F300E9E9E900E4E4E400EEEE
      EE00F4F4F400E9E9E900E3E3E300E4E4E400E3E3E300D5D5D500E3E3E300E6E6
      E600D6D6D600DCDCDC00EDEDED00EDEDED00DDDDDD00E4E4E400DFDFDF00D0D0
      D000C9C9C900E0E0E000E1E1E100E4E4E400C4C4C400E0E0E000ECECEC00E7E7
      E700E9E9E900E7E7E700ECECEC00E0E0E000E9E9E900DDDDDD00F0F0F000E6E6
      E600E8E8E800EAEAEA00E9E9E900EAEAEA00D4D4D400D7D7D700E3E3E300E6E6
      E600EAEAEA00D8D8D800E4E4E400E8E8E800E5E5E500B0B0B000DDDDDD00F0F0
      F000EBEBEB00D8D8D800CCCCCC00E6E6E600DEDEDE00C4C4C400E9E9E900F2F2
      F200E9E9E900EDEDED00D4D4D400D1D1D100D4D4D400E0E0E000D7D7D700DBDB
      DB00D6D6D600D1D1D100E5E5E500D1D1D100AEAEAE00E2E2E200E9E9E900EAEA
      EA00D1D1D100D6D6D600DBDBDB00E0E0E000EFEFEF00EBEBEB00ECECEC00E9E9
      E900EEEEEE00E5E5E500DFDFDF00EAEAEA00EFEFEF00ECECEC00E6E6E600E0E0
      E000ECECEC00F2F2F200EBEBEB00ECECEC00EEEEEE00F1F1F100E1E1E100E5E5
      E500F1F1F100E2E2E200D7D7D700EAEAEA00F0F0F000EEEEEE00EBEBEB00EFEF
      EF00E7E7E700EEEEEE00E4E4E400E7E7E700F1F1F100E9E9E900EDEDED00E4E4
      E400E9E9E900EFEFEF00E4E4E400E6E6E600EBEBEB00EAEAEA00DFDFDF00D8D8
      D800E1E1E100CFCFCF00E4E4E400EFEFEF00DADADA00D1D1D100E4E4E400EFEF
      EF00F1F1F100EBEBEB00E7E7E700EEEEEE00E9E9E900F2F2F200E2E2E200D8D8
      D800E3E3E300BEBEBE00EBEBEB00DADADA00D0D0D000A8A8A800BABABA00EFEF
      EF00C8C8C800BBBBBB00D3D3D300E0E0E000DEDEDE00CACACA00D9D9D900D6D6
      D600E2E2E200EAEAEA00D3D3D300D0D0D000D8D8D800C1C1C100E8E8E800CFCF
      CF00D4D4D400D9D9D900DEDEDE00D7D7D700DBDBDB00DFDFDF00DCDCDC00DDDD
      DD00E4E4E400DFDFDF00D0D0D000C9C9C900E0E0E000E1E1E100E4E4E400C4C4
      C400E0E0E000ECECEC00E7E7E700E9E9E900E7E7E700ECECEC00E0E0E000E9E9
      E900DDDDDD00F0F0F000E6E6E600E8E8E800EAEAEA00E9E9E900EAEAEA00D4D4
      D400D7D7D700E3E3E300E6E6E600EAEAEA00D8D8D800E4E4E400E8E8E800E5E5
      E500B0B0B000DDDDDD00F0F0F000EBEBEB00D8D8D800CCCCCC00E6E6E600DEDE
      DE00C4C4C400E9E9E900F2F2F200E9E9E900EDEDED00D4D4D400D1D1D100D4D4
      D400E0E0E000D7D7D700DBDBDB00D6D6D600D1D1D100E5E5E500D1D1D100AEAE
      AE00E2E2E200E9E9E900EAEAEA00D1D1D100D6D6D600DBDBDB00E0E0E000EFEF
      EF00EBEBEB00ECECEC00E9E9E900EEEEEE00E5E5E500DFDFDF00EAEAEA00EFEF
      EF00ECECEC00E6E6E600E0E0E000ECECEC00F2F2F200EBEBEB00ECECEC00EEEE
      EE00F1F1F100E1E1E100E5E5E500F1F1F100E2E2E200D7D7D700EAEAEA00F0F0
      F000EEEEEE00EBEBEB00EFEFEF00E7E7E700EEEEEE00E4E4E400E7E7E700F1F1
      F100E9E9E900EDEDED00E4E4E400E9E9E900EFEFEF00E4E4E400E6E6E600EBEB
      EB00EAEAEA00DFDFDF00D8D8D800E1E1E100CFCFCF00E4E4E400EFEFEF00DADA
      DA00D1D1D100E4E4E400EFEFEF00F1F1F100EBEBEB00E7E7E700EEEEEE00E9E9
      E900F2F2F200E2E2E200D8D8D800E3E3E300BEBEBE00EBEBEB00DADADA00D0D0
      D000A8A8A800BABABA00EFEFEF00C8C8C800BBBBBB00D3D3D300E0E0E000DEDE
      DE00CACACA00D9D9D900D6D6D600E2E2E200EAEAEA00D3D3D300D0D0D000D8D8
      D800C1C1C100E8E8E800CFCFCF00D4D4D400D9D9D900DEDEDE00D7D7D700DBDB
      DB00DFDFDF00DCDCDC00DDDDDD00E4E4E400DFDFDF00D0D0D000C9C9C900E0E0
      E000E1E1E100E4E4E400C4C4C400E0E0E000ECECEC00E7E7E700E9E9E900E7E7
      E700ECECEC00E0E0E000E9E9E900DDDDDD00F0F0F000E6E6E600E8E8E800EAEA
      EA00E9E9E900EAEAEA00D4D4D400D7D7D700E3E3E300E6E6E600EAEAEA00D8D8
      D800E4E4E400E8E8E800E5E5E500B0B0B000DDDDDD00F0F0F000EBEBEB00D8D8
      D800CCCCCC00E6E6E600DEDEDE00C4C4C400E9E9E900F2F2F200E9E9E900EDED
      ED00D4D4D400D1D1D100D4D4D400E0E0E000D7D7D700DBDBDB00D6D6D600D1D1
      D100E5E5E500D1D1D100AEAEAE00E2E2E200E9E9E900EAEAEA00D1D1D100D6D6
      D600DBDBDB00E0E0E000EFEFEF00EBEBEB00ECECEC00E9E9E900EEEEEE00E5E5
      E500DFDFDF00EAEAEA00EFEFEF00ECECEC00E6E6E600E0E0E000ECECEC00F2F2
      F200EBEBEB00ECECEC00EEEEEE00F1F1F100E1E1E100E5E5E500F1F1F100E2E2
      E200D7D7D700EAEAEA00F0F0F000EEEEEE00EBEBEB00EFEFEF00E7E7E700EEEE
      EE00E4E4E400E7E7E700F1F1F100E9E9E900EDEDED00E4E4E400E9E9E900EFEF
      EF00E4E4E400E6E6E600EBEBEB00EAEAEA00DFDFDF00D8D8D800E1E1E100CFCF
      CF00E4E4E400EFEFEF00DADADA00D1D1D100E4E4E400EFEFEF00D8D8D800DEDE
      DE00D1D1D100C1C1C100C4C4C400E6E6E600DFDFDF00E1E1E100BCBCBC00DBDB
      DB00EEEEEE00E5E5E500E6E6E600E9E9E900E7E7E700E6E6E600E9E9E900D8D8
      D800EDEDED00D8D8D800E5E5E500EAEAEA00E8E8E800E5E5E500CBCBCB00D9D9
      D900E2E2E200E6E6E600E7E7E700C9C9C900E4E4E400F3F3F300DEDEDE00A7A7
      A700DDDDDD00E9E9E900ECECEC00D1D1D100CCCCCC00E9E9E900DBDBDB00CFCF
      CF00F2F2F200F3F3F300E9E9E900EFEFEF00C2C2C200D0D0D000D3D3D300E1E1
      E100D9D9D900E4E4E400D5D5D500CDCDCD00E7E7E700CBCBCB00A7A7A700E0E0
      E000E4E4E400E0E0E000BEBEBE00E1E1E100DDDDDD00DBDBDB00EBEBEB00EDED
      ED00EEEEEE00E6E6E600EAEAEA00E3E3E300D7D7D700E7E7E700EEEEEE00EDED
      ED00E6E6E600DADADA00EAEAEA00EBEBEB00E4E4E400E8E8E800E9E9E900EEEE
      EE00D9D9D900DDDDDD00EDEDED00EAEAEA00CECECE00E6E6E600F1F1F100EFEF
      EF00EAEAEA00EEEEEE00E1E1E100E9E9E900E9E9E900DDDDDD00E8E8E800ECEC
      EC00ECECEC00DFDFDF00E1E1E100F3F3F300E8E8E800DADADA00D8D8D800EDED
      ED00F2F2F200DEDEDE00E0E0E000C9C9C900D9D9D900F0F0F000E5E5E500CACA
      CA00C9C9C900DBDBDB00EFEFEF00DDDDDD00DCDCDC00F1F1F100EDEDED00EFEF
      EF00D2D2D200B5B5B500C4C4C400B3B3B300DCDCDC00E5E5E500CDCDCD00B5B5
      B500A2A2A200DBDBDB00D6D6D600A9A9A900C4C4C400E4E4E400E7E7E700D2D2
      D200E1E1E100DFDFDF00E6E6E600E2E2E200CBCBCB00CBCBCB00D5D5D500B8B8
      B800D6D6D600BEBEBE00C9C9C900D4D4D400DEDEDE00D9D9D900DADADA00DEDE
      DE00D8D8D800D8D8D800DEDEDE00D1D1D100C1C1C100C4C4C400E6E6E600DFDF
      DF00E1E1E100BCBCBC00DBDBDB00EEEEEE00E5E5E500E6E6E600E9E9E900E7E7
      E700E6E6E600E9E9E900D8D8D800EDEDED00D8D8D800E5E5E500EAEAEA00E8E8
      E800E5E5E500CBCBCB00D9D9D900E2E2E200E6E6E600E7E7E700C9C9C900E4E4
      E400F3F3F300DEDEDE00A7A7A700DDDDDD00E9E9E900ECECEC00D1D1D100CCCC
      CC00E9E9E900DBDBDB00CFCFCF00F2F2F200F3F3F300E9E9E900EFEFEF00C2C2
      C200D0D0D000D3D3D300E1E1E100D9D9D900E4E4E400D5D5D500CDCDCD00E7E7
      E700CBCBCB00A7A7A700E0E0E000E4E4E400E0E0E000BEBEBE00E1E1E100DDDD
      DD00DBDBDB00EBEBEB00EDEDED00EEEEEE00E6E6E600EAEAEA00E3E3E300D7D7
      D700E7E7E700EEEEEE00EDEDED00E6E6E600DADADA00EAEAEA00EBEBEB00E4E4
      E400E8E8E800E9E9E900EEEEEE00D9D9D900DDDDDD00EDEDED00EAEAEA00CECE
      CE00E6E6E600F1F1F100EFEFEF00EAEAEA00EEEEEE00E1E1E100E9E9E900E9E9
      E900DDDDDD00E8E8E800ECECEC00ECECEC00DFDFDF00E1E1E100F3F3F300E8E8
      E800DADADA00D8D8D800EDEDED00F2F2F200DEDEDE00E0E0E000C9C9C900D9D9
      D900F0F0F000E5E5E500CACACA00C9C9C900DBDBDB00EFEFEF00DDDDDD00DCDC
      DC00F1F1F100EDEDED00EFEFEF00D2D2D200B5B5B500C4C4C400B3B3B300DCDC
      DC00E5E5E500CDCDCD00B5B5B500A2A2A200DBDBDB00D6D6D600A9A9A900C4C4
      C400E4E4E400E7E7E700D2D2D200E1E1E100DFDFDF00E6E6E600E2E2E200CBCB
      CB00CBCBCB00D5D5D500B8B8B800D6D6D600BEBEBE00C9C9C900D4D4D400DEDE
      DE00D9D9D900DADADA00DEDEDE00D8D8D800D8D8D800DEDEDE00D1D1D100C1C1
      C100C4C4C400E6E6E600DFDFDF00E1E1E100BCBCBC00DBDBDB00EEEEEE00E5E5
      E500E6E6E600E9E9E900E7E7E700E6E6E600E9E9E900D8D8D800EDEDED00D8D8
      D800E5E5E500EAEAEA00E8E8E800E5E5E500CBCBCB00D9D9D900E2E2E200E6E6
      E600E7E7E700C9C9C900E4E4E400F3F3F300DEDEDE00A7A7A700DDDDDD00E9E9
      E900ECECEC00D1D1D100CCCCCC00E9E9E900DBDBDB00CFCFCF00F2F2F200F3F3
      F300E9E9E900EFEFEF00C2C2C200D0D0D000D3D3D300E1E1E100D9D9D900E4E4
      E400D5D5D500CDCDCD00E7E7E700CBCBCB00A7A7A700E0E0E000E4E4E400E0E0
      E000BEBEBE00E1E1E100DDDDDD00DBDBDB00EBEBEB00EDEDED00EEEEEE00E6E6
      E600EAEAEA00E3E3E300D7D7D700E7E7E700EEEEEE00EDEDED00E6E6E600DADA
      DA00EAEAEA00EBEBEB00E4E4E400E8E8E800E9E9E900EEEEEE00D9D9D900DDDD
      DD00EDEDED00EAEAEA00CECECE00E6E6E600F1F1F100EFEFEF00EAEAEA00EEEE
      EE00E1E1E100E9E9E900E9E9E900DDDDDD00E8E8E800ECECEC00ECECEC00DFDF
      DF00E1E1E100F3F3F300E8E8E800DADADA00D8D8D800EDEDED00F2F2F200DEDE
      DE00E0E0E000C9C9C900D9D9D900F0F0F000E5E5E500CACACA00C9C9C900DBDB
      DB00CACACA00CBCBCB00B5B5B500A7A7A700B8B8B800EAEAEA00DEDEDE00DFDF
      DF00B2B2B200D1D1D100E9E9E900DFDFDF00E4E4E400E9E9E900E0E0E000E5E5
      E500E6E6E600D5D5D500DBDBDB00CCCCCC00E2E2E200EFEFEF00EDEDED00E1E1
      E100C6C6C600DDDDDD00DDDDDD00E4E4E400DFDFDF00C8C8C800E3E3E300E3E3
      E300BABABA00A6A6A600EBEBEB00E9E9E900E6E6E600D8D8D800D8D8D800E9E9
      E900CACACA00D9D9D900F2F2F200F3F3F300EFEFEF00D8D8D80096969600C3C3
      C300C9C9C900CCCCCC00CBCBCB00E2E2E200C8C8C800C9C9C900E8E8E800C4C4
      C400A2A2A200DFDFDF00E0E0E000DADADA00B2B2B200E5E5E500D6D6D600C8C8
      C800DBDBDB00E9E9E900F0F0F000E7E7E700EAEAEA00E1E1E100CECECE00E3E3
      E300ECECEC00EEEEEE00E7E7E700D4D4D400E8E8E800E8E8E800E4E4E400E9E9
      E900E7E7E700EEEEEE00D5D5D500DBDBDB00EEEEEE00E7E7E700C9C9C900E1E1
      E100EAEAEA00F0F0F000EDEDED00EEEEEE00E3E3E300DFDFDF00EEEEEE00D9D9
      D900D4D4D400EAEAEA00EDEDED00D1D1D100DDDDDD00EBEBEB00ECECEC00E0E0
      E000CDCDCD00D9D9D900E2E2E200D3D3D300D9D9D900AEAEAE00BEBEBE00E0E0
      E000EBEBEB00CFCFCF00B3B3B300C3C3C300F5F5F500E3E3E300D1D1D100F2F2
      F200ECECEC00EBEBEB00E7E7E700D4D4D400D8D8D800B0B0B000CCCCCC00F0F0
      F000D1D1D100B8B8B800C8C8C800AEAEAE00E0E0E000B1B1B100B3B3B300DEDE
      DE00E1E1E100CFCFCF00D9D9D900DDDDDD00E8E8E800E5E5E500CDCDCD00D6D6
      D600DFDFDF00C0C0C000CECECE00BBBBBB00CECECE00D4D4D400DBDBDB00DADA
      DA00DFDFDF00DCDCDC00CECECE00CACACA00CBCBCB00B5B5B500A7A7A700B8B8
      B800EAEAEA00DEDEDE00DFDFDF00B2B2B200D1D1D100E9E9E900DFDFDF00E4E4
      E400E9E9E900E0E0E000E5E5E500E6E6E600D5D5D500DBDBDB00CCCCCC00E2E2
      E200EFEFEF00EDEDED00E1E1E100C6C6C600DDDDDD00DDDDDD00E4E4E400DFDF
      DF00C8C8C800E3E3E300E3E3E300BABABA00A6A6A600EBEBEB00E9E9E900E6E6
      E600D8D8D800D8D8D800E9E9E900CACACA00D9D9D900F2F2F200F3F3F300EFEF
      EF00D8D8D80096969600C3C3C300C9C9C900CCCCCC00CBCBCB00E2E2E200C8C8
      C800C9C9C900E8E8E800C4C4C400A2A2A200DFDFDF00E0E0E000DADADA00B2B2
      B200E5E5E500D6D6D600C8C8C800DBDBDB00E9E9E900F0F0F000E7E7E700EAEA
      EA00E1E1E100CECECE00E3E3E300ECECEC00EEEEEE00E7E7E700D4D4D400E8E8
      E800E8E8E800E4E4E400E9E9E900E7E7E700EEEEEE00D5D5D500DBDBDB00EEEE
      EE00E7E7E700C9C9C900E1E1E100EAEAEA00F0F0F000EDEDED00EEEEEE00E3E3
      E300DFDFDF00EEEEEE00D9D9D900D4D4D400EAEAEA00EDEDED00D1D1D100DDDD
      DD00EBEBEB00ECECEC00E0E0E000CDCDCD00D9D9D900E2E2E200D3D3D300D9D9
      D900AEAEAE00BEBEBE00E0E0E000EBEBEB00CFCFCF00B3B3B300C3C3C300F5F5
      F500E3E3E300D1D1D100F2F2F200ECECEC00EBEBEB00E7E7E700D4D4D400D8D8
      D800B0B0B000CCCCCC00F0F0F000D1D1D100B8B8B800C8C8C800AEAEAE00E0E0
      E000B1B1B100B3B3B300DEDEDE00E1E1E100CFCFCF00D9D9D900DDDDDD00E8E8
      E800E5E5E500CDCDCD00D6D6D600DFDFDF00C0C0C000CECECE00BBBBBB00CECE
      CE00D4D4D400DBDBDB00DADADA00DFDFDF00DCDCDC00CECECE00CACACA00CBCB
      CB00B5B5B500A7A7A700B8B8B800EAEAEA00DEDEDE00DFDFDF00B2B2B200D1D1
      D100E9E9E900DFDFDF00E4E4E400E9E9E900E0E0E000E5E5E500E6E6E600D5D5
      D500DBDBDB00CCCCCC00E2E2E200EFEFEF00EDEDED00E1E1E100C6C6C600DDDD
      DD00DDDDDD00E4E4E400DFDFDF00C8C8C800E3E3E300E3E3E300BABABA00A6A6
      A600EBEBEB00E9E9E900E6E6E600D8D8D800D8D8D800E9E9E900CACACA00D9D9
      D900F2F2F200F3F3F300EFEFEF00D8D8D80096969600C3C3C300C9C9C900CCCC
      CC00CBCBCB00E2E2E200C8C8C800C9C9C900E8E8E800C4C4C400A2A2A200DFDF
      DF00E0E0E000DADADA00B2B2B200E5E5E500D6D6D600C8C8C800DBDBDB00E9E9
      E900F0F0F000E7E7E700EAEAEA00E1E1E100CECECE00E3E3E300ECECEC00EEEE
      EE00E7E7E700D4D4D400E8E8E800E8E8E800E4E4E400E9E9E900E7E7E700EEEE
      EE00D5D5D500DBDBDB00EEEEEE00E7E7E700C9C9C900E1E1E100EAEAEA00F0F0
      F000EDEDED00EEEEEE00E3E3E300DFDFDF00EEEEEE00D9D9D900D4D4D400EAEA
      EA00EDEDED00D1D1D100DDDDDD00EBEBEB00ECECEC00E0E0E000CDCDCD00D9D9
      D900E2E2E200D3D3D300D9D9D900AEAEAE00BEBEBE00E0E0E000EBEBEB00CFCF
      CF00B3B3B300C3C3C300CFCFCF00D6D6D600C0C0C000BBBBBB00DBDBDB00E2E2
      E200DADADA00E3E3E300B4B4B400CECECE00E7E7E700DCDCDC00E7E7E700E9E9
      E900E1E1E100DFDFDF00E7E7E700D7D7D700C6C6C600CCCCCC00E4E4E400E6E6
      E600E6E6E600D5D5D500C1C1C100E5E5E500DEDEDE00EEEEEE00E6E6E600C8C8
      C800DFDFDF00BFBFBF00797979008F8F8F00EBEBEB00EAEAEA00E4E4E400CECE
      CE00D7D7D700DEDEDE00B3B3B300E2E2E200EFEFEF00F2F2F200F7F7F700CCCC
      CC0080808000D7D7D700DADADA00C1C1C100C1C1C100EBEBEB00D2D2D200BEBE
      BE00E0E0E000B8B8B8009B9B9B00E0E0E000E1E1E100DFDFDF00B9B9B900E4E4
      E400D3D3D300C3C3C300D7D7D700E8E8E800EFEFEF00E6E6E600ECECEC00E0E0
      E000C7C7C700DFDFDF00EBEBEB00EFEFEF00E9E9E900D1D1D100E7E7E700E8E8
      E800E6E6E600EBEBEB00E4E4E400ECECEC00D3D3D300DCDCDC00F1F1F100DADA
      DA00CCCCCC00DFDFDF00DBDBDB00F0F0F000EFEFEF00EBEBEB00E9E9E900E0E0
      E000E8E8E800E1E1E100C7C7C700D4D4D400EAEAEA00C4C4C400D4D4D400EBEB
      EB00EAEAEA00EEEEEE00D4D4D400B7B7B700A8A8A800A7A7A700C6C6C6009797
      9700BCBCBC00DFDFDF00EBEBEB00DBDBDB00B0B0B000B0B0B000EEEEEE00E8E8
      E800CACACA00EDEDED00EBEBEB00F0F0F000F5F5F500E3E3E300EBEBEB00ACAC
      AC00C9C9C900E7E7E700DDDDDD00A6A6A600E3E3E300A1A1A100C8C8C800C4C4
      C4009F9F9F00D3D3D300D9D9D900CDCDCD00CBCBCB00D2D2D200E0E0E000D8D8
      D800BEBEBE00D1D1D100D8D8D800B8B8B800B7B7B700ACACAC00C7C7C700BDBD
      BD00CACACA00CCCCCC00D9D9D900D7D7D700CBCBCB00CFCFCF00D6D6D600C0C0
      C000BBBBBB00DBDBDB00E2E2E200DADADA00E3E3E300B4B4B400CECECE00E7E7
      E700DCDCDC00E7E7E700E9E9E900E1E1E100DFDFDF00E7E7E700D7D7D700C6C6
      C600CCCCCC00E4E4E400E6E6E600E6E6E600D5D5D500C1C1C100E5E5E500DEDE
      DE00EEEEEE00E6E6E600C8C8C800DFDFDF00BFBFBF00797979008F8F8F00EBEB
      EB00EAEAEA00E4E4E400CECECE00D7D7D700DEDEDE00B3B3B300E2E2E200EFEF
      EF00F2F2F200F7F7F700CCCCCC0080808000D7D7D700DADADA00C1C1C100C1C1
      C100EBEBEB00D2D2D200BEBEBE00E0E0E000B8B8B8009B9B9B00E0E0E000E1E1
      E100DFDFDF00B9B9B900E4E4E400D3D3D300C3C3C300D7D7D700E8E8E800EFEF
      EF00E6E6E600ECECEC00E0E0E000C7C7C700DFDFDF00EBEBEB00EFEFEF00E9E9
      E900D1D1D100E7E7E700E8E8E800E6E6E600EBEBEB00E4E4E400ECECEC00D3D3
      D300DCDCDC00F1F1F100DADADA00CCCCCC00DFDFDF00DBDBDB00F0F0F000EFEF
      EF00EBEBEB00E9E9E900E0E0E000E8E8E800E1E1E100C7C7C700D4D4D400EAEA
      EA00C4C4C400D4D4D400EBEBEB00EAEAEA00EEEEEE00D4D4D400B7B7B700A8A8
      A800A7A7A700C6C6C60097979700BCBCBC00DFDFDF00EBEBEB00DBDBDB00B0B0
      B000B0B0B000EEEEEE00E8E8E800CACACA00EDEDED00EBEBEB00F0F0F000F5F5
      F500E3E3E300EBEBEB00ACACAC00C9C9C900E7E7E700DDDDDD00A6A6A600E3E3
      E300A1A1A100C8C8C800C4C4C4009F9F9F00D3D3D300D9D9D900CDCDCD00CBCB
      CB00D2D2D200E0E0E000D8D8D800BEBEBE00D1D1D100D8D8D800B8B8B800B7B7
      B700ACACAC00C7C7C700BDBDBD00CACACA00CCCCCC00D9D9D900D7D7D700CBCB
      CB00CFCFCF00D6D6D600C0C0C000BBBBBB00DBDBDB00E2E2E200DADADA00E3E3
      E300B4B4B400CECECE00E7E7E700DCDCDC00E7E7E700E9E9E900E1E1E100DFDF
      DF00E7E7E700D7D7D700C6C6C600CCCCCC00E4E4E400E6E6E600E6E6E600D5D5
      D500C1C1C100E5E5E500DEDEDE00EEEEEE00E6E6E600C8C8C800DFDFDF00BFBF
      BF00797979008F8F8F00EBEBEB00EAEAEA00E4E4E400CECECE00D7D7D700DEDE
      DE00B3B3B300E2E2E200EFEFEF00F2F2F200F7F7F700CCCCCC0080808000D7D7
      D700DADADA00C1C1C100C1C1C100EBEBEB00D2D2D200BEBEBE00E0E0E000B8B8
      B8009B9B9B00E0E0E000E1E1E100DFDFDF00B9B9B900E4E4E400D3D3D300C3C3
      C300D7D7D700E8E8E800EFEFEF00E6E6E600ECECEC00E0E0E000C7C7C700DFDF
      DF00EBEBEB00EFEFEF00E9E9E900D1D1D100E7E7E700E8E8E800E6E6E600EBEB
      EB00E4E4E400ECECEC00D3D3D300DCDCDC00F1F1F100DADADA00CCCCCC00DFDF
      DF00DBDBDB00F0F0F000EFEFEF00EBEBEB00E9E9E900E0E0E000E8E8E800E1E1
      E100C7C7C700D4D4D400EAEAEA00C4C4C400D4D4D400EBEBEB00EAEAEA00EEEE
      EE00D4D4D400B7B7B700A8A8A800A7A7A700C6C6C60097979700BCBCBC00DFDF
      DF00EBEBEB00DBDBDB00B0B0B000B0B0B000D3D3D300D9D9D900BDBDBD00B7B7
      B700DDDDDD00D5D5D500D5D5D500E9E9E900BBBBBB00D3D3D300EBEBEB00DEDE
      DE00ECECEC00EAEAEA00E5E5E500DBDBDB00E9E9E900DCDCDC00B8B8B800D2D2
      D200E8E8E800E3E3E300E5E5E500D0D0D000C0C0C000E9E9E900DDDDDD00F1F1
      F100E7E7E700B4B4B400DEDEDE00BCBCBC00666666008B8B8B00EBEBEB00E9E9
      E900E4E4E400C2C2C200D6D6D600DBDBDB00ADADAD00EDEDED00E8E8E800E3E3
      E300E8E8E800B9B9B9006F6F6F00E5E5E500E2E2E200ADADAD00A9A9A900E4E4
      E400D3D3D300C4C4C400E5E5E500B7B7B70099999900DDDDDD00DBDBDB00D9D9
      D900B3B3B300EBEBEB00DFDFDF00D3D3D300E5E5E500EEEEEE00EDEDED00E3E3
      E300EDEDED00DFDFDF00C3C3C300DDDDDD00EAEAEA00F0F0F000EAEAEA00CFCF
      CF00E6E6E600E5E5E500E3E3E300E8E8E800DDDDDD00E6E6E600CECECE00D9D9
      D900EEEEEE00D3D3D300D7D7D700E4E4E400D0D0D000EEEEEE00EEEEEE00E3E3
      E300E8E8E800E9E9E900DBDBDB00EEEEEE00C6C6C600BBBBBB00E4E4E400BFBF
      BF00C9C9C900F5F5F500E2E2E200F2F2F200E8E8E800B5B5B500909090009B9B
      9B00CECECE0099999900D7D7D700F3F3F300ECECEC00E2E2E200B2B2B2009D9D
      9D00D6D6D600D7D7D700C0C0C000EBEBEB00F0F0F000F5F5F500DADADA00A8A8
      A800B4B4B400ACACAC00D1D1D100EFEFEF00E5E5E500A1A1A100CDCDCD00C1C1
      C100ADADAD00CACACA008E8E8E00CECECE00E0E0E000DBDBDB00CCCCCC00CCCC
      CC00DADADA00D8D8D800BDBDBD00D8D8D800DCDCDC00BEBEBE00B2B2B200ADAD
      AD00CECECE00B6B6B600D0D0D000D3D3D300DADADA00D7D7D700CCCCCC00D3D3
      D300D9D9D900BDBDBD00B7B7B700DDDDDD00D5D5D500D5D5D500E9E9E900BBBB
      BB00D3D3D300EBEBEB00DEDEDE00ECECEC00EAEAEA00E5E5E500DBDBDB00E9E9
      E900DCDCDC00B8B8B800D2D2D200E8E8E800E3E3E300E5E5E500D0D0D000C0C0
      C000E9E9E900DDDDDD00F1F1F100E7E7E700B4B4B400DEDEDE00BCBCBC006666
      66008B8B8B00EBEBEB00E9E9E900E4E4E400C2C2C200D6D6D600DBDBDB00ADAD
      AD00EDEDED00E8E8E800E3E3E300E8E8E800B9B9B9006F6F6F00E5E5E500E2E2
      E200ADADAD00A9A9A900E4E4E400D3D3D300C4C4C400E5E5E500B7B7B7009999
      9900DDDDDD00DBDBDB00D9D9D900B3B3B300EBEBEB00DFDFDF00D3D3D300E5E5
      E500EEEEEE00EDEDED00E3E3E300EDEDED00DFDFDF00C3C3C300DDDDDD00EAEA
      EA00F0F0F000EAEAEA00CFCFCF00E6E6E600E5E5E500E3E3E300E8E8E800DDDD
      DD00E6E6E600CECECE00D9D9D900EEEEEE00D3D3D300D7D7D700E4E4E400D0D0
      D000EEEEEE00EEEEEE00E3E3E300E8E8E800E9E9E900DBDBDB00EEEEEE00C6C6
      C600BBBBBB00E4E4E400BFBFBF00C9C9C900F5F5F500E2E2E200F2F2F200E8E8
      E800B5B5B500909090009B9B9B00CECECE0099999900D7D7D700F3F3F300ECEC
      EC00E2E2E200B2B2B2009D9D9D00D6D6D600D7D7D700C0C0C000EBEBEB00F0F0
      F000F5F5F500DADADA00A8A8A800B4B4B400ACACAC00D1D1D100EFEFEF00E5E5
      E500A1A1A100CDCDCD00C1C1C100ADADAD00CACACA008E8E8E00CECECE00E0E0
      E000DBDBDB00CCCCCC00CCCCCC00DADADA00D8D8D800BDBDBD00D8D8D800DCDC
      DC00BEBEBE00B2B2B200ADADAD00CECECE00B6B6B600D0D0D000D3D3D300DADA
      DA00D7D7D700CCCCCC00D3D3D300D9D9D900BDBDBD00B7B7B700DDDDDD00D5D5
      D500D5D5D500E9E9E900BBBBBB00D3D3D300EBEBEB00DEDEDE00ECECEC00EAEA
      EA00E5E5E500DBDBDB00E9E9E900DCDCDC00B8B8B800D2D2D200E8E8E800E3E3
      E300E5E5E500D0D0D000C0C0C000E9E9E900DDDDDD00F1F1F100E7E7E700B4B4
      B400DEDEDE00BCBCBC00666666008B8B8B00EBEBEB00E9E9E900E4E4E400C2C2
      C200D6D6D600DBDBDB00ADADAD00EDEDED00E8E8E800E3E3E300E8E8E800B9B9
      B9006F6F6F00E5E5E500E2E2E200ADADAD00A9A9A900E4E4E400D3D3D300C4C4
      C400E5E5E500B7B7B70099999900DDDDDD00DBDBDB00D9D9D900B3B3B300EBEB
      EB00DFDFDF00D3D3D300E5E5E500EEEEEE00EDEDED00E3E3E300EDEDED00DFDF
      DF00C3C3C300DDDDDD00EAEAEA00F0F0F000EAEAEA00CFCFCF00E6E6E600E5E5
      E500E3E3E300E8E8E800DDDDDD00E6E6E600CECECE00D9D9D900EEEEEE00D3D3
      D300D7D7D700E4E4E400D0D0D000EEEEEE00EEEEEE00E3E3E300E8E8E800E9E9
      E900DBDBDB00EEEEEE00C6C6C600BBBBBB00E4E4E400BFBFBF00C9C9C900F5F5
      F500E2E2E200F2F2F200E8E8E800B5B5B500909090009B9B9B00CECECE009999
      9900D7D7D700F3F3F300ECECEC00E2E2E200B2B2B2009D9D9D00D2D2D200D2D2
      D20093939300A2A2A200D8D8D800D1D1D100DCDCDC00E1E1E100C1C1C100BBBB
      BB00E5E5E500DBDBDB00DBDBDB00E3E3E300E5E5E500E4E4E400E4E4E400C4C4
      C4009C9C9C00E3E3E300DBDBDB00E1E1E100D0D0D000C5C5C500C9C9C900E3E3
      E300DBDBDB00E3E3E300DCDCDC00C8C8C800CBCBCB00DEDEDE0095959500B6B6
      B600EDEDED00EDEDED00DFDFDF00D1D1D100D9D9D900DBDBDB0096969600F4F4
      F400D7D7D700D1D1D100E5E5E500ABABAB0083838300DEDEDE00E5E5E500C5C5
      C500B0B0B000DBDBDB00DEDEDE00BABABA00DCDCDC00AEAEAE0092929200E6E6
      E600E0E0E000D3D3D300A4A4A400E9E9E900D0D0D000CECECE00E0E0E000E8E8
      E800ECECEC00ECECEC00E3E3E300E1E1E100C9C9C900D4D4D400ECECEC00EEEE
      EE00EEEEEE00D7D7D700E2E2E200DDDDDD00E3E3E300E5E5E500EEEEEE00D9D9
      D900B4B4B400C2C2C200E5E5E500CECECE00D7D7D700EFEFEF00CBCBCB00D1D1
      D100EAEAEA00DEDEDE00DCDCDC00EDEDED00D8D8D800E1E1E100E1E1E100A8A8
      A800D1D1D100C0C0C000B8B8B800EDEDED00F5F5F500EAEAEA00EDEDED00E1E1
      E100BEBEBE00919191008F8F8F006D6D6D00DDDDDD00EEEEEE00E4E4E400EBEB
      EB00A9A9A900AEAEAE00B6B6B600D5D5D500BDBDBD00DCDCDC00ECECEC00EEEE
      EE00D5D5D500A3A3A300B5B5B500ACACAC00D5D5D500E0E0E000D2D2D2008D8D
      8D00C6C6C600E1E1E100B3B3B300B5B5B500B1B1B100BFBFBF00E1E1E100E1E1
      E100D2D2D200C0C0C000E0E0E000D4D4D400BABABA00E7E7E700C6C6C600C6C6
      C60094949400A2A2A200CECECE00C1C1C100CBCBCB00CCCCCC00D3D3D300CECE
      CE00B3B3B300D2D2D200D2D2D20093939300A2A2A200D8D8D800D1D1D100DCDC
      DC00E1E1E100C1C1C100BBBBBB00E5E5E500DBDBDB00DBDBDB00E3E3E300E5E5
      E500E4E4E400E4E4E400C4C4C4009C9C9C00E3E3E300DBDBDB00E1E1E100D0D0
      D000C5C5C500C9C9C900E3E3E300DBDBDB00E3E3E300DCDCDC00C8C8C800CBCB
      CB00DEDEDE0095959500B6B6B600EDEDED00EDEDED00DFDFDF00D1D1D100D9D9
      D900DBDBDB0096969600F4F4F400D7D7D700D1D1D100E5E5E500ABABAB008383
      8300DEDEDE00E5E5E500C5C5C500B0B0B000DBDBDB00DEDEDE00BABABA00DCDC
      DC00AEAEAE0092929200E6E6E600E0E0E000D3D3D300A4A4A400E9E9E900D0D0
      D000CECECE00E0E0E000E8E8E800ECECEC00ECECEC00E3E3E300E1E1E100C9C9
      C900D4D4D400ECECEC00EEEEEE00EEEEEE00D7D7D700E2E2E200DDDDDD00E3E3
      E300E5E5E500EEEEEE00D9D9D900B4B4B400C2C2C200E5E5E500CECECE00D7D7
      D700EFEFEF00CBCBCB00D1D1D100EAEAEA00DEDEDE00DCDCDC00EDEDED00D8D8
      D800E1E1E100E1E1E100A8A8A800D1D1D100C0C0C000B8B8B800EDEDED00F5F5
      F500EAEAEA00EDEDED00E1E1E100BEBEBE00919191008F8F8F006D6D6D00DDDD
      DD00EEEEEE00E4E4E400EBEBEB00A9A9A900AEAEAE00B6B6B600D5D5D500BDBD
      BD00DCDCDC00ECECEC00EEEEEE00D5D5D500A3A3A300B5B5B500ACACAC00D5D5
      D500E0E0E000D2D2D2008D8D8D00C6C6C600E1E1E100B3B3B300B5B5B500B1B1
      B100BFBFBF00E1E1E100E1E1E100D2D2D200C0C0C000E0E0E000D4D4D400BABA
      BA00E7E7E700C6C6C600C6C6C60094949400A2A2A200CECECE00C1C1C100CBCB
      CB00CCCCCC00D3D3D300CECECE00B3B3B300D2D2D200D2D2D20093939300A2A2
      A200D8D8D800D1D1D100DCDCDC00E1E1E100C1C1C100BBBBBB00E5E5E500DBDB
      DB00DBDBDB00E3E3E300E5E5E500E4E4E400E4E4E400C4C4C4009C9C9C00E3E3
      E300DBDBDB00E1E1E100D0D0D000C5C5C500C9C9C900E3E3E300DBDBDB00E3E3
      E300DCDCDC00C8C8C800CBCBCB00DEDEDE0095959500B6B6B600EDEDED00EDED
      ED00DFDFDF00D1D1D100D9D9D900DBDBDB0096969600F4F4F400D7D7D700D1D1
      D100E5E5E500ABABAB0083838300DEDEDE00E5E5E500C5C5C500B0B0B000DBDB
      DB00DEDEDE00BABABA00DCDCDC00AEAEAE0092929200E6E6E600E0E0E000D3D3
      D300A4A4A400E9E9E900D0D0D000CECECE00E0E0E000E8E8E800ECECEC00ECEC
      EC00E3E3E300E1E1E100C9C9C900D4D4D400ECECEC00EEEEEE00EEEEEE00D7D7
      D700E2E2E200DDDDDD00E3E3E300E5E5E500EEEEEE00D9D9D900B4B4B400C2C2
      C200E5E5E500CECECE00D7D7D700EFEFEF00CBCBCB00D1D1D100EAEAEA00DEDE
      DE00DCDCDC00EDEDED00D8D8D800E1E1E100E1E1E100A8A8A800D1D1D100C0C0
      C000B8B8B800EDEDED00F5F5F500EAEAEA00EDEDED00E1E1E100BEBEBE009191
      91008F8F8F006D6D6D00DDDDDD00EEEEEE00E4E4E400EBEBEB00A9A9A900AEAE
      AE00DFDFDF00B9B9B9008383830088888800C6C6C600E3E3E300D7D7D700D4D4
      D400B7B7B700B0B0B000E0E0E000E4E4E400DFDFDF00E6E6E600E2E2E200E5E5
      E500E8E8E800A0A0A000A4A4A400D5D5D500CACACA00D8D8D800C0C0C0009E9E
      9E00C7C7C700D4D4D400CACACA00F6F6F600DEDEDE00CBCBCB00E8E8E8009C9C
      9C0049494900B0B0B000DEDEDE00DEDEDE00F1F1F100E0E0E000EAEAEA00E4E4
      E400A4A4A400EAEAEA00D0D0D000D2D2D200ECECEC00A1A1A10087878700DADA
      DA00DBDBDB00CDCDCD00B7B7B700CFCFCF00EAEAEA00B4B4B400CFCFCF00A7A7
      A700A2A2A200E3E3E300DADADA00DCDCDC00AFAFAF00D7D7D700B4B4B400BCBC
      BC00DDDDDD00E2E2E200E2E2E200EAEAEA00E8E8E800E6E6E600CCCCCC00D6D6
      D600E9E9E900E8E8E800ECECEC00D6D6D600DDDDDD00EAEAEA00E7E7E700E4E4
      E400EDEDED00D3D3D300ADADAD00C3C3C300EAEAEA00BBBBBB00E3E3E300EBEB
      EB00E5E5E500C1C1C100DCDCDC00DADADA00D8D8D800E9E9E900DDDDDD00E2E2
      E200E1E1E100C3C3C300B3B3B300BCBCBC00B1B1B100ECECEC00E9E9E900EAEA
      EA00E6E6E600E3E3E300DADADA007A7A7A006C6C6C009C9C9C00E7E7E700E0E0
      E000E2E2E200E1E1E10095959500AFAFAF00D3D3D300BBBBBB00BDBDBD00E1E1
      E100E8E8E800EDEDED00F4F4F400DEDEDE00E5E5E500A7A7A700D2D2D200C8C8
      C800B3B3B30087878700BEBEBE00EEEEEE00D8D8D800B3B3B300A7A7A700ABAB
      AB00D5D5D500E7E7E700E1E1E100BBBBBB00D9D9D900D9D9D900B0B0B000E3E3
      E300D5D5D500CCCCCC008A8A8A009A9A9A00D0D0D000ACACAC00CDCDCD00CFCF
      CF00CBCBCB00D6D6D600C1C1C100DFDFDF00B9B9B9008383830088888800C6C6
      C600E3E3E300D7D7D700D4D4D400B7B7B700B0B0B000E0E0E000E4E4E400DFDF
      DF00E6E6E600E2E2E200E5E5E500E8E8E800A0A0A000A4A4A400D5D5D500CACA
      CA00D8D8D800C0C0C0009E9E9E00C7C7C700D4D4D400CACACA00F6F6F600DEDE
      DE00CBCBCB00E8E8E8009C9C9C0049494900B0B0B000DEDEDE00DEDEDE00F1F1
      F100E0E0E000EAEAEA00E4E4E400A4A4A400EAEAEA00D0D0D000D2D2D200ECEC
      EC00A1A1A10087878700DADADA00DBDBDB00CDCDCD00B7B7B700CFCFCF00EAEA
      EA00B4B4B400CFCFCF00A7A7A700A2A2A200E3E3E300DADADA00DCDCDC00AFAF
      AF00D7D7D700B4B4B400BCBCBC00DDDDDD00E2E2E200E2E2E200EAEAEA00E8E8
      E800E6E6E600CCCCCC00D6D6D600E9E9E900E8E8E800ECECEC00D6D6D600DDDD
      DD00EAEAEA00E7E7E700E4E4E400EDEDED00D3D3D300ADADAD00C3C3C300EAEA
      EA00BBBBBB00E3E3E300EBEBEB00E5E5E500C1C1C100DCDCDC00DADADA00D8D8
      D800E9E9E900DDDDDD00E2E2E200E1E1E100C3C3C300B3B3B300BCBCBC00B1B1
      B100ECECEC00E9E9E900EAEAEA00E6E6E600E3E3E300DADADA007A7A7A006C6C
      6C009C9C9C00E7E7E700E0E0E000E2E2E200E1E1E10095959500AFAFAF00D3D3
      D300BBBBBB00BDBDBD00E1E1E100E8E8E800EDEDED00F4F4F400DEDEDE00E5E5
      E500A7A7A700D2D2D200C8C8C800B3B3B30087878700BEBEBE00EEEEEE00D8D8
      D800B3B3B300A7A7A700ABABAB00D5D5D500E7E7E700E1E1E100BBBBBB00D9D9
      D900D9D9D900B0B0B000E3E3E300D5D5D500CCCCCC008A8A8A009A9A9A00D0D0
      D000ACACAC00CDCDCD00CFCFCF00CBCBCB00D6D6D600C1C1C100DFDFDF00B9B9
      B9008383830088888800C6C6C600E3E3E300D7D7D700D4D4D400B7B7B700B0B0
      B000E0E0E000E4E4E400DFDFDF00E6E6E600E2E2E200E5E5E500E8E8E800A0A0
      A000A4A4A400D5D5D500CACACA00D8D8D800C0C0C0009E9E9E00C7C7C700D4D4
      D400CACACA00F6F6F600DEDEDE00CBCBCB00E8E8E8009C9C9C0049494900B0B0
      B000DEDEDE00DEDEDE00F1F1F100E0E0E000EAEAEA00E4E4E400A4A4A400EAEA
      EA00D0D0D000D2D2D200ECECEC00A1A1A10087878700DADADA00DBDBDB00CDCD
      CD00B7B7B700CFCFCF00EAEAEA00B4B4B400CFCFCF00A7A7A700A2A2A200E3E3
      E300DADADA00DCDCDC00AFAFAF00D7D7D700B4B4B400BCBCBC00DDDDDD00E2E2
      E200E2E2E200EAEAEA00E8E8E800E6E6E600CCCCCC00D6D6D600E9E9E900E8E8
      E800ECECEC00D6D6D600DDDDDD00EAEAEA00E7E7E700E4E4E400EDEDED00D3D3
      D300ADADAD00C3C3C300EAEAEA00BBBBBB00E3E3E300EBEBEB00E5E5E500C1C1
      C100DCDCDC00DADADA00D8D8D800E9E9E900DDDDDD00E2E2E200E1E1E100C3C3
      C300B3B3B300BCBCBC00B1B1B100ECECEC00E9E9E900EAEAEA00E6E6E600E3E3
      E300DADADA007A7A7A006C6C6C009C9C9C00E7E7E700E0E0E000E2E2E200E1E1
      E10095959500AFAFAF00D0D0D0009A9A9A00A0A0A0009C9C9C00C7C7C700D8D8
      D800CDCDCD00D7D7D700C8C8C800BFBFBF00DEDEDE00E0E0E000D3D3D300E3E3
      E300DFDFDF00E7E7E700D9D9D90081818100B8B8B800D8D8D800CFCFCF00E2E2
      E200D6D6D600A9A9A900D6D6D600D0D0D000C5C5C500EEEEEE00E7E7E700C0C0
      C000C5C5C5007272720047474700C8C8C800F9F9F900EBEBEB00DEDEDE00CACA
      CA00E2E2E200DEDEDE00BABABA00F2F2F200E6E6E600E6E6E600EFEFEF009595
      95009E9E9E00E4E4E400D5D5D500D5D5D500C5C5C500C3C3C300DFDFDF00D2D2
      D200CECECE009D9D9D00B5B5B500E1E1E100D5D5D500DBDBDB009B9B9B00D8D8
      D800CFCFCF00D7D7D700E5E5E500E7E7E700E6E6E600EAEAEA00ECECEC00E1E1
      E100C6C6C600D3D3D300E5E5E500E3E3E300EAEAEA00D2D2D200D1D1D100EEEE
      EE00EDEDED00EAEAEA00EBEBEB00C8C8C800ACACAC00CCCCCC00EAEAEA00AFAF
      AF00E8E8E800EBEBEB00F1F1F100C4C4C400C9C9C900D8D8D800D9D9D900DEDE
      DE00E6E6E600E8E8E800E3E3E300CBCBCB009D9D9D00A3A3A300B5B5B500DFDF
      DF00E2E2E200E5E5E500E9E9E900D7D7D700ADADAD008C8C8C0085858500AAAA
      AA00F0F0F000DBDBDB00E0E0E000E6E6E6009A9A9A00AEAEAE00DFDFDF00ADAD
      AD00B2B2B200DEDEDE00ECECEC00E4E4E400F6F6F600F7F7F700E5E5E500A9A9
      A900DBDBDB00D5D5D500CACACA00A4A4A400B9B9B900EDEDED00E6E6E600BDBD
      BD00A4A4A400A4A4A400D4D4D400D8D8D800D8D8D800BBBBBB00D9D9D900CACA
      CA00AAAAAA00E6E6E600DADADA00BBBBBB00646464007F7F7F00CFCFCF00A9A9
      A900CECECE00CFCFCF00B6B6B600D4D4D400CECECE00D0D0D0009A9A9A00A0A0
      A0009C9C9C00C7C7C700D8D8D800CDCDCD00D7D7D700C8C8C800BFBFBF00DEDE
      DE00E0E0E000D3D3D300E3E3E300DFDFDF00E7E7E700D9D9D90081818100B8B8
      B800D8D8D800CFCFCF00E2E2E200D6D6D600A9A9A900D6D6D600D0D0D000C5C5
      C500EEEEEE00E7E7E700C0C0C000C5C5C5007272720047474700C8C8C800F9F9
      F900EBEBEB00DEDEDE00CACACA00E2E2E200DEDEDE00BABABA00F2F2F200E6E6
      E600E6E6E600EFEFEF00959595009E9E9E00E4E4E400D5D5D500D5D5D500C5C5
      C500C3C3C300DFDFDF00D2D2D200CECECE009D9D9D00B5B5B500E1E1E100D5D5
      D500DBDBDB009B9B9B00D8D8D800CFCFCF00D7D7D700E5E5E500E7E7E700E6E6
      E600EAEAEA00ECECEC00E1E1E100C6C6C600D3D3D300E5E5E500E3E3E300EAEA
      EA00D2D2D200D1D1D100EEEEEE00EDEDED00EAEAEA00EBEBEB00C8C8C800ACAC
      AC00CCCCCC00EAEAEA00AFAFAF00E8E8E800EBEBEB00F1F1F100C4C4C400C9C9
      C900D8D8D800D9D9D900DEDEDE00E6E6E600E8E8E800E3E3E300CBCBCB009D9D
      9D00A3A3A300B5B5B500DFDFDF00E2E2E200E5E5E500E9E9E900D7D7D700ADAD
      AD008C8C8C0085858500AAAAAA00F0F0F000DBDBDB00E0E0E000E6E6E6009A9A
      9A00AEAEAE00DFDFDF00ADADAD00B2B2B200DEDEDE00ECECEC00E4E4E400F6F6
      F600F7F7F700E5E5E500A9A9A900DBDBDB00D5D5D500CACACA00A4A4A400B9B9
      B900EDEDED00E6E6E600BDBDBD00A4A4A400A4A4A400D4D4D400D8D8D800D8D8
      D800BBBBBB00D9D9D900CACACA00AAAAAA00E6E6E600DADADA00BBBBBB006464
      64007F7F7F00CFCFCF00A9A9A900CECECE00CFCFCF00B6B6B600D4D4D400CECE
      CE00D0D0D0009A9A9A00A0A0A0009C9C9C00C7C7C700D8D8D800CDCDCD00D7D7
      D700C8C8C800BFBFBF00DEDEDE00E0E0E000D3D3D300E3E3E300DFDFDF00E7E7
      E700D9D9D90081818100B8B8B800D8D8D800CFCFCF00E2E2E200D6D6D600A9A9
      A900D6D6D600D0D0D000C5C5C500EEEEEE00E7E7E700C0C0C000C5C5C5007272
      720047474700C8C8C800F9F9F900EBEBEB00DEDEDE00CACACA00E2E2E200DEDE
      DE00BABABA00F2F2F200E6E6E600E6E6E600EFEFEF00959595009E9E9E00E4E4
      E400D5D5D500D5D5D500C5C5C500C3C3C300DFDFDF00D2D2D200CECECE009D9D
      9D00B5B5B500E1E1E100D5D5D500DBDBDB009B9B9B00D8D8D800CFCFCF00D7D7
      D700E5E5E500E7E7E700E6E6E600EAEAEA00ECECEC00E1E1E100C6C6C600D3D3
      D300E5E5E500E3E3E300EAEAEA00D2D2D200D1D1D100EEEEEE00EDEDED00EAEA
      EA00EBEBEB00C8C8C800ACACAC00CCCCCC00EAEAEA00AFAFAF00E8E8E800EBEB
      EB00F1F1F100C4C4C400C9C9C900D8D8D800D9D9D900DEDEDE00E6E6E600E8E8
      E800E3E3E300CBCBCB009D9D9D00A3A3A300B5B5B500DFDFDF00E2E2E200E5E5
      E500E9E9E900D7D7D700ADADAD008C8C8C0085858500AAAAAA00F0F0F000DBDB
      DB00E0E0E000E6E6E6009A9A9A00AEAEAE00B8B8B80096969600CCCCCC00AEAE
      AE00B2B2B200D1D1D100CECECE00D0D0D000BFBFBF00C9C9C900DFDFDF00E1E1
      E100DADADA00E2E2E200E5E5E500ECECEC00B4B4B4008F8F8F00CDCDCD00DADA
      DA00D2D2D200D6D6D600DBDBDB00BCBCBC00DCDCDC00D7D7D700C3C3C300B5B5
      B500E5E5E500B2B2B200AAAAAA00A2A2A20090909000CECECE00EEEEEE00E9E9
      E900DDDDDD00C0C0C000D8D8D800CACACA00BEBEBE00E9E9E900EFEFEF00EBEB
      EB00E4E4E40087878700BDBDBD00F3F3F300DBDBDB00DADADA00D9D9D900CDCD
      CD00C0C0C000E4E4E400C1C1C1008E8E8E00BFBFBF00E3E3E300DCDCDC00E0E0
      E00086868600C8C8C800E1E1E100D0D0D000B8B8B800CFCFCF00E7E7E700E7E7
      E700E7E7E700DFDFDF00C0C0C000C8C8C800E0E0E000E2E2E200E9E9E900D5D5
      D500D1D1D100E9E9E900CCCCCC00C9C9C900E6E6E600C8C8C800A3A3A300C7C7
      C700E7E7E700B4B4B400E1E1E100F0F0F000E5E5E500DDDDDD00C0C0C000C9C9
      C900DEDEDE00E2E2E200E1E1E100D8D8D800E0E0E000D0D0D000BFBFBF009090
      90009A9A9A00D6D6D600E3E3E300E9E9E900EDEDED00E9E9E900B6B6B600C8C8
      C8009494940077777700DEDEDE00E0E0E000DCDCDC00EDEDED00BBBBBB00B9B9
      B900EBEBEB00BFBFBF00A7A7A700CCCCCC00F5F5F500EEEEEE00F4F4F400FCFC
      FC00DFDFDF00B4B4B400D5D5D500D0D0D000D6D6D600B6B6B600AAAAAA00DADA
      DA00DEDEDE00B3B3B3008C8C8C0089898900D3D3D300D6D6D600DADADA00CDCD
      CD00CFCFCF00C7C7C700B1B1B100D8D8D800C9C9C900BDBDBD00666666007373
      7300CBCBCB0097979700ACACAC00A7A7A700BEBEBE00C9C9C900D5D5D500B8B8
      B80096969600CCCCCC00AEAEAE00B2B2B200D1D1D100CECECE00D0D0D000BFBF
      BF00C9C9C900DFDFDF00E1E1E100DADADA00E2E2E200E5E5E500ECECEC00B4B4
      B4008F8F8F00CDCDCD00DADADA00D2D2D200D6D6D600DBDBDB00BCBCBC00DCDC
      DC00D7D7D700C3C3C300B5B5B500E5E5E500B2B2B200AAAAAA00A2A2A2009090
      9000CECECE00EEEEEE00E9E9E900DDDDDD00C0C0C000D8D8D800CACACA00BEBE
      BE00E9E9E900EFEFEF00EBEBEB00E4E4E40087878700BDBDBD00F3F3F300DBDB
      DB00DADADA00D9D9D900CDCDCD00C0C0C000E4E4E400C1C1C1008E8E8E00BFBF
      BF00E3E3E300DCDCDC00E0E0E00086868600C8C8C800E1E1E100D0D0D000B8B8
      B800CFCFCF00E7E7E700E7E7E700E7E7E700DFDFDF00C0C0C000C8C8C800E0E0
      E000E2E2E200E9E9E900D5D5D500D1D1D100E9E9E900CCCCCC00C9C9C900E6E6
      E600C8C8C800A3A3A300C7C7C700E7E7E700B4B4B400E1E1E100F0F0F000E5E5
      E500DDDDDD00C0C0C000C9C9C900DEDEDE00E2E2E200E1E1E100D8D8D800E0E0
      E000D0D0D000BFBFBF00909090009A9A9A00D6D6D600E3E3E300E9E9E900EDED
      ED00E9E9E900B6B6B600C8C8C8009494940077777700DEDEDE00E0E0E000DCDC
      DC00EDEDED00BBBBBB00B9B9B900EBEBEB00BFBFBF00A7A7A700CCCCCC00F5F5
      F500EEEEEE00F4F4F400FCFCFC00DFDFDF00B4B4B400D5D5D500D0D0D000D6D6
      D600B6B6B600AAAAAA00DADADA00DEDEDE00B3B3B3008C8C8C0089898900D3D3
      D300D6D6D600DADADA00CDCDCD00CFCFCF00C7C7C700B1B1B100D8D8D800C9C9
      C900BDBDBD006666660073737300CBCBCB0097979700ACACAC00A7A7A700BEBE
      BE00C9C9C900D5D5D500B8B8B80096969600CCCCCC00AEAEAE00B2B2B200D1D1
      D100CECECE00D0D0D000BFBFBF00C9C9C900DFDFDF00E1E1E100DADADA00E2E2
      E200E5E5E500ECECEC00B4B4B4008F8F8F00CDCDCD00DADADA00D2D2D200D6D6
      D600DBDBDB00BCBCBC00DCDCDC00D7D7D700C3C3C300B5B5B500E5E5E500B2B2
      B200AAAAAA00A2A2A20090909000CECECE00EEEEEE00E9E9E900DDDDDD00C0C0
      C000D8D8D800CACACA00BEBEBE00E9E9E900EFEFEF00EBEBEB00E4E4E4008787
      8700BDBDBD00F3F3F300DBDBDB00DADADA00D9D9D900CDCDCD00C0C0C000E4E4
      E400C1C1C1008E8E8E00BFBFBF00E3E3E300DCDCDC00E0E0E00086868600C8C8
      C800E1E1E100D0D0D000B8B8B800CFCFCF00E7E7E700E7E7E700E7E7E700DFDF
      DF00C0C0C000C8C8C800E0E0E000E2E2E200E9E9E900D5D5D500D1D1D100E9E9
      E900CCCCCC00C9C9C900E6E6E600C8C8C800A3A3A300C7C7C700E7E7E700B4B4
      B400E1E1E100F0F0F000E5E5E500DDDDDD00C0C0C000C9C9C900DEDEDE00E2E2
      E200E1E1E100D8D8D800E0E0E000D0D0D000BFBFBF00909090009A9A9A00D6D6
      D600E3E3E300E9E9E900EDEDED00E9E9E900B6B6B600C8C8C800949494007777
      7700DEDEDE00E0E0E000DCDCDC00EDEDED00BBBBBB00B9B9B90098989800A1A1
      A100E0E0E000A9A9A900A0A0A000B8B8B800CACACA00BFBFBF00A7A7A700CFCF
      CF00E2E2E200E4E4E400E5E5E500DFDFDF00E7E7E700DBDBDB0087878700BDBD
      BD00D9D9D900D2D2D200C5C5C500CCCCCC00D0D0D000A4A4A400BABABA00C1C1
      C100B3B3B3007E7E7E00AFAFAF00A3A3A300959595008E8E8E0094949400D8D8
      D800EBEBEB00E7E7E700EFEFEF00D3D3D300E1E1E100CECECE00D3D3D300E5E5
      E500E6E6E600E2E2E200E1E1E1006F6F6F00C0C0C000E4E4E400D2D2D200C8C8
      C800D3D3D300D2D2D2009D9D9D00D1D1D100ACACAC0090909000C9C9C900DFDF
      DF00D8D8D800DEDEDE0081818100D7D7D700E8E8E800CACACA00ABABAB00CACA
      CA00EBEBEB00E8E8E800E1E1E100E3E3E300C0C0C000BBBBBB00DADADA00E3E3
      E300E8E8E800DBDBDB00D5D5D500E0E0E000CACACA00CACACA00E2E2E200C6C6
      C600B9B9B900E5E5E500E8E8E800B8B8B800DBDBDB00F0F0F000DEDEDE00ECEC
      EC00C8C8C800A6A6A600DCDCDC00E4E4E400D5D5D500D8D8D800E5E5E500D3D3
      D300D3D3D300A9A9A90078787800E8E8E800E7E7E700D9D9D900DCDCDC00CDCD
      CD00A5A5A5009C9C9C007A7A7A006B6B6B00C9C9C900E2E2E200DDDDDD00E4E4
      E400C9C9C900B8B8B800E1E1E100DDDDDD00B1B1B100B3B3B300E5E5E500F8F8
      F800F4F4F400F5F5F500E6E6E600B9B9B900C2C2C200A3A3A300AAAAAA00A4A4
      A40098989800C2C2C200E3E3E3009F9F9F008686860074747400C5C5C500DDDD
      DD00DADADA00D5D5D500C3C3C300BABABA00B5B5B500CBCBCB00BEBEBE00CCCC
      CC007373730071717100D3D3D300A2A2A200B9B9B900B2B2B200E0E0E000BABA
      BA00CACACA0098989800A1A1A100E0E0E000A9A9A900A0A0A000B8B8B800CACA
      CA00BFBFBF00A7A7A700CFCFCF00E2E2E200E4E4E400E5E5E500DFDFDF00E7E7
      E700DBDBDB0087878700BDBDBD00D9D9D900D2D2D200C5C5C500CCCCCC00D0D0
      D000A4A4A400BABABA00C1C1C100B3B3B3007E7E7E00AFAFAF00A3A3A3009595
      95008E8E8E0094949400D8D8D800EBEBEB00E7E7E700EFEFEF00D3D3D300E1E1
      E100CECECE00D3D3D300E5E5E500E6E6E600E2E2E200E1E1E1006F6F6F00C0C0
      C000E4E4E400D2D2D200C8C8C800D3D3D300D2D2D2009D9D9D00D1D1D100ACAC
      AC0090909000C9C9C900DFDFDF00D8D8D800DEDEDE0081818100D7D7D700E8E8
      E800CACACA00ABABAB00CACACA00EBEBEB00E8E8E800E1E1E100E3E3E300C0C0
      C000BBBBBB00DADADA00E3E3E300E8E8E800DBDBDB00D5D5D500E0E0E000CACA
      CA00CACACA00E2E2E200C6C6C600B9B9B900E5E5E500E8E8E800B8B8B800DBDB
      DB00F0F0F000DEDEDE00ECECEC00C8C8C800A6A6A600DCDCDC00E4E4E400D5D5
      D500D8D8D800E5E5E500D3D3D300D3D3D300A9A9A90078787800E8E8E800E7E7
      E700D9D9D900DCDCDC00CDCDCD00A5A5A5009C9C9C007A7A7A006B6B6B00C9C9
      C900E2E2E200DDDDDD00E4E4E400C9C9C900B8B8B800E1E1E100DDDDDD00B1B1
      B100B3B3B300E5E5E500F8F8F800F4F4F400F5F5F500E6E6E600B9B9B900C2C2
      C200A3A3A300AAAAAA00A4A4A40098989800C2C2C200E3E3E3009F9F9F008686
      860074747400C5C5C500DDDDDD00DADADA00D5D5D500C3C3C300BABABA00B5B5
      B500CBCBCB00BEBEBE00CCCCCC007373730071717100D3D3D300A2A2A200B9B9
      B900B2B2B200E0E0E000BABABA00CACACA0098989800A1A1A100E0E0E000A9A9
      A900A0A0A000B8B8B800CACACA00BFBFBF00A7A7A700CFCFCF00E2E2E200E4E4
      E400E5E5E500DFDFDF00E7E7E700DBDBDB0087878700BDBDBD00D9D9D900D2D2
      D200C5C5C500CCCCCC00D0D0D000A4A4A400BABABA00C1C1C100B3B3B3007E7E
      7E00AFAFAF00A3A3A300959595008E8E8E0094949400D8D8D800EBEBEB00E7E7
      E700EFEFEF00D3D3D300E1E1E100CECECE00D3D3D300E5E5E500E6E6E600E2E2
      E200E1E1E1006F6F6F00C0C0C000E4E4E400D2D2D200C8C8C800D3D3D300D2D2
      D2009D9D9D00D1D1D100ACACAC0090909000C9C9C900DFDFDF00D8D8D800DEDE
      DE0081818100D7D7D700E8E8E800CACACA00ABABAB00CACACA00EBEBEB00E8E8
      E800E1E1E100E3E3E300C0C0C000BBBBBB00DADADA00E3E3E300E8E8E800DBDB
      DB00D5D5D500E0E0E000CACACA00CACACA00E2E2E200C6C6C600B9B9B900E5E5
      E500E8E8E800B8B8B800DBDBDB00F0F0F000DEDEDE00ECECEC00C8C8C800A6A6
      A600DCDCDC00E4E4E400D5D5D500D8D8D800E5E5E500D3D3D300D3D3D300A9A9
      A90078787800E8E8E800E7E7E700D9D9D900DCDCDC00CDCDCD00A5A5A5009C9C
      9C007A7A7A006B6B6B00C9C9C900E2E2E200DDDDDD00E4E4E400C9C9C900B8B8
      B80075757500A7A7A700DFDFDF008B8B8B007C7C7C00ACACAC00D3D3D300C4C4
      C40094949400B7B7B700C9C9C900DADADA00E0E0E000E6E6E600E6E6E600B2B2
      B20073737300DADADA00D2D2D200BFBFBF00B2B2B200C4C4C400D8D8D800A1A1
      A100B2B2B200B8B8B800C3C3C3009292920066666600686868005D5D5D004F4F
      4F0087878700E7E7E700F0F0F000EDEDED00E4E4E400D7D7D700E2E2E200D7D7
      D700E3E3E300E1E1E100D4D4D400CFCFCF00DDDDDD007B7B7B00D5D5D500E5E5
      E500DDDDDD00CACACA00D7D7D700E3E3E300ADADAD00AAAAAA008F8F8F009999
      9900CACACA00D9D9D900D0D0D000DEDEDE009B9B9B00D1D1D100D6D6D600DBDB
      DB00E1E1E100E8E8E800EDEDED00E8E8E800E0E0E000D7D7D700BFBFBF00ACAC
      AC00D2D2D200E5E5E500E4E4E400D6D6D600C4C4C400E4E4E400E3E3E300ECEC
      EC00ECECEC00B1B1B100A9A9A900E2E2E200D9D9D900B3B3B300DEDEDE00E8E8
      E800E3E3E300E2E2E200D4D4D4008E8E8E00C9C9C900E2E2E200D1D1D100E3E3
      E300E4E4E400D1D1D100C1C1C100D6D6D60070707000ABABAB00EDEDED00D3D3
      D300E7E7E700C0C0C000A7A7A7009B9B9B00939393008D8D8D00B2B2B200C5C5
      C500DBDBDB00E3E3E300D7D7D700BEBEBE00CFCFCF00E4E4E400C0C0C000A3A3
      A300C4C4C400EEEEEE00F0F0F000E5E5E500DDDDDD00AFAFAF00C7C7C700A9A9
      A900A5A5A500A7A7A700A1A1A100ACACAC00DDDDDD00CCCCCC00BEBEBE007A7A
      7A0098989800D1D1D100D1D1D100C8C8C800B2B2B200AEAEAE00B6B6B600CBCB
      CB00C2C2C200D0D0D000737373006B6B6B00CFCFCF009E9E9E00CBCBCB00C4C4
      C400BFBFBF00A2A2A200A9A9A90075757500A7A7A700DFDFDF008B8B8B007C7C
      7C00ACACAC00D3D3D300C4C4C40094949400B7B7B700C9C9C900DADADA00E0E0
      E000E6E6E600E6E6E600B2B2B20073737300DADADA00D2D2D200BFBFBF00B2B2
      B200C4C4C400D8D8D800A1A1A100B2B2B200B8B8B800C3C3C300929292006666
      6600686868005D5D5D004F4F4F0087878700E7E7E700F0F0F000EDEDED00E4E4
      E400D7D7D700E2E2E200D7D7D700E3E3E300E1E1E100D4D4D400CFCFCF00DDDD
      DD007B7B7B00D5D5D500E5E5E500DDDDDD00CACACA00D7D7D700E3E3E300ADAD
      AD00AAAAAA008F8F8F0099999900CACACA00D9D9D900D0D0D000DEDEDE009B9B
      9B00D1D1D100D6D6D600DBDBDB00E1E1E100E8E8E800EDEDED00E8E8E800E0E0
      E000D7D7D700BFBFBF00ACACAC00D2D2D200E5E5E500E4E4E400D6D6D600C4C4
      C400E4E4E400E3E3E300ECECEC00ECECEC00B1B1B100A9A9A900E2E2E200D9D9
      D900B3B3B300DEDEDE00E8E8E800E3E3E300E2E2E200D4D4D4008E8E8E00C9C9
      C900E2E2E200D1D1D100E3E3E300E4E4E400D1D1D100C1C1C100D6D6D6007070
      7000ABABAB00EDEDED00D3D3D300E7E7E700C0C0C000A7A7A7009B9B9B009393
      93008D8D8D00B2B2B200C5C5C500DBDBDB00E3E3E300D7D7D700BEBEBE00CFCF
      CF00E4E4E400C0C0C000A3A3A300C4C4C400EEEEEE00F0F0F000E5E5E500DDDD
      DD00AFAFAF00C7C7C700A9A9A900A5A5A500A7A7A700A1A1A100ACACAC00DDDD
      DD00CCCCCC00BEBEBE007A7A7A0098989800D1D1D100D1D1D100C8C8C800B2B2
      B200AEAEAE00B6B6B600CBCBCB00C2C2C200D0D0D000737373006B6B6B00CFCF
      CF009E9E9E00CBCBCB00C4C4C400BFBFBF00A2A2A200A9A9A90075757500A7A7
      A700DFDFDF008B8B8B007C7C7C00ACACAC00D3D3D300C4C4C40094949400B7B7
      B700C9C9C900DADADA00E0E0E000E6E6E600E6E6E600B2B2B20073737300DADA
      DA00D2D2D200BFBFBF00B2B2B200C4C4C400D8D8D800A1A1A100B2B2B200B8B8
      B800C3C3C3009292920066666600686868005D5D5D004F4F4F0087878700E7E7
      E700F0F0F000EDEDED00E4E4E400D7D7D700E2E2E200D7D7D700E3E3E300E1E1
      E100D4D4D400CFCFCF00DDDDDD007B7B7B00D5D5D500E5E5E500DDDDDD00CACA
      CA00D7D7D700E3E3E300ADADAD00AAAAAA008F8F8F0099999900CACACA00D9D9
      D900D0D0D000DEDEDE009B9B9B00D1D1D100D6D6D600DBDBDB00E1E1E100E8E8
      E800EDEDED00E8E8E800E0E0E000D7D7D700BFBFBF00ACACAC00D2D2D200E5E5
      E500E4E4E400D6D6D600C4C4C400E4E4E400E3E3E300ECECEC00ECECEC00B1B1
      B100A9A9A900E2E2E200D9D9D900B3B3B300DEDEDE00E8E8E800E3E3E300E2E2
      E200D4D4D4008E8E8E00C9C9C900E2E2E200D1D1D100E3E3E300E4E4E400D1D1
      D100C1C1C100D6D6D60070707000ABABAB00EDEDED00D3D3D300E7E7E700C0C0
      C000A7A7A7009B9B9B00939393008D8D8D00B2B2B200C5C5C500DBDBDB00E3E3
      E300D7D7D700BEBEBE0066666600ADADAD00DFDFDF0086868600909090009F9F
      9F00CACACA00C2C2C200858585009D9D9D00BDBDBD00E8E8E800E0E0E000DFDF
      DF00DDDDDD008787870098989800E3E3E300CACACA00B1B1B100AEAEAE00B2B2
      B200D0D0D000B7B7B700D8D8D800CECECE00E4E4E400D2D2D200767676009090
      90008A8A8A00A2A2A200D1D1D100ECECEC00DEDEDE00E4E4E400D9D9D900D1D1
      D100E3E3E300E0E0E000E7E7E700EAEAEA00E9E9E900DBDBDB00DBDBDB007979
      7900DEDEDE00E2E2E200D6D6D600C6C6C600D6D6D600E4E4E400C9C9C900BCBC
      BC008F8F8F009F9F9F00BFBFBF00D9D9D900CFCFCF00D4D4D400A3A3A300AAAA
      AA00B6B6B600D5D5D500EDEDED00EBEBEB00E5E5E500E3E3E300DCDCDC00CDCD
      CD00C3C3C300A1A1A100C7C7C700E3E3E300E3E3E300D8D8D800B8B8B800C7C7
      C700BEBEBE00D7D7D700EEEEEE00A8A8A8008E8E8E00D3D3D300DDDDDD00B1B1
      B100E3E3E300E3E3E300DFDFDF00D7D7D700D7D7D700A3A3A300AFAFAF00DFDF
      DF00D3D3D300D8D8D800D5D5D500D6D6D600C4C4C400D8D8D800747474004E4E
      4E00CACACA00DDDDDD00E7E7E700DADADA00D7D7D700CDCDCD008F8F8F00B5B5
      B500C6C6C600B4B4B400D0D0D000E1E1E100DBDBDB00C1C1C100BEBEBE00D8D8
      D800BABABA00A4A4A400B4B4B400D3D3D300E6E6E600E5E5E500D1D1D100A7A7
      A700D0D0D000CECECE00C3C3C300B5B5B500C3C3C300A8A8A800B7B7B700D5D5
      D500D3D3D3008282820067676700BDBDBD00DBDBDB00D8D8D800C7C7C700B2B2
      B200B3B3B300CACACA00BFBFBF00C4C4C4007878780071717100B2B2B2008B8B
      8B00C3C3C300BABABA00CACACA00CBCBCB009797970066666600ADADAD00DFDF
      DF0086868600909090009F9F9F00CACACA00C2C2C200858585009D9D9D00BDBD
      BD00E8E8E800E0E0E000DFDFDF00DDDDDD008787870098989800E3E3E300CACA
      CA00B1B1B100AEAEAE00B2B2B200D0D0D000B7B7B700D8D8D800CECECE00E4E4
      E400D2D2D20076767600909090008A8A8A00A2A2A200D1D1D100ECECEC00DEDE
      DE00E4E4E400D9D9D900D1D1D100E3E3E300E0E0E000E7E7E700EAEAEA00E9E9
      E900DBDBDB00DBDBDB0079797900DEDEDE00E2E2E200D6D6D600C6C6C600D6D6
      D600E4E4E400C9C9C900BCBCBC008F8F8F009F9F9F00BFBFBF00D9D9D900CFCF
      CF00D4D4D400A3A3A300AAAAAA00B6B6B600D5D5D500EDEDED00EBEBEB00E5E5
      E500E3E3E300DCDCDC00CDCDCD00C3C3C300A1A1A100C7C7C700E3E3E300E3E3
      E300D8D8D800B8B8B800C7C7C700BEBEBE00D7D7D700EEEEEE00A8A8A8008E8E
      8E00D3D3D300DDDDDD00B1B1B100E3E3E300E3E3E300DFDFDF00D7D7D700D7D7
      D700A3A3A300AFAFAF00DFDFDF00D3D3D300D8D8D800D5D5D500D6D6D600C4C4
      C400D8D8D800747474004E4E4E00CACACA00DDDDDD00E7E7E700DADADA00D7D7
      D700CDCDCD008F8F8F00B5B5B500C6C6C600B4B4B400D0D0D000E1E1E100DBDB
      DB00C1C1C100BEBEBE00D8D8D800BABABA00A4A4A400B4B4B400D3D3D300E6E6
      E600E5E5E500D1D1D100A7A7A700D0D0D000CECECE00C3C3C300B5B5B500C3C3
      C300A8A8A800B7B7B700D5D5D500D3D3D3008282820067676700BDBDBD00DBDB
      DB00D8D8D800C7C7C700B2B2B200B3B3B300CACACA00BFBFBF00C4C4C4007878
      780071717100B2B2B2008B8B8B00C3C3C300BABABA00CACACA00CBCBCB009797
      970066666600ADADAD00DFDFDF0086868600909090009F9F9F00CACACA00C2C2
      C200858585009D9D9D00BDBDBD00E8E8E800E0E0E000DFDFDF00DDDDDD008787
      870098989800E3E3E300CACACA00B1B1B100AEAEAE00B2B2B200D0D0D000B7B7
      B700D8D8D800CECECE00E4E4E400D2D2D20076767600909090008A8A8A00A2A2
      A200D1D1D100ECECEC00DEDEDE00E4E4E400D9D9D900D1D1D100E3E3E300E0E0
      E000E7E7E700EAEAEA00E9E9E900DBDBDB00DBDBDB0079797900DEDEDE00E2E2
      E200D6D6D600C6C6C600D6D6D600E4E4E400C9C9C900BCBCBC008F8F8F009F9F
      9F00BFBFBF00D9D9D900CFCFCF00D4D4D400A3A3A300AAAAAA00B6B6B600D5D5
      D500EDEDED00EBEBEB00E5E5E500E3E3E300DCDCDC00CDCDCD00C3C3C300A1A1
      A100C7C7C700E3E3E300E3E3E300D8D8D800B8B8B800C7C7C700BEBEBE00D7D7
      D700EEEEEE00A8A8A8008E8E8E00D3D3D300DDDDDD00B1B1B100E3E3E300E3E3
      E300DFDFDF00D7D7D700D7D7D700A3A3A300AFAFAF00DFDFDF00D3D3D300D8D8
      D800D5D5D500D6D6D600C4C4C400D8D8D800747474004E4E4E00CACACA00DDDD
      DD00E7E7E700DADADA00D7D7D700CDCDCD008F8F8F00B5B5B500C6C6C600B4B4
      B400D0D0D000E1E1E100DBDBDB00C1C1C10081818100CECECE00DCDCDC006D6D
      6D00919191008F8F8F00BCBCBC00CFCFCF00A4A4A400B7B7B700CDCDCD00DDDD
      DD009D9D9D00B5B5B500BEBEBE0068686800CDCDCD00EDEDED00D6D6D600BDBD
      BD00C6C6C600BEBEBE00BCBCBC00B9B9B900EAEAEA00CBCBCB00D9D9D900F3F3
      F300CDCDCD00D2D2D200A6A6A600C0C0C000D2D2D200E0E0E000E9E9E900E3E3
      E300DEDEDE00CFCFCF00ECECEC00EBEBEB00E0E0E000E4E4E400E1E1E100ACAC
      AC007D7D7D0064646400DADADA00DBDBDB00C5C5C500BFBFBF00D9D9D900E1E1
      E100DEDEDE00E0E0E0009292920095959500ADADAD00E1E1E100DDDDDD00D6D6
      D600A7A7A700D5D5D500E0E0E000E2E2E200DEDEDE00E2E2E200EAEAEA00E5E5
      E500DADADA00D4D4D400D1D1D1009D9D9D00BABABA00DEDEDE00E7E7E700E6E6
      E600C3C3C300B6B6B600C2C2C200DCDCDC00E5E5E500AEAEAE00B6B6B600F3F3
      F300D0D0D000B6B6B600E3E3E300E2E2E200CFCFCF00D6D6D600D3D3D300CACA
      CA009D9D9D00C3C3C300D8D8D800DADADA00D7D7D700D6D6D600CDCDCD00B2B2
      B200838383006666660086868600D9D9D900CDCDCD00E7E7E700D7D7D700D0D0
      D000A2A2A200B3B3B300E6E6E600B8B8B800BEBEBE00D5D5D500D7D7D700CCCC
      CC00D0D0D000D6D6D600ADADAD00A7A7A700AEAEAE00ACACAC00CECECE00E3E3
      E300BEBEBE00A8A8A800C0C0C000CDCDCD00C0C0C000A8A8A800DDDDDD00B4B4
      B40091919100ACACAC00D8D8D800B7B7B7006E6E6E009D9D9D00BCBCBC00CECE
      CE00D2D2D2009A9A9A00A6A6A600CDCDCD00B5B5B5009D9D9D00656565007373
      73009F9F9F0095959500C3C3C300B7B7B700C1C1C100DDDDDD008A8A8A008181
      8100CECECE00DCDCDC006D6D6D00919191008F8F8F00BCBCBC00CFCFCF00A4A4
      A400B7B7B700CDCDCD00DDDDDD009D9D9D00B5B5B500BEBEBE0068686800CDCD
      CD00EDEDED00D6D6D600BDBDBD00C6C6C600BEBEBE00BCBCBC00B9B9B900EAEA
      EA00CBCBCB00D9D9D900F3F3F300CDCDCD00D2D2D200A6A6A600C0C0C000D2D2
      D200E0E0E000E9E9E900E3E3E300DEDEDE00CFCFCF00ECECEC00EBEBEB00E0E0
      E000E4E4E400E1E1E100ACACAC007D7D7D0064646400DADADA00DBDBDB00C5C5
      C500BFBFBF00D9D9D900E1E1E100DEDEDE00E0E0E0009292920095959500ADAD
      AD00E1E1E100DDDDDD00D6D6D600A7A7A700D5D5D500E0E0E000E2E2E200DEDE
      DE00E2E2E200EAEAEA00E5E5E500DADADA00D4D4D400D1D1D1009D9D9D00BABA
      BA00DEDEDE00E7E7E700E6E6E600C3C3C300B6B6B600C2C2C200DCDCDC00E5E5
      E500AEAEAE00B6B6B600F3F3F300D0D0D000B6B6B600E3E3E300E2E2E200CFCF
      CF00D6D6D600D3D3D300CACACA009D9D9D00C3C3C300D8D8D800DADADA00D7D7
      D700D6D6D600CDCDCD00B2B2B200838383006666660086868600D9D9D900CDCD
      CD00E7E7E700D7D7D700D0D0D000A2A2A200B3B3B300E6E6E600B8B8B800BEBE
      BE00D5D5D500D7D7D700CCCCCC00D0D0D000D6D6D600ADADAD00A7A7A700AEAE
      AE00ACACAC00CECECE00E3E3E300BEBEBE00A8A8A800C0C0C000CDCDCD00C0C0
      C000A8A8A800DDDDDD00B4B4B40091919100ACACAC00D8D8D800B7B7B7006E6E
      6E009D9D9D00BCBCBC00CECECE00D2D2D2009A9A9A00A6A6A600CDCDCD00B5B5
      B5009D9D9D0065656500737373009F9F9F0095959500C3C3C300B7B7B700C1C1
      C100DDDDDD008A8A8A0081818100CECECE00DCDCDC006D6D6D00919191008F8F
      8F00BCBCBC00CFCFCF00A4A4A400B7B7B700CDCDCD00DDDDDD009D9D9D00B5B5
      B500BEBEBE0068686800CDCDCD00EDEDED00D6D6D600BDBDBD00C6C6C600BEBE
      BE00BCBCBC00B9B9B900EAEAEA00CBCBCB00D9D9D900F3F3F300CDCDCD00D2D2
      D200A6A6A600C0C0C000D2D2D200E0E0E000E9E9E900E3E3E300DEDEDE00CFCF
      CF00ECECEC00EBEBEB00E0E0E000E4E4E400E1E1E100ACACAC007D7D7D006464
      6400DADADA00DBDBDB00C5C5C500BFBFBF00D9D9D900E1E1E100DEDEDE00E0E0
      E0009292920095959500ADADAD00E1E1E100DDDDDD00D6D6D600A7A7A700D5D5
      D500E0E0E000E2E2E200DEDEDE00E2E2E200EAEAEA00E5E5E500DADADA00D4D4
      D400D1D1D1009D9D9D00BABABA00DEDEDE00E7E7E700E6E6E600C3C3C300B6B6
      B600C2C2C200DCDCDC00E5E5E500AEAEAE00B6B6B600F3F3F300D0D0D000B6B6
      B600E3E3E300E2E2E200CFCFCF00D6D6D600D3D3D300CACACA009D9D9D00C3C3
      C300D8D8D800DADADA00D7D7D700D6D6D600CDCDCD00B2B2B200838383006666
      660086868600D9D9D900CDCDCD00E7E7E700D7D7D700D0D0D000A2A2A200B3B3
      B300E6E6E600B8B8B800BEBEBE00D5D5D500D7D7D700CCCCCC00CBCBCB00EBEB
      EB00CCCCCC0071717100ADADAD00C4C4C400D1D1D100C3C3C300A9A9A900C9C9
      C900E4E4E400B2B2B20049494900B6B6B6009F9F9F008C8C8C00E2E2E200D6D6
      D600D2D2D200D4D4D400D0D0D000A8A8A800C1C1C100C6C6C600DDDDDD00DEDE
      DE00E3E3E300DADADA00EDEDED00C8C8C80080808000CDCDCD00CACACA00E0E0
      E000E9E9E900EBEBEB00E6E6E600D7D7D700DEDEDE00E1E1E100CCCCCC00F1F1
      F100E9E9E9008D8D8D004B4B4B0091919100E9E9E900E7E7E700C4C4C400B6B6
      B600E3E3E300DBDBDB00EBEBEB00CECECE0094949400A7A7A700A8A8A800DCDC
      DC00D7D7D700C5C5C5008A8A8A00D7D7D700E7E7E700C4C4C400ADADAD00D9D9
      D900EFEFEF00EBEBEB00D2D2D200B5B5B500C7C7C700AAAAAA00A2A2A200DBDB
      DB00E1E1E100E5E5E500C5C5C500E2E2E200E4E4E400E6E6E600E3E3E300AEAE
      AE00CACACA00E2E2E200DDDDDD00ABABAB00BDBDBD00D9D9D900D3D3D300CFCF
      CF00C4C4C400C2C2C200C4C4C400A5A5A500C6C6C600E2E2E200CFCFCF00C1C1
      C100BFBFBF00C4C4C400939393009797970085858500CFCFCF00D0D0D000BBBB
      BB00818181008C8C8C008C8C8C00B6B6B600EDEDED00D4D4D4009F9F9F00BCBC
      BC00DCDCDC008D8D8D008D8D8D00D8D8D800B5B5B500B5B5B500DADADA00A5A5
      A5009B9B9B00D1D1D100C4C4C400A6A6A600ADADAD00B8B8B800B1B1B100B2B2
      B200D2D2D200BBBBBB00666666007E7E7E00C8C8C800B9B9B900919191008686
      8600D0D0D000D4D4D400D5D5D500A4A4A4009F9F9F00CDCDCD00B2B2B2006464
      6400414141007777770093939300ADADAD00C9C9C900CFCFCF00D5D5D500CACA
      CA0071717100CBCBCB00EBEBEB00CCCCCC0071717100ADADAD00C4C4C400D1D1
      D100C3C3C300A9A9A900C9C9C900E4E4E400B2B2B20049494900B6B6B6009F9F
      9F008C8C8C00E2E2E200D6D6D600D2D2D200D4D4D400D0D0D000A8A8A800C1C1
      C100C6C6C600DDDDDD00DEDEDE00E3E3E300DADADA00EDEDED00C8C8C8008080
      8000CDCDCD00CACACA00E0E0E000E9E9E900EBEBEB00E6E6E600D7D7D700DEDE
      DE00E1E1E100CCCCCC00F1F1F100E9E9E9008D8D8D004B4B4B0091919100E9E9
      E900E7E7E700C4C4C400B6B6B600E3E3E300DBDBDB00EBEBEB00CECECE009494
      9400A7A7A700A8A8A800DCDCDC00D7D7D700C5C5C5008A8A8A00D7D7D700E7E7
      E700C4C4C400ADADAD00D9D9D900EFEFEF00EBEBEB00D2D2D200B5B5B500C7C7
      C700AAAAAA00A2A2A200DBDBDB00E1E1E100E5E5E500C5C5C500E2E2E200E4E4
      E400E6E6E600E3E3E300AEAEAE00CACACA00E2E2E200DDDDDD00ABABAB00BDBD
      BD00D9D9D900D3D3D300CFCFCF00C4C4C400C2C2C200C4C4C400A5A5A500C6C6
      C600E2E2E200CFCFCF00C1C1C100BFBFBF00C4C4C40093939300979797008585
      8500CFCFCF00D0D0D000BBBBBB00818181008C8C8C008C8C8C00B6B6B600EDED
      ED00D4D4D4009F9F9F00BCBCBC00DCDCDC008D8D8D008D8D8D00D8D8D800B5B5
      B500B5B5B500DADADA00A5A5A5009B9B9B00D1D1D100C4C4C400A6A6A600ADAD
      AD00B8B8B800B1B1B100B2B2B200D2D2D200BBBBBB00666666007E7E7E00C8C8
      C800B9B9B9009191910086868600D0D0D000D4D4D400D5D5D500A4A4A4009F9F
      9F00CDCDCD00B2B2B20064646400414141007777770093939300ADADAD00C9C9
      C900CFCFCF00D5D5D500CACACA0071717100CBCBCB00EBEBEB00CCCCCC007171
      7100ADADAD00C4C4C400D1D1D100C3C3C300A9A9A900C9C9C900E4E4E400B2B2
      B20049494900B6B6B6009F9F9F008C8C8C00E2E2E200D6D6D600D2D2D200D4D4
      D400D0D0D000A8A8A800C1C1C100C6C6C600DDDDDD00DEDEDE00E3E3E300DADA
      DA00EDEDED00C8C8C80080808000CDCDCD00CACACA00E0E0E000E9E9E900EBEB
      EB00E6E6E600D7D7D700DEDEDE00E1E1E100CCCCCC00F1F1F100E9E9E9008D8D
      8D004B4B4B0091919100E9E9E900E7E7E700C4C4C400B6B6B600E3E3E300DBDB
      DB00EBEBEB00CECECE0094949400A7A7A700A8A8A800DCDCDC00D7D7D700C5C5
      C5008A8A8A00D7D7D700E7E7E700C4C4C400ADADAD00D9D9D900EFEFEF00EBEB
      EB00D2D2D200B5B5B500C7C7C700AAAAAA00A2A2A200DBDBDB00E1E1E100E5E5
      E500C5C5C500E2E2E200E4E4E400E6E6E600E3E3E300AEAEAE00CACACA00E2E2
      E200DDDDDD00ABABAB00BDBDBD00D9D9D900D3D3D300CFCFCF00C4C4C400C2C2
      C200C4C4C400A5A5A500C6C6C600E2E2E200CFCFCF00C1C1C100BFBFBF00C4C4
      C400939393009797970085858500CFCFCF00D0D0D000BBBBBB00818181008C8C
      8C008C8C8C00B6B6B600EDEDED00D4D4D4009F9F9F00BCBCBC00DCDCDC008D8D
      8D00CACACA00E3E3E300BEBEBE008B8B8B00D1D1D100D2D2D200D3D3D300B9B9
      B900A7A7A700D0D0D000C6C6C600D8D8D800C0C0C000C9C9C90063636300B4B4
      B400EDEDED00E2E2E200E1E1E100CBCBCB00C0C0C000B8B8B800BCBCBC00D7D7
      D700E2E2E200DEDEDE00E1E1E100D5D5D500DCDCDC00C0C0C0008E8E8E00D4D4
      D400D5D5D500DFDFDF00E5E5E500E8E8E800E0E0E000D1D1D100E5E5E500E5E5
      E500E5E5E500E6E6E600E0E0E000E2E2E200A1A1A10091919100BDBDBD00B8B8
      B800C5C5C500CECECE00E0E0E000D0D0D000EDEDED00BFBFBF00A0A0A000ACAC
      AC008E8E8E00CDCDCD00DBDBDB00D5D5D5009E9E9E00D0D0D000E4E4E400C4C4
      C400CECECE00EAEAEA00D9D9D900E5E5E500C6C6C6009D9D9D00ACACAC009F9F
      9F00ADADAD00E6E6E600E2E2E200DFDFDF00C6C6C600DADADA00E7E7E700E8E8
      E800E4E4E400B0B0B000D6D6D600E3E3E300C8C8C80084848400A4A4A400CACA
      CA00C8C8C800CACACA00C5C5C500C5C5C500C8C8C800A5A5A500ADADAD00C7C7
      C700C8C8C800CCCCCC00CDCDCD00B6B6B6009090900096969600A6A6A6006767
      6700D2D2D200C5C5C50094949400A6A6A60065656500B7B7B700DBDBDB00E1E1
      E100C7C7C700BEBEBE00D3D3D3009797970072727200D1D1D100A2A2A200B0B0
      B000EFEFEF00BFBFBF0092929200B3B3B300D1D1D100A6A6A600B4B4B400B9B9
      B900AEAEAE00ACACAC00C6C6C600C1C1C1008C8C8C0079797900C1C1C100C1C1
      C100B2B2B2007F7F7F009D9D9D00D2D2D200CECECE00B5B5B500A4A4A400CACA
      CA00BFBFBF009595950065656500979797008E8E8E00A9A9A900D8D8D800BFBF
      BF00C7C7C700AAAAAA007F7F7F00CACACA00E3E3E300BEBEBE008B8B8B00D1D1
      D100D2D2D200D3D3D300B9B9B900A7A7A700D0D0D000C6C6C600D8D8D800C0C0
      C000C9C9C90063636300B4B4B400EDEDED00E2E2E200E1E1E100CBCBCB00C0C0
      C000B8B8B800BCBCBC00D7D7D700E2E2E200DEDEDE00E1E1E100D5D5D500DCDC
      DC00C0C0C0008E8E8E00D4D4D400D5D5D500DFDFDF00E5E5E500E8E8E800E0E0
      E000D1D1D100E5E5E500E5E5E500E5E5E500E6E6E600E0E0E000E2E2E200A1A1
      A10091919100BDBDBD00B8B8B800C5C5C500CECECE00E0E0E000D0D0D000EDED
      ED00BFBFBF00A0A0A000ACACAC008E8E8E00CDCDCD00DBDBDB00D5D5D5009E9E
      9E00D0D0D000E4E4E400C4C4C400CECECE00EAEAEA00D9D9D900E5E5E500C6C6
      C6009D9D9D00ACACAC009F9F9F00ADADAD00E6E6E600E2E2E200DFDFDF00C6C6
      C600DADADA00E7E7E700E8E8E800E4E4E400B0B0B000D6D6D600E3E3E300C8C8
      C80084848400A4A4A400CACACA00C8C8C800CACACA00C5C5C500C5C5C500C8C8
      C800A5A5A500ADADAD00C7C7C700C8C8C800CCCCCC00CDCDCD00B6B6B6009090
      900096969600A6A6A60067676700D2D2D200C5C5C50094949400A6A6A6006565
      6500B7B7B700DBDBDB00E1E1E100C7C7C700BEBEBE00D3D3D300979797007272
      7200D1D1D100A2A2A200B0B0B000EFEFEF00BFBFBF0092929200B3B3B300D1D1
      D100A6A6A600B4B4B400B9B9B900AEAEAE00ACACAC00C6C6C600C1C1C1008C8C
      8C0079797900C1C1C100C1C1C100B2B2B2007F7F7F009D9D9D00D2D2D200CECE
      CE00B5B5B500A4A4A400CACACA00BFBFBF009595950065656500979797008E8E
      8E00A9A9A900D8D8D800BFBFBF00C7C7C700AAAAAA007F7F7F00CACACA00E3E3
      E300BEBEBE008B8B8B00D1D1D100D2D2D200D3D3D300B9B9B900A7A7A700D0D0
      D000C6C6C600D8D8D800C0C0C000C9C9C90063636300B4B4B400EDEDED00E2E2
      E200E1E1E100CBCBCB00C0C0C000B8B8B800BCBCBC00D7D7D700E2E2E200DEDE
      DE00E1E1E100D5D5D500DCDCDC00C0C0C0008E8E8E00D4D4D400D5D5D500DFDF
      DF00E5E5E500E8E8E800E0E0E000D1D1D100E5E5E500E5E5E500E5E5E500E6E6
      E600E0E0E000E2E2E200A1A1A10091919100BDBDBD00B8B8B800C5C5C500CECE
      CE00E0E0E000D0D0D000EDEDED00BFBFBF00A0A0A000ACACAC008E8E8E00CDCD
      CD00DBDBDB00D5D5D5009E9E9E00D0D0D000E4E4E400C4C4C400CECECE00EAEA
      EA00D9D9D900E5E5E500C6C6C6009D9D9D00ACACAC009F9F9F00ADADAD00E6E6
      E600E2E2E200DFDFDF00C6C6C600DADADA00E7E7E700E8E8E800E4E4E400B0B0
      B000D6D6D600E3E3E300C8C8C80084848400A4A4A400CACACA00C8C8C800CACA
      CA00C5C5C500C5C5C500C8C8C800A5A5A500ADADAD00C7C7C700C8C8C800CCCC
      CC00CDCDCD00B6B6B6009090900096969600A6A6A60067676700D2D2D200C5C5
      C50094949400A6A6A60065656500B7B7B700DBDBDB00E1E1E100C7C7C700BEBE
      BE00D3D3D3009797970089898900C5C5C500CCCCCC0066666600C9C9C900D6D6
      D600BCBCBC00CECECE0090909000A2A2A200BDBDBD00DCDCDC00F9F9F900A2A2
      A2006D6D6D00CBCBCB00FAFAFA00E0E0E000D7D7D700A1A1A100B2B2B200C8C8
      C800AEAEAE00DBDBDB00DCDCDC00DCDCDC00D0D0D000C9C9C900D4D4D400CBCB
      CB00A2A2A200C8C8C800CFCFCF00D9D9D900E7E7E700E9E9E900D5D5D500CECE
      CE00E0E0E000E9E9E900F1F1F100E1E1E100D4D4D400EFEFEF00B5B5B5008282
      82009B9B9B0095959500B3B3B300C9C9C900D4D4D400CBCBCB00EBEBEB00ADAD
      AD00B0B0B000B4B4B40078787800C9C9C900E1E1E100D8D8D800A3A3A300DDDD
      DD00F2F2F200E2E2E200E1E1E100E3E3E300D3D3D300E8E8E800D9D9D900C1C1
      C100C6C6C600ACACAC00A9A9A900D5D5D500E1E1E100E0E0E000C5C5C500CBCB
      CB00E6E6E600E4E4E400DBDBDB009F9F9F00CFCFCF00E1E1E100C5C5C5009393
      9300B8B8B800D6D6D600C6C6C600C6C6C600C2C2C200C1C1C100C6C6C600BFBF
      BF0092929200B2B2B200D0D0D000C5C5C500D0D0D000BABABA00A1A1A1007C7C
      7C00D8D8D8007979790094949400CFCFCF00C4C4C400D2D2D2004F4F4F00A4A4
      A400C9C9C900E6E6E600E4E4E400BCBCBC00B9B9B900B8B8B800C4C4C400E0E0
      E000A7A7A700AEAEAE00E3E3E300DBDBDB00BDBDBD009D9D9D00AAAAAA00A2A2
      A200B5B5B500B8B8B800AEAEAE009A9A9A0097979700B7B7B700D1D1D1006464
      64009E9E9E00BDBDBD00AFAFAF009292920091919100ABABAB00D2D2D200B1B1
      B10099999900C1C1C100CDCDCD00B1B1B1004D4D4D0086868600737373009A9A
      9A00C9C9C900BABABA00CACACA008A8A8A008F8F8F0089898900C5C5C500CCCC
      CC0066666600C9C9C900D6D6D600BCBCBC00CECECE0090909000A2A2A200BDBD
      BD00DCDCDC00F9F9F900A2A2A2006D6D6D00CBCBCB00FAFAFA00E0E0E000D7D7
      D700A1A1A100B2B2B200C8C8C800AEAEAE00DBDBDB00DCDCDC00DCDCDC00D0D0
      D000C9C9C900D4D4D400CBCBCB00A2A2A200C8C8C800CFCFCF00D9D9D900E7E7
      E700E9E9E900D5D5D500CECECE00E0E0E000E9E9E900F1F1F100E1E1E100D4D4
      D400EFEFEF00B5B5B500828282009B9B9B0095959500B3B3B300C9C9C900D4D4
      D400CBCBCB00EBEBEB00ADADAD00B0B0B000B4B4B40078787800C9C9C900E1E1
      E100D8D8D800A3A3A300DDDDDD00F2F2F200E2E2E200E1E1E100E3E3E300D3D3
      D300E8E8E800D9D9D900C1C1C100C6C6C600ACACAC00A9A9A900D5D5D500E1E1
      E100E0E0E000C5C5C500CBCBCB00E6E6E600E4E4E400DBDBDB009F9F9F00CFCF
      CF00E1E1E100C5C5C50093939300B8B8B800D6D6D600C6C6C600C6C6C600C2C2
      C200C1C1C100C6C6C600BFBFBF0092929200B2B2B200D0D0D000C5C5C500D0D0
      D000BABABA00A1A1A1007C7C7C00D8D8D8007979790094949400CFCFCF00C4C4
      C400D2D2D2004F4F4F00A4A4A400C9C9C900E6E6E600E4E4E400BCBCBC00B9B9
      B900B8B8B800C4C4C400E0E0E000A7A7A700AEAEAE00E3E3E300DBDBDB00BDBD
      BD009D9D9D00AAAAAA00A2A2A200B5B5B500B8B8B800AEAEAE009A9A9A009797
      9700B7B7B700D1D1D100646464009E9E9E00BDBDBD00AFAFAF00929292009191
      9100ABABAB00D2D2D200B1B1B10099999900C1C1C100CDCDCD00B1B1B1004D4D
      4D0086868600737373009A9A9A00C9C9C900BABABA00CACACA008A8A8A008F8F
      8F0089898900C5C5C500CCCCCC0066666600C9C9C900D6D6D600BCBCBC00CECE
      CE0090909000A2A2A200BDBDBD00DCDCDC00F9F9F900A2A2A2006D6D6D00CBCB
      CB00FAFAFA00E0E0E000D7D7D700A1A1A100B2B2B200C8C8C800AEAEAE00DBDB
      DB00DCDCDC00DCDCDC00D0D0D000C9C9C900D4D4D400CBCBCB00A2A2A200C8C8
      C800CFCFCF00D9D9D900E7E7E700E9E9E900D5D5D500CECECE00E0E0E000E9E9
      E900F1F1F100E1E1E100D4D4D400EFEFEF00B5B5B500828282009B9B9B009595
      9500B3B3B300C9C9C900D4D4D400CBCBCB00EBEBEB00ADADAD00B0B0B000B4B4
      B40078787800C9C9C900E1E1E100D8D8D800A3A3A300DDDDDD00F2F2F200E2E2
      E200E1E1E100E3E3E300D3D3D300E8E8E800D9D9D900C1C1C100C6C6C600ACAC
      AC00A9A9A900D5D5D500E1E1E100E0E0E000C5C5C500CBCBCB00E6E6E600E4E4
      E400DBDBDB009F9F9F00CFCFCF00E1E1E100C5C5C50093939300B8B8B800D6D6
      D600C6C6C600C6C6C600C2C2C200C1C1C100C6C6C600BFBFBF0092929200B2B2
      B200D0D0D000C5C5C500D0D0D000BABABA00A1A1A1007C7C7C00D8D8D8007979
      790094949400CFCFCF00C4C4C400D2D2D2004F4F4F00A4A4A400C9C9C900E6E6
      E600E4E4E400BCBCBC00B9B9B900B8B8B800ADADAD00BABABA00BDBDBD006464
      640099999900C3C3C300E2E2E200959595004B4B4B0061616100A9A9A9009191
      9100A4A4A4006262620074747400DCDCDC00F1F1F100C4C4C400D9D9D900BBBB
      BB00BABABA00BABABA00A0A0A000DBDBDB00DDDDDD00E5E5E500D3D3D300CCCC
      CC00C0C0C000A5A5A5009E9E9E00C7C7C700D9D9D900D6D6D600E1E1E100E8E8
      E800D4D4D400CFCFCF00DBDBDB00E8E8E800BFBFBF00C9C9C900DADADA00BEBE
      BE008282820086868600BEBEBE00BBBBBB00B5B5B500BFBFBF00D9D9D900DBDB
      DB00DEDEDE0099999900BFBFBF00C2C2C2006F6F6F00C3C3C300DDDDDD00D4D4
      D400AAAAAA00D0D0D000D0D0D000E9E9E900DBDBDB00DDDDDD00D8D8D800CACA
      CA00D9D9D900DBDBDB00D0D0D000ACACAC00A6A6A600CBCBCB00E2E2E200E1E1
      E100C7C7C700C5C5C500D7D7D700CBCBCB00C2C2C20089898900BEBEBE00DADA
      DA00CFCFCF00B0B0B000CECECE00D6D6D600B5B5B500B6B6B600B6B6B600B8B8
      B800C1C1C100D5D5D5009C9C9C009E9E9E00C5C5C500C1C1C100C4C4C400ABAB
      AB00A4A4A40081818100C4C4C400D0D0D0007D7D7D00B4B4B400C6C6C600C1C1
      C10061616100C4C4C400DEDEDE00C9C9C900C9C9C900CACACA00C2C2C200BBBB
      BB00CCCCCC00C6C6C600C4C4C400C1C1C100C5C5C500C9C9C900D6D6D600A8A8
      A8009A9A9A0084848400BBBBBB00BFBFBF00A4A4A400A4A4A400B7B7B700C0C0
      C000BABABA0044444400474747009B9B9B00B3B3B3009A9A9A009E9E9E00BFBF
      BF00CCCCCC00B5B5B500A7A7A700BCBCBC00AAAAAA009B9B9B00464646009F9F
      9F0076767600A0A0A000CECECE00C4C4C400B3B3B30079797900A6A6A600ADAD
      AD00BABABA00BDBDBD006464640099999900C3C3C300E2E2E200959595004B4B
      4B0061616100A9A9A90091919100A4A4A4006262620074747400DCDCDC00F1F1
      F100C4C4C400D9D9D900BBBBBB00BABABA00BABABA00A0A0A000DBDBDB00DDDD
      DD00E5E5E500D3D3D300CCCCCC00C0C0C000A5A5A5009E9E9E00C7C7C700D9D9
      D900D6D6D600E1E1E100E8E8E800D4D4D400CFCFCF00DBDBDB00E8E8E800BFBF
      BF00C9C9C900DADADA00BEBEBE008282820086868600BEBEBE00BBBBBB00B5B5
      B500BFBFBF00D9D9D900DBDBDB00DEDEDE0099999900BFBFBF00C2C2C2006F6F
      6F00C3C3C300DDDDDD00D4D4D400AAAAAA00D0D0D000D0D0D000E9E9E900DBDB
      DB00DDDDDD00D8D8D800CACACA00D9D9D900DBDBDB00D0D0D000ACACAC00A6A6
      A600CBCBCB00E2E2E200E1E1E100C7C7C700C5C5C500D7D7D700CBCBCB00C2C2
      C20089898900BEBEBE00DADADA00CFCFCF00B0B0B000CECECE00D6D6D600B5B5
      B500B6B6B600B6B6B600B8B8B800C1C1C100D5D5D5009C9C9C009E9E9E00C5C5
      C500C1C1C100C4C4C400ABABAB00A4A4A40081818100C4C4C400D0D0D0007D7D
      7D00B4B4B400C6C6C600C1C1C10061616100C4C4C400DEDEDE00C9C9C900C9C9
      C900CACACA00C2C2C200BBBBBB00CCCCCC00C6C6C600C4C4C400C1C1C100C5C5
      C500C9C9C900D6D6D600A8A8A8009A9A9A0084848400BBBBBB00BFBFBF00A4A4
      A400A4A4A400B7B7B700C0C0C000BABABA0044444400474747009B9B9B00B3B3
      B3009A9A9A009E9E9E00BFBFBF00CCCCCC00B5B5B500A7A7A700BCBCBC00AAAA
      AA009B9B9B00464646009F9F9F0076767600A0A0A000CECECE00C4C4C400B3B3
      B30079797900A6A6A600ADADAD00BABABA00BDBDBD006464640099999900C3C3
      C300E2E2E200959595004B4B4B0061616100A9A9A90091919100A4A4A4006262
      620074747400DCDCDC00F1F1F100C4C4C400D9D9D900BBBBBB00BABABA00BABA
      BA00A0A0A000DBDBDB00DDDDDD00E5E5E500D3D3D300CCCCCC00C0C0C000A5A5
      A5009E9E9E00C7C7C700D9D9D900D6D6D600E1E1E100E8E8E800D4D4D400CFCF
      CF00DBDBDB00E8E8E800BFBFBF00C9C9C900DADADA00BEBEBE00828282008686
      8600BEBEBE00BBBBBB00B5B5B500BFBFBF00D9D9D900DBDBDB00DEDEDE009999
      9900BFBFBF00C2C2C2006F6F6F00C3C3C300DDDDDD00D4D4D400AAAAAA00D0D0
      D000D0D0D000E9E9E900DBDBDB00DDDDDD00D8D8D800CACACA00D9D9D900DBDB
      DB00D0D0D000ACACAC00A6A6A600CBCBCB00E2E2E200E1E1E100C7C7C700C5C5
      C500D7D7D700CBCBCB00C2C2C20089898900BEBEBE00DADADA00CFCFCF00B0B0
      B000CECECE00D6D6D600B5B5B500B6B6B600B6B6B600B8B8B800C1C1C100D5D5
      D5009C9C9C009E9E9E00C5C5C500C1C1C100C4C4C400ABABAB00A4A4A4008181
      8100C4C4C400D0D0D0007D7D7D00B4B4B400C6C6C600C1C1C10061616100C4C4
      C400DEDEDE00C9C9C900C9C9C900CACACA00C2C2C200BBBBBB00D2D2D200CFCF
      CF00BCBCBC00494949007F7F7F00A6A6A600C3C3C3009E9E9E004F4F4F00C7C7
      C700888888004848480068686800474747007A7A7A00EEEEEE00DEDEDE00D4D4
      D400BEBEBE00B6B6B600E5E5E500CCCCCC00A8A8A800D9D9D900DEDEDE00DCDC
      DC00D9D9D900D6D6D6009F9F9F006666660071717100A8A8A800C8C8C800C6C6
      C600D0D0D000D7D7D700C3C3C300CECECE00D9D9D900D7D7D700747474009090
      9000D2D2D200A8A8A800666666007D7D7D00D1D1D100D2D2D200B2B2B200B6B6
      B600DADADA00DDDDDD00BABABA0088888800CECECE00CECECE0067676700AFAF
      AF00D7D7D700D8D8D800BCBCBC00B6B6B600A3A3A300D3D3D300DBDBDB00E9E9
      E900CCCCCC0090909000A8A8A800BBBBBB00A2A2A20091919100AEAEAE00D3D3
      D300E4E4E400DCDCDC00CFCFCF00D7D7D700D3D3D300C2C2C200BCBCBC009999
      9900C9C9C900DDDDDD00D9D9D900BEBEBE00D6D6D600D1D1D100ADADAD00B7B7
      B700BABABA00B9B9B900C6C6C600BFBFBF00C0C0C00092929200A5A5A500D1D1
      D100CACACA00A2A2A200ABABAB006A6A6A007E7E7E00D8D8D800A2A2A2007272
      7200A4A4A400B1B1B1007A7A7A00B2B2B200DDDDDD00CACACA00CBCBCB00D7D7
      D700CBCBCB00A7A7A7007D7D7D0085858500B8B8B8009E9E9E00BCBCBC00CACA
      CA00CDCDCD00C2C2C200A0A0A00078787800B6B6B600B7B7B70094949400A8A8
      A800CECECE00C5C5C500ADADAD008888880070707000A1A1A100C8C8C800ADAD
      AD009B9B9B00CFCFCF00B7B7B700AAAAAA00B2B2B200B1B1B100737373007878
      780062626200C3C3C3006E6E6E008D8D8D00C9C9C900A4A4A4009A9A9A007D7D
      7D00A7A7A700D2D2D200CFCFCF00BCBCBC00494949007F7F7F00A6A6A600C3C3
      C3009E9E9E004F4F4F00C7C7C700888888004848480068686800474747007A7A
      7A00EEEEEE00DEDEDE00D4D4D400BEBEBE00B6B6B600E5E5E500CCCCCC00A8A8
      A800D9D9D900DEDEDE00DCDCDC00D9D9D900D6D6D6009F9F9F00666666007171
      7100A8A8A800C8C8C800C6C6C600D0D0D000D7D7D700C3C3C300CECECE00D9D9
      D900D7D7D7007474740090909000D2D2D200A8A8A800666666007D7D7D00D1D1
      D100D2D2D200B2B2B200B6B6B600DADADA00DDDDDD00BABABA0088888800CECE
      CE00CECECE0067676700AFAFAF00D7D7D700D8D8D800BCBCBC00B6B6B600A3A3
      A300D3D3D300DBDBDB00E9E9E900CCCCCC0090909000A8A8A800BBBBBB00A2A2
      A20091919100AEAEAE00D3D3D300E4E4E400DCDCDC00CFCFCF00D7D7D700D3D3
      D300C2C2C200BCBCBC0099999900C9C9C900DDDDDD00D9D9D900BEBEBE00D6D6
      D600D1D1D100ADADAD00B7B7B700BABABA00B9B9B900C6C6C600BFBFBF00C0C0
      C00092929200A5A5A500D1D1D100CACACA00A2A2A200ABABAB006A6A6A007E7E
      7E00D8D8D800A2A2A20072727200A4A4A400B1B1B1007A7A7A00B2B2B200DDDD
      DD00CACACA00CBCBCB00D7D7D700CBCBCB00A7A7A7007D7D7D0085858500B8B8
      B8009E9E9E00BCBCBC00CACACA00CDCDCD00C2C2C200A0A0A00078787800B6B6
      B600B7B7B70094949400A8A8A800CECECE00C5C5C500ADADAD00888888007070
      7000A1A1A100C8C8C800ADADAD009B9B9B00CFCFCF00B7B7B700AAAAAA00B2B2
      B200B1B1B100737373007878780062626200C3C3C3006E6E6E008D8D8D00C9C9
      C900A4A4A4009A9A9A007D7D7D00A7A7A700D2D2D200CFCFCF00BCBCBC004949
      49007F7F7F00A6A6A600C3C3C3009E9E9E004F4F4F00C7C7C700888888004848
      480068686800474747007A7A7A00EEEEEE00DEDEDE00D4D4D400BEBEBE00B6B6
      B600E5E5E500CCCCCC00A8A8A800D9D9D900DEDEDE00DCDCDC00D9D9D900D6D6
      D6009F9F9F006666660071717100A8A8A800C8C8C800C6C6C600D0D0D000D7D7
      D700C3C3C300CECECE00D9D9D900D7D7D7007474740090909000D2D2D200A8A8
      A800666666007D7D7D00D1D1D100D2D2D200B2B2B200B6B6B600DADADA00DDDD
      DD00BABABA0088888800CECECE00CECECE0067676700AFAFAF00D7D7D700D8D8
      D800BCBCBC00B6B6B600A3A3A300D3D3D300DBDBDB00E9E9E900CCCCCC009090
      9000A8A8A800BBBBBB00A2A2A20091919100AEAEAE00D3D3D300E4E4E400DCDC
      DC00CFCFCF00D7D7D700D3D3D300C2C2C200BCBCBC0099999900C9C9C900DDDD
      DD00D9D9D900BEBEBE00D6D6D600D1D1D100ADADAD00B7B7B700BABABA00B9B9
      B900C6C6C600BFBFBF00C0C0C00092929200A5A5A500D1D1D100CACACA00A2A2
      A200ABABAB006A6A6A007E7E7E00D8D8D800A2A2A20072727200A4A4A400B1B1
      B1007A7A7A00B2B2B200DDDDDD00CACACA00CBCBCB00D7D7D700CBCBCB00A7A7
      A700AAAAAA00D4D4D400D3D3D3004040400086868600D5D5D500C4C4C400C7C7
      C700BCBCBC00D3D3D300BEBEBE006F6F6F00707070004A4A4A00ABABAB00D4D4
      D400D5D5D500D9D9D900AEAEAE009B9B9B00C9C9C900C7C7C70081818100A5A5
      A500D7D7D700D8D8D800E2E2E200E6E6E600BDBDBD006E6E6E006C6C6C00ABAB
      AB00CECECE00D2D2D200DDDDDD00DEDEDE00C5C5C500BABABA00D2D2D200E8E8
      E800B5B5B500C4C4C400E1E1E100C9C9C9007272720095959500DBDBDB00D4D4
      D400B7B7B700C4C4C400E0E0E000DEDEDE00A5A5A500A1A1A100E8E8E800DBDB
      DB006F6F6F00A4A4A400D4D4D400C9C9C900A5A5A500BFBFBF00BEBEBE00D6D6
      D600DBDBDB00E6E6E600C6C6C600A0A0A000AAAAAA00B4B4B400A2A2A2009999
      9900ABABAB00BEBEBE00DDDDDD00DBDBDB00D4D4D400DDDDDD00D9D9D900D2D2
      D200BDBDBD00ACACAC00D6D6D600DEDEDE00DBDBDB00BDBDBD00D3D3D300CACA
      CA00ACACAC00BEBEBE00B8B8B800ACACAC00B9B9B900A9A9A900D2D2D200A4A4
      A40099999900B1B1B100B0B0B000B0B0B000B4B4B4007070700096969600D5D5
      D500C5C5C5006767670068686800929292005C5C5C00D1D1D100D5D5D500CCCC
      CC00DADADA00CACACA00B6B6B600989898004848480076767600919191005151
      5100BBBBBB00E4E4E400C2C2C200CFCFCF00A3A3A3007A7A7A00ABABAB00BCBC
      BC009E9E9E00A6A6A600BEBEBE00BEBEBE00CCCCCC00B8B8B800848484008A8A
      8A00929292009494940097979700BDBDBD00BEBEBE00A3A3A300ADADAD00C2C2
      C200969696008D8D8D007C7C7C00CDCDCD009090900090909000BFBFBF00AFAF
      AF007B7B7B008787870086868600AAAAAA00D4D4D400D3D3D300404040008686
      8600D5D5D500C4C4C400C7C7C700BCBCBC00D3D3D300BEBEBE006F6F6F007070
      70004A4A4A00ABABAB00D4D4D400D5D5D500D9D9D900AEAEAE009B9B9B00C9C9
      C900C7C7C70081818100A5A5A500D7D7D700D8D8D800E2E2E200E6E6E600BDBD
      BD006E6E6E006C6C6C00ABABAB00CECECE00D2D2D200DDDDDD00DEDEDE00C5C5
      C500BABABA00D2D2D200E8E8E800B5B5B500C4C4C400E1E1E100C9C9C9007272
      720095959500DBDBDB00D4D4D400B7B7B700C4C4C400E0E0E000DEDEDE00A5A5
      A500A1A1A100E8E8E800DBDBDB006F6F6F00A4A4A400D4D4D400C9C9C900A5A5
      A500BFBFBF00BEBEBE00D6D6D600DBDBDB00E6E6E600C6C6C600A0A0A000AAAA
      AA00B4B4B400A2A2A20099999900ABABAB00BEBEBE00DDDDDD00DBDBDB00D4D4
      D400DDDDDD00D9D9D900D2D2D200BDBDBD00ACACAC00D6D6D600DEDEDE00DBDB
      DB00BDBDBD00D3D3D300CACACA00ACACAC00BEBEBE00B8B8B800ACACAC00B9B9
      B900A9A9A900D2D2D200A4A4A40099999900B1B1B100B0B0B000B0B0B000B4B4
      B4007070700096969600D5D5D500C5C5C5006767670068686800929292005C5C
      5C00D1D1D100D5D5D500CCCCCC00DADADA00CACACA00B6B6B600989898004848
      4800767676009191910051515100BBBBBB00E4E4E400C2C2C200CFCFCF00A3A3
      A3007A7A7A00ABABAB00BCBCBC009E9E9E00A6A6A600BEBEBE00BEBEBE00CCCC
      CC00B8B8B800848484008A8A8A00929292009494940097979700BDBDBD00BEBE
      BE00A3A3A300ADADAD00C2C2C200969696008D8D8D007C7C7C00CDCDCD009090
      900090909000BFBFBF00AFAFAF007B7B7B008787870086868600AAAAAA00D4D4
      D400D3D3D3004040400086868600D5D5D500C4C4C400C7C7C700BCBCBC00D3D3
      D300BEBEBE006F6F6F00707070004A4A4A00ABABAB00D4D4D400D5D5D500D9D9
      D900AEAEAE009B9B9B00C9C9C900C7C7C70081818100A5A5A500D7D7D700D8D8
      D800E2E2E200E6E6E600BDBDBD006E6E6E006C6C6C00ABABAB00CECECE00D2D2
      D200DDDDDD00DEDEDE00C5C5C500BABABA00D2D2D200E8E8E800B5B5B500C4C4
      C400E1E1E100C9C9C9007272720095959500DBDBDB00D4D4D400B7B7B700C4C4
      C400E0E0E000DEDEDE00A5A5A500A1A1A100E8E8E800DBDBDB006F6F6F00A4A4
      A400D4D4D400C9C9C900A5A5A500BFBFBF00BEBEBE00D6D6D600DBDBDB00E6E6
      E600C6C6C600A0A0A000AAAAAA00B4B4B400A2A2A20099999900ABABAB00BEBE
      BE00DDDDDD00DBDBDB00D4D4D400DDDDDD00D9D9D900D2D2D200BDBDBD00ACAC
      AC00D6D6D600DEDEDE00DBDBDB00BDBDBD00D3D3D300CACACA00ACACAC00BEBE
      BE00B8B8B800ACACAC00B9B9B900A9A9A900D2D2D200A4A4A40099999900B1B1
      B100B0B0B000B0B0B000B4B4B4007070700096969600D5D5D500C5C5C5006767
      670068686800929292005C5C5C00D1D1D100D5D5D500CCCCCC00DADADA00CACA
      CA00B6B6B60098989800BEBEBE00C4C4C400B7B7B7006B6B6B0076767600DEDE
      DE00D7D7D700CBCBCB00C9C9C900CCCCCC00D1D1D100B8B8B800474747008C8C
      8C008D8D8D0085858500EFEFEF00DCDCDC00B3B3B300B3B3B300D2D2D200CECE
      CE008B8B8B009A9A9A00DBDBDB00DBDBDB00D4D4D400ADADAD00B9B9B9008E8E
      8E007F7F7F00CDCDCD00E3E3E300DDDDDD00DEDEDE00DEDEDE00CECECE00CECE
      CE00D3D3D300E5E5E500E5E5E500DBDBDB00C3C3C300C6C6C60063636300A5A5
      A500DADADA00CBCBCB00B4B4B400C7C7C700D4D4D400CBCBCB0085858500A9A9
      A900E1E1E100D5D5D50088888800ACACAC00D7D7D700C4C4C400A7A7A700CECE
      CE00DCDCDC00DADADA00CCCCCC00D4D4D400D2D2D200D4D4D400CACACA00B5B5
      B500BDBDBD00BBBBBB00AFAFAF00A2A2A200D1D1D100DBDBDB00D7D7D700D0D0
      D000D8D8D800D5D5D5009797970098989800D1D1D100D8D8D800CDCDCD00C7C7
      C700D7D7D700C8C8C800A9A9A900B6B6B6009E9E9E008484840094949400B1B1
      B100CACACA00BBBBBB00999999006F6F6F006A6A6A00A8A8A800AFAFAF007272
      720083838300BBBBBB00C5C5C500B3B3B3007A7A7A008D8D8D007A7A7A00C9C9
      C900BFBFBF00C8C8C800DBDBDB00A9A9A90091919100BDBDBD00B8B8B8009292
      9200919191005F5F5F00BCBCBC00D1D1D100BBBBBB00C8C8C800BABABA007979
      7900A8A8A800C9C9C900A9A9A900ADADAD00CBCBCB00BBBBBB00BFBFBF009595
      9500464646005E5E5E00646464006464640091919100BFBFBF00D4D4D4009C9C
      9C00A3A3A300CACACA00AEAEAE008D8D8D0082828200C2C2C200ADADAD00A3A3
      A300C1C1C100D2D2D20082828200B3B3B30098989800BEBEBE00C4C4C400B7B7
      B7006B6B6B0076767600DEDEDE00D7D7D700CBCBCB00C9C9C900CCCCCC00D1D1
      D100B8B8B800474747008C8C8C008D8D8D0085858500EFEFEF00DCDCDC00B3B3
      B300B3B3B300D2D2D200CECECE008B8B8B009A9A9A00DBDBDB00DBDBDB00D4D4
      D400ADADAD00B9B9B9008E8E8E007F7F7F00CDCDCD00E3E3E300DDDDDD00DEDE
      DE00DEDEDE00CECECE00CECECE00D3D3D300E5E5E500E5E5E500DBDBDB00C3C3
      C300C6C6C60063636300A5A5A500DADADA00CBCBCB00B4B4B400C7C7C700D4D4
      D400CBCBCB0085858500A9A9A900E1E1E100D5D5D50088888800ACACAC00D7D7
      D700C4C4C400A7A7A700CECECE00DCDCDC00DADADA00CCCCCC00D4D4D400D2D2
      D200D4D4D400CACACA00B5B5B500BDBDBD00BBBBBB00AFAFAF00A2A2A200D1D1
      D100DBDBDB00D7D7D700D0D0D000D8D8D800D5D5D5009797970098989800D1D1
      D100D8D8D800CDCDCD00C7C7C700D7D7D700C8C8C800A9A9A900B6B6B6009E9E
      9E008484840094949400B1B1B100CACACA00BBBBBB00999999006F6F6F006A6A
      6A00A8A8A800AFAFAF007272720083838300BBBBBB00C5C5C500B3B3B3007A7A
      7A008D8D8D007A7A7A00C9C9C900BFBFBF00C8C8C800DBDBDB00A9A9A9009191
      9100BDBDBD00B8B8B80092929200919191005F5F5F00BCBCBC00D1D1D100BBBB
      BB00C8C8C800BABABA0079797900A8A8A800C9C9C900A9A9A900ADADAD00CBCB
      CB00BBBBBB00BFBFBF0095959500464646005E5E5E0064646400646464009191
      9100BFBFBF00D4D4D4009C9C9C00A3A3A300CACACA00AEAEAE008D8D8D008282
      8200C2C2C200ADADAD00A3A3A300C1C1C100D2D2D20082828200B3B3B3009898
      9800BEBEBE00C4C4C400B7B7B7006B6B6B0076767600DEDEDE00D7D7D700CBCB
      CB00C9C9C900CCCCCC00D1D1D100B8B8B800474747008C8C8C008D8D8D008585
      8500EFEFEF00DCDCDC00B3B3B300B3B3B300D2D2D200CECECE008B8B8B009A9A
      9A00DBDBDB00DBDBDB00D4D4D400ADADAD00B9B9B9008E8E8E007F7F7F00CDCD
      CD00E3E3E300DDDDDD00DEDEDE00DEDEDE00CECECE00CECECE00D3D3D300E5E5
      E500E5E5E500DBDBDB00C3C3C300C6C6C60063636300A5A5A500DADADA00CBCB
      CB00B4B4B400C7C7C700D4D4D400CBCBCB0085858500A9A9A900E1E1E100D5D5
      D50088888800ACACAC00D7D7D700C4C4C400A7A7A700CECECE00DCDCDC00DADA
      DA00CCCCCC00D4D4D400D2D2D200D4D4D400CACACA00B5B5B500BDBDBD00BBBB
      BB00AFAFAF00A2A2A200D1D1D100DBDBDB00D7D7D700D0D0D000D8D8D800D5D5
      D5009797970098989800D1D1D100D8D8D800CDCDCD00C7C7C700D7D7D700C8C8
      C800A9A9A900B6B6B6009E9E9E008484840094949400B1B1B100CACACA00BBBB
      BB00999999006F6F6F006A6A6A00A8A8A800AFAFAF007272720083838300BBBB
      BB00C5C5C500B3B3B3007A7A7A008D8D8D007A7A7A00C9C9C900BFBFBF00C8C8
      C800DBDBDB00A9A9A90091919100BDBDBD00CBCBCB00C9C9C900B0B0B0006565
      650084848400CCCCCC00CFCFCF00B5B5B500AFAFAF00E9E9E9009A9A9A004E4E
      4E0045454500C4C4C400C9C9C900CFCFCF00C5C5C500B3B3B300C5C5C500C9C9
      C900CFCFCF00CDCDCD00B3B3B300ABABAB00CDCDCD00D4D4D400D0D0D0008383
      8300BABABA00C1C1C10092929200D3D3D300DCDCDC00DFDFDF00E8E8E800E8E8
      E800DADADA00BDBDBD00BEBEBE00CBCBCB00D9D9D900D3D3D300B7B7B700BEBE
      BE004848480087878700C5C5C500C0C0C000ADADAD00C1C1C100CCCCCC00C1C1
      C10070707000B0B0B000DDDDDD00D9D9D900A4A4A400AEAEAE00C6C6C600B8B8
      B800B8B8B800D4D4D400CCCCCC00C8C8C800BDBDBD00CACACA00D1D1D100CACA
      CA00AFAFAF008E8E8E00ABABAB00C6C6C600C4C4C400A8A8A800CBCBCB00D5D5
      D500D9D9D900D6D6D600DCDCDC00CECECE006D6D6D0083838300D7D7D700DFDF
      DF00C7C7C700C3C3C300D4D4D400C8C8C800B2B2B200C7C7C700B2B2B2009F9F
      9F00BABABA00B9B9B900C1C1C100BEBEBE00989898005C5C5C00474747009999
      9900BBBBBB00A4A4A4007C7C7C00C3C3C300BEBEBE00CFCFCF00AFAFAF006F6F
      6F005F5F5F00B9B9B900B7B7B700BBBBBB00D5D5D500BEBEBE00A7A7A700D1D1
      D100E3E3E3009D9D9D00A4A4A400ADADAD00C9C9C900BABABA00CCCCCC00BBBB
      BB00C0C0C0009393930098989800AFAFAF009595950096969600AEAEAE00A7A7
      A700C5C5C500BBBBBB00A8A8A8009C9C9C00989898008E8E8E0084848400A6A6
      A600CCCCCC009D9D9D00B5B5B500D2D2D200939393006F6F6F0098989800BABA
      BA0080808000A5A5A500CACACA00CDCDCD00A8A8A800D6D6D600C5C5C500CBCB
      CB00C9C9C900B0B0B0006565650084848400CCCCCC00CFCFCF00B5B5B500AFAF
      AF00E9E9E9009A9A9A004E4E4E0045454500C4C4C400C9C9C900CFCFCF00C5C5
      C500B3B3B300C5C5C500C9C9C900CFCFCF00CDCDCD00B3B3B300ABABAB00CDCD
      CD00D4D4D400D0D0D00083838300BABABA00C1C1C10092929200D3D3D300DCDC
      DC00DFDFDF00E8E8E800E8E8E800DADADA00BDBDBD00BEBEBE00CBCBCB00D9D9
      D900D3D3D300B7B7B700BEBEBE004848480087878700C5C5C500C0C0C000ADAD
      AD00C1C1C100CCCCCC00C1C1C10070707000B0B0B000DDDDDD00D9D9D900A4A4
      A400AEAEAE00C6C6C600B8B8B800B8B8B800D4D4D400CCCCCC00C8C8C800BDBD
      BD00CACACA00D1D1D100CACACA00AFAFAF008E8E8E00ABABAB00C6C6C600C4C4
      C400A8A8A800CBCBCB00D5D5D500D9D9D900D6D6D600DCDCDC00CECECE006D6D
      6D0083838300D7D7D700DFDFDF00C7C7C700C3C3C300D4D4D400C8C8C800B2B2
      B200C7C7C700B2B2B2009F9F9F00BABABA00B9B9B900C1C1C100BEBEBE009898
      98005C5C5C004747470099999900BBBBBB00A4A4A4007C7C7C00C3C3C300BEBE
      BE00CFCFCF00AFAFAF006F6F6F005F5F5F00B9B9B900B7B7B700BBBBBB00D5D5
      D500BEBEBE00A7A7A700D1D1D100E3E3E3009D9D9D00A4A4A400ADADAD00C9C9
      C900BABABA00CCCCCC00BBBBBB00C0C0C0009393930098989800AFAFAF009595
      950096969600AEAEAE00A7A7A700C5C5C500BBBBBB00A8A8A8009C9C9C009898
      98008E8E8E0084848400A6A6A600CCCCCC009D9D9D00B5B5B500D2D2D2009393
      93006F6F6F0098989800BABABA0080808000A5A5A500CACACA00CDCDCD00A8A8
      A800D6D6D600C5C5C500CBCBCB00C9C9C900B0B0B0006565650084848400CCCC
      CC00CFCFCF00B5B5B500AFAFAF00E9E9E9009A9A9A004E4E4E0045454500C4C4
      C400C9C9C900CFCFCF00C5C5C500B3B3B300C5C5C500C9C9C900CFCFCF00CDCD
      CD00B3B3B300ABABAB00CDCDCD00D4D4D400D0D0D00083838300BABABA00C1C1
      C10092929200D3D3D300DCDCDC00DFDFDF00E8E8E800E8E8E800DADADA00BDBD
      BD00BEBEBE00CBCBCB00D9D9D900D3D3D300B7B7B700BEBEBE00484848008787
      8700C5C5C500C0C0C000ADADAD00C1C1C100CCCCCC00C1C1C10070707000B0B0
      B000DDDDDD00D9D9D900A4A4A400AEAEAE00C6C6C600B8B8B800B8B8B800D4D4
      D400CCCCCC00C8C8C800BDBDBD00CACACA00D1D1D100CACACA00AFAFAF008E8E
      8E00ABABAB00C6C6C600C4C4C400A8A8A800CBCBCB00D5D5D500D9D9D900D6D6
      D600DCDCDC00CECECE006D6D6D0083838300D7D7D700DFDFDF00C7C7C700C3C3
      C300D4D4D400C8C8C800B2B2B200C7C7C700B2B2B2009F9F9F00BABABA00B9B9
      B900C1C1C100BEBEBE00989898005C5C5C004747470099999900BBBBBB00A4A4
      A4007C7C7C00C3C3C300BEBEBE00CFCFCF00AFAFAF006F6F6F005F5F5F00B9B9
      B900B7B7B700BBBBBB00D5D5D500BEBEBE00A7A7A700D1D1D100BABABA00CFCF
      CF00CACACA004343430092929200D1D1D100B7B7B700BFBFBF00BDBDBD00D9D9
      D900C1C1C1003F3F3F0079797900E4E4E400E6E6E600D6D6D600BFBFBF009999
      990096969600CBCBCB00AFAFAF00A7A7A700BCBCBC00ACACAC00C0C0C000D5D5
      D500CACACA00C1C1C100D8D8D800E1E1E100C0C0C000D6D6D600E6E6E600DBDB
      DB00DDDDDD00DFDFDF00E3E3E300C4C4C400CCCCCC00D4D4D400E0E0E000CDCD
      CD00D3D3D300DEDEDE00616161006363630095959500A1A1A10064646400AAAA
      AA00D2D2D200ACACAC0065656500C0C0C000E0E0E000D4D4D4009D9D9D007A7A
      7A00C5C5C500B2B2B200B8B8B800B6B6B600BCBCBC009D9D9D00ABABAB00C2C2
      C200CACACA00C6C6C600C4C4C400B2B2B200898989009191910099999900A0A0
      A000C2C2C200D1D1D100D2D2D200CBCBCB00CECECE00D2D2D200A2A2A200A0A0
      A000CCCCCC00DDDDDD00CCCCCC00D0D0D000C7C7C700CCCCCC00A4A4A400B0B0
      B000B2B2B200B0B0B000C5C5C500AFAFAF00B0B0B000BCBCBC00C1C1C1009595
      950063636300AAAAAA00ACACAC009C9C9C006C6C6C00B3B3B300C4C4C400CBCB
      CB00C4C4C400777777006F6F6F00BFBFBF00AAAAAA00C1C1C100CFCFCF00CDCD
      CD00D2D2D200C3C3C300BBBBBB00D0D0D0007F7F7F0066666600C5C5C500D0D0
      D000BCBCBC00BCBCBC00B9B9B90095959500AEAEAE00A5A5A5007E7E7E009494
      940063636300A4A4A400B8B8B800C9C9C90093939300808080006A6A6A006C6C
      6C008787870094949400C2C2C200A4A4A400AEAEAE00B9B9B900757575006363
      6300AEAEAE009F9F9F008585850097979700C3C3C300B1B1B100B4B4B400C5C5
      C500BBBBBB00BABABA00CFCFCF00CACACA004343430092929200D1D1D100B7B7
      B700BFBFBF00BDBDBD00D9D9D900C1C1C1003F3F3F0079797900E4E4E400E6E6
      E600D6D6D600BFBFBF009999990096969600CBCBCB00AFAFAF00A7A7A700BCBC
      BC00ACACAC00C0C0C000D5D5D500CACACA00C1C1C100D8D8D800E1E1E100C0C0
      C000D6D6D600E6E6E600DBDBDB00DDDDDD00DFDFDF00E3E3E300C4C4C400CCCC
      CC00D4D4D400E0E0E000CDCDCD00D3D3D300DEDEDE0061616100636363009595
      9500A1A1A10064646400AAAAAA00D2D2D200ACACAC0065656500C0C0C000E0E0
      E000D4D4D4009D9D9D007A7A7A00C5C5C500B2B2B200B8B8B800B6B6B600BCBC
      BC009D9D9D00ABABAB00C2C2C200CACACA00C6C6C600C4C4C400B2B2B2008989
      89009191910099999900A0A0A000C2C2C200D1D1D100D2D2D200CBCBCB00CECE
      CE00D2D2D200A2A2A200A0A0A000CCCCCC00DDDDDD00CCCCCC00D0D0D000C7C7
      C700CCCCCC00A4A4A400B0B0B000B2B2B200B0B0B000C5C5C500AFAFAF00B0B0
      B000BCBCBC00C1C1C1009595950063636300AAAAAA00ACACAC009C9C9C006C6C
      6C00B3B3B300C4C4C400CBCBCB00C4C4C400777777006F6F6F00BFBFBF00AAAA
      AA00C1C1C100CFCFCF00CDCDCD00D2D2D200C3C3C300BBBBBB00D0D0D0007F7F
      7F0066666600C5C5C500D0D0D000BCBCBC00BCBCBC00B9B9B90095959500AEAE
      AE00A5A5A5007E7E7E009494940063636300A4A4A400B8B8B800C9C9C9009393
      9300808080006A6A6A006C6C6C008787870094949400C2C2C200A4A4A400AEAE
      AE00B9B9B9007575750063636300AEAEAE009F9F9F008585850097979700C3C3
      C300B1B1B100B4B4B400C5C5C500BBBBBB00BABABA00CFCFCF00CACACA004343
      430092929200D1D1D100B7B7B700BFBFBF00BDBDBD00D9D9D900C1C1C1003F3F
      3F0079797900E4E4E400E6E6E600D6D6D600BFBFBF009999990096969600CBCB
      CB00AFAFAF00A7A7A700BCBCBC00ACACAC00C0C0C000D5D5D500CACACA00C1C1
      C100D8D8D800E1E1E100C0C0C000D6D6D600E6E6E600DBDBDB00DDDDDD00DFDF
      DF00E3E3E300C4C4C400CCCCCC00D4D4D400E0E0E000CDCDCD00D3D3D300DEDE
      DE00616161006363630095959500A1A1A10064646400AAAAAA00D2D2D200ACAC
      AC0065656500C0C0C000E0E0E000D4D4D4009D9D9D007A7A7A00C5C5C500B2B2
      B200B8B8B800B6B6B600BCBCBC009D9D9D00ABABAB00C2C2C200CACACA00C6C6
      C600C4C4C400B2B2B200898989009191910099999900A0A0A000C2C2C200D1D1
      D100D2D2D200CBCBCB00CECECE00D2D2D200A2A2A200A0A0A000CCCCCC00DDDD
      DD00CCCCCC00D0D0D000C7C7C700CCCCCC00A4A4A400B0B0B000B2B2B200B0B0
      B000C5C5C500AFAFAF00B0B0B000BCBCBC00C1C1C1009595950063636300AAAA
      AA00ACACAC009C9C9C006C6C6C00B3B3B300C4C4C400CBCBCB00C4C4C4007777
      77006F6F6F00BFBFBF00AAAAAA00C1C1C100CFCFCF00CDCDCD00D2D2D200C3C3
      C3008B8B8B0097979700A7A7A700474747007E7E7E00D0D0D000C5C5C500C8C8
      C800A9A9A900CDCDCD00B9B9B900505050008F8F8F0086868600C5C5C500DBDB
      DB00CACACA00B4B4B400B6B6B600CDCDCD0098989800A0A0A000D8D8D800AEAE
      AE00C5C5C500DBDBDB00D0D0D000E5E5E500D6D6D600E4E4E400BEBEBE00D3D3
      D300DFDFDF00DADADA00D9D9D900CDCDCD00DADADA00C3C3C300CACACA00C3C3
      C3009F9F9F009F9F9F00CCCCCC00D5D5D5007E7E7E009F9F9F00C9C9C9009494
      940065656500C0C0C000D5D5D500A9A9A90068686800BFBFBF00E4E4E400D5D5
      D5009D9D9D0075757500C8C8C800B8B8B8008B8B8B008A8A8A00B5B5B500B8B8
      B800BABABA00BCBCBC00CFCFCF00D3D3D300BEBEBE00BCBCBC00ADADAD009494
      94006565650063636300ADADAD00D5D5D500BEBEBE00ABABAB00C3C3C300DDDD
      DD00C7C7C700BABABA00A2A2A200A1A1A100C7C7C700E0E0E000C2C2C200AEAE
      AE00A4A4A400B5B5B500A9A9A900B5B5B500ADADAD00AFAFAF0096969600B4B4
      B400BCBCBC00C5C5C50083838300A5A5A500B0B0B0008282820056565600B4B4
      B400BDBDBD00C2C2C200C9C9C900AEAEAE0067676700A5A5A500CACACA00C4C4
      C400CBCBCB00CACACA00D4D4D40093939300A3A3A300DEDEDE00707070004E4E
      4E00AEAEAE00D5D5D500D7D7D700C4C4C400B8B8B80079797900A3A3A300C8C8
      C80087878700A2A2A20088888800B7B7B700BCBCBC00BCBCBC00949494006363
      6300939393007F7F7F00C5C5C5009C9C9C00B9B9B900B1B1B100C6C6C600B2B2
      B20066666600595959009B9B9B00A7A7A700B1B1B1008C8C8C00B3B3B3008888
      8800A5A5A500CDCDCD00A8A8A8008B8B8B0097979700A7A7A700474747007E7E
      7E00D0D0D000C5C5C500C8C8C800A9A9A900CDCDCD00B9B9B900505050008F8F
      8F0086868600C5C5C500DBDBDB00CACACA00B4B4B400B6B6B600CDCDCD009898
      9800A0A0A000D8D8D800AEAEAE00C5C5C500DBDBDB00D0D0D000E5E5E500D6D6
      D600E4E4E400BEBEBE00D3D3D300DFDFDF00DADADA00D9D9D900CDCDCD00DADA
      DA00C3C3C300CACACA00C3C3C3009F9F9F009F9F9F00CCCCCC00D5D5D5007E7E
      7E009F9F9F00C9C9C9009494940065656500C0C0C000D5D5D500A9A9A9006868
      6800BFBFBF00E4E4E400D5D5D5009D9D9D0075757500C8C8C800B8B8B8008B8B
      8B008A8A8A00B5B5B500B8B8B800BABABA00BCBCBC00CFCFCF00D3D3D300BEBE
      BE00BCBCBC00ADADAD00949494006565650063636300ADADAD00D5D5D500BEBE
      BE00ABABAB00C3C3C300DDDDDD00C7C7C700BABABA00A2A2A200A1A1A100C7C7
      C700E0E0E000C2C2C200AEAEAE00A4A4A400B5B5B500A9A9A900B5B5B500ADAD
      AD00AFAFAF0096969600B4B4B400BCBCBC00C5C5C50083838300A5A5A500B0B0
      B0008282820056565600B4B4B400BDBDBD00C2C2C200C9C9C900AEAEAE006767
      6700A5A5A500CACACA00C4C4C400CBCBCB00CACACA00D4D4D40093939300A3A3
      A300DEDEDE00707070004E4E4E00AEAEAE00D5D5D500D7D7D700C4C4C400B8B8
      B80079797900A3A3A300C8C8C80087878700A2A2A20088888800B7B7B700BCBC
      BC00BCBCBC009494940063636300939393007F7F7F00C5C5C5009C9C9C00B9B9
      B900B1B1B100C6C6C600B2B2B20066666600595959009B9B9B00A7A7A700B1B1
      B1008C8C8C00B3B3B30088888800A5A5A500CDCDCD00A8A8A8008B8B8B009797
      9700A7A7A700474747007E7E7E00D0D0D000C5C5C500C8C8C800A9A9A900CDCD
      CD00B9B9B900505050008F8F8F0086868600C5C5C500DBDBDB00CACACA00B4B4
      B400B6B6B600CDCDCD0098989800A0A0A000D8D8D800AEAEAE00C5C5C500DBDB
      DB00D0D0D000E5E5E500D6D6D600E4E4E400BEBEBE00D3D3D300DFDFDF00DADA
      DA00D9D9D900CDCDCD00DADADA00C3C3C300CACACA00C3C3C3009F9F9F009F9F
      9F00CCCCCC00D5D5D5007E7E7E009F9F9F00C9C9C9009494940065656500C0C0
      C000D5D5D500A9A9A90068686800BFBFBF00E4E4E400D5D5D5009D9D9D007575
      7500C8C8C800B8B8B8008B8B8B008A8A8A00B5B5B500B8B8B800BABABA00BCBC
      BC00CFCFCF00D3D3D300BEBEBE00BCBCBC00ADADAD0094949400656565006363
      6300ADADAD00D5D5D500BEBEBE00ABABAB00C3C3C300DDDDDD00C7C7C700BABA
      BA00A2A2A200A1A1A100C7C7C700E0E0E000C2C2C200AEAEAE00A4A4A400B5B5
      B500A9A9A900B5B5B500ADADAD00AFAFAF0096969600B4B4B400BCBCBC00C5C5
      C50083838300A5A5A500B0B0B0008282820056565600B4B4B400BDBDBD00C2C2
      C200C9C9C900AEAEAE0067676700A5A5A500CACACA00C4C4C400CBCBCB00CACA
      CA00D4D4D40093939300767676008E8E8E00BEBEBE005252520082828200E1E1
      E100CBCBCB006E6E6E005050500064646400515151007F7F7F007E7E7E007979
      7900D1D1D100DBDBDB00C8C8C800C9C9C900B1B1B100A3A3A3008F8F8F008282
      8200C3C3C300C2C2C200C3C3C300CECECE00D4D4D400CFCFCF00B3B3B300DADA
      DA008B8B8B00B7B7B700CFCFCF00BABABA00D3D3D300D6D6D600D3D3D300BDBD
      BD00C5C5C500A4A4A4004B4B4B006D6D6D00D2D2D200C9C9C90074747400AFAF
      AF00D2D2D200BCBCBC00AFAFAF00DCDCDC00D7D7D700A4A4A40066666600C0C0
      C000D3D3D300E1E1E100BABABA0080808000C5C5C500C7C7C700ADADAD009A9A
      9A00C2C2C200CBCBCB00C6C6C600B6B6B600CCCCCC00D7D7D700BEBEBE00A4A4
      A400C2C2C200CECECE00A1A1A1007B7B7B009F9F9F00C5C5C500BBBBBB00B2B2
      B200C6C6C600D9D9D900CDCDCD00CDCDCD00B1B1B100A3A3A300C2C2C200D0D0
      D000BDBDBD00B1B1B100A8A8A800ADADAD0093939300A5A5A500ADADAD00C4C4
      C400CBCBCB00BDBDBD00CFCFCF00C6C6C600B3B3B3009F9F9F00838383003E3E
      3E0067676700B6B6B600B0B0B000B3B3B300B6B6B600A3A3A300757575007C7C
      7C00BBBBBB00ADADAD00A9A9A900BFBFBF00CFCFCF007E7E7E0093939300C4C4
      C4006E6E6E005C5C5C00AAAAAA00BFBFBF00CACACA00C5C5C500C1C1C1007575
      75009F9F9F00DDDDDD009C9C9C0095959500B5B5B500CACACA00C8C8C800D4D4
      D400BBBBBB00ABABAB00CCCCCC0083838300B7B7B700A7A7A700B0B0B000A1A1
      A100C0C0C000C1C1C1008B8B8B00494949006464640097979700ADADAD008282
      8200B3B3B300BABABA00C6C6C600CACACA00A8A8A800767676008E8E8E00BEBE
      BE005252520082828200E1E1E100CBCBCB006E6E6E0050505000646464005151
      51007F7F7F007E7E7E0079797900D1D1D100DBDBDB00C8C8C800C9C9C900B1B1
      B100A3A3A3008F8F8F0082828200C3C3C300C2C2C200C3C3C300CECECE00D4D4
      D400CFCFCF00B3B3B300DADADA008B8B8B00B7B7B700CFCFCF00BABABA00D3D3
      D300D6D6D600D3D3D300BDBDBD00C5C5C500A4A4A4004B4B4B006D6D6D00D2D2
      D200C9C9C90074747400AFAFAF00D2D2D200BCBCBC00AFAFAF00DCDCDC00D7D7
      D700A4A4A40066666600C0C0C000D3D3D300E1E1E100BABABA0080808000C5C5
      C500C7C7C700ADADAD009A9A9A00C2C2C200CBCBCB00C6C6C600B6B6B600CCCC
      CC00D7D7D700BEBEBE00A4A4A400C2C2C200CECECE00A1A1A1007B7B7B009F9F
      9F00C5C5C500BBBBBB00B2B2B200C6C6C600D9D9D900CDCDCD00CDCDCD00B1B1
      B100A3A3A300C2C2C200D0D0D000BDBDBD00B1B1B100A8A8A800ADADAD009393
      9300A5A5A500ADADAD00C4C4C400CBCBCB00BDBDBD00CFCFCF00C6C6C600B3B3
      B3009F9F9F00838383003E3E3E0067676700B6B6B600B0B0B000B3B3B300B6B6
      B600A3A3A300757575007C7C7C00BBBBBB00ADADAD00A9A9A900BFBFBF00CFCF
      CF007E7E7E0093939300C4C4C4006E6E6E005C5C5C00AAAAAA00BFBFBF00CACA
      CA00C5C5C500C1C1C100757575009F9F9F00DDDDDD009C9C9C0095959500B5B5
      B500CACACA00C8C8C800D4D4D400BBBBBB00ABABAB00CCCCCC0083838300B7B7
      B700A7A7A700B0B0B000A1A1A100C0C0C000C1C1C1008B8B8B00494949006464
      640097979700ADADAD0082828200B3B3B300BABABA00C6C6C600CACACA00A8A8
      A800767676008E8E8E00BEBEBE005252520082828200E1E1E100CBCBCB006E6E
      6E005050500064646400515151007F7F7F007E7E7E0079797900D1D1D100DBDB
      DB00C8C8C800C9C9C900B1B1B100A3A3A3008F8F8F0082828200C3C3C300C2C2
      C200C3C3C300CECECE00D4D4D400CFCFCF00B3B3B300DADADA008B8B8B00B7B7
      B700CFCFCF00BABABA00D3D3D300D6D6D600D3D3D300BDBDBD00C5C5C500A4A4
      A4004B4B4B006D6D6D00D2D2D200C9C9C90074747400AFAFAF00D2D2D200BCBC
      BC00AFAFAF00DCDCDC00D7D7D700A4A4A40066666600C0C0C000D3D3D300E1E1
      E100BABABA0080808000C5C5C500C7C7C700ADADAD009A9A9A00C2C2C200CBCB
      CB00C6C6C600B6B6B600CCCCCC00D7D7D700BEBEBE00A4A4A400C2C2C200CECE
      CE00A1A1A1007B7B7B009F9F9F00C5C5C500BBBBBB00B2B2B200C6C6C600D9D9
      D900CDCDCD00CDCDCD00B1B1B100A3A3A300C2C2C200D0D0D000BDBDBD00B1B1
      B100A8A8A800ADADAD0093939300A5A5A500ADADAD00C4C4C400CBCBCB00BDBD
      BD00CFCFCF00C6C6C600B3B3B3009F9F9F00838383003E3E3E0067676700B6B6
      B600B0B0B000B3B3B300B6B6B600A3A3A300757575007C7C7C00BBBBBB00ADAD
      AD00A9A9A900BFBFBF00CFCFCF007E7E7E0079797900B3B3B300DADADA006666
      660082828200E6E6E600CBCBCB00888888007A7A7A006A6A6A0045454500B8B8
      B800BFBFBF00BFBFBF00DFDFDF00CFCFCF00C9C9C900BDBDBD00858585008080
      8000A7A7A700AEAEAE00D2D2D200ABABAB00B9B9B900DADADA00D7D7D700D6D6
      D600B4B4B400A9A9A900525252009E9E9E00CACACA00B1B1B100D2D2D200D3D3
      D300BFBFBF00CBCBCB00C4C4C400BBBBBB0099999900ABABAB00BBBBBB008C8C
      8C004C4C4C0067676700A6A6A600BDBDBD00AFAFAF00D2D2D200E6E6E6009B9B
      9B005D5D5D00BABABA00C4C4C400D1D1D100818181003C3C3C0098989800C0C0
      C000CACACA00BABABA00B4B4B400A9A9A900AFAFAF00A9A9A900BABABA00C6C6
      C600BCBCBC00C9C9C900C9C9C900CBCBCB009B9B9B006B6B6B0083838300ADAD
      AD00C1C1C100B8B8B800C8C8C800D3D3D300B8B8B800C2C2C200DEDEDE00E1E1
      E100CBCBCB00C9C9C900C2C2C200C0C0C000A0A0A000B1B1B100A5A5A500A3A3
      A300C0C0C000A9A9A900ADADAD007C7C7C005F5F5F00B9B9B900D5D5D5009494
      9400525252004D4D4D009D9D9D00B6B6B600B5B5B500B3B3B300B9B9B9009393
      9300ABABAB007F7F7F0093939300B1B1B100B7B7B700D4D4D400D4D4D4008A8A
      8A0064646400ACACAC00A7A7A7007E7E7E00A5A5A500B9B9B900C0C0C000C5C5
      C500C4C4C400898989009A9A9A00C3C3C300AFAFAF0085858500D5D5D500CDCD
      CD00CECECE00A0A0A0009D9D9D00BFBFBF008F8F8F008A8A8A00ACACAC00C6C6
      C600888888009C9C9C00B4B4B400BDBDBD00A8A8A800636363006C6C6C00A7A7
      A700B0B0B0007A7A7A00B9B9B900C0C0C000C2C2C200999999007A7A7A007979
      7900B3B3B300DADADA006666660082828200E6E6E600CBCBCB00888888007A7A
      7A006A6A6A0045454500B8B8B800BFBFBF00BFBFBF00DFDFDF00CFCFCF00C9C9
      C900BDBDBD008585850080808000A7A7A700AEAEAE00D2D2D200ABABAB00B9B9
      B900DADADA00D7D7D700D6D6D600B4B4B400A9A9A900525252009E9E9E00CACA
      CA00B1B1B100D2D2D200D3D3D300BFBFBF00CBCBCB00C4C4C400BBBBBB009999
      9900ABABAB00BBBBBB008C8C8C004C4C4C0067676700A6A6A600BDBDBD00AFAF
      AF00D2D2D200E6E6E6009B9B9B005D5D5D00BABABA00C4C4C400D1D1D1008181
      81003C3C3C0098989800C0C0C000CACACA00BABABA00B4B4B400A9A9A900AFAF
      AF00A9A9A900BABABA00C6C6C600BCBCBC00C9C9C900C9C9C900CBCBCB009B9B
      9B006B6B6B0083838300ADADAD00C1C1C100B8B8B800C8C8C800D3D3D300B8B8
      B800C2C2C200DEDEDE00E1E1E100CBCBCB00C9C9C900C2C2C200C0C0C000A0A0
      A000B1B1B100A5A5A500A3A3A300C0C0C000A9A9A900ADADAD007C7C7C005F5F
      5F00B9B9B900D5D5D50094949400525252004D4D4D009D9D9D00B6B6B600B5B5
      B500B3B3B300B9B9B90093939300ABABAB007F7F7F0093939300B1B1B100B7B7
      B700D4D4D400D4D4D4008A8A8A0064646400ACACAC00A7A7A7007E7E7E00A5A5
      A500B9B9B900C0C0C000C5C5C500C4C4C400898989009A9A9A00C3C3C300AFAF
      AF0085858500D5D5D500CDCDCD00CECECE00A0A0A0009D9D9D00BFBFBF008F8F
      8F008A8A8A00ACACAC00C6C6C600888888009C9C9C00B4B4B400BDBDBD00A8A8
      A800636363006C6C6C00A7A7A700B0B0B0007A7A7A00B9B9B900C0C0C000C2C2
      C200999999007A7A7A0079797900B3B3B300DADADA006666660082828200E6E6
      E600CBCBCB00888888007A7A7A006A6A6A0045454500B8B8B800BFBFBF00BFBF
      BF00DFDFDF00CFCFCF00C9C9C900BDBDBD008585850080808000A7A7A700AEAE
      AE00D2D2D200ABABAB00B9B9B900DADADA00D7D7D700D6D6D600B4B4B400A9A9
      A900525252009E9E9E00CACACA00B1B1B100D2D2D200D3D3D300BFBFBF00CBCB
      CB00C4C4C400BBBBBB0099999900ABABAB00BBBBBB008C8C8C004C4C4C006767
      6700A6A6A600BDBDBD00AFAFAF00D2D2D200E6E6E6009B9B9B005D5D5D00BABA
      BA00C4C4C400D1D1D100818181003C3C3C0098989800C0C0C000CACACA00BABA
      BA00B4B4B400A9A9A900AFAFAF00A9A9A900BABABA00C6C6C600BCBCBC00C9C9
      C900C9C9C900CBCBCB009B9B9B006B6B6B0083838300ADADAD00C1C1C100B8B8
      B800C8C8C800D3D3D300B8B8B800C2C2C200DEDEDE00E1E1E100CBCBCB00C9C9
      C900C2C2C200C0C0C000A0A0A000B1B1B100A5A5A500A3A3A300C0C0C000A9A9
      A900ADADAD007C7C7C005F5F5F00B9B9B900D5D5D50094949400525252004D4D
      4D009D9D9D00B6B6B600B5B5B500B3B3B300B9B9B90093939300ABABAB007F7F
      7F0093939300B1B1B100B7B7B700D4D4D400D4D4D4008A8A8A009C9C9C00CBCB
      CB00B8B8B800616161004E4E4E0084848400B3B3B300D8D8D800E2E2E200AEAE
      AE004E4E4E008A8A8A00ADADAD00BBBBBB00DBDBDB00D4D4D400B2B2B2009A9A
      9A00A7A7A700BDBDBD00B7B7B700D1D1D100A5A5A5004F4F4F005F5F5F00BABA
      BA00BABABA00A7A7A700C8C8C800B1B1B1007D7D7D00BABABA00D3D3D300C5C5
      C500D3D3D300C3C3C300C6C6C600CCCCCC009D9D9D00A3A3A300D0D0D000C1C1
      C1007D7D7D008181810095959500A3A3A300B5B5B500BFBFBF00B9B9B900C1C1
      C100C6C6C6008F8F8F006B6B6B00B0B0B000C7C7C700D1D1D100A5A5A5007575
      75009D9D9D00ADADAD00ACACAC00B7B7B700ABABAB00A4A4A400B9B9B900BFBF
      BF00CBCBCB00C8C8C800BCBCBC00B1B1B100BABABA00CFCFCF009A9A9A007878
      7800ADADAD00CCCCCC00C8C8C800B5B5B50099999900B2B2B200C7C7C700B8B8
      B8009B9B9B00AFAFAF00CECECE00CBCBCB00C1C1C100B4B4B40094949400B3B3
      B300B5B5B500A7A7A700A7A7A7006363630085858500A9A9A900656565006B6B
      6B00999999008181810063636300AAAAAA00A7A7A700AEAEAE00BCBCBC00B3B3
      B300C0C0C000A6A6A600BDBDBD00A3A3A30071717100ABABAB00CDCDCD00BFBF
      BF00D8D8D800C1C1C10086868600A5A5A500B5B5B5006B6B6B00ACACAC00CDCD
      CD009B9B9B00A5A5A500C6C6C60096969600A2A2A200B9B9B900C4C4C400AAAA
      AA00CCCCCC00ADADAD00B5B5B500696969007A7A7A00B8B8B80091919100ACAC
      AC009B9B9B00C0C0C000B9B9B90099999900B3B3B3009E9E9E00898989007676
      76008B8B8B00A3A3A3009999990070707000B7B7B700B0B0B000C8C8C800ABAB
      AB00727272009C9C9C00CBCBCB00B8B8B800616161004E4E4E0084848400B3B3
      B300D8D8D800E2E2E200AEAEAE004E4E4E008A8A8A00ADADAD00BBBBBB00DBDB
      DB00D4D4D400B2B2B2009A9A9A00A7A7A700BDBDBD00B7B7B700D1D1D100A5A5
      A5004F4F4F005F5F5F00BABABA00BABABA00A7A7A700C8C8C800B1B1B1007D7D
      7D00BABABA00D3D3D300C5C5C500D3D3D300C3C3C300C6C6C600CCCCCC009D9D
      9D00A3A3A300D0D0D000C1C1C1007D7D7D008181810095959500A3A3A300B5B5
      B500BFBFBF00B9B9B900C1C1C100C6C6C6008F8F8F006B6B6B00B0B0B000C7C7
      C700D1D1D100A5A5A500757575009D9D9D00ADADAD00ACACAC00B7B7B700ABAB
      AB00A4A4A400B9B9B900BFBFBF00CBCBCB00C8C8C800BCBCBC00B1B1B100BABA
      BA00CFCFCF009A9A9A0078787800ADADAD00CCCCCC00C8C8C800B5B5B5009999
      9900B2B2B200C7C7C700B8B8B8009B9B9B00AFAFAF00CECECE00CBCBCB00C1C1
      C100B4B4B40094949400B3B3B300B5B5B500A7A7A700A7A7A700636363008585
      8500A9A9A900656565006B6B6B00999999008181810063636300AAAAAA00A7A7
      A700AEAEAE00BCBCBC00B3B3B300C0C0C000A6A6A600BDBDBD00A3A3A3007171
      7100ABABAB00CDCDCD00BFBFBF00D8D8D800C1C1C10086868600A5A5A500B5B5
      B5006B6B6B00ACACAC00CDCDCD009B9B9B00A5A5A500C6C6C60096969600A2A2
      A200B9B9B900C4C4C400AAAAAA00CCCCCC00ADADAD00B5B5B500696969007A7A
      7A00B8B8B80091919100ACACAC009B9B9B00C0C0C000B9B9B90099999900B3B3
      B3009E9E9E0089898900767676008B8B8B00A3A3A3009999990070707000B7B7
      B700B0B0B000C8C8C800ABABAB00727272009C9C9C00CBCBCB00B8B8B8006161
      61004E4E4E0084848400B3B3B300D8D8D800E2E2E200AEAEAE004E4E4E008A8A
      8A00ADADAD00BBBBBB00DBDBDB00D4D4D400B2B2B2009A9A9A00A7A7A700BDBD
      BD00B7B7B700D1D1D100A5A5A5004F4F4F005F5F5F00BABABA00BABABA00A7A7
      A700C8C8C800B1B1B1007D7D7D00BABABA00D3D3D300C5C5C500D3D3D300C3C3
      C300C6C6C600CCCCCC009D9D9D00A3A3A300D0D0D000C1C1C1007D7D7D008181
      810095959500A3A3A300B5B5B500BFBFBF00B9B9B900C1C1C100C6C6C6008F8F
      8F006B6B6B00B0B0B000C7C7C700D1D1D100A5A5A500757575009D9D9D00ADAD
      AD00ACACAC00B7B7B700ABABAB00A4A4A400B9B9B900BFBFBF00CBCBCB00C8C8
      C800BCBCBC00B1B1B100BABABA00CFCFCF009A9A9A0078787800ADADAD00CCCC
      CC00C8C8C800B5B5B50099999900B2B2B200C7C7C700B8B8B8009B9B9B00AFAF
      AF00CECECE00CBCBCB00C1C1C100B4B4B40094949400B3B3B300B5B5B500A7A7
      A700A7A7A7006363630085858500A9A9A900656565006B6B6B00999999008181
      810063636300AAAAAA00A7A7A700AEAEAE00BCBCBC00B3B3B300C0C0C000A6A6
      A600BDBDBD00A3A3A30071717100ABABAB00CDCDCD00BFBFBF00D8D8D800C1C1
      C100B7B7B700C6C6C600AFAFAF00737373005E5E5E004949490082828200CCCC
      CC00DADADA00BABABA00969696007B7B7B0050505000A3A3A300D4D4D400BEBE
      BE008A8A8A0096969600CFCFCF00CBCBCB00A0A0A000CCCCCC00909090005959
      59004E4E4E009E9E9E008787870049494900ACACAC00DBDBDB00B8B8B800CECE
      CE00C3C3C300A7A7A700ABABAB00ABABAB00BDBDBD00C5C5C500AEAEAE00B2B2
      B200CFCFCF00CCCCCC00B7B7B700D0D0D000CACACA00B9B9B900C9C9C9009D9D
      9D009F9F9F00B8B8B80085858500525252005B5B5B00B2B2B200CDCDCD00C1C1
      C100D1D1D100C8C8C800B7B7B700C0C0C000BEBEBE00CCCCCC00D2D2D200CFCF
      CF00CACACA00B9B9B900C5C5C500C0C0C000ABABAB006363630087878700B9B9
      B9008E8E8E00656565009D9D9D00C4C4C400B7B7B700C7C7C70094949400A8A8
      A800DADADA00C7C7C7007878780083838300CCCCCC00C9C9C900C2C2C200ACAC
      AC009090900086868600777777009F9F9F00A1A1A100BFBFBF00B6B6B600C6C6
      C600CBCBCB009C9C9C0094949400959595008F8F8F008A8A8A00676767009F9F
      9F00B0B0B000B8B8B800B5B5B500BCBCBC00BFBFBF00BEBEBE0080808000A6A6
      A600CACACA0089898900C0C0C000D2D2D200D0D0D000D2D2D2009C9C9C004444
      44009E9E9E00C2C2C200ADADAD00C8C8C800BDBDBD008E8E8E00A8A8A800B3B3
      B3009B9B9B00B6B6B6008D8D8D008B8B8B00B3B3B300BDBDBD008C8C8C009797
      9700C5C5C500B9B9B900ADADAD00A1A1A100BCBCBC008D8D8D00B9B9B900BBBB
      BB008A8A8A00646464008D8D8D00A8A8A8009F9F9F0061616100A0A0A0008C8C
      8C00C1C1C100C0C0C000A1A1A100B7B7B700C6C6C600AFAFAF00737373005E5E
      5E004949490082828200CCCCCC00DADADA00BABABA00969696007B7B7B005050
      5000A3A3A300D4D4D400BEBEBE008A8A8A0096969600CFCFCF00CBCBCB00A0A0
      A000CCCCCC0090909000595959004E4E4E009E9E9E008787870049494900ACAC
      AC00DBDBDB00B8B8B800CECECE00C3C3C300A7A7A700ABABAB00ABABAB00BDBD
      BD00C5C5C500AEAEAE00B2B2B200CFCFCF00CCCCCC00B7B7B700D0D0D000CACA
      CA00B9B9B900C9C9C9009D9D9D009F9F9F00B8B8B80085858500525252005B5B
      5B00B2B2B200CDCDCD00C1C1C100D1D1D100C8C8C800B7B7B700C0C0C000BEBE
      BE00CCCCCC00D2D2D200CFCFCF00CACACA00B9B9B900C5C5C500C0C0C000ABAB
      AB006363630087878700B9B9B9008E8E8E00656565009D9D9D00C4C4C400B7B7
      B700C7C7C70094949400A8A8A800DADADA00C7C7C7007878780083838300CCCC
      CC00C9C9C900C2C2C200ACACAC009090900086868600777777009F9F9F00A1A1
      A100BFBFBF00B6B6B600C6C6C600CBCBCB009C9C9C0094949400959595008F8F
      8F008A8A8A00676767009F9F9F00B0B0B000B8B8B800B5B5B500BCBCBC00BFBF
      BF00BEBEBE0080808000A6A6A600CACACA0089898900C0C0C000D2D2D200D0D0
      D000D2D2D2009C9C9C00444444009E9E9E00C2C2C200ADADAD00C8C8C800BDBD
      BD008E8E8E00A8A8A800B3B3B3009B9B9B00B6B6B6008D8D8D008B8B8B00B3B3
      B300BDBDBD008C8C8C0097979700C5C5C500B9B9B900ADADAD00A1A1A100BCBC
      BC008D8D8D00B9B9B900BBBBBB008A8A8A00646464008D8D8D00A8A8A8009F9F
      9F0061616100A0A0A0008C8C8C00C1C1C100C0C0C000A1A1A100B7B7B700C6C6
      C600AFAFAF00737373005E5E5E004949490082828200CCCCCC00DADADA00BABA
      BA00969696007B7B7B0050505000A3A3A300D4D4D400BEBEBE008A8A8A009696
      9600CFCFCF00CBCBCB00A0A0A000CCCCCC0090909000595959004E4E4E009E9E
      9E008787870049494900ACACAC00DBDBDB00B8B8B800CECECE00C3C3C300A7A7
      A700ABABAB00ABABAB00BDBDBD00C5C5C500AEAEAE00B2B2B200CFCFCF00CCCC
      CC00B7B7B700D0D0D000CACACA00B9B9B900C9C9C9009D9D9D009F9F9F00B8B8
      B80085858500525252005B5B5B00B2B2B200CDCDCD00C1C1C100D1D1D100C8C8
      C800B7B7B700C0C0C000BEBEBE00CCCCCC00D2D2D200CFCFCF00CACACA00B9B9
      B900C5C5C500C0C0C000ABABAB006363630087878700B9B9B9008E8E8E006565
      65009D9D9D00C4C4C400B7B7B700C7C7C70094949400A8A8A800DADADA00C7C7
      C7007878780083838300CCCCCC00C9C9C900C2C2C200ACACAC00909090008686
      8600777777009F9F9F00A1A1A100BFBFBF00B6B6B600C6C6C600CBCBCB009C9C
      9C0094949400959595008F8F8F008A8A8A00676767009F9F9F00B0B0B000B8B8
      B800B5B5B500BCBCBC00BFBFBF00BEBEBE0080808000A6A6A600CACACA008989
      8900C0C0C000D2D2D200AFAFAF00B2B2B200B9B9B90096969600A0A0A0008585
      8500A3A3A300E6E6E600A7A7A7006A6A6A00AFAFAF008A8A8A0072727200D9D9
      D900D8D8D800B8B8B800B2B2B200C8C8C800CDCDCD00B2B2B200B5B5B500D0D0
      D000D1D1D100B8B8B800A6A6A600BFBFBF009D9D9D0085858500B8B8B800DEDE
      DE00CFCFCF00CACACA00B6B6B600A3A3A300A6A6A600ADADAD00BBBBBB00C9C9
      C900B5B5B500A6A6A6008E8E8E00A7A7A700C4C4C400AFAFAF007D7D7D006565
      6500C2C2C200878787006E6E6E00CCCCCC0096969600444444006B6B6B00B1B1
      B100D2D2D200C0C0C000BFBFBF00C9C9C900BFBFBF00BEBEBE00BCBCBC00CCCC
      CC00D2D2D200DADADA00CBCBCB00A8A8A800BFBFBF00D3D3D300C7C7C7009999
      990098989800B4B4B400A4A4A400646464006C6C6C00A8A8A800B4B4B400CCCC
      CC00CACACA00C9C9C900BFBFBF00C6C6C600C3C3C300CBCBCB00CBCBCB00C3C3
      C300B1B1B100A4A4A400919191006C6C6C004949490092929200C0C0C000B6B6
      B600D0D0D000C3C3C30078787800B8B8B800D7D7D700E3E3E300AAAAAA004848
      480062626200B2B2B200B0B0B000B9B9B900AAAAAA00B5B5B500B7B7B700AAAA
      AA00989898009D9D9D00AEAEAE0098989800B7B7B7009F9F9F00C9C9C900C7C7
      C7009E9E9E0068686800818181007D7D7D00A4A4A400D5D5D500C5C5C5008D8D
      8D00A2A2A2008D8D8D004D4D4D00949494006C6C6C0092929200C6C6C600DEDE
      DE00A5A5A50093939300CACACA00AFAFAF00C0C0C0008C8C8C009C9C9C009797
      9700BABABA00D4D4D4008E8E8E004B4B4B007E7E7E009F9F9F00A8A8A8007575
      7500A3A3A30069696900ADADAD00ACACAC00B1B1B100AFAFAF00B2B2B200B9B9
      B90096969600A0A0A00085858500A3A3A300E6E6E600A7A7A7006A6A6A00AFAF
      AF008A8A8A0072727200D9D9D900D8D8D800B8B8B800B2B2B200C8C8C800CDCD
      CD00B2B2B200B5B5B500D0D0D000D1D1D100B8B8B800A6A6A600BFBFBF009D9D
      9D0085858500B8B8B800DEDEDE00CFCFCF00CACACA00B6B6B600A3A3A300A6A6
      A600ADADAD00BBBBBB00C9C9C900B5B5B500A6A6A6008E8E8E00A7A7A700C4C4
      C400AFAFAF007D7D7D0065656500C2C2C200878787006E6E6E00CCCCCC009696
      9600444444006B6B6B00B1B1B100D2D2D200C0C0C000BFBFBF00C9C9C900BFBF
      BF00BEBEBE00BCBCBC00CCCCCC00D2D2D200DADADA00CBCBCB00A8A8A800BFBF
      BF00D3D3D300C7C7C7009999990098989800B4B4B400A4A4A400646464006C6C
      6C00A8A8A800B4B4B400CCCCCC00CACACA00C9C9C900BFBFBF00C6C6C600C3C3
      C300CBCBCB00CBCBCB00C3C3C300B1B1B100A4A4A400919191006C6C6C004949
      490092929200C0C0C000B6B6B600D0D0D000C3C3C30078787800B8B8B800D7D7
      D700E3E3E300AAAAAA004848480062626200B2B2B200B0B0B000B9B9B900AAAA
      AA00B5B5B500B7B7B700AAAAAA00989898009D9D9D00AEAEAE0098989800B7B7
      B7009F9F9F00C9C9C900C7C7C7009E9E9E0068686800818181007D7D7D00A4A4
      A400D5D5D500C5C5C5008D8D8D00A2A2A2008D8D8D004D4D4D00949494006C6C
      6C0092929200C6C6C600DEDEDE00A5A5A50093939300CACACA00AFAFAF00C0C0
      C0008C8C8C009C9C9C0097979700BABABA00D4D4D4008E8E8E004B4B4B007E7E
      7E009F9F9F00A8A8A80075757500A3A3A30069696900ADADAD00ACACAC00B1B1
      B100AFAFAF00B2B2B200B9B9B90096969600A0A0A00085858500A3A3A300E6E6
      E600A7A7A7006A6A6A00AFAFAF008A8A8A0072727200D9D9D900D8D8D800B8B8
      B800B2B2B200C8C8C800CDCDCD00B2B2B200B5B5B500D0D0D000D1D1D100B8B8
      B800A6A6A600BFBFBF009D9D9D0085858500B8B8B800DEDEDE00CFCFCF00CACA
      CA00B6B6B600A3A3A300A6A6A600ADADAD00BBBBBB00C9C9C900B5B5B500A6A6
      A6008E8E8E00A7A7A700C4C4C400AFAFAF007D7D7D0065656500C2C2C2008787
      87006E6E6E00CCCCCC0096969600444444006B6B6B00B1B1B100D2D2D200C0C0
      C000BFBFBF00C9C9C900BFBFBF00BEBEBE00BCBCBC00CCCCCC00D2D2D200DADA
      DA00CBCBCB00A8A8A800BFBFBF00D3D3D300C7C7C7009999990098989800B4B4
      B400A4A4A400646464006C6C6C00A8A8A800B4B4B400CCCCCC00CACACA00C9C9
      C900BFBFBF00C6C6C600C3C3C300CBCBCB00CBCBCB00C3C3C300B1B1B100A4A4
      A400919191006C6C6C004949490092929200C0C0C000B6B6B600D0D0D000C3C3
      C30078787800B8B8B800D7D7D700E3E3E300AAAAAA004848480062626200B2B2
      B200B0B0B000B9B9B900AAAAAA00B5B5B500B7B7B700AAAAAA00989898009D9D
      9D00AEAEAE0098989800B7B7B7009F9F9F00B2B2B200B5B5B500B4B4B400B5B5
      B500C3C3C300C8C8C800C8C8C800808080004B4B4B0047474700B6B6B600CDCD
      CD00CDCDCD00D3D3D300C2C2C200C9C9C900D3D3D300BFBFBF00CACACA00D1D1
      D100D0D0D000D9D9D900D2D2D200DEDEDE00A5A5A500A2A2A200CDCDCD00CACA
      CA00C5C5C500B8B8B800D0D0D000AFAFAF009C9C9C00BDBDBD00BCBCBC00B2B2
      B200CECECE00D3D3D3007F7F7F0067676700606060008C8C8C00919191006666
      66007C7C7C008B8B8B00B8B8B800CCCCCC00C1C1C100D8D8D8009C9C9C006F6F
      6F00A4A4A400C0C0C000C1C1C100C5C5C500BBBBBB00C0C0C000A2A2A2007070
      7000828282009191910095959500BCBCBC00CDCDCD00A7A7A700B1B1B100C2C2
      C200B8B8B800D0D0D000B3B3B300BEBEBE00CCCCCC00747474004C4C4C00A1A1
      A100D0D0D000C1C1C100CBCBCB00C0C0C0009B9B9B00A6A6A600D0D0D000E3E3
      E300BFBFBF00A4A4A4007B7B7B00858585009595950094949400656565007C7C
      7C00B6B6B600A1A1A10088888800C3C3C3005E5E5E0051515100A8A8A8009B9B
      9B007A7A7A004B4B4B0090909000C5C5C500B5B5B500ACACAC00B3B3B300B5B5
      B500AEAEAE00A4A4A400A2A2A2007979790064646400B2B2B200AFAFAF006060
      60008F8F8F00DDDDDD009C9C9C006262620087878700B5B5B500B5B5B5009292
      9200B6B6B600A5A5A500ABABAB007F7F7F00454545009C9C9C0091919100A5A5
      A500B0B0B000B3B3B3008787870076767600AAAAAA00CCCCCC00A2A2A2004949
      49007B7B7B009A9A9A00A6A6A600B1B1B1007A7A7A006E6E6E00A2A2A2009898
      9800ABABAB007B7B7B00A3A3A30095959500BEBEBE00B8B8B800A7A7A700B2B2
      B200B5B5B500B4B4B400B5B5B500C3C3C300C8C8C800C8C8C800808080004B4B
      4B0047474700B6B6B600CDCDCD00CDCDCD00D3D3D300C2C2C200C9C9C900D3D3
      D300BFBFBF00CACACA00D1D1D100D0D0D000D9D9D900D2D2D200DEDEDE00A5A5
      A500A2A2A200CDCDCD00CACACA00C5C5C500B8B8B800D0D0D000AFAFAF009C9C
      9C00BDBDBD00BCBCBC00B2B2B200CECECE00D3D3D3007F7F7F00676767006060
      60008C8C8C0091919100666666007C7C7C008B8B8B00B8B8B800CCCCCC00C1C1
      C100D8D8D8009C9C9C006F6F6F00A4A4A400C0C0C000C1C1C100C5C5C500BBBB
      BB00C0C0C000A2A2A20070707000828282009191910095959500BCBCBC00CDCD
      CD00A7A7A700B1B1B100C2C2C200B8B8B800D0D0D000B3B3B300BEBEBE00CCCC
      CC00747474004C4C4C00A1A1A100D0D0D000C1C1C100CBCBCB00C0C0C0009B9B
      9B00A6A6A600D0D0D000E3E3E300BFBFBF00A4A4A4007B7B7B00858585009595
      950094949400656565007C7C7C00B6B6B600A1A1A10088888800C3C3C3005E5E
      5E0051515100A8A8A8009B9B9B007A7A7A004B4B4B0090909000C5C5C500B5B5
      B500ACACAC00B3B3B300B5B5B500AEAEAE00A4A4A400A2A2A200797979006464
      6400B2B2B200AFAFAF00606060008F8F8F00DDDDDD009C9C9C00626262008787
      8700B5B5B500B5B5B50092929200B6B6B600A5A5A500ABABAB007F7F7F004545
      45009C9C9C0091919100A5A5A500B0B0B000B3B3B3008787870076767600AAAA
      AA00CCCCCC00A2A2A200494949007B7B7B009A9A9A00A6A6A600B1B1B1007A7A
      7A006E6E6E00A2A2A20098989800ABABAB007B7B7B00A3A3A30095959500BEBE
      BE00B8B8B800A7A7A700B2B2B200B5B5B500B4B4B400B5B5B500C3C3C300C8C8
      C800C8C8C800808080004B4B4B0047474700B6B6B600CDCDCD00CDCDCD00D3D3
      D300C2C2C200C9C9C900D3D3D300BFBFBF00CACACA00D1D1D100D0D0D000D9D9
      D900D2D2D200DEDEDE00A5A5A500A2A2A200CDCDCD00CACACA00C5C5C500B8B8
      B800D0D0D000AFAFAF009C9C9C00BDBDBD00BCBCBC00B2B2B200CECECE00D3D3
      D3007F7F7F0067676700606060008C8C8C0091919100666666007C7C7C008B8B
      8B00B8B8B800CCCCCC00C1C1C100D8D8D8009C9C9C006F6F6F00A4A4A400C0C0
      C000C1C1C100C5C5C500BBBBBB00C0C0C000A2A2A20070707000828282009191
      910095959500BCBCBC00CDCDCD00A7A7A700B1B1B100C2C2C200B8B8B800D0D0
      D000B3B3B300BEBEBE00CCCCCC00747474004C4C4C00A1A1A100D0D0D000C1C1
      C100CBCBCB00C0C0C0009B9B9B00A6A6A600D0D0D000E3E3E300BFBFBF00A4A4
      A4007B7B7B00858585009595950094949400656565007C7C7C00B6B6B600A1A1
      A10088888800C3C3C3005E5E5E0051515100A8A8A8009B9B9B007A7A7A004B4B
      4B0090909000C5C5C500B5B5B500ACACAC00B3B3B300B5B5B500AEAEAE00A4A4
      A400A2A2A2007979790064646400B2B2B200AFAFAF0060606000AEAEAE00B3B3
      B30082828200B1B1B100B1B1B100CBCBCB00ABABAB004B4B4B006E6E6E00CECE
      CE00A0A0A00077777700888888008A8A8A008585850085858500A8A8A800C7C7
      C700C9C9C900D7D7D700D0D0D000B6B6B600BEBEBE00C5C5C500676767006565
      6500CCCCCC00E8E8E8009494940098989800C3C3C3009D9D9D00B6B6B600D0D0
      D000C5C5C500B8B8B800C9C9C900CBCBCB00B0B0B0008B8B8B009A9A9A00B9B9
      B900A6A6A6009F9F9F00C0C0C000CACACA00ADADAD00A9A9A900CFCFCF00C7C7
      C7005F5F5F0070707000B5B5B500C3C3C300B6B6B600C6C6C600B4B4B400CCCC
      CC008080800090909000B2B2B200929292006464640097979700CACACA00A4A4
      A400A7A7A700BBBBBB00BFBFBF00A0A0A00085858500A7A7A700BFBFBF007878
      78004D4D4D0095959500A6A6A600AFAFAF00919191008888880064646400B2B2
      B200A6A6A600A1A1A100C0C0C000AAAAAA0083838300AAAAAA00959595008E8E
      8E008F8F8F00A3A3A300C4C4C400707070004C4C4C00868686009C9C9C006666
      6600777777008888880084848400BABABA00C2C2C200B9B9B900BDBDBD00B9B9
      B900BABABA009B9B9B008B8B8B00A8A8A800A8A8A80097979700606060009F9F
      9F00BEBEBE009A9A9A00A6A6A600C3C3C3005C5C5C006D6D6D00606060009B9B
      9B00A7A7A7007F7F7F00A2A2A200B3B3B300C4C4C400B8B8B8007F7F7F00B1B1
      B100C3C3C300B7B7B700A9A9A900C4C4C400828282004E4E4E0093939300CCCC
      CC00AEAEAE0091919100B0B0B0009B9B9B00818181007F7F7F0079797900A1A1
      A100B1B1B100BDBDBD00A9A9A90082828200A2A2A20080808000B6B6B600ADAD
      AD008D8D8D00AEAEAE00B3B3B30082828200B1B1B100B1B1B100CBCBCB00ABAB
      AB004B4B4B006E6E6E00CECECE00A0A0A00077777700888888008A8A8A008585
      850085858500A8A8A800C7C7C700C9C9C900D7D7D700D0D0D000B6B6B600BEBE
      BE00C5C5C5006767670065656500CCCCCC00E8E8E8009494940098989800C3C3
      C3009D9D9D00B6B6B600D0D0D000C5C5C500B8B8B800C9C9C900CBCBCB00B0B0
      B0008B8B8B009A9A9A00B9B9B900A6A6A6009F9F9F00C0C0C000CACACA00ADAD
      AD00A9A9A900CFCFCF00C7C7C7005F5F5F0070707000B5B5B500C3C3C300B6B6
      B600C6C6C600B4B4B400CCCCCC008080800090909000B2B2B200929292006464
      640097979700CACACA00A4A4A400A7A7A700BBBBBB00BFBFBF00A0A0A0008585
      8500A7A7A700BFBFBF00787878004D4D4D0095959500A6A6A600AFAFAF009191
      91008888880064646400B2B2B200A6A6A600A1A1A100C0C0C000AAAAAA008383
      8300AAAAAA00959595008E8E8E008F8F8F00A3A3A300C4C4C400707070004C4C
      4C00868686009C9C9C0066666600777777008888880084848400BABABA00C2C2
      C200B9B9B900BDBDBD00B9B9B900BABABA009B9B9B008B8B8B00A8A8A800A8A8
      A80097979700606060009F9F9F00BEBEBE009A9A9A00A6A6A600C3C3C3005C5C
      5C006D6D6D00606060009B9B9B00A7A7A7007F7F7F00A2A2A200B3B3B300C4C4
      C400B8B8B8007F7F7F00B1B1B100C3C3C300B7B7B700A9A9A900C4C4C4008282
      82004E4E4E0093939300CCCCCC00AEAEAE0091919100B0B0B0009B9B9B008181
      81007F7F7F0079797900A1A1A100B1B1B100BDBDBD00A9A9A90082828200A2A2
      A20080808000B6B6B600ADADAD008D8D8D00AEAEAE00B3B3B30082828200B1B1
      B100B1B1B100CBCBCB00ABABAB004B4B4B006E6E6E00CECECE00A0A0A0007777
      7700888888008A8A8A008585850085858500A8A8A800C7C7C700C9C9C900D7D7
      D700D0D0D000B6B6B600BEBEBE00C5C5C5006767670065656500CCCCCC00E8E8
      E8009494940098989800C3C3C3009D9D9D00B6B6B600D0D0D000C5C5C500B8B8
      B800C9C9C900CBCBCB00B0B0B0008B8B8B009A9A9A00B9B9B900A6A6A6009F9F
      9F00C0C0C000CACACA00ADADAD00A9A9A900CFCFCF00C7C7C7005F5F5F007070
      7000B5B5B500C3C3C300B6B6B600C6C6C600B4B4B400CCCCCC00808080009090
      9000B2B2B200929292006464640097979700CACACA00A4A4A400A7A7A700BBBB
      BB00BFBFBF00A0A0A00085858500A7A7A700BFBFBF00787878004D4D4D009595
      9500A6A6A600AFAFAF00919191008888880064646400B2B2B200A6A6A600A1A1
      A100C0C0C000AAAAAA0083838300AAAAAA00959595008E8E8E008F8F8F00A3A3
      A300C4C4C400707070004C4C4C00868686009C9C9C0066666600777777008888
      880084848400BABABA00C2C2C200B9B9B900BDBDBD00B9B9B900BABABA009B9B
      9B008B8B8B00A8A8A800A8A8A80097979700606060009F9F9F00BEBEBE009A9A
      9A00A2A2A200AAAAAA008787870098989800606060004D4D4D007D7D7D00C0C0
      C000CACACA00D2D2D200707070004B4B4B007E7E7E0081818100888888009696
      9600B9B9B900C1C1C100ABABAB00C9C9C900C4C4C4006E6E6E0084848400C7C7
      C7008989890079797900ADADAD00C2C2C200C8C8C800B4B4B400C9C9C900C3C3
      C300CACACA00D3D3D300C3C3C30093939300B2B2B200C6C6C600D8D8D800D0D0
      D000C2C2C200C5C5C500D2D2D200CECECE00A8A8A800A5A5A500AEAEAE009595
      95006868680080808000686868006B6B6B008787870076767600B1B1B100BDBD
      BD00959595009D9D9D0094949400AFAFAF00CDCDCD00BABABA0098989800B5B5
      B500CECECE00ADADAD00BDBDBD00C8C8C800B8B8B800737373004E4E4E008989
      89009C9C9C006C6C6C005F5F5F00646464004A4A4A0092929200959595008686
      860060606000ACACAC007878780063636300A8A8A800BEBEBE00B8B8B800B8B8
      B8009D9D9D0092929200A0A0A000C0C0C000A9A9A9008181810086868600BABA
      BA00D4D4D400CFCFCF00CDCDCD008787870049494900666666009F9F9F00C8C8
      C800B7B7B700ACACAC00B7B7B700929292007B7B7B00B2B2B200B0B0B000ABAB
      AB008787870069696900C5C5C500BABABA00CDCDCD00A1A1A100ADADAD00A2A2
      A2006464640068686800C3C3C300BABABA00C7C7C700C1C1C100A6A6A600A3A3
      A30093939300A1A1A100D1D1D100BFBFBF006C6C6C0091919100C9C9C9007373
      730090909000B2B2B200C6C6C600BCBCBC00B3B3B300A4A4A4009B9B9B008585
      850087878700A9A9A9006E6E6E0080808000ADADAD00A7A7A7009C9C9C006161
      6100989898007A7A7A0067676700A2A2A200AAAAAA0087878700989898006060
      60004D4D4D007D7D7D00C0C0C000CACACA00D2D2D200707070004B4B4B007E7E
      7E00818181008888880096969600B9B9B900C1C1C100ABABAB00C9C9C900C4C4
      C4006E6E6E0084848400C7C7C7008989890079797900ADADAD00C2C2C200C8C8
      C800B4B4B400C9C9C900C3C3C300CACACA00D3D3D300C3C3C30093939300B2B2
      B200C6C6C600D8D8D800D0D0D000C2C2C200C5C5C500D2D2D200CECECE00A8A8
      A800A5A5A500AEAEAE00959595006868680080808000686868006B6B6B008787
      870076767600B1B1B100BDBDBD00959595009D9D9D0094949400AFAFAF00CDCD
      CD00BABABA0098989800B5B5B500CECECE00ADADAD00BDBDBD00C8C8C800B8B8
      B800737373004E4E4E00898989009C9C9C006C6C6C005F5F5F00646464004A4A
      4A0092929200959595008686860060606000ACACAC007878780063636300A8A8
      A800BEBEBE00B8B8B800B8B8B8009D9D9D0092929200A0A0A000C0C0C000A9A9
      A9008181810086868600BABABA00D4D4D400CFCFCF00CDCDCD00878787004949
      4900666666009F9F9F00C8C8C800B7B7B700ACACAC00B7B7B700929292007B7B
      7B00B2B2B200B0B0B000ABABAB008787870069696900C5C5C500BABABA00CDCD
      CD00A1A1A100ADADAD00A2A2A2006464640068686800C3C3C300BABABA00C7C7
      C700C1C1C100A6A6A600A3A3A30093939300A1A1A100D1D1D100BFBFBF006C6C
      6C0091919100C9C9C9007373730090909000B2B2B200C6C6C600BCBCBC00B3B3
      B300A4A4A4009B9B9B008585850087878700A9A9A9006E6E6E0080808000ADAD
      AD00A7A7A7009C9C9C0061616100989898007A7A7A0067676700A2A2A200AAAA
      AA008787870098989800606060004D4D4D007D7D7D00C0C0C000CACACA00D2D2
      D200707070004B4B4B007E7E7E00818181008888880096969600B9B9B900C1C1
      C100ABABAB00C9C9C900C4C4C4006E6E6E0084848400C7C7C700898989007979
      7900ADADAD00C2C2C200C8C8C800B4B4B400C9C9C900C3C3C300CACACA00D3D3
      D300C3C3C30093939300B2B2B200C6C6C600D8D8D800D0D0D000C2C2C200C5C5
      C500D2D2D200CECECE00A8A8A800A5A5A500AEAEAE0095959500686868008080
      8000686868006B6B6B008787870076767600B1B1B100BDBDBD00959595009D9D
      9D0094949400AFAFAF00CDCDCD00BABABA0098989800B5B5B500CECECE00ADAD
      AD00BDBDBD00C8C8C800B8B8B800737373004E4E4E00898989009C9C9C006C6C
      6C005F5F5F00646464004A4A4A0092929200959595008686860060606000ACAC
      AC007878780063636300A8A8A800BEBEBE00B8B8B800B8B8B8009D9D9D009292
      9200A0A0A000C0C0C000A9A9A9008181810086868600BABABA00D4D4D400CFCF
      CF00CDCDCD008787870049494900666666009F9F9F00C8C8C800B7B7B700ACAC
      AC00B7B7B700929292007B7B7B00B2B2B200B0B0B000ABABAB00878787006969
      6900C5C5C500BABABA00ABABAB00B7B7B700B5B5B500B8B8B800444444003F3F
      3F0098989800CDCDCD00B2B2B200A5A5A500A0A0A000A8A8A800959595008F8F
      8F00A7A7A700B5B5B500ABABAB00C2C2C200C3C3C300D0D0D000B9B9B9007E7E
      7E00A4A4A400B1B1B100D0D0D0009E9E9E0047474700A5A5A500DBDBDB00CACA
      CA00D8D8D800DCDCDC00DCDCDC00D7D7D700C4C4C4009E9E9E00CACACA00BBBB
      BB00B5B5B500BFBFBF00CECECE00BDBDBD00B2B2B200CACACA00BCBCBC00A0A0
      A000BEBEBE00BCBCBC00A2A2A20091919100555555005D5D5D008E8E8E006868
      680094949400B4B4B400A6A6A6005E5E5E006B6B6B00A7A7A700C6C6C600A7A7
      A700909090009D9D9D00BFBFBF00AEAEAE00B8B8B800C4C4C400AFAFAF00ABAB
      AB0095959500ADADAD00C9C9C900ACACAC006E6E6E005D5D5D0096969600BCBC
      BC00CDCDCD00BFBFBF0085858500BCBCBC00ADADAD00A8A8A800BABABA00AFAF
      AF00A7A7A700B2B2B2009D9D9D008888880091919100A2A2A200B3B3B300C8C8
      C800CECECE00E0E0E000C9C9C900B9B9B900C4C4C40090909000484848006767
      67007A7A7A009090900097979700B7B7B700C3C3C300B0B0B000A1A1A1009696
      9600A9A9A900B1B1B100ADADAD0080808000B2B2B2007C7C7C00A0A0A000BEBE
      BE00A2A2A200C0C0C0008181810072727200C8C8C800C6C6C600BBBBBB00C3C3
      C3007D7D7D0072727200A9A9A900BFBFBF00B4B4B40073737300505050007C7C
      7C00C2C2C200C7C7C700ABABAB00B1B1B100B6B6B600B3B3B300C4C4C4008282
      8200AFAFAF00C1C1C100BBBBBB00B5B5B500606060007171710071717100A6A6
      A600AFAFAF0093939300BBBBBB00B5B5B50085858500ABABAB00B7B7B700B5B5
      B500B8B8B800444444003F3F3F0098989800CDCDCD00B2B2B200A5A5A500A0A0
      A000A8A8A800959595008F8F8F00A7A7A700B5B5B500ABABAB00C2C2C200C3C3
      C300D0D0D000B9B9B9007E7E7E00A4A4A400B1B1B100D0D0D0009E9E9E004747
      4700A5A5A500DBDBDB00CACACA00D8D8D800DCDCDC00DCDCDC00D7D7D700C4C4
      C4009E9E9E00CACACA00BBBBBB00B5B5B500BFBFBF00CECECE00BDBDBD00B2B2
      B200CACACA00BCBCBC00A0A0A000BEBEBE00BCBCBC00A2A2A200919191005555
      55005D5D5D008E8E8E006868680094949400B4B4B400A6A6A6005E5E5E006B6B
      6B00A7A7A700C6C6C600A7A7A700909090009D9D9D00BFBFBF00AEAEAE00B8B8
      B800C4C4C400AFAFAF00ABABAB0095959500ADADAD00C9C9C900ACACAC006E6E
      6E005D5D5D0096969600BCBCBC00CDCDCD00BFBFBF0085858500BCBCBC00ADAD
      AD00A8A8A800BABABA00AFAFAF00A7A7A700B2B2B2009D9D9D00888888009191
      9100A2A2A200B3B3B300C8C8C800CECECE00E0E0E000C9C9C900B9B9B900C4C4
      C4009090900048484800676767007A7A7A009090900097979700B7B7B700C3C3
      C300B0B0B000A1A1A10096969600A9A9A900B1B1B100ADADAD0080808000B2B2
      B2007C7C7C00A0A0A000BEBEBE00A2A2A200C0C0C0008181810072727200C8C8
      C800C6C6C600BBBBBB00C3C3C3007D7D7D0072727200A9A9A900BFBFBF00B4B4
      B40073737300505050007C7C7C00C2C2C200C7C7C700ABABAB00B1B1B100B6B6
      B600B3B3B300C4C4C40082828200AFAFAF00C1C1C100BBBBBB00B5B5B5006060
      60007171710071717100A6A6A600AFAFAF0093939300BBBBBB00B5B5B5008585
      8500ABABAB00B7B7B700B5B5B500B8B8B800444444003F3F3F0098989800CDCD
      CD00B2B2B200A5A5A500A0A0A000A8A8A800959595008F8F8F00A7A7A700B5B5
      B500ABABAB00C2C2C200C3C3C300D0D0D000B9B9B9007E7E7E00A4A4A400B1B1
      B100D0D0D0009E9E9E0047474700A5A5A500DBDBDB00CACACA00D8D8D800DCDC
      DC00DCDCDC00D7D7D700C4C4C4009E9E9E00CACACA00BBBBBB00B5B5B500BFBF
      BF00CECECE00BDBDBD00B2B2B200CACACA00BCBCBC00A0A0A000BEBEBE00BCBC
      BC00A2A2A20091919100555555005D5D5D008E8E8E006868680094949400B4B4
      B400A6A6A6005E5E5E006B6B6B00A7A7A700C6C6C600A7A7A700909090009D9D
      9D00BFBFBF00AEAEAE00B8B8B800C4C4C400AFAFAF00ABABAB0095959500ADAD
      AD00C9C9C900ACACAC006E6E6E005D5D5D0096969600BCBCBC00CDCDCD00BFBF
      BF0085858500BCBCBC00ADADAD00A8A8A800BABABA00AFAFAF00A7A7A700B2B2
      B2009D9D9D008888880091919100A2A2A200B3B3B300C8C8C800CECECE00E0E0
      E000C9C9C900B9B9B900C4C4C4009090900048484800676767007A7A7A009090
      900097979700B7B7B700C3C3C300B0B0B000A1A1A10096969600A9A9A900B1B1
      B100ADADAD0080808000B2B2B2007C7C7C00A9A9A900B4B4B400C8C8C800B7B7
      B700B2B2B200A4A4A400BFBFBF005F5F5F004E4E4E007D7D7D00C6C6C600A2A2
      A2007373730098989800A6A6A600ADADAD0084848400A8A8A800AAAAAA00ACAC
      AC00C7C7C700CDCDCD00C2C2C200B0B0B000B2B2B2009393930072727200BEBE
      BE00BBBBBB0092929200CBCBCB00C7C7C700CFCFCF00CCCCCC00C0C0C000C1C1
      C100C9C9C90099999900A7A7A700C5C5C500C9C9C900929292006B6B6B008585
      8500787878009F9F9F00C5C5C500C2C2C200CCCCCC00858585005D5D5D009E9E
      9E00CDCDCD00B4B4B400B3B3B300B9B9B900C9C9C9009C9C9C0099999900A3A3
      A30093939300B4B4B4009A9A9A0091919100C1C1C100A3A3A3008F8F8F00BCBC
      BC00C1C1C100D8D8D800B7B7B7007C7C7C0096969600C6C6C6009C9C9C006C6C
      6C00B8B8B800AEAEAE00D2D2D200ABABAB006A6A6A00BBBBBB00C6C6C600B8B8
      B800BEBEBE00B3B3B300B6B6B600C1C1C100A6A6A6008B8B8B00939393009494
      9400B0B0B000BDBDBD00AFAFAF00BBBBBB00BFBFBF00C6C6C600C8C8C800BCBC
      BC00B1B1B100A7A7A700858585006E6E6E0083838300B1B1B100A8A8A800B4B4
      B400BCBCBC00A8A8A800B4B4B400C1C1C100C1C1C100C0C0C000B0B0B0008282
      8200ABABAB00949494003B3B3B006C6C6C009E9E9E00AFAFAF00CCCCCC00D0D0
      D000D0D0D000D3D3D300A6A6A6009A9A9A00A7A7A700BABABA00949494006060
      600098989800C8C8C800B5B5B500D4D4D400AEAEAE00BABABA00C9C9C900AEAE
      AE00A9A9A90084848400AFAFAF00C1C1C100AAAAAA00B8B8B8009C9C9C00ACAC
      AC00777777008D8D8D00AFAFAF0083838300BDBDBD009393930095959500A9A9
      A900B4B4B400C8C8C800B7B7B700B2B2B200A4A4A400BFBFBF005F5F5F004E4E
      4E007D7D7D00C6C6C600A2A2A2007373730098989800A6A6A600ADADAD008484
      8400A8A8A800AAAAAA00ACACAC00C7C7C700CDCDCD00C2C2C200B0B0B000B2B2
      B2009393930072727200BEBEBE00BBBBBB0092929200CBCBCB00C7C7C700CFCF
      CF00CCCCCC00C0C0C000C1C1C100C9C9C90099999900A7A7A700C5C5C500C9C9
      C900929292006B6B6B0085858500787878009F9F9F00C5C5C500C2C2C200CCCC
      CC00858585005D5D5D009E9E9E00CDCDCD00B4B4B400B3B3B300B9B9B900C9C9
      C9009C9C9C0099999900A3A3A30093939300B4B4B4009A9A9A0091919100C1C1
      C100A3A3A3008F8F8F00BCBCBC00C1C1C100D8D8D800B7B7B7007C7C7C009696
      9600C6C6C6009C9C9C006C6C6C00B8B8B800AEAEAE00D2D2D200ABABAB006A6A
      6A00BBBBBB00C6C6C600B8B8B800BEBEBE00B3B3B300B6B6B600C1C1C100A6A6
      A6008B8B8B009393930094949400B0B0B000BDBDBD00AFAFAF00BBBBBB00BFBF
      BF00C6C6C600C8C8C800BCBCBC00B1B1B100A7A7A700858585006E6E6E008383
      8300B1B1B100A8A8A800B4B4B400BCBCBC00A8A8A800B4B4B400C1C1C100C1C1
      C100C0C0C000B0B0B00082828200ABABAB00949494003B3B3B006C6C6C009E9E
      9E00AFAFAF00CCCCCC00D0D0D000D0D0D000D3D3D300A6A6A6009A9A9A00A7A7
      A700BABABA00949494006060600098989800C8C8C800B5B5B500D4D4D400AEAE
      AE00BABABA00C9C9C900AEAEAE00A9A9A90084848400AFAFAF00C1C1C100AAAA
      AA00B8B8B8009C9C9C00ACACAC00777777008D8D8D00AFAFAF0083838300BDBD
      BD009393930095959500A9A9A900B4B4B400C8C8C800B7B7B700B2B2B200A4A4
      A400BFBFBF005F5F5F004E4E4E007D7D7D00C6C6C600A2A2A200737373009898
      9800A6A6A600ADADAD0084848400A8A8A800AAAAAA00ACACAC00C7C7C700CDCD
      CD00C2C2C200B0B0B000B2B2B2009393930072727200BEBEBE00BBBBBB009292
      9200CBCBCB00C7C7C700CFCFCF00CCCCCC00C0C0C000C1C1C100C9C9C9009999
      9900A7A7A700C5C5C500C9C9C900929292006B6B6B0085858500787878009F9F
      9F00C5C5C500C2C2C200CCCCCC00858585005D5D5D009E9E9E00CDCDCD00B4B4
      B400B3B3B300B9B9B900C9C9C9009C9C9C0099999900A3A3A30093939300B4B4
      B4009A9A9A0091919100C1C1C100A3A3A3008F8F8F00BCBCBC00C1C1C100D8D8
      D800B7B7B7007C7C7C0096969600C6C6C6009C9C9C006C6C6C00B8B8B800AEAE
      AE00D2D2D200ABABAB006A6A6A00BBBBBB00C6C6C600B8B8B800BEBEBE00B3B3
      B300B6B6B600C1C1C100A6A6A6008B8B8B009393930094949400B0B0B000BDBD
      BD00AFAFAF00BBBBBB00BFBFBF00C6C6C600C8C8C800BCBCBC00B1B1B100A7A7
      A700858585006E6E6E0083838300B1B1B100A8A8A800B4B4B400BCBCBC00A8A8
      A800B4B4B400C1C1C100C1C1C100C0C0C000B0B0B00082828200ADADAD00B7B7
      B700B3B3B300ADADAD008E8E8E0090909000A9A9A9004B4B4B00474747009595
      9500D1D1D1007D7D7D0082828200ADADAD00A2A2A200A5A5A500959595008F8F
      8F004F4F4F0067676700CCCCCC00AFAFAF0086868600B5B5B500A4A4A4009292
      9200B7B7B700C9C9C9009797970063636300BBBBBB00ABABAB009C9C9C008787
      870086868600BDBDBD00CFCFCF00C1C1C100B2B2B200C0C0C000C3C3C300ADAD
      AD00A8A8A800B4B4B400797979009F9F9F008A8A8A007A7A7A00B3B3B3006666
      66005F5F5F0094949400BEBEBE00C5C5C500C0C0C000B0B0B000C3C3C300C7C7
      C700898989007B7B7B0097979700C7C7C700C2C2C200AFAFAF00CECECE008E8E
      8E0065656500B5B5B500D2D2D200BDBDBD00B9B9B9006666660080808000BEBE
      BE00ADADAD006A6A6A007E7E7E00B3B3B300BCBCBC00A3A3A30088888800C4C4
      C400B6B6B600A1A1A100B0B0B000AFAFAF00AFAFAF00A7A7A700B2B2B200A5A5
      A500A4A4A400B9B9B900B8B8B800434343004D4D4D0075757500A6A6A600B5B5
      B5006565650067676700C6C6C600C5C5C500B1B1B100B1B1B100A7A7A700AFAF
      AF00A1A1A100A5A5A500B7B7B700BFBFBF00AEAEAE00C0C0C000AAAAAA007373
      730065656500A9A9A900D0D0D000A3A3A300858585004C4C4C008E8E8E008383
      830089898900AEAEAE00B7B7B700B6B6B600BBBBBB00CECECE00777777007979
      7900A0A0A000A0A0A000ACACAC009A9A9A00C8C8C8008888880093939300C6C6
      C600ADADAD00616161008585850085858500B5B5B500B1B1B100747474009090
      90008787870093939300AEAEAE00818181006C6C6C0044444400A5A5A5007070
      700074747400ADADAD00B7B7B700B3B3B300ADADAD008E8E8E0090909000A9A9
      A9004B4B4B004747470095959500D1D1D1007D7D7D0082828200ADADAD00A2A2
      A200A5A5A500959595008F8F8F004F4F4F0067676700CCCCCC00AFAFAF008686
      8600B5B5B500A4A4A40092929200B7B7B700C9C9C9009797970063636300BBBB
      BB00ABABAB009C9C9C008787870086868600BDBDBD00CFCFCF00C1C1C100B2B2
      B200C0C0C000C3C3C300ADADAD00A8A8A800B4B4B400797979009F9F9F008A8A
      8A007A7A7A00B3B3B300666666005F5F5F0094949400BEBEBE00C5C5C500C0C0
      C000B0B0B000C3C3C300C7C7C700898989007B7B7B0097979700C7C7C700C2C2
      C200AFAFAF00CECECE008E8E8E0065656500B5B5B500D2D2D200BDBDBD00B9B9
      B9006666660080808000BEBEBE00ADADAD006A6A6A007E7E7E00B3B3B300BCBC
      BC00A3A3A30088888800C4C4C400B6B6B600A1A1A100B0B0B000AFAFAF00AFAF
      AF00A7A7A700B2B2B200A5A5A500A4A4A400B9B9B900B8B8B800434343004D4D
      4D0075757500A6A6A600B5B5B5006565650067676700C6C6C600C5C5C500B1B1
      B100B1B1B100A7A7A700AFAFAF00A1A1A100A5A5A500B7B7B700BFBFBF00AEAE
      AE00C0C0C000AAAAAA007373730065656500A9A9A900D0D0D000A3A3A3008585
      85004C4C4C008E8E8E008383830089898900AEAEAE00B7B7B700B6B6B600BBBB
      BB00CECECE007777770079797900A0A0A000A0A0A000ACACAC009A9A9A00C8C8
      C8008888880093939300C6C6C600ADADAD00616161008585850085858500B5B5
      B500B1B1B10074747400909090008787870093939300AEAEAE00818181006C6C
      6C0044444400A5A5A5007070700074747400ADADAD00B7B7B700B3B3B300ADAD
      AD008E8E8E0090909000A9A9A9004B4B4B004747470095959500D1D1D1007D7D
      7D0082828200ADADAD00A2A2A200A5A5A500959595008F8F8F004F4F4F006767
      6700CCCCCC00AFAFAF0086868600B5B5B500A4A4A40092929200B7B7B700C9C9
      C9009797970063636300BBBBBB00ABABAB009C9C9C008787870086868600BDBD
      BD00CFCFCF00C1C1C100B2B2B200C0C0C000C3C3C300ADADAD00A8A8A800B4B4
      B400797979009F9F9F008A8A8A007A7A7A00B3B3B300666666005F5F5F009494
      9400BEBEBE00C5C5C500C0C0C000B0B0B000C3C3C300C7C7C700898989007B7B
      7B0097979700C7C7C700C2C2C200AFAFAF00CECECE008E8E8E0065656500B5B5
      B500D2D2D200BDBDBD00B9B9B9006666660080808000BEBEBE00ADADAD006A6A
      6A007E7E7E00B3B3B300BCBCBC00A3A3A30088888800C4C4C400B6B6B600A1A1
      A100B0B0B000AFAFAF00AFAFAF00A7A7A700B2B2B200A5A5A500A4A4A400B9B9
      B900B8B8B800434343004D4D4D0075757500A6A6A600B5B5B500656565006767
      6700C6C6C600C5C5C500B1B1B100B1B1B100A7A7A700AFAFAF00A1A1A100A5A5
      A500B7B7B700BFBFBF00AEAEAE00C0C0C000AAAAAA007373730065656500A9A9
      A900B8B8B8007E7E7E0063636300CACACA007777770045454500ACACAC00C0C0
      C000C1C1C100AEAEAE008F8F8F008B8B8B0090909000A0A0A000ADADAD00B5B5
      B500BCBCBC00A0A0A0006363630087878700C2C2C2008585850062626200A3A3
      A300B9B9B9008888880075757500AAAAAA00AAAAAA00B3B3B300B9B9B9008B8B
      8B008D8D8D008F8F8F007D7D7D00A3A3A300D0D0D000D0D0D000979797009797
      9700959595007676760074747400B9B9B900CCCCCC00CACACA00919191008484
      84008A8A8A0047474700767676009C9C9C00CBCBCB00C7C7C700B5B5B500BEBE
      BE00BFBFBF008F8F8F003F3F3F006767670096969600B4B4B400A9A9A9008C8C
      8C00BEBEBE00C5C5C500BCBCBC00C6C6C600959595004F4F4F00ADADAD00C0C0
      C000A5A5A500A7A7A700A7A7A7004F4F4F0091919100C9C9C900BBBBBB00ACAC
      AC00898989009D9D9D00A9A9A900B4B4B400BABABA00A6A6A60097979700A5A5
      A500A7A7A7009D9D9D00A5A5A500B7B7B700B7B7B700A6A6A600929292009A9A
      9A00B6B6B600B7B7B7004E4E4E003E3E3E0081818100616161006F6F6F00B3B3
      B3009C9C9C00848484008C8C8C008A8A8A00B6B6B600BDBDBD009F9F9F00A2A2
      A200A9A9A9004949490044444400919191009E9E9E00A8A8A800CDCDCD00B0B0
      B00085858500434343004F4F4F00898989007C7C7C007777770085858500B4B4
      B400696969006B6B6B008D8D8D00929292008686860074747400BFBFBF007A7A
      7A008B8B8B00CDCDCD00B7B7B700808080009E9E9E0074747400A4A4A400A5A5
      A500686868009D9D9D00BBBBBB0097979700A6A6A600A8A8A800AEAEAE009C9C
      9C00AFAFAF00C5C5C500A3A3A300B8B8B8007E7E7E0063636300CACACA007777
      770045454500ACACAC00C0C0C000C1C1C100AEAEAE008F8F8F008B8B8B009090
      9000A0A0A000ADADAD00B5B5B500BCBCBC00A0A0A0006363630087878700C2C2
      C2008585850062626200A3A3A300B9B9B9008888880075757500AAAAAA00AAAA
      AA00B3B3B300B9B9B9008B8B8B008D8D8D008F8F8F007D7D7D00A3A3A300D0D0
      D000D0D0D0009797970097979700959595007676760074747400B9B9B900CCCC
      CC00CACACA0091919100848484008A8A8A0047474700767676009C9C9C00CBCB
      CB00C7C7C700B5B5B500BEBEBE00BFBFBF008F8F8F003F3F3F00676767009696
      9600B4B4B400A9A9A9008C8C8C00BEBEBE00C5C5C500BCBCBC00C6C6C6009595
      95004F4F4F00ADADAD00C0C0C000A5A5A500A7A7A700A7A7A7004F4F4F009191
      9100C9C9C900BBBBBB00ACACAC00898989009D9D9D00A9A9A900B4B4B400BABA
      BA00A6A6A60097979700A5A5A500A7A7A7009D9D9D00A5A5A500B7B7B700B7B7
      B700A6A6A600929292009A9A9A00B6B6B600B7B7B7004E4E4E003E3E3E008181
      8100616161006F6F6F00B3B3B3009C9C9C00848484008C8C8C008A8A8A00B6B6
      B600BDBDBD009F9F9F00A2A2A200A9A9A9004949490044444400919191009E9E
      9E00A8A8A800CDCDCD00B0B0B00085858500434343004F4F4F00898989007C7C
      7C007777770085858500B4B4B400696969006B6B6B008D8D8D00929292008686
      860074747400BFBFBF007A7A7A008B8B8B00CDCDCD00B7B7B700808080009E9E
      9E0074747400A4A4A400A5A5A500686868009D9D9D00BBBBBB0097979700A6A6
      A600A8A8A800AEAEAE009C9C9C00AFAFAF00C5C5C500A3A3A300B8B8B8007E7E
      7E0063636300CACACA007777770045454500ACACAC00C0C0C000C1C1C100AEAE
      AE008F8F8F008B8B8B0090909000A0A0A000ADADAD00B5B5B500BCBCBC00A0A0
      A0006363630087878700C2C2C2008585850062626200A3A3A300B9B9B9008888
      880075757500AAAAAA00AAAAAA00B3B3B300B9B9B9008B8B8B008D8D8D008F8F
      8F007D7D7D00A3A3A300D0D0D000D0D0D0009797970097979700959595007676
      760074747400B9B9B900CCCCCC00CACACA0091919100848484008A8A8A004747
      4700767676009C9C9C00CBCBCB00C7C7C700B5B5B500BEBEBE00BFBFBF008F8F
      8F003F3F3F006767670096969600B4B4B400A9A9A9008C8C8C00BEBEBE00C5C5
      C500BCBCBC00C6C6C600959595004F4F4F00ADADAD00C0C0C000A5A5A500A7A7
      A700A7A7A7004F4F4F0091919100C9C9C900BBBBBB00ACACAC00898989009D9D
      9D00A9A9A900B4B4B400BABABA00A6A6A60097979700A5A5A500A7A7A7009D9D
      9D00A5A5A500B7B7B700B7B7B700A6A6A600929292009A9A9A00B6B6B600B7B7
      B7004E4E4E003E3E3E0081818100616161006F6F6F00B3B3B3009C9C9C008484
      84008C8C8C008A8A8A00B6B6B600BDBDBD009F9F9F00A2A2A200A9A9A9004949
      49004444440091919100B3B3B3009B9B9B007E7E7E00B6B6B600AAAAAA009999
      9900A2A2A20072727200A2A2A2009898980075757500B4B4B4009B9B9B007777
      7700A6A6A600B6B6B600A4A4A40098989800AFAFAF00B6B6B600A9A9A9009B9B
      9B0080808000B3B3B300BDBDBD0095959500666666007B7B7B0097979700B4B4
      B400A2A2A20087878700AFAFAF00ACACAC006363630071717100BCBCBC00BABA
      BA009E9E9E009B9B9B00848484007979790074747400A9A9A900DBDBDB00C0C0
      C000B2B2B200CDCDCD007C7C7C004B4B4B00A5A5A500BEBEBE009F9F9F00C2C2
      C200CACACA00BDBDBD00A9A9A9009C9C9C0092929200ABABAB0096969600C5C5
      C500C0C0C000A4A4A400ACACAC00BABABA00C8C8C800BEBEBE00A8A8A8006767
      67008888880046464600A6A6A600D1D1D1008A8A8A0043434300656565007676
      7600A5A5A500ADADAD0085858500A7A7A700B5B5B500A5A5A500B7B7B700AEAE
      AE00B0B0B000B3B3B300696969007676760096969600797979006D6D6D00BABA
      BA00B8B8B800C5C5C500C2C2C200B7B7B7006C6C6C00636363006C6C6C006464
      64006A6A6A00A0A0A0009292920063636300656565006666660092929200BDBD
      BD00B4B4B400A3A3A300D0D0D000B7B7B700C3C3C300C1C1C100A8A8A8009999
      99008F8F8F00BEBEBE00878787008C8C8C00BFBFBF00BDBDBD00727272006666
      66006F6F6F008E8E8E0098989800A5A5A5008282820080808000B4B4B400C5C5
      C500CECECE00D4D4D400A2A2A20067676700A1A1A100CDCDCD00A9A9A9006464
      6400A0A0A000CCCCCC009C9C9C00ABABAB00CACACA0072727200494949008080
      8000C9C9C90099999900949494009C9C9C00B0B0B000B3B3B3009B9B9B007E7E
      7E00B6B6B600AAAAAA0099999900A2A2A20072727200A2A2A200989898007575
      7500B4B4B4009B9B9B0077777700A6A6A600B6B6B600A4A4A40098989800AFAF
      AF00B6B6B600A9A9A9009B9B9B0080808000B3B3B300BDBDBD00959595006666
      66007B7B7B0097979700B4B4B400A2A2A20087878700AFAFAF00ACACAC006363
      630071717100BCBCBC00BABABA009E9E9E009B9B9B0084848400797979007474
      7400A9A9A900DBDBDB00C0C0C000B2B2B200CDCDCD007C7C7C004B4B4B00A5A5
      A500BEBEBE009F9F9F00C2C2C200CACACA00BDBDBD00A9A9A9009C9C9C009292
      9200ABABAB0096969600C5C5C500C0C0C000A4A4A400ACACAC00BABABA00C8C8
      C800BEBEBE00A8A8A800676767008888880046464600A6A6A600D1D1D1008A8A
      8A00434343006565650076767600A5A5A500ADADAD0085858500A7A7A700B5B5
      B500A5A5A500B7B7B700AEAEAE00B0B0B000B3B3B30069696900767676009696
      9600797979006D6D6D00BABABA00B8B8B800C5C5C500C2C2C200B7B7B7006C6C
      6C00636363006C6C6C00646464006A6A6A00A0A0A00092929200636363006565
      65006666660092929200BDBDBD00B4B4B400A3A3A300D0D0D000B7B7B700C3C3
      C300C1C1C100A8A8A800999999008F8F8F00BEBEBE00878787008C8C8C00BFBF
      BF00BDBDBD0072727200666666006F6F6F008E8E8E0098989800A5A5A5008282
      820080808000B4B4B400C5C5C500CECECE00D4D4D400A2A2A20067676700A1A1
      A100CDCDCD00A9A9A90064646400A0A0A000CCCCCC009C9C9C00ABABAB00CACA
      CA00727272004949490080808000C9C9C90099999900949494009C9C9C00B0B0
      B000B3B3B3009B9B9B007E7E7E00B6B6B600AAAAAA0099999900A2A2A2007272
      7200A2A2A2009898980075757500B4B4B4009B9B9B0077777700A6A6A600B6B6
      B600A4A4A40098989800AFAFAF00B6B6B600A9A9A9009B9B9B0080808000B3B3
      B300BDBDBD0095959500666666007B7B7B0097979700B4B4B400A2A2A2008787
      8700AFAFAF00ACACAC006363630071717100BCBCBC00BABABA009E9E9E009B9B
      9B00848484007979790074747400A9A9A900DBDBDB00C0C0C000B2B2B200CDCD
      CD007C7C7C004B4B4B00A5A5A500BEBEBE009F9F9F00C2C2C200CACACA00BDBD
      BD00A9A9A9009C9C9C0092929200ABABAB0096969600C5C5C500C0C0C000A4A4
      A400ACACAC00BABABA00C8C8C800BEBEBE00A8A8A80067676700888888004646
      4600A6A6A600D1D1D1008A8A8A00434343006565650076767600A5A5A500ADAD
      AD0085858500A7A7A700B5B5B500A5A5A500B7B7B700AEAEAE00B0B0B000B3B3
      B300696969007676760096969600797979006D6D6D00BABABA00B8B8B800C5C5
      C500C2C2C200B7B7B7006C6C6C00636363006C6C6C00646464006A6A6A00A0A0
      A0009292920063636300656565006666660092929200BDBDBD00B4B4B400A3A3
      A300D0D0D000B7B7B700C3C3C300C1C1C100}
    TabOrder = 1
    object BitBtn2: TBitBtn
      Left = 194
      Top = 2
      Width = 97
      Height = 22
      Caption = #20303#38498#22788#25910#36153
      TabOrder = 0
      Visible = False
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777770000000000000770777777777777707070000000000
        0707070EFEFEFEFE0707070F8888888F0707070EFEFEFEFE0707070F8888888F
        0707070EFEFEFEFE0707070F888FEFEF0707070EFEFEFEFE0707070000000000
        0707077777777777770770000000000000777777777777777777}
    end
  end
  object XPMenu1: TXPMenu
    DimLevel = 30
    GrayLevel = 10
    Font.Charset = GB2312_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = clBtnFace
    IconBackColor = clBtnFace
    MenuBarColor = clBtnFace
    SelectColor = clHighlight
    SelectBorderColor = clHighlight
    SelectFontColor = clMenuText
    DisabledColor = clInactiveCaption
    SeparatorColor = clBtnFace
    CheckedColor = clHighlight
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = True
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = False
    Active = True
    Left = 416
    Top = 16
  end
end
