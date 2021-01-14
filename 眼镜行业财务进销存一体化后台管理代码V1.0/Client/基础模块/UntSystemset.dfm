inherited fmSystemset: TfmSystemset
  Left = 32
  Top = 44
  Caption = #29992#25143#26435#38480
  ClientHeight = 466
  ClientWidth = 743
  Menu = MainMenu1
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 466
    Align = alLeft
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    object TreeBase: TTreeView
      Left = 2
      Top = 2
      Width = 197
      Height = 462
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
    Left = 201
    Top = 0
    Width = 88
    Height = 466
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object btnAdd: TBitBtn
      Left = 6
      Top = 8
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 0
      OnClick = btnAddClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
    end
    object btnEdit: TBitBtn
      Left = 6
      Top = 36
      Width = 75
      Height = 25
      Caption = #20462#25913
      TabOrder = 1
      OnClick = btnEditClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADA000000000000000D088888888888880A080808080808080D000000000000
        000AA0EEEEEEEE0DADADD0E0000EE0DADADAA0E0A0EE00ADADADD0E00EE0D00A
        DADAA0E0EE0DA000ADADD0EEE0DAD0B70ADAA0EE0DADA0B80DADD0E0DADADA0B
        70DAA00DADADAD0B00ADD0DADADADAD0110AADADADADADA000AD}
    end
    object btnDelete: TBitBtn
      Left = 6
      Top = 65
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 2
      OnClick = btnDeleteClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF33339993707399933333773337F3777FF3399933000339
        9933377333777F3377F3399333707333993337733337333337FF993333333333
        399377F33333F333377F993333303333399377F33337FF333373993333707333
        333377F333777F333333993333101333333377F333777F3FFFFF993333000399
        999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
        99933773FF777F3F777F339993707399999333773F373F77777F333999999999
        3393333777333777337333333999993333333333377777333333}
      NumGlyphs = 2
    end
    object btnCancel: TBitBtn
      Left = 5
      Top = 431
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 3
      OnClick = btnCancelClick
      Kind = bkCancel
    end
  end
  object GroupBox1: TGroupBox
    Left = 289
    Top = 0
    Width = 454
    Height = 466
    Align = alClient
    Caption = #26435#38480#35774#32622#34920
    TabOrder = 2
    object Pc1: TPageControl
      Left = 4
      Top = 15
      Width = 443
      Height = 442
      ActivePage = TabSheet2
      Images = ImageList1
      TabIndex = 1
      TabOrder = 0
      OnChange = Pc1Change
      object TabSheet1: TTabSheet
        Caption = #21518#21488#31649#29702
        object RdG: TRadioGroup
          Left = 260
          Top = 8
          Width = 172
          Height = 393
          Caption = #21151#33021#34920
          ItemIndex = 0
          Items.Strings = (
            #37319#36141#31649#29702
            #24211#23384#31649#29702
            #37197#36865#31649#29702
            #22522#26412#20449#24687
            #31995#32479#35774#32622
            #20915#31574#20998#26512
            #36130#21153#31649#29702)
          TabOrder = 0
          OnClick = RdGClick
        end
        object GridBase: TStringGrid
          Left = 1
          Top = 8
          Width = 254
          Height = 403
          ColCount = 3
          Ctl3D = False
          RowCount = 2
          ParentCtl3D = False
          TabOrder = 1
          OnDblClick = GridbaseDblClick
          OnDrawCell = GridBaseDrawCell
          OnSelectCell = GridbaseSelectCell
          ColWidths = (
            64
            100
            72)
        end
      end
      object TabSheet2: TTabSheet
        Caption = #38376#24215#38144#21806
        ImageIndex = 1
        object GridB: TStringGrid
          Left = 0
          Top = 8
          Width = 256
          Height = 401
          ColCount = 3
          Ctl3D = False
          RowCount = 2
          ParentCtl3D = False
          TabOrder = 0
          OnDblClick = GridBDblClick
          OnDrawCell = GridBaseDrawCell
          OnSelectCell = GridbaseSelectCell
          ColWidths = (
            64
            110
            73)
        end
        object RDg2: TRadioGroup
          Left = 260
          Top = 8
          Width = 174
          Height = 393
          Caption = #21151#33021#34920
          TabOrder = 1
          OnClick = RDg2Click
        end
      end
    end
    object RBAll: TRadioButton
      Left = 200
      Top = 16
      Width = 49
      Height = 17
      Caption = #20840#36873
      TabOrder = 1
      OnClick = RBAllClick
    end
    object RBclear: TRadioButton
      Left = 288
      Top = 16
      Width = 49
      Height = 17
      Caption = #20840#28165
      TabOrder = 2
      OnClick = RBclearClick
    end
  end
  object ImageList1: TImageList
    Left = 320
    Top = 24
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000C51CC51C
      C51CC51CC51CC51CC51CC51CC618000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E749E549D004BB7BFB7F
      FC7FBA7FFC7FDB7FDB7FFC7F6B2900000000000000000000B47F2A7F876A6362
      2556000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C96E6E7FF208647FB27B
      BA7F340ADB7F0B7E0B7EBB7B6B290000000000000000836A74778E7F8F7F8F7F
      B07FD07F287B475A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C96E6F7F3211407E7573
      BB7F1502DA7FA77D745ABB7B6B290000000000000000836AA36AD77FD17FB07F
      F37FE458D07FB17F836A00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C96ED17F3215D44A5867
      DB7B9466BB775A6BF95EBB7B6B2900000000000000008366E77ABA7BF27FF47F
      2050A250F37FF27FF67F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C96EF37F5315603E103F
      DC7B3529FC7B7D6F1252BB7B6B29000000000000000083662B7F2D77F87F3277
      F47FAE72737BF47FFA7F665E0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C77F67F74115F4F3D4B
      3D475E4B3D471C433D473E436B29000000000000000083666D7F6E7F2B7B2B77
      3277FE7FE354F87FD97FFD7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000917B0B7313325A2A5A26
      5A265A265926181E3A22BA0D000000000000000000008366D07FD27FD27FD27F
      D27F2B776150F97F707F707F435E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F57FF37FF37FD07F5077
      967BFB7F0000DC7F0000000000000000000000000000A56AF27FF37FF37FF67F
      F57FF57FF27FB37F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006066F57FF37F977B6066
      51777177957B6066000000000000000000000000000000000000FE7FFB7F057F
      00000000E676257F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000F803FFFF00000000C003E0FF00000000C003C01F00000000
      C003C00F00000000C003C00F00000000C003C00700000000C003C00700000000
      C007C00300000000C05FC01F00000000C01FF19F00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object cdsdata: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 168
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    OwnerDraw = True
    Left = 416
    Top = 96
    object S1: TMenuItem
      Caption = #31995#32479#31649#29702'(&S)'
      Visible = False
      object N38: TMenuItem
        Caption = #31995#32479#35774#32622
        ImageIndex = 26
      end
      object mmi_SetTime: TMenuItem
        Caption = #31995#32479#26102#38388#35774#32622
        ImageIndex = 52
      end
      object mmi_PrinterSetup: TMenuItem
        Caption = #25171#21360#26426#35774#32622
        ImageIndex = 19
      end
      object mmi_QuickCode: TMenuItem
        Caption = #24555#36895#32534#30721#29983#25104
        ImageIndex = 39
      end
      object N37: TMenuItem
        Caption = '-'
      end
      object mmi_kqday: TMenuItem
        Caption = #32771#21220#31614#21040
        ImageIndex = 59
      end
      object mmi_changePwd: TMenuItem
        Caption = #21475#20196#20462#25913
        ImageIndex = 36
      end
      object N36: TMenuItem
        Caption = #38646#21806#20132#29677
        ImageIndex = 30
      end
      object mmi_ChangeOperate: TMenuItem
        Caption = #26356#25442#25805#20316#21592
        ImageIndex = 36
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object mmi_close: TMenuItem
        Caption = #20851#38381#31995#32479
        ImageIndex = 37
      end
    end
    object S2: TMenuItem
      Caption = #38646#21806#31649#29702'(&R)'
      Visible = False
      object mmi_Agio: TMenuItem
        Caption = #38646#21806#25171#25240
        ImageIndex = 10
      end
      object mnt_Retail: TMenuItem
        Caption = #38646#21806#25910#27454
        ImageIndex = 60
      end
      object mmi_saleth: TMenuItem
        Caption = #26410#21462#20214#36864#36135
        ImageIndex = 4
      end
      object mmi_something: TMenuItem
        Caption = #24050#21462#20214#36864#36135
        ImageIndex = 2
      end
      object mmi_salejb: TMenuItem
        Caption = #38646#21806#20132#29677
        ImageIndex = 17
      end
      object mmi_Debt: TMenuItem
        Caption = #27424#27454#22788#29702
        ImageIndex = 58
      end
      object mmi_CheckDraft: TMenuItem
        Caption = #19994#21153#23457#26680
        ImageIndex = 18
      end
      object mmi_Todaymoney: TMenuItem
        Caption = #29616#37329#30424#28857
        ImageIndex = 46
      end
      object mmi_RetailPrint: TMenuItem
        Caption = #38646#21806#25910#27454#34917#25171
        ImageIndex = 20
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object mmi_QueryDebit: TMenuItem
        Caption = #27424#27454#21333#25454#26597#35810
        ImageIndex = 22
      end
      object mmi_doback_Qry: TMenuItem
        Caption = #24050#21462#20214#36864#36135#26597#35810
        ImageIndex = 22
      end
      object mmi_back_Qry: TMenuItem
        Caption = #26410#21462#20214#36864#36135#26597#35810
        ImageIndex = 22
      end
      object N51: TMenuItem
        Caption = #38646#21806#26085#26376#24180#25253#34920
        ImageIndex = 22
      end
    end
    object D1: TMenuItem
      Caption = #26085#24120#19994#21153'(&D)'
      Visible = False
      object mmi_yoptome: TMenuItem
        Caption = #39564'       '#20809
        ImageIndex = 65
      end
      object mmi_Order: TMenuItem
        Caption = #38646#21806#23450#21333
        ImageIndex = 26
      end
      object mmi_sale: TMenuItem
        Caption = #38646#37197#23450#21333
        ImageIndex = 26
      end
      object mmi_BackGround: TMenuItem
        Caption = #21518#21488#22788#29702
        ImageIndex = 27
      end
      object mmi_outground: TMenuItem
        Caption = #22806#21152#24037#31649#29702
        ImageIndex = 61
      end
      object mmi_Gain: TMenuItem
        Caption = #39038#23458#21462#38236
        ImageIndex = 18
      end
      object mmi_EndCheck: TMenuItem
        Caption = #32456'        '#26816
        ImageIndex = 44
      end
      object mmi_ordergood: TMenuItem
        Caption = #39044#21806#35746#21333
        ImageIndex = 47
      end
      object mmi_AwardGuest: TMenuItem
        Caption = #38646#26143#36192#36865
        ImageIndex = 21
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object mmi_OptometryQuery: TMenuItem
        Caption = #39564#20809#36164#26009#26597#35810#32479#35745
        ImageIndex = 22
      end
      object mmi_OrderQuery: TMenuItem
        Caption = #38646#21806#38646#37197#23450#21333#26597#35810
        ImageIndex = 22
      end
      object mmi_Yushou_qry: TMenuItem
        Caption = #39044#21806#35746#21333#26597#35810
        ImageIndex = 22
      end
      object mmi_debit_Qry: TMenuItem
        Caption = #35823#26399#23450#21333#26597#35810
        ImageIndex = 22
      end
      object mmi_backgroud_qry: TMenuItem
        Caption = #21518#21488#22788#29702#26597#35810
        ImageIndex = 22
      end
      object mmi_outmake_qry: TMenuItem
        Caption = #22806#21152#24037#26597#35810#32479#35745
        ImageIndex = 22
      end
      object mmi_notgain_qry: TMenuItem
        Caption = #26410#21462#38236#23450#21333#26597#30475
        ImageIndex = 22
      end
      object mmi_gain_qry: TMenuItem
        Caption = #21462#38236#35760#24405#26597#35810
        ImageIndex = 22
      end
      object N23: TMenuItem
        Caption = #39038#23458#21462#38236#26597#35810
        ImageIndex = 22
      end
      object mmi_award_qry: TMenuItem
        Caption = #38646#26143#36192#36865#26597#35810
        ImageIndex = 22
      end
    end
    object O1: TMenuItem
      Caption = #24211#23384#31649#29702'(&K)'
      Visible = False
      object mmi_overflow: TMenuItem
        Caption = #21830#21697#25253#28322
        ImageIndex = 18
      end
      object mmi_scrap: TMenuItem
        Caption = #21830#21697#25253#25439
        ImageIndex = 16
      end
      object N47: TMenuItem
        Caption = #24211#23384#30424#28857
        ImageIndex = 54
        object mmi_pan: TMenuItem
          Caption = #33829#19994#20013#30424#28857
          ImageIndex = 4
        end
        object mmi_stopPan: TMenuItem
          Caption = #20572#19994#30424#28857
          ImageIndex = 5
        end
        object mmi_Pan_qry: TMenuItem
          Caption = #33829#19994#20013#30424#28857#32479#35745
          ImageIndex = 19
        end
        object mmi_stopPan_Qry: TMenuItem
          Caption = #20572#19994#30424#28857#32479#35745
          ImageIndex = 52
        end
      end
      object N25: TMenuItem
        Caption = '-'
      end
      object N31: TMenuItem
        Caption = #24211#23384#25253#35686#31649#29702
        ImageIndex = 51
        object mmi_WarnLimit: TMenuItem
          Caption = #19978#19979#38480#25253#35686#35774#32622
          ImageIndex = 32
        end
        object N45: TMenuItem
          Caption = #24211#23384#19978#38480#25253#35686
          ImageIndex = 46
        end
        object N46: TMenuItem
          Caption = #24211#23384#19979#38480#25253#35686
          ImageIndex = 46
        end
      end
      object N42: TMenuItem
        Caption = #24211#23384#29366#20917
        ImageIndex = 33
        object mmi_stockgoods: TMenuItem
          Caption = #24211#23384#25152#26377#21830#21697#20449#24687#26597#35810#32479#35745
          ImageIndex = 29
        end
        object mmi_Agood_stockQry: TMenuItem
          Caption = #21333#21697#20840#24215#24211#23384#26597#35810
          ImageIndex = 33
        end
      end
      object mmiQueryScrap: TMenuItem
        Caption = #21830#21697#25253#25439#26597#35810
        ImageIndex = 54
      end
      object mmiQryOverflow: TMenuItem
        Caption = #21830#21697#25253#28322#26597#35810
        ImageIndex = 54
      end
      object N28: TMenuItem
        Caption = #22871#39184#21830#21697#26597#35810
        ImageIndex = 54
      end
      object N29: TMenuItem
        Caption = #36192#21697#26597#35810
        ImageIndex = 54
      end
    end
    object P1: TMenuItem
      Caption = #37197#36865#31649#29702'(&P)'
      Visible = False
      object mmi_shopquehuo: TMenuItem
        Caption = #32570#36135#30003#35831#21333
        ImageIndex = 56
      end
      object mmi_AskGoodPlan: TMenuItem
        Caption = #37197#36865#30003#35831#21333
        ImageIndex = 62
      end
      object mmi_PosSendBill: TMenuItem
        Caption = #37197#36865#25910#36135#21333
        ImageIndex = 61
      end
      object mmi_postQuest: TMenuItem
        Caption = #37197#36865#36864#36135#21333
        ImageIndex = 16
      end
      object mmi_ReceiveGood: TMenuItem
        Caption = #30452#21457#25910#36135#21333
        ImageIndex = 12
      end
      object N52: TMenuItem
        Caption = '-'
      end
      object mmi_Qrygetgood: TMenuItem
        Caption = #21830#21697#38656#27714#26597#35810
        ImageIndex = 20
      end
      object mmi_zfgetgoods_qry: TMenuItem
        Caption = #30452#21457#25910#36135#26597#35810
        ImageIndex = 20
      end
      object mmi_psgetgoods_qry: TMenuItem
        Caption = #37197#36865#25910#36135#26597#35810
        ImageIndex = 20
      end
      object mmi_psbackgood_qry: TMenuItem
        Caption = #37197#36865#36864#36135#26597#35810
        ImageIndex = 20
      end
    end
    object N4: TMenuItem
      Caption = #36130#21153#31649#29702'(&C)'
      Visible = False
      object mmi_MoneyBill: TMenuItem
        Caption = #29616#37329#36153#29992#21333
        ImageIndex = 64
      end
      object mmi_NormalBill: TMenuItem
        Caption = #19968#33324#36153#29992#21333
        ImageIndex = 25
      end
      object mmi_OtherBill: TMenuItem
        Caption = #20854#20182#25910#20837
        ImageIndex = 24
      end
      object mmi_DTFS: TMenuItem
        Caption = #24453#25674#36153#29992#21457#29983
        ImageIndex = 17
      end
      object MMI_DTTX: TMenuItem
        Caption = #24453#25674#36153#29992#25674#38144
        ImageIndex = 30
      end
      object N50: TMenuItem
        Caption = '-'
      end
      object mmi_cwQry1: TMenuItem
        Caption = #29616#37329#36153#29992#21333#26597#35810
        ImageIndex = 22
      end
      object mmi_cwQry2: TMenuItem
        Caption = #19968#33324#36153#29992#21333#26597#35810
        ImageIndex = 22
      end
      object mmi_cwQry3: TMenuItem
        Caption = #20854#20182#25910#20837#26597#35810
        ImageIndex = 22
      end
      object mmi_cwQry4: TMenuItem
        Caption = #24453#25674#36153#29992#21457#29983#26597#35810
        ImageIndex = 22
      end
      object mmi_cwQry5: TMenuItem
        Caption = #24453#25674#36153#29992#25674#38144#26597#35810
        ImageIndex = 22
      end
    end
    object N9: TMenuItem
      Caption = #23458#25143#26381#21153'(G)'
      Visible = False
      object mmi_SingleGuest: TMenuItem
        Caption = #38646#26143#39038#23458#36164#26009#24405#20837#32534#36753
        ImageIndex = 39
      end
      object mmi_jifen: TMenuItem
        Caption = #31215#20998#31649#29702
        ImageIndex = 28
      end
      object mmi_water: TMenuItem
        Caption = #20813#36153#26381#21153
        ImageIndex = 25
      end
      object nni_Guestviisit: TMenuItem
        Caption = #39038#23458#22238#35775
        ImageIndex = 45
      end
      object mmi_guestAdvice: TMenuItem
        Caption = #39038#23458#25237#35785#24314#35758
        ImageIndex = 26
      end
      object N20: TMenuItem
        Caption = '-'
      end
      object mmi_Optometry: TMenuItem
        Caption = #39038#23458#39564#20809#36164#26009#26597#35810
        ImageIndex = 22
      end
      object mmi_GuestAllInfo: TMenuItem
        Caption = #39038#23458#36164#26009#32508#21512#26597#35810
        ImageIndex = 22
      end
      object mmi_SingleGuestQuery: TMenuItem
        Caption = #38646#26143#39038#23458#36164#26009#26597#35810#32479#35745
        ImageIndex = 29
      end
    end
    object N12: TMenuItem
      Caption = #24215#38754#31649#29702'(&T)'
      Visible = False
      object mmi_ShopBbs: TMenuItem
        Caption = #20844#21578#31649#29702
        ImageIndex = 44
      end
      object mmi_kaoqing: TMenuItem
        Caption = #32771#21220#31649#29702
        ImageIndex = 52
      end
      object mmi_yuangong: TMenuItem
        Caption = #21592#24037#31649#29702
        ImageIndex = 64
      end
      object mmi_ShopLocalInfo: TMenuItem
        Caption = #38376#24215#22522#26412#36164#26009
        Hint = 'mmi_ShopLocalInfo'
        ImageIndex = 15
      end
      object N58: TMenuItem
        Caption = '-'
      end
      object N33: TMenuItem
        Caption = #32771#21220#25968#25454#32479#35745
        ImageIndex = 19
      end
      object N49: TMenuItem
        Caption = #21592#24037#23398#21382#20998#24067
        ImageIndex = 10
      end
      object N59: TMenuItem
        Caption = #21592#24037#24180#40836#20998#24067
        ImageIndex = 10
      end
      object N60: TMenuItem
        Caption = #21592#24037#19987#19994#20998#24067
        ImageIndex = 10
      end
      object N61: TMenuItem
        Caption = #21592#24037#22870#24809#35760#24405
        ImageIndex = 10
      end
    end
    object N11: TMenuItem
      Caption = #20915#31574#20998#26512'(Q)'
      Visible = False
      object mmi_stockChange: TMenuItem
        Caption = #20840#33021#36827#38144#23384#21464#21160#34920
        ImageIndex = 58
      end
      object N41: TMenuItem
        Caption = '-'
      end
      object mmi_SaleSort: TMenuItem
        Caption = #32844#21592#38144#21806#25490#34892#27036
        ImageIndex = 63
      end
      object mmi_GoodSellSort: TMenuItem
        Caption = #21830#21697#38144#21806#25490#34892#27036
        ImageIndex = 35
      end
      object mmi_saleTypesort: TMenuItem
        Caption = #21830#21697#38144#21806#20998#31867#25490#34892#27036
        ImageIndex = 39
      end
      object mmi_SglGoodSort: TMenuItem
        Caption = #21830#21697#38144#21806#21333#21697#20998#26512
        ImageIndex = 63
      end
      object mmi_CustomerGraph: TMenuItem
        Caption = #39038#23458#20915#31574#20998#26512
        ImageIndex = 35
      end
      object N39: TMenuItem
        Caption = '-'
      end
      object mmi_PayTotal: TMenuItem
        Caption = #20184#27454#32479#35745#20998#26512
        ImageIndex = 49
        Visible = False
      end
    end
    object N2: TMenuItem
      Caption = #24110#21161'(&H)'
      Visible = False
      object mmi_Caculator: TMenuItem
        Caption = #35745#31639#22120
        ImageIndex = 57
      end
      object mmi_YCanlendar: TMenuItem
        Caption = #20892#21382#26085#21382
        ImageIndex = 47
      end
      object mmi_AlarmClock: TMenuItem
        Caption = #30005#23376#25552#37266#31807
        ImageIndex = 55
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object N1: TMenuItem
        Caption = #31995#32479#24110#21161
        ImageIndex = 53
      end
      object mmi_ShowTip: TMenuItem
        Caption = #27599#26085#19968#24086
        ImageIndex = 14
      end
      object mmi_About: TMenuItem
        Caption = #20851#20110#31995#32479
        ImageIndex = 34
      end
    end
    object N3: TMenuItem
      Caption = #29305#27530#26435#38480
      Visible = False
      object N19: TMenuItem
        Caption = #25253#25439#21333
      end
      object N26: TMenuItem
        Caption = #25253#28322#21333
      end
      object N34: TMenuItem
        Caption = #37197#36865#30003#35831
      end
      object N40: TMenuItem
        Caption = #37197#36865#36864#36135
      end
      object N44: TMenuItem
        Caption = #30452#21457#25910#36135
      end
      object N53: TMenuItem
        Caption = #29616#37329#36153#29992#21333
      end
      object N54: TMenuItem
        Caption = #19968#33324#36153#29992#21333
      end
      object N55: TMenuItem
        Caption = #20854#23427#25910#20837
      end
      object N56: TMenuItem
        Caption = #24453#25674#36153#29992#21457#29983#21333
      end
      object N57: TMenuItem
        Caption = #24453#25674#36153#29992#25674#38144#21333
      end
      object N30: TMenuItem
        Caption = #38646#26143#36192#36865
      end
      object N32: TMenuItem
        Caption = #32456#26816
      end
      object N5: TMenuItem
        Caption = #37197#36865#25910#36135#31614#25209
      end
      object N6: TMenuItem
        Caption = #24050#21462#20214#36864#36135
      end
      object N7: TMenuItem
        Caption = #26410#21462#20214#36864#36135
      end
      object N8: TMenuItem
        Caption = #27424#27454#22788#29702
      end
    end
  end
end
