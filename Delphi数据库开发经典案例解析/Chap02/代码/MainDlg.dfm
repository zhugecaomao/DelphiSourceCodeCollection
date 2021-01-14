object main: Tmain
  Left = 422
  Top = 201
  BorderStyle = bsDialog
  Caption = #20154#21147#36164#28304#31649#29702
  ClientHeight = 493
  ClientWidth = 642
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 642
    Height = 470
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 632
      Height = 460
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #26426#26500#35774#32622#21450#32534#30721
        object Label1: TLabel
          Left = 280
          Top = 32
          Width = 63
          Height = 13
          AutoSize = False
          Caption = #21333#20301#21517#31216'     '
        end
        object Label2: TLabel
          Left = 280
          Top = 64
          Width = 87
          Height = 13
          AutoSize = False
          Caption = #19978#32423#21333#20301#21517#31216'     '
        end
        object Label3: TLabel
          Left = 280
          Top = 96
          Width = 75
          Height = 13
          AutoSize = False
          Caption = #26412#21333#20301#32534#21495'     '
        end
        object Label4: TLabel
          Left = 280
          Top = 160
          Width = 81
          Height = 13
          AutoSize = False
          Caption = #19978#32423#21333#20301#32534#21495'      '
        end
        object Label61: TLabel
          Left = 280
          Top = 128
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #26412#32423#32534#30721
        end
        object TreeView1: TTreeView
          Left = 8
          Top = 8
          Width = 233
          Height = 401
          Indent = 19
          ReadOnly = True
          TabOrder = 0
          OnClick = TreeView1Click
        end
        object Edit1: TEdit
          Left = 368
          Top = 32
          Width = 177
          Height = 21
          TabOrder = 1
        end
        object Edit2: TEdit
          Left = 368
          Top = 64
          Width = 177
          Height = 21
          ReadOnly = True
          TabOrder = 2
        end
        object Edit3: TEdit
          Left = 368
          Top = 96
          Width = 177
          Height = 21
          ReadOnly = True
          TabOrder = 3
        end
        object Edit4: TEdit
          Left = 368
          Top = 160
          Width = 177
          Height = 21
          ReadOnly = True
          TabOrder = 4
        end
        object Button12: TButton
          Left = 280
          Top = 200
          Width = 113
          Height = 25
          Caption = #26174#31034#26426#26500#35774#32622
          TabOrder = 5
          OnClick = Button12Click
        end
        object Button13: TButton
          Left = 280
          Top = 232
          Width = 113
          Height = 25
          Caption = #22686#21152#19968#20010#23376#33410#28857
          Enabled = False
          TabOrder = 6
          OnClick = Button13Click
        end
        object Button14: TButton
          Left = 280
          Top = 296
          Width = 113
          Height = 25
          Caption = #21024#38500#24403#21069#33410#28857
          Enabled = False
          TabOrder = 7
          OnClick = Button14Click
        end
        object Button15: TButton
          Left = 280
          Top = 328
          Width = 113
          Height = 25
          Caption = #20462#25913#33410#28857#21517#31216
          Enabled = False
          TabOrder = 8
          OnClick = Button15Click
        end
        object Button16: TButton
          Left = 280
          Top = 360
          Width = 113
          Height = 25
          Caption = #20445#23384#35774#32622
          Enabled = False
          TabOrder = 9
          OnClick = Button16Click
        end
        object Edit27: TEdit
          Left = 368
          Top = 128
          Width = 177
          Height = 21
          TabOrder = 10
        end
        object Button6: TButton
          Left = 280
          Top = 264
          Width = 113
          Height = 25
          Caption = #22686#21152#20026#21516#32423#33410#28857
          Enabled = False
          TabOrder = 11
          OnClick = Button6Click
        end
      end
      object TabSheet2: TTabSheet
        Caption = #26426#26500#20449#24687#31649#29702
        OnShow = TabSheet2Show
        object DBGrid1: TDBGrid
          Left = 0
          Top = 120
          Width = 625
          Height = 289
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = #20869#37096#32534#21495
              Visible = True
            end
            item
              Expanded = False
              FieldName = #21333#20301#32534#21495
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = #21333#20301#21517#31216
              Width = 175
              Visible = True
            end
            item
              Expanded = False
              FieldName = #25340#38899#32534#30721
              Visible = True
            end
            item
              Expanded = False
              FieldName = #21333#20301#22320#22336
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = #21333#20301#30005#35805#21495#30721
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = #24320#25143#38134#34892
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = #24080#21495
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = #24320#25143#20840#31216
              Width = 300
              Visible = True
            end>
        end
        object DBNavigator1: TDBNavigator
          Left = 0
          Top = 88
          Width = 225
          Height = 25
          DataSource = DataSource1
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          TabOrder = 1
        end
        object Panel7: TPanel
          Left = 8
          Top = 8
          Width = 609
          Height = 73
          BorderStyle = bsSingle
          TabOrder = 2
          object Label36: TLabel
            Left = 32
            Top = 16
            Width = 65
            Height = 13
            AutoSize = False
            Caption = #21333#20301#21517#31216'    '
          end
          object Edit31: TEdit
            Left = 104
            Top = 16
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object Button8: TButton
            Left = 264
            Top = 16
            Width = 75
            Height = 25
            Caption = #26597#35810
            TabOrder = 1
            OnClick = Button8Click
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #32844#21592#20449#24687#31649#29702
        OnShow = TabSheet3Show
        object PageControl2: TPageControl
          Left = 0
          Top = 0
          Width = 620
          Height = 417
          ActivePage = TabSheet5
          TabOrder = 0
          object TabSheet5: TTabSheet
            Caption = #32844#21592#20449#24687#32500#25252
            object Label5: TLabel
              Left = 8
              Top = 168
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #32844#21592#32534#21495
            end
            object Label6: TLabel
              Left = 136
              Top = 168
              Width = 33
              Height = 13
              AutoSize = False
              Caption = #22995#21517
            end
            object Label7: TLabel
              Left = 264
              Top = 168
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #22995#21517#31616#30721
            end
            object Label8: TLabel
              Left = 336
              Top = 168
              Width = 33
              Height = 13
              AutoSize = False
              Caption = #24615#21035
            end
            object Label9: TLabel
              Left = 392
              Top = 168
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #20986#29983#26085#26399
            end
            object Label10: TLabel
              Left = 472
              Top = 168
              Width = 33
              Height = 13
              AutoSize = False
              Caption = #24180#40836
            end
            object Label11: TLabel
              Left = 528
              Top = 168
              Width = 33
              Height = 13
              AutoSize = False
              Caption = #31821#36143
            end
            object Label12: TLabel
              Left = 8
              Top = 216
              Width = 33
              Height = 13
              AutoSize = False
              Caption = #27665#26063
            end
            object Label13: TLabel
              Left = 104
              Top = 216
              Width = 65
              Height = 13
              AutoSize = False
              Caption = #25991#21270#31243#24230
            end
            object Label14: TLabel
              Left = 256
              Top = 216
              Width = 65
              Height = 13
              AutoSize = False
              Caption = #27605#19994#23398#26657
            end
            object Label15: TLabel
              Left = 488
              Top = 216
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #20581#24247#29366#20917
            end
            object Label16: TLabel
              Left = 8
              Top = 264
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #23130#23035#29366#20917
            end
            object Label17: TLabel
              Left = 104
              Top = 264
              Width = 73
              Height = 13
              AutoSize = False
              Caption = #36523#20221#35777#21495#30721
            end
            object Label18: TLabel
              Left = 256
              Top = 264
              Width = 65
              Height = 13
              AutoSize = False
              Caption = #23478#24237#30005#35805
            end
            object Label19: TLabel
              Left = 352
              Top = 264
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #21150#20844#30005#35805
            end
            object Label20: TLabel
              Left = 480
              Top = 264
              Width = 33
              Height = 13
              AutoSize = False
              Caption = #25163#26426
            end
            object Label21: TLabel
              Left = 8
              Top = 312
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #32844#24037#24080#21495
            end
            object Label22: TLabel
              Left = 104
              Top = 312
              Width = 65
              Height = 13
              AutoSize = False
              Caption = #30005#23376#37038#20214
            end
            object Label23: TLabel
              Left = 304
              Top = 312
              Width = 65
              Height = 13
              AutoSize = False
              Caption = #21333#20301#32534#21495
            end
            object Label24: TLabel
              Left = 416
              Top = 312
              Width = 33
              Height = 13
              AutoSize = False
              Caption = #22791#27880
            end
            object Label58: TLabel
              Left = 376
              Top = 360
              Width = 3
              Height = 13
            end
            object DBGrid2: TDBGrid
              Left = 0
              Top = 24
              Width = 617
              Height = 136
              DataSource = DataSource2
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGrid2CellClick
              Columns = <
                item
                  Expanded = False
                  FieldName = #20869#37096#32534#21495
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #32844#21592#32534#21495
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #22995#21517
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #22995#21517#31616#30721
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #24615#21035
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #20986#29983#26085#26399
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #24180#40836
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #31821#36143
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #27665#26063
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #25991#21270#31243#24230
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #27605#19994#23398#26657
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #20581#24247#29366#20917
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #23130#23035#29366#20917
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #36523#20221#35777#21495#30721
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #23478#24237#30005#35805
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #21150#20844#30005#35805
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #25163#26426
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #30005#23376#37038#20214#22320#22336
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #32844#24037#36134#21495
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #21333#20301#32534#21495
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #22791#27880
                  Visible = True
                end>
            end
            object DBNavigator2: TDBNavigator
              Left = 0
              Top = 0
              Width = 225
              Height = 25
              DataSource = DataSource2
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
              TabOrder = 1
            end
            object Edit5: TEdit
              Left = 8
              Top = 184
              Width = 121
              Height = 21
              TabOrder = 2
            end
            object Edit6: TEdit
              Left = 136
              Top = 184
              Width = 121
              Height = 21
              TabOrder = 3
            end
            object Edit7: TEdit
              Left = 264
              Top = 184
              Width = 65
              Height = 21
              TabOrder = 4
            end
            object ComboBox1: TComboBox
              Left = 336
              Top = 184
              Width = 49
              Height = 21
              ItemHeight = 13
              TabOrder = 5
              Items.Strings = (
                #30007
                #22899)
            end
            object Edit8: TEdit
              Left = 392
              Top = 184
              Width = 73
              Height = 21
              TabOrder = 6
            end
            object Edit9: TEdit
              Left = 472
              Top = 184
              Width = 49
              Height = 21
              TabOrder = 7
            end
            object Edit10: TEdit
              Left = 528
              Top = 184
              Width = 81
              Height = 21
              TabOrder = 8
            end
            object ComboBox2: TComboBox
              Left = 8
              Top = 232
              Width = 89
              Height = 21
              ItemHeight = 13
              TabOrder = 9
              Items.Strings = (
                #27721#26063
                #22766#26063
                #33945#21476#26063
                #22238#26063
                #34255#26063)
            end
            object Edit11: TEdit
              Left = 104
              Top = 232
              Width = 145
              Height = 21
              TabOrder = 10
            end
            object Edit12: TEdit
              Left = 256
              Top = 232
              Width = 225
              Height = 21
              TabOrder = 11
            end
            object Edit13: TEdit
              Left = 488
              Top = 232
              Width = 121
              Height = 21
              TabOrder = 12
            end
            object Edit14: TEdit
              Left = 104
              Top = 280
              Width = 145
              Height = 21
              TabOrder = 13
            end
            object ComboBox3: TComboBox
              Left = 8
              Top = 280
              Width = 89
              Height = 21
              ItemHeight = 13
              TabOrder = 14
              Items.Strings = (
                #24050#23130
                #26410#23130)
            end
            object Edit15: TEdit
              Left = 256
              Top = 280
              Width = 89
              Height = 21
              TabOrder = 15
            end
            object Edit16: TEdit
              Left = 352
              Top = 280
              Width = 121
              Height = 21
              TabOrder = 16
            end
            object Edit17: TEdit
              Left = 480
              Top = 280
              Width = 129
              Height = 21
              TabOrder = 17
            end
            object Edit18: TEdit
              Left = 8
              Top = 328
              Width = 89
              Height = 21
              TabOrder = 18
            end
            object Edit19: TEdit
              Left = 104
              Top = 328
              Width = 193
              Height = 21
              TabOrder = 19
            end
            object Edit20: TEdit
              Left = 304
              Top = 328
              Width = 105
              Height = 21
              TabOrder = 20
            end
            object Edit21: TEdit
              Left = 416
              Top = 328
              Width = 193
              Height = 21
              TabOrder = 21
            end
            object Button1: TButton
              Left = 24
              Top = 356
              Width = 113
              Height = 25
              Caption = #20462#25913#35760#24405
              Enabled = False
              TabOrder = 22
              OnClick = Button1Click
            end
            object Button2: TButton
              Left = 152
              Top = 357
              Width = 97
              Height = 25
              Caption = #21024#38500#35760#24405
              Enabled = False
              TabOrder = 23
              OnClick = Button2Click
            end
            object Button3: TButton
              Left = 272
              Top = 357
              Width = 89
              Height = 25
              Caption = #25554#20837#26032#35760#24405
              Enabled = False
              TabOrder = 24
              OnClick = Button3Click
            end
          end
          object TabSheet6: TTabSheet
            Caption = #32844#21592#20449#24687#26597#35810
            ImageIndex = 1
            object DBGrid3: TDBGrid
              Left = 0
              Top = 72
              Width = 609
              Height = 313
              DataSource = DataSource3
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = #22995#21517
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #24615#21035
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #20986#29983#26085#26399
                  Width = 128
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #31821#36143
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #21333#20301#21517#31216
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #21150#20844#30005#35805
                  Width = 120
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #23130#23035#29366#20917
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #25991#21270#31243#24230
                  Width = 128
                  Visible = True
                end>
            end
            object Panel3: TPanel
              Left = 0
              Top = 2
              Width = 609
              Height = 65
              BorderStyle = bsSingle
              TabOrder = 1
              object Label25: TLabel
                Left = 16
                Top = 8
                Width = 33
                Height = 13
                AutoSize = False
                Caption = #22995#21517
              end
              object Label26: TLabel
                Left = 184
                Top = 8
                Width = 57
                Height = 13
                AutoSize = False
                Caption = #22995#21517#31616#30721
              end
              object Label27: TLabel
                Left = 384
                Top = 8
                Width = 33
                Height = 13
                AutoSize = False
                Caption = #31821#36143
              end
              object Label28: TLabel
                Left = 184
                Top = 32
                Width = 33
                Height = 17
                AutoSize = False
                Caption = #24615#21035
              end
              object Label29: TLabel
                Left = 16
                Top = 32
                Width = 33
                Height = 13
                AutoSize = False
                Caption = #27665#26063
              end
              object Edit22: TEdit
                Left = 56
                Top = 8
                Width = 121
                Height = 21
                TabOrder = 0
              end
              object Edit23: TEdit
                Left = 248
                Top = 8
                Width = 121
                Height = 21
                TabOrder = 1
              end
              object Edit24: TEdit
                Left = 432
                Top = 8
                Width = 121
                Height = 21
                TabOrder = 2
              end
              object ComboBox4: TComboBox
                Left = 248
                Top = 32
                Width = 65
                Height = 21
                ItemHeight = 13
                TabOrder = 3
                Items.Strings = (
                  #30007
                  #22899)
              end
              object ComboBox5: TComboBox
                Left = 56
                Top = 32
                Width = 105
                Height = 21
                ItemHeight = 13
                TabOrder = 4
                Items.Strings = (
                  #27721#26063
                  #22766#26063
                  #33945#26063
                  #22238#26063
                  #34255#26063
                  #32500#21566#23572#26063)
              end
              object Button4: TButton
                Left = 384
                Top = 32
                Width = 105
                Height = 25
                Caption = #26597#35810
                TabOrder = 5
                OnClick = Button4Click
              end
            end
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = #34218#36164#31119#21033#31649#29702
        ImageIndex = 3
        object PageControl3: TPageControl
          Left = 0
          Top = -1
          Width = 625
          Height = 433
          ActivePage = TabSheet9
          TabOrder = 0
          object TabSheet8: TTabSheet
            Caption = #20010#20154#25152#24471#31246#29575
            ImageIndex = 1
            object DBGrid4: TDBGrid
              Left = 8
              Top = 64
              Width = 601
              Height = 313
              DataSource = DataSource4
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = #32534#21495
                  Width = 32
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #32423#25968
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #19981#35745#31246#24037#36164
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #24037#36164#19979#38480
                  Width = 96
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #24037#36164#19978#38480
                  Width = 96
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #20010#20154#25152#24471#31246#29575
                  Width = 96
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #36895#31639#25187#38500#25968
                  Width = 96
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #22791#27880
                  Visible = True
                end>
            end
            object DBNavigator3: TDBNavigator
              Left = 24
              Top = 32
              Width = 220
              Height = 25
              DataSource = DataSource4
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              TabOrder = 1
            end
          end
          object TabSheet7: TTabSheet
            Caption = #24403#26376#24037#36164#31649#29702
            OnShow = TabSheet7Show
            object Label37: TLabel
              Left = 16
              Top = 264
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #22522#26412#24037#36164
            end
            object Label38: TLabel
              Left = 96
              Top = 264
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #28014#21160#24037#36164
            end
            object Label39: TLabel
              Left = 176
              Top = 264
              Width = 49
              Height = 13
              AutoSize = False
              Caption = #21512#21516#34917
            end
            object Label40: TLabel
              Left = 256
              Top = 264
              Width = 49
              Height = 13
              AutoSize = False
              Caption = #31918#21103#34917' '
            end
            object Label41: TLabel
              Left = 336
              Top = 264
              Width = 49
              Height = 13
              AutoSize = False
              Caption = #20020#26102#34917
            end
            object Label42: TLabel
              Left = 416
              Top = 264
              Width = 33
              Height = 13
              AutoSize = False
              Caption = #25151#34917
            end
            object Label43: TLabel
              Left = 496
              Top = 264
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #32844#21153#24037#36164
            end
            object Label44: TLabel
              Left = 16
              Top = 304
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #24037#40836#24037#36164
            end
            object Label45: TLabel
              Left = 96
              Top = 304
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #32771#26680#24037#36164
            end
            object Label46: TLabel
              Left = 176
              Top = 304
              Width = 33
              Height = 13
              AutoSize = False
              Caption = #22870#37329
            end
            object Label47: TLabel
              Left = 256
              Top = 304
              Width = 33
              Height = 13
              AutoSize = False
              Caption = #25151#31199
            end
            object Label48: TLabel
              Left = 336
              Top = 304
              Width = 41
              Height = 13
              AutoSize = False
              Caption = #27700#30005#36153
            end
            object Label49: TLabel
              Left = 416
              Top = 304
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #35831#20551#25187#38500
            end
            object Label50: TLabel
              Left = 496
              Top = 304
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #32771#21220#25187#38500
            end
            object Label51: TLabel
              Left = 16
              Top = 344
              Width = 33
              Height = 13
              AutoSize = False
              Caption = #32602#27454
            end
            object Label52: TLabel
              Left = 96
              Top = 344
              Width = 73
              Height = 13
              AutoSize = False
              Caption = #20303#25151#20844#31215#37329
            end
            object Label53: TLabel
              Left = 176
              Top = 344
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #21307#30103#20445#38505
            end
            object Label54: TLabel
              Left = 256
              Top = 344
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #20859#32769#20445#38505
            end
            object Label55: TLabel
              Left = 336
              Top = 344
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #22833#19994#20445#38505
            end
            object Label56: TLabel
              Left = 416
              Top = 344
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #29983#32946#20445#38505
            end
            object Label57: TLabel
              Left = 496
              Top = 344
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #24037#20260#20445#38505
            end
            object DBGrid8: TDBGrid
              Left = 0
              Top = 112
              Width = 617
              Height = 145
              DataSource = DataSource5
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = #22995#21517
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #26085#26399
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #32844#21592#32534#21495
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #24212#21457#37329#39069#21512#35745
                  Width = 96
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #24212#25187#37329#39069#21512#35745
                  Width = 96
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #24037#36164#21512#35745
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #20010#20154#25152#24471#31246
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #23454#21457#37329#39069
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #21457#25918#21542
                  Visible = True
                end>
            end
            object DBEdit1: TDBEdit
              Left = 96
              Top = 280
              Width = 73
              Height = 21
              DataField = #28014#21160#24037#36164
              DataSource = DataSource5
              TabOrder = 1
            end
            object DBEdit2: TDBEdit
              Left = 16
              Top = 280
              Width = 73
              Height = 21
              DataField = #22522#26412#24037#36164
              DataSource = DataSource5
              TabOrder = 2
            end
            object DBEdit3: TDBEdit
              Left = 176
              Top = 280
              Width = 73
              Height = 21
              DataField = #21512#21516#34917
              DataSource = DataSource5
              TabOrder = 3
            end
            object DBEdit4: TDBEdit
              Left = 256
              Top = 280
              Width = 73
              Height = 21
              DataField = #31918#21103#34917
              DataSource = DataSource5
              TabOrder = 4
            end
            object DBEdit5: TDBEdit
              Left = 336
              Top = 280
              Width = 73
              Height = 21
              DataField = #20020#26102#34917
              DataSource = DataSource5
              TabOrder = 5
            end
            object DBEdit6: TDBEdit
              Left = 416
              Top = 280
              Width = 73
              Height = 21
              DataField = #25151#34917
              DataSource = DataSource5
              TabOrder = 6
            end
            object DBEdit7: TDBEdit
              Left = 496
              Top = 280
              Width = 73
              Height = 21
              DataField = #32844#21153#24037#36164
              DataSource = DataSource5
              TabOrder = 7
            end
            object DBEdit8: TDBEdit
              Left = 16
              Top = 320
              Width = 73
              Height = 21
              DataField = #24037#40836#24037#36164
              DataSource = DataSource5
              TabOrder = 8
            end
            object DBEdit9: TDBEdit
              Left = 96
              Top = 320
              Width = 73
              Height = 21
              DataField = #32771#26680#24037#36164
              DataSource = DataSource5
              TabOrder = 9
            end
            object DBEdit10: TDBEdit
              Left = 176
              Top = 320
              Width = 73
              Height = 21
              DataField = #22870#37329
              DataSource = DataSource5
              TabOrder = 10
            end
            object DBEdit11: TDBEdit
              Left = 256
              Top = 320
              Width = 73
              Height = 21
              DataField = #25151#31199
              DataSource = DataSource5
              TabOrder = 11
            end
            object DBEdit12: TDBEdit
              Left = 336
              Top = 320
              Width = 73
              Height = 21
              DataField = #27700#30005#36153
              DataSource = DataSource5
              TabOrder = 12
            end
            object DBEdit13: TDBEdit
              Left = 416
              Top = 320
              Width = 73
              Height = 21
              DataField = #35831#20551#25187#38500
              DataSource = DataSource5
              TabOrder = 13
            end
            object DBEdit14: TDBEdit
              Left = 496
              Top = 320
              Width = 73
              Height = 21
              DataField = #32771#21220#25187#38500
              DataSource = DataSource5
              TabOrder = 14
            end
            object DBEdit15: TDBEdit
              Left = 16
              Top = 360
              Width = 73
              Height = 21
              DataField = #32602#27454
              DataSource = DataSource5
              TabOrder = 15
            end
            object DBEdit16: TDBEdit
              Left = 96
              Top = 360
              Width = 73
              Height = 21
              DataField = #20303#25151#20844#31215#37329
              DataSource = DataSource5
              TabOrder = 16
            end
            object DBEdit17: TDBEdit
              Left = 176
              Top = 360
              Width = 73
              Height = 21
              DataField = #21307#30103#20445#38505
              DataSource = DataSource5
              TabOrder = 17
            end
            object DBEdit18: TDBEdit
              Left = 256
              Top = 360
              Width = 73
              Height = 21
              DataField = #20859#32769#20445#38505
              DataSource = DataSource5
              TabOrder = 18
            end
            object DBEdit19: TDBEdit
              Left = 336
              Top = 360
              Width = 73
              Height = 21
              DataField = #22833#19994#20445#38505
              DataSource = DataSource5
              TabOrder = 19
            end
            object DBEdit20: TDBEdit
              Left = 416
              Top = 360
              Width = 73
              Height = 21
              DataField = #29983#32946#20445#38505
              DataSource = DataSource5
              TabOrder = 20
            end
            object DBEdit21: TDBEdit
              Left = 496
              Top = 360
              Width = 73
              Height = 21
              DataField = #24037#20260#20445#38505
              DataSource = DataSource5
              TabOrder = 21
            end
            object Panel8: TPanel
              Left = 0
              Top = 8
              Width = 609
              Height = 73
              BorderStyle = bsSingle
              TabOrder = 22
              object Label59: TLabel
                Left = 40
                Top = 12
                Width = 81
                Height = 13
                AutoSize = False
                Caption = #35201#23548#20837#30340#26376#20221'       '
              end
              object Label60: TLabel
                Left = 40
                Top = 40
                Width = 63
                Height = 13
                AutoSize = False
                Caption = #24403#21069#26376#20221'     '
              end
              object Edit32: TEdit
                Left = 128
                Top = 10
                Width = 121
                Height = 21
                TabOrder = 0
              end
              object Button9: TButton
                Left = 280
                Top = 8
                Width = 121
                Height = 25
                Caption = #23548#20837#24037#36164#21382#21490
                TabOrder = 1
                OnClick = Button9Click
              end
              object Edit33: TEdit
                Left = 128
                Top = 40
                Width = 121
                Height = 21
                TabOrder = 2
              end
              object Button10: TButton
                Left = 280
                Top = 38
                Width = 121
                Height = 25
                Caption = #35745#31639#24403#26376#24037#36164
                TabOrder = 3
                OnClick = Button10Click
              end
              object Button11: TButton
                Left = 416
                Top = 9
                Width = 121
                Height = 24
                Caption = #21457#25918#24037#36164
                TabOrder = 4
                OnClick = Button11Click
              end
            end
            object DBNavigator6: TDBNavigator
              Left = 0
              Top = 83
              Width = 225
              Height = 25
              DataSource = DataSource5
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
              TabOrder = 23
            end
          end
          object TabSheet9: TTabSheet
            Caption = #24037#36164#21457#25918#21382#21490
            ImageIndex = 2
            OnShow = TabSheet9Show
            object DBGrid5: TDBGrid
              Left = 8
              Top = 104
              Width = 601
              Height = 289
              DataSource = DataSource3
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = #22995#21517
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #26085#26399
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #32844#21592#32534#21495
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #22522#26412#24037#36164
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #28014#21160#24037#36164
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #21512#21516#34917
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #31918#21103#34917
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #25151#34917
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #20020#26102#34917
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #32844#21153#24037#36164
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #24037#40836#24037#36164
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #32771#26680#24037#36164
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #22870#37329
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #24212#21457#37329#39069#21512#35745
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #25151#31199
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #27700#30005#36153
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #35831#20551#25187#38500
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #32771#21220#25187#38500
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #32602#27454
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #20303#25151#20844#31215#37329
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #21307#30103#20445#38505
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #20859#32769#20445#38505
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #22833#19994#20445#38505
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #29983#32946#20445#38505
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #24037#20260#20445#38505
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #24212#25187#37329#39069#21512#35745
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #24037#36164#21512#35745
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #20010#20154#25152#24471#31246
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #23454#21457#37329#39069
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #21457#25918#21542
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = #26376#20221
                  Visible = True
                end>
            end
            object Panel4: TPanel
              Left = 8
              Top = 8
              Width = 601
              Height = 89
              BorderStyle = bsSingle
              TabOrder = 1
              object Label30: TLabel
                Left = 40
                Top = 24
                Width = 33
                Height = 13
                AutoSize = False
                Caption = #26085#26399
              end
              object Label31: TLabel
                Left = 208
                Top = 24
                Width = 57
                Height = 13
                AutoSize = False
                Caption = #32844#21592#22995#21517
              end
              object Edit25: TEdit
                Left = 80
                Top = 24
                Width = 121
                Height = 21
                TabOrder = 0
              end
              object Edit26: TEdit
                Left = 272
                Top = 24
                Width = 121
                Height = 21
                TabOrder = 1
              end
              object Button5: TButton
                Left = 416
                Top = 24
                Width = 89
                Height = 25
                Caption = #26597#35810
                TabOrder = 2
                OnClick = Button5Click
              end
            end
          end
          object TabSheet10: TTabSheet
            Caption = #32844#21592#22870#21169#31649#29702
            ImageIndex = 3
            object Panel10: TPanel
              Left = 16
              Top = 72
              Width = 569
              Height = 185
              BorderStyle = bsSingle
              TabOrder = 1
              object Label68: TLabel
                Left = 16
                Top = 82
                Width = 97
                Height = 13
                AutoSize = False
                Caption = #26159#21542#35745#20837#24037#36164
              end
              object Label69: TLabel
                Left = 408
                Top = 130
                Width = 57
                Height = 13
                AutoSize = False
                Caption = #22870#21169#26085#26399
              end
              object Label70: TLabel
                Left = 392
                Top = 34
                Width = 65
                Height = 13
                AutoSize = False
                Caption = #22870#21169#37329#39069
              end
              object Label71: TLabel
                Left = 128
                Top = 82
                Width = 65
                Height = 13
                AutoSize = False
                Caption = #22870#21169#21407#22240
              end
              object Label72: TLabel
                Left = 200
                Top = 34
                Width = 57
                Height = 13
                AutoSize = False
                Caption = #22870#21169#31867#22411
              end
              object Label73: TLabel
                Left = 16
                Top = 130
                Width = 73
                Height = 13
                AutoSize = False
                Caption = #37096#38376#24847#35265
              end
              object Label74: TLabel
                Left = 16
                Top = 34
                Width = 65
                Height = 13
                AutoSize = False
                Caption = #32844#24037#32534#21495
              end
              object DBEdit29: TDBEdit
                Left = 16
                Top = 48
                Width = 161
                Height = 21
                DataField = #32844#21592#32534#21495
                DataSource = DataSource6
                TabOrder = 0
              end
              object DBEdit30: TDBEdit
                Left = 200
                Top = 48
                Width = 177
                Height = 21
                DataField = #22870#21169#31867#22411
                DataSource = DataSource6
                TabOrder = 1
              end
              object DBEdit31: TDBEdit
                Left = 392
                Top = 48
                Width = 121
                Height = 21
                DataField = #22870#21169#37329#39069
                DataSource = DataSource6
                TabOrder = 2
              end
              object DBEdit32: TDBEdit
                Left = 16
                Top = 96
                Width = 89
                Height = 21
                DataField = #26159#21542#35745#20837#24037#36164
                DataSource = DataSource6
                TabOrder = 3
              end
              object DBEdit33: TDBEdit
                Left = 128
                Top = 96
                Width = 385
                Height = 21
                DataField = #22870#21169#21407#22240
                DataSource = DataSource6
                TabOrder = 4
              end
              object DBEdit34: TDBEdit
                Left = 16
                Top = 144
                Width = 377
                Height = 21
                DataField = #37096#38376#24847#35265
                DataSource = DataSource6
                TabOrder = 5
              end
              object DBEdit35: TDBEdit
                Left = 408
                Top = 144
                Width = 105
                Height = 21
                DataField = #22870#21169#26085#26399
                DataSource = DataSource6
                TabOrder = 6
              end
            end
            object DBNavigator4: TDBNavigator
              Left = 32
              Top = 40
              Width = 240
              Height = 25
              DataSource = DataSource6
              TabOrder = 0
            end
          end
          object TabSheet11: TTabSheet
            Caption = #32844#21592#24809#32602#31649#29702
            ImageIndex = 4
            object DBNavigator5: TDBNavigator
              Left = 32
              Top = 40
              Width = 230
              Height = 25
              DataSource = DataSource7
              TabOrder = 0
            end
            object Panel5: TPanel
              Left = 16
              Top = 72
              Width = 569
              Height = 185
              BorderStyle = bsSingle
              TabOrder = 1
              object Label32: TLabel
                Left = 16
                Top = 82
                Width = 97
                Height = 13
                AutoSize = False
                Caption = #26159#21542#35745#20837#24037#36164
              end
              object Label33: TLabel
                Left = 408
                Top = 130
                Width = 57
                Height = 13
                AutoSize = False
                Caption = #24809#32602#26085#26399
              end
              object Label34: TLabel
                Left = 392
                Top = 34
                Width = 65
                Height = 13
                AutoSize = False
                Caption = #24809#32602#37329#39069
              end
              object Label35: TLabel
                Left = 128
                Top = 82
                Width = 65
                Height = 13
                AutoSize = False
                Caption = #24809#32602#21407#22240
              end
              object Label75: TLabel
                Left = 200
                Top = 34
                Width = 57
                Height = 13
                AutoSize = False
                Caption = #24809#32602#31867#22411
              end
              object Label76: TLabel
                Left = 16
                Top = 130
                Width = 73
                Height = 13
                AutoSize = False
                Caption = #37096#38376#24847#35265
              end
              object Label77: TLabel
                Left = 16
                Top = 34
                Width = 65
                Height = 13
                AutoSize = False
                Caption = #32844#24037#32534#21495
              end
              object DBEdit36: TDBEdit
                Left = 16
                Top = 48
                Width = 161
                Height = 21
                DataField = #32844#21592#32534#21495
                DataSource = DataSource7
                TabOrder = 0
              end
              object DBEdit37: TDBEdit
                Left = 200
                Top = 48
                Width = 177
                Height = 21
                DataField = #24809#32602#31867#22411
                DataSource = DataSource7
                TabOrder = 1
              end
              object DBEdit38: TDBEdit
                Left = 392
                Top = 48
                Width = 121
                Height = 21
                DataField = #24809#32602#37329#39069
                DataSource = DataSource7
                TabOrder = 2
              end
              object DBEdit39: TDBEdit
                Left = 16
                Top = 96
                Width = 89
                Height = 21
                DataField = #26159#21542#35745#20837#24037#36164
                DataSource = DataSource7
                TabOrder = 3
              end
              object DBEdit40: TDBEdit
                Left = 128
                Top = 96
                Width = 385
                Height = 21
                DataField = #24809#32602#21407#22240
                DataSource = DataSource7
                TabOrder = 4
              end
              object DBEdit41: TDBEdit
                Left = 16
                Top = 144
                Width = 377
                Height = 21
                DataField = #37096#38376#24847#35265
                DataSource = DataSource7
                TabOrder = 5
              end
              object DBEdit42: TDBEdit
                Left = 408
                Top = 144
                Width = 105
                Height = 21
                DataField = #24809#32602#26085#26399
                DataSource = DataSource7
                TabOrder = 6
              end
            end
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 470
    Width = 642
    Height = 23
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object StatusBar1: TStatusBar
      Left = 0
      Top = -1
      Width = 642
      Height = 24
      Panels = <
        item
          Width = 60
        end
        item
          Text = #20154#21147#36164#28304#31649#29702#31995#32479' '#25968#25454#24211#24320#21457#32463#20856#26696#20363#35299#26512' '#28165#21326#22823#23398#20986#29256#31038' '
          Width = 50
        end>
    end
  end
  object ADOQuery1: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=hrmbook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from '#32452#32455#26426#26500#32534#30721#34920)
    Left = 361
    Top = 65533
  end
  object ADOQuery2: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=hrmbook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 393
    Top = 65533
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery2
    Left = 417
    Top = 65533
  end
  object ADOTable1: TADOTable
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=hrmbook'
    CursorType = ctStatic
    TableName = #32844#21592#22522#26412#20449#24687#34920
    Left = 440
  end
  object DataSource2: TDataSource
    DataSet = ADOTable1
    Left = 464
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 496
  end
  object ADOQuery3: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=hrmbook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 520
  end
  object ADOTable2: TADOTable
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=hrmbook'
    CursorType = ctStatic
    TableName = #20010#20154#25152#24471#31246#34920
    Left = 545
    Top = 65533
  end
  object DataSource4: TDataSource
    DataSet = ADOTable2
    Left = 576
  end
  object ADOQuery4: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=hrmbook'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select b.'#22995#21517',a.* from '#26376#24037#36164#32479#35745#34920' a,'#32844#21592#22522#26412#20449#24687#34920' b where a.'#32844#21592#32534#21495'=b.'#32844#21592#32534#21495)
    Left = 441
    Top = 29
  end
  object DataSource5: TDataSource
    DataSet = ADOQuery4
    Left = 465
    Top = 29
  end
  object ADOCommand1: TADOCommand
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=hrmbook'
    Parameters = <>
    Left = 497
    Top = 29
  end
  object DataSource6: TDataSource
    DataSet = ADOTable4
    Left = 577
    Top = 29
  end
  object DataSource7: TDataSource
    DataSet = ADOTable3
    Left = 609
    Top = 29
  end
  object ADOTable3: TADOTable
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=hrmbook'
    CursorType = ctStatic
    TableName = #32844#21592#24809#32602#34920
    Left = 545
    Top = 29
  end
  object ADOTable4: TADOTable
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=hrmbook'
    CursorType = ctStatic
    TableName = #32844#21592#22870#21169#34920
    Left = 521
    Top = 29
  end
end
