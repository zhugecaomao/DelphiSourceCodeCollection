inherited frmSearchPerson: TfrmSearchPerson
  Left = 28
  Top = 53
  Width = 703
  Height = 499
  Caption = 'frmSearchPerson'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBkGnd: TPanel
    Width = 695
    Height = 465
    object Splitter1: TSplitter
      Left = 187
      Top = 89
      Width = 9
      Height = 376
      Cursor = crHSplit
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 695
      Height = 89
      Align = alTop
      ParentColor = True
      TabOrder = 0
      object btnReset: TDsFancyButton
        Left = 8
        Top = 59
        Width = 73
        Height = 25
        ButtonColor = clBtnFace
        Caption = #22797#20301
        FrameColor = clGray
        FrameWidth = 6
        CornerRadius = 10
        TextStyle = txRaised
        OnClick = btnResetClick
      end
      object btnSearch: TDsFancyButton
        Left = 88
        Top = 59
        Width = 73
        Height = 25
        ButtonColor = clBtnFace
        Caption = #26597#35810
        FrameColor = clGray
        FrameWidth = 6
        CornerRadius = 10
        TextStyle = txRaised
        OnClick = btnSearchClick
      end
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 54
        Height = 13
        Caption = #22995'    '#21517
      end
      object Label43: TLabel
        Left = 448
        Top = 16
        Width = 26
        Height = 13
        Caption = #24615#21035
      end
      object Label44: TLabel
        Left = 448
        Top = 40
        Width = 26
        Height = 13
        Caption = #29983#32918
      end
      object Label45: TLabel
        Left = 448
        Top = 64
        Width = 26
        Height = 13
        Caption = #26143#24231
      end
      object Label46: TLabel
        Left = 320
        Top = 16
        Width = 13
        Height = 13
        Caption = #30465
        FocusControl = DBLookupComboBox3
      end
      object Label47: TLabel
        Left = 320
        Top = 40
        Width = 13
        Height = 13
        Caption = #24066
        FocusControl = DBLookupComboBox4
      end
      object Label48: TLabel
        Left = 320
        Top = 64
        Width = 13
        Height = 13
        Caption = #21306
        FocusControl = DBLookupComboBox5
      end
      object Label49: TLabel
        Left = 176
        Top = 16
        Width = 26
        Height = 13
        Caption = #32844#19994
      end
      object Label50: TLabel
        Left = 176
        Top = 40
        Width = 26
        Height = 13
        Caption = #37096#38376
      end
      object Label51: TLabel
        Left = 176
        Top = 64
        Width = 26
        Height = 13
        Caption = #32844#20301
      end
      object Label52: TLabel
        Left = 8
        Top = 36
        Width = 52
        Height = 13
        Caption = #20154#21592#31867#22411
        FocusControl = DBLookupComboBox12
      end
      object btnCard: TDsFancyButton
        Left = 592
        Top = 8
        Width = 89
        Height = 25
        ButtonColor = clBtnFace
        Caption = #21517'    '#29255
        FrameColor = clGray
        FrameWidth = 6
        CornerRadius = 10
        TextStyle = txRaised
        OnClick = btnCardClick
      end
      object btnInfo: TDsFancyButton
        Left = 592
        Top = 32
        Width = 89
        Height = 25
        ButtonColor = clBtnFace
        Caption = #20449' '#24687' '#21345
        FrameColor = clGray
        FrameWidth = 6
        CornerRadius = 10
        TextStyle = txRaised
        OnClick = btnInfoClick
      end
      object btnRecord: TDsFancyButton
        Left = 592
        Top = 56
        Width = 89
        Height = 25
        ButtonColor = clBtnFace
        Caption = #22521#35757#35760#24405
        FrameColor = clGray
        FrameWidth = 6
        CornerRadius = 10
        TextStyle = txRaised
        OnClick = btnRecordClick
      end
      object cb_Xm: TComboBox
        Left = 64
        Top = 8
        Width = 105
        Height = 21
        CharCase = ecUpperCase
        ItemHeight = 13
        TabOrder = 0
      end
      object cb_Sex: TComboBox
        Left = 480
        Top = 8
        Width = 105
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 8
      end
      object cb_Sx: TComboBox
        Left = 480
        Top = 32
        Width = 105
        Height = 21
        Style = csDropDownList
        DropDownCount = 13
        ItemHeight = 13
        TabOrder = 9
      end
      object cb_Star: TComboBox
        Left = 480
        Top = 56
        Width = 105
        Height = 21
        Style = csDropDownList
        DropDownCount = 13
        ItemHeight = 13
        TabOrder = 10
      end
      object cb_Province: TComboBox
        Left = 336
        Top = 8
        Width = 105
        Height = 21
        Style = csDropDownList
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 5
      end
      object cb_City: TComboBox
        Left = 336
        Top = 32
        Width = 105
        Height = 21
        Style = csDropDownList
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 6
      end
      object cb_Belt: TComboBox
        Left = 336
        Top = 56
        Width = 105
        Height = 21
        Style = csDropDownList
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 7
      end
      object cb_Job: TComboBox
        Left = 208
        Top = 8
        Width = 105
        Height = 21
        Style = csDropDownList
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 2
      end
      object cb_Part: TComboBox
        Left = 208
        Top = 32
        Width = 105
        Height = 21
        Style = csDropDownList
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 3
      end
      object cb_Zw: TComboBox
        Left = 208
        Top = 56
        Width = 105
        Height = 21
        Style = csDropDownList
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 4
      end
      object cb_XType: TComboBox
        Left = 64
        Top = 32
        Width = 105
        Height = 21
        Style = csDropDownList
        DropDownCount = 10
        ItemHeight = 13
        TabOrder = 1
      end
    end
    object PageControl1: TPageControl
      Left = 196
      Top = 89
      Width = 499
      Height = 376
      ActivePage = TabSheet2
      Align = alClient
      HotTrack = True
      TabIndex = 1
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = #20154#21592#22522#26412#20449#24687
        object PageControl2: TPageControl
          Left = 0
          Top = 0
          Width = 491
          Height = 348
          ActivePage = TabSheet4
          Align = alClient
          HotTrack = True
          TabIndex = 0
          TabOrder = 0
          object TabSheet4: TTabSheet
            Caption = #20010#20154
            object Label10: TLabel
              Left = 8
              Top = 16
              Width = 52
              Height = 13
              Caption = #20154#21592#32534#21495
              FocusControl = DBEdit5
            end
            object Label11: TLabel
              Left = 8
              Top = 40
              Width = 26
              Height = 13
              Caption = #22995#21517
              FocusControl = DBEdit6
            end
            object Label12: TLabel
              Left = 8
              Top = 64
              Width = 26
              Height = 13
              Caption = #31616#25340
              FocusControl = DBEdit7
            end
            object Label13: TLabel
              Left = 8
              Top = 88
              Width = 26
              Height = 13
              Caption = #24615#21035
            end
            object Label14: TLabel
              Left = 8
              Top = 112
              Width = 26
              Height = 13
              Caption = #29983#26085
              FocusControl = DBEdit8
            end
            object Label15: TLabel
              Left = 8
              Top = 136
              Width = 26
              Height = 13
              Caption = #29983#32918
            end
            object Label16: TLabel
              Left = 8
              Top = 160
              Width = 26
              Height = 13
              Caption = #26143#24231
            end
            object Label17: TLabel
              Left = 8
              Top = 184
              Width = 26
              Height = 13
              Caption = #29233#22909
              FocusControl = DBEdit9
            end
            object Label18: TLabel
              Left = 8
              Top = 208
              Width = 26
              Height = 13
              Caption = #29305#38271
              FocusControl = DBEdit10
            end
            object Label19: TLabel
              Left = 8
              Top = 232
              Width = 26
              Height = 13
              Caption = #26165#31216
              FocusControl = DBEdit11
            end
            object Label20: TLabel
              Left = 144
              Top = 232
              Width = 28
              Height = 13
              Caption = 'OICQ'
              FocusControl = DBEdit12
            end
            object Label21: TLabel
              Left = 8
              Top = 256
              Width = 35
              Height = 13
              Caption = 'EMAIL'
              FocusControl = DBEdit13
            end
            object Label22: TLabel
              Left = 8
              Top = 280
              Width = 52
              Height = 13
              Caption = #32852#31995#30005#35805
              FocusControl = DBEdit14
            end
            object Label23: TLabel
              Left = 8
              Top = 304
              Width = 52
              Height = 13
              Caption = #20010#20154#20027#39029
              FocusControl = DBEdit15
            end
            object DsFancyButton1: TDsFancyButton
              Left = 240
              Top = 8
              Width = 73
              Height = 25
              ButtonColor = clBtnFace
              Caption = #21478#23384#20026'...'
              FrameColor = clGray
              FrameWidth = 6
              CornerRadius = 10
              TextStyle = txRaised
            end
            object DBEdit5: TDBEdit
              Left = 64
              Top = 8
              Width = 134
              Height = 21
              DataField = 'BH'
              DataSource = DS
              TabOrder = 0
            end
            object DBEdit6: TDBEdit
              Left = 64
              Top = 32
              Width = 134
              Height = 21
              DataField = 'NAME'
              DataSource = DS
              TabOrder = 1
            end
            object DBEdit7: TDBEdit
              Left = 64
              Top = 56
              Width = 69
              Height = 21
              DataField = 'NAME_JP'
              DataSource = DS
              TabOrder = 2
            end
            object DBEdit8: TDBEdit
              Left = 64
              Top = 104
              Width = 137
              Height = 21
              DataField = 'BIRTHDAY'
              DataSource = DS
              TabOrder = 4
            end
            object DBEdit9: TDBEdit
              Left = 64
              Top = 176
              Width = 249
              Height = 21
              DataField = 'AH'
              DataSource = DS
              TabOrder = 7
            end
            object DBEdit10: TDBEdit
              Left = 64
              Top = 200
              Width = 417
              Height = 21
              DataField = 'TC'
              DataSource = DS
              TabOrder = 8
            end
            object DBEdit11: TDBEdit
              Left = 64
              Top = 224
              Width = 73
              Height = 21
              DataField = 'NC'
              DataSource = DS
              TabOrder = 9
            end
            object DBEdit12: TDBEdit
              Left = 176
              Top = 224
              Width = 305
              Height = 21
              DataField = 'OICQ'
              DataSource = DS
              TabOrder = 10
            end
            object DBEdit13: TDBEdit
              Left = 64
              Top = 248
              Width = 417
              Height = 21
              DataField = 'EMAIL'
              DataSource = DS
              TabOrder = 11
            end
            object DBEdit14: TDBEdit
              Left = 64
              Top = 272
              Width = 417
              Height = 21
              DataField = 'LXDH'
              DataSource = DS
              TabOrder = 12
            end
            object DBEdit15: TDBEdit
              Left = 64
              Top = 296
              Width = 417
              Height = 21
              DataField = 'WEB'
              DataSource = DS
              TabOrder = 13
            end
            object DBImage1: TDBImage
              Left = 320
              Top = 0
              Width = 161
              Height = 193
              DataField = 'PHOTO'
              DataSource = DS
              TabOrder = 14
            end
            object dcb_SEX: TDBComboBox
              Left = 64
              Top = 80
              Width = 73
              Height = 21
              DataField = 'SEX'
              DataSource = DS
              ItemHeight = 13
              TabOrder = 3
            end
            object dcb_SX: TDBComboBox
              Left = 64
              Top = 128
              Width = 73
              Height = 21
              DataField = 'SX'
              DataSource = DS
              ItemHeight = 13
              TabOrder = 5
            end
            object dcb_STAR: TDBComboBox
              Left = 64
              Top = 152
              Width = 73
              Height = 21
              DataField = 'XZ'
              DataSource = DS
              ItemHeight = 13
              TabOrder = 6
            end
          end
          object TabSheet5: TTabSheet
            Caption = #23478#24237
            ImageIndex = 1
            object Label24: TLabel
              Left = 8
              Top = 16
              Width = 13
              Height = 13
              Caption = #30465
              FocusControl = DBLookupComboBox3
            end
            object Label25: TLabel
              Left = 8
              Top = 40
              Width = 13
              Height = 13
              Caption = #24066
              FocusControl = DBLookupComboBox4
            end
            object Label26: TLabel
              Left = 8
              Top = 64
              Width = 13
              Height = 13
              Caption = #21306
              FocusControl = DBLookupComboBox5
            end
            object Label27: TLabel
              Left = 8
              Top = 88
              Width = 26
              Height = 13
              Caption = #22320#22336
              FocusControl = DBEdit16
            end
            object Label28: TLabel
              Left = 8
              Top = 112
              Width = 26
              Height = 13
              Caption = #37038#32534
              FocusControl = DBEdit17
            end
            object Label29: TLabel
              Left = 8
              Top = 136
              Width = 26
              Height = 13
              Caption = #30005#35805
              FocusControl = DBEdit18
            end
            object Label30: TLabel
              Left = 8
              Top = 160
              Width = 52
              Height = 13
              Caption = #23478#24237#25104#21592
            end
            object DBLookupComboBox3: TDBLookupComboBox
              Left = 64
              Top = 8
              Width = 113
              Height = 21
              DataField = 'family_province_mc'
              DataSource = DS
              TabOrder = 0
            end
            object DBLookupComboBox4: TDBLookupComboBox
              Left = 64
              Top = 32
              Width = 113
              Height = 21
              DataField = 'family_city_mc'
              DataSource = DS
              TabOrder = 1
            end
            object DBLookupComboBox5: TDBLookupComboBox
              Left = 64
              Top = 56
              Width = 113
              Height = 21
              DataField = 'family_belt_mc'
              DataSource = DS
              TabOrder = 2
            end
            object DBEdit16: TDBEdit
              Left = 64
              Top = 80
              Width = 393
              Height = 21
              DataField = 'FAMILY_ADDRESS'
              DataSource = DS
              TabOrder = 3
            end
            object DBEdit17: TDBEdit
              Left = 64
              Top = 104
              Width = 82
              Height = 21
              DataField = 'FAMILY_POST'
              DataSource = DS
              TabOrder = 4
            end
            object DBEdit18: TDBEdit
              Left = 64
              Top = 128
              Width = 201
              Height = 21
              DataField = 'FAMILY_PHONE'
              DataSource = DS
              TabOrder = 5
            end
            object DBMemo3: TDBMemo
              Left = 64
              Top = 152
              Width = 393
              Height = 161
              DataField = 'FAMILY_FAMILY'
              DataSource = DS
              ScrollBars = ssVertical
              TabOrder = 6
            end
          end
          object TabSheet6: TTabSheet
            Caption = #21333#20301
            ImageIndex = 2
            object Label31: TLabel
              Left = 8
              Top = 16
              Width = 13
              Height = 13
              Caption = #30465
              FocusControl = DBLookupComboBox6
            end
            object Label32: TLabel
              Left = 8
              Top = 40
              Width = 13
              Height = 13
              Caption = #24066
              FocusControl = DBLookupComboBox7
            end
            object Label33: TLabel
              Left = 8
              Top = 64
              Width = 13
              Height = 13
              Caption = #21306
              FocusControl = DBLookupComboBox8
            end
            object Label34: TLabel
              Left = 8
              Top = 88
              Width = 26
              Height = 13
              Caption = #32844#19994
              FocusControl = DBLookupComboBox9
            end
            object Label35: TLabel
              Left = 8
              Top = 112
              Width = 26
              Height = 13
              Caption = #30005#35805
              FocusControl = DBEdit19
            end
            object Label36: TLabel
              Left = 8
              Top = 136
              Width = 26
              Height = 13
              Caption = #20256#30495
              FocusControl = DBEdit20
            end
            object Label37: TLabel
              Left = 8
              Top = 160
              Width = 26
              Height = 13
              Caption = #37096#38376
              FocusControl = DBLookupComboBox10
            end
            object Label38: TLabel
              Left = 8
              Top = 184
              Width = 26
              Height = 13
              Caption = #32844#20301
              FocusControl = DBLookupComboBox11
            end
            object Label39: TLabel
              Left = 8
              Top = 208
              Width = 26
              Height = 13
              Caption = #22320#22336
              FocusControl = DBEdit21
            end
            object Label40: TLabel
              Left = 8
              Top = 232
              Width = 52
              Height = 13
              Caption = #20844#21496#20027#39029
              FocusControl = DBEdit22
            end
            object Label41: TLabel
              Left = 8
              Top = 256
              Width = 52
              Height = 13
              Caption = #20154#21592#31867#22411
              FocusControl = DBLookupComboBox12
            end
            object Label42: TLabel
              Left = 8
              Top = 280
              Width = 26
              Height = 13
              Caption = #26631#24535
              FocusControl = DBLookupComboBox13
            end
            object DBLookupComboBox6: TDBLookupComboBox
              Left = 64
              Top = 8
              Width = 113
              Height = 21
              DataField = 'company_province_mc'
              DataSource = DS
              TabOrder = 0
            end
            object DBLookupComboBox7: TDBLookupComboBox
              Left = 64
              Top = 32
              Width = 113
              Height = 21
              DataField = 'company_city_mc'
              DataSource = DS
              TabOrder = 1
            end
            object DBLookupComboBox8: TDBLookupComboBox
              Left = 64
              Top = 56
              Width = 113
              Height = 21
              DataField = 'company_belt_mc'
              DataSource = DS
              TabOrder = 2
            end
            object DBLookupComboBox9: TDBLookupComboBox
              Left = 64
              Top = 80
              Width = 113
              Height = 21
              DataField = 'company_job_mc'
              DataSource = DS
              TabOrder = 3
            end
            object DBEdit19: TDBEdit
              Left = 64
              Top = 104
              Width = 201
              Height = 21
              DataField = 'COMPANY_PHONE'
              DataSource = DS
              TabOrder = 4
            end
            object DBEdit20: TDBEdit
              Left = 64
              Top = 128
              Width = 201
              Height = 21
              DataField = 'COMPANY_CZ'
              DataSource = DS
              TabOrder = 5
            end
            object DBLookupComboBox10: TDBLookupComboBox
              Left = 64
              Top = 152
              Width = 113
              Height = 21
              DataField = 'company_part_mc'
              DataSource = DS
              TabOrder = 6
            end
            object DBLookupComboBox11: TDBLookupComboBox
              Left = 64
              Top = 176
              Width = 113
              Height = 21
              DataField = 'company_zw_mc'
              DataSource = DS
              TabOrder = 7
            end
            object DBEdit21: TDBEdit
              Left = 64
              Top = 200
              Width = 393
              Height = 21
              DataField = 'COMPANY_ADDRESS'
              DataSource = DS
              TabOrder = 8
            end
            object DBEdit22: TDBEdit
              Left = 64
              Top = 224
              Width = 393
              Height = 21
              DataField = 'COMAPNY_WEB'
              DataSource = DS
              TabOrder = 9
            end
            object DBLookupComboBox12: TDBLookupComboBox
              Left = 64
              Top = 248
              Width = 113
              Height = 21
              DataField = 'xtype_mc'
              DataSource = DS
              TabOrder = 10
            end
            object DBLookupComboBox13: TDBLookupComboBox
              Left = 64
              Top = 272
              Width = 113
              Height = 21
              DataField = 'flag_mc'
              DataSource = DS
              TabOrder = 11
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #22270#34920#32479#35745#20449#24687
        ImageIndex = 1
        object PageControl3: TPageControl
          Left = 0
          Top = 0
          Width = 491
          Height = 348
          ActivePage = TabSheet7
          Align = alClient
          HotTrack = True
          TabIndex = 0
          TabOrder = 0
          object TabSheet7: TTabSheet
            Caption = #24615#21035#27604#20363
            object PageControl4: TPageControl
              Left = 0
              Top = 0
              Width = 483
              Height = 320
              ActivePage = TabSheet8
              Align = alClient
              HotTrack = True
              TabIndex = 0
              TabOrder = 0
              object TabSheet8: TTabSheet
                Caption = #24403#21069
                object DBChart1: TDBChart
                  Left = 0
                  Top = 0
                  Width = 475
                  Height = 292
                  AllowPanning = pmNone
                  AllowZoom = False
                  BackWall.Brush.Color = clWhite
                  BackWall.Brush.Style = bsClear
                  BackWall.Pen.Visible = False
                  Title.Text.Strings = (
                    #24615#21035#27604#20363)
                  AxisVisible = False
                  ClipPoints = False
                  Frame.Visible = False
                  View3DOptions.Elevation = 315
                  View3DOptions.Orthogonal = False
                  View3DOptions.Perspective = 0
                  View3DOptions.Rotation = 360
                  View3DWalls = False
                  Align = alClient
                  ParentColor = True
                  TabOrder = 0
                  OnDblClick = DBChart1DblClick
                  object Series2: TPieSeries
                    Marks.ArrowLength = 8
                    Marks.Visible = True
                    DataSource = Q_Sex1
                    SeriesColor = clRed
                    XLabelsSource = 'SEX'
                    OtherSlice.Text = 'Other'
                    PieValues.DateTime = False
                    PieValues.Name = 'Pie'
                    PieValues.Multiplier = 1
                    PieValues.Order = loNone
                    PieValues.ValueSource = 'COUNT'
                  end
                end
              end
              object TabSheet9: TTabSheet
                Caption = #25972#20307
                ImageIndex = 1
                object DBChart2: TDBChart
                  Left = 0
                  Top = 0
                  Width = 475
                  Height = 292
                  AllowPanning = pmNone
                  AllowZoom = False
                  BackWall.Brush.Color = clWhite
                  BackWall.Brush.Style = bsClear
                  BackWall.Pen.Visible = False
                  Title.Text.Strings = (
                    #24615#21035#27604#20363)
                  AxisVisible = False
                  ClipPoints = False
                  Frame.Visible = False
                  View3DOptions.Elevation = 315
                  View3DOptions.Orthogonal = False
                  View3DOptions.Perspective = 0
                  View3DOptions.Rotation = 360
                  View3DWalls = False
                  Align = alClient
                  ParentColor = True
                  TabOrder = 0
                  OnDblClick = DBChart1DblClick
                  object Series1: TPieSeries
                    Marks.ArrowLength = 8
                    Marks.Visible = True
                    DataSource = Q_Sex2
                    SeriesColor = clRed
                    XLabelsSource = 'SEX'
                    OtherSlice.Text = 'Other'
                    PieValues.DateTime = False
                    PieValues.Name = 'Pie'
                    PieValues.Multiplier = 1
                    PieValues.Order = loNone
                    PieValues.ValueSource = 'COUNT'
                  end
                end
              end
            end
          end
          object TabSheet10: TTabSheet
            Caption = #32844#19994#27604#20363
            ImageIndex = 1
            object PageControl5: TPageControl
              Left = 0
              Top = 0
              Width = 483
              Height = 320
              ActivePage = TabSheet12
              Align = alClient
              TabIndex = 0
              TabOrder = 0
              object TabSheet12: TTabSheet
                Caption = #24403#21069
                object DBChart3: TDBChart
                  Left = 0
                  Top = 0
                  Width = 475
                  Height = 292
                  AllowPanning = pmNone
                  AllowZoom = False
                  BackWall.Brush.Color = clWhite
                  BackWall.Brush.Style = bsClear
                  BackWall.Pen.Visible = False
                  Title.Text.Strings = (
                    #32844#19994#27604#20363)
                  AxisVisible = False
                  ClipPoints = False
                  Frame.Visible = False
                  View3DOptions.Elevation = 315
                  View3DOptions.Orthogonal = False
                  View3DOptions.Perspective = 0
                  View3DOptions.Rotation = 360
                  View3DWalls = False
                  Align = alClient
                  ParentColor = True
                  TabOrder = 0
                  OnDblClick = DBChart1DblClick
                  object Series3: TPieSeries
                    Marks.ArrowLength = 8
                    Marks.Visible = True
                    DataSource = Q_Job1
                    SeriesColor = clRed
                    XLabelsSource = 'job_mc'
                    OtherSlice.Text = 'Other'
                    PieValues.DateTime = False
                    PieValues.Name = 'Pie'
                    PieValues.Multiplier = 1
                    PieValues.Order = loNone
                    PieValues.ValueSource = 'COUNT'
                  end
                end
              end
              object TabSheet13: TTabSheet
                Caption = #25972#20307
                ImageIndex = 1
                object DBChart4: TDBChart
                  Left = 0
                  Top = 0
                  Width = 475
                  Height = 292
                  AllowPanning = pmNone
                  AllowZoom = False
                  BackWall.Brush.Color = clWhite
                  BackWall.Brush.Style = bsClear
                  BackWall.Pen.Visible = False
                  Title.Text.Strings = (
                    #32844#19994#27604#20363)
                  AxisVisible = False
                  ClipPoints = False
                  Frame.Visible = False
                  View3DOptions.Elevation = 315
                  View3DOptions.Orthogonal = False
                  View3DOptions.Perspective = 0
                  View3DOptions.Rotation = 360
                  View3DWalls = False
                  Align = alClient
                  ParentColor = True
                  TabOrder = 0
                  OnDblClick = DBChart1DblClick
                  object Series4: TPieSeries
                    Marks.ArrowLength = 8
                    Marks.Visible = True
                    DataSource = Q_Job2
                    SeriesColor = clRed
                    XLabelsSource = 'job_mc'
                    OtherSlice.Text = 'Other'
                    PieValues.DateTime = False
                    PieValues.Name = 'Pie'
                    PieValues.Multiplier = 1
                    PieValues.Order = loNone
                    PieValues.ValueSource = 'COUNT'
                  end
                end
              end
            end
          end
          object TabSheet11: TTabSheet
            Caption = #20154#21592#31867#22411#27604#20363
            ImageIndex = 2
            object PageControl6: TPageControl
              Left = 0
              Top = 0
              Width = 483
              Height = 320
              ActivePage = TabSheet15
              Align = alClient
              TabIndex = 0
              TabOrder = 0
              object TabSheet15: TTabSheet
                Caption = #24403#21069
                object DBChart5: TDBChart
                  Left = 0
                  Top = 0
                  Width = 475
                  Height = 292
                  AllowPanning = pmNone
                  AllowZoom = False
                  BackWall.Brush.Color = clWhite
                  BackWall.Brush.Style = bsClear
                  BackWall.Pen.Visible = False
                  Title.Text.Strings = (
                    #20154#21592#31867#22411#27604#20363)
                  AxisVisible = False
                  ClipPoints = False
                  Frame.Visible = False
                  View3DOptions.Elevation = 315
                  View3DOptions.Orthogonal = False
                  View3DOptions.Perspective = 0
                  View3DOptions.Rotation = 360
                  View3DWalls = False
                  Align = alClient
                  ParentColor = True
                  TabOrder = 0
                  OnDblClick = DBChart1DblClick
                  object Series6: TPieSeries
                    Marks.ArrowLength = 8
                    Marks.Visible = True
                    DataSource = Q_Type1
                    SeriesColor = clRed
                    XLabelsSource = 'xtype_mc'
                    OtherSlice.Text = 'Other'
                    PieValues.DateTime = False
                    PieValues.Name = 'Pie'
                    PieValues.Multiplier = 1
                    PieValues.Order = loNone
                    PieValues.ValueSource = 'COUNT'
                  end
                end
              end
              object TabSheet16: TTabSheet
                Caption = #25972#20307
                ImageIndex = 1
                object DBChart6: TDBChart
                  Left = 0
                  Top = 0
                  Width = 475
                  Height = 292
                  AllowPanning = pmNone
                  AllowZoom = False
                  BackWall.Brush.Color = clWhite
                  BackWall.Brush.Style = bsClear
                  BackWall.Pen.Visible = False
                  Title.Text.Strings = (
                    #20154#21592#31867#22411#27604#20363)
                  AxisVisible = False
                  ClipPoints = False
                  Frame.Visible = False
                  View3DOptions.Elevation = 315
                  View3DOptions.Orthogonal = False
                  View3DOptions.Perspective = 0
                  View3DOptions.Rotation = 360
                  View3DWalls = False
                  Align = alClient
                  ParentColor = True
                  TabOrder = 0
                  OnDblClick = DBChart1DblClick
                  object Series5: TPieSeries
                    Marks.ArrowLength = 8
                    Marks.Visible = True
                    DataSource = Q_Type2
                    SeriesColor = clRed
                    XLabelsSource = 'xtype_mc'
                    OtherSlice.Text = 'Other'
                    PieValues.DateTime = False
                    PieValues.Name = 'Pie'
                    PieValues.Multiplier = 1
                    PieValues.Order = loNone
                    PieValues.ValueSource = 'COUNT'
                  end
                end
              end
            end
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #22521#35757#35760#24405#20449#24687
        ImageIndex = 2
        object Label2: TLabel
          Left = 8
          Top = 16
          Width = 52
          Height = 13
          Caption = #25253#21517#26085#26399
          FocusControl = DBEdit1
        end
        object Label3: TLabel
          Left = 200
          Top = 16
          Width = 52
          Height = 13
          Caption = #22521#35757#31181#31867
        end
        object Label4: TLabel
          Left = 8
          Top = 40
          Width = 26
          Height = 13
          Caption = #20215#26684
        end
        object Label5: TLabel
          Left = 8
          Top = 88
          Width = 52
          Height = 13
          Caption = #22521#35757#35828#26126
        end
        object Label6: TLabel
          Left = 200
          Top = 40
          Width = 26
          Height = 13
          Caption = #25240#25187
          FocusControl = DBEdit3
        end
        object Label7: TLabel
          Left = 8
          Top = 64
          Width = 52
          Height = 13
          Caption = #23454#38469#25910#36153
          FocusControl = DBEdit4
        end
        object Label8: TLabel
          Left = 200
          Top = 64
          Width = 52
          Height = 13
          Caption = #23398#21592#29366#24577
          FocusControl = DBLookupComboBox2
        end
        object Label9: TLabel
          Left = 8
          Top = 160
          Width = 26
          Height = 13
          Caption = #35780#20215
          FocusControl = DBMemo2
        end
        object DBEdit1: TDBEdit
          Left = 72
          Top = 8
          Width = 113
          Height = 21
          DataField = 'COME_DATE'
          DataSource = DS1
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 72
          Top = 32
          Width = 113
          Height = 21
          Color = clInfoBk
          DataField = 'kind_price'
          DataSource = DS1
          ReadOnly = True
          TabOrder = 1
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 256
          Top = 8
          Width = 121
          Height = 21
          DataField = 'kind_mc'
          DataSource = DS1
          TabOrder = 2
        end
        object DBMemo1: TDBMemo
          Left = 72
          Top = 80
          Width = 305
          Height = 65
          Color = clInfoBk
          DataField = 'kind_detail'
          DataSource = DS1
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 3
        end
        object DBEdit3: TDBEdit
          Left = 256
          Top = 32
          Width = 49
          Height = 21
          DataField = 'ZK'
          DataSource = DS1
          TabOrder = 4
        end
        object DBEdit4: TDBEdit
          Left = 72
          Top = 56
          Width = 113
          Height = 21
          DataField = 'REAL_PRICE'
          DataSource = DS1
          TabOrder = 5
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 256
          Top = 56
          Width = 121
          Height = 21
          DataField = 'state_mc'
          DataSource = DS1
          TabOrder = 6
        end
        object DBMemo2: TDBMemo
          Left = 72
          Top = 152
          Width = 305
          Height = 65
          DataField = 'DETAIL'
          DataSource = DS1
          ScrollBars = ssVertical
          TabOrder = 7
        end
        object DBGrid2: TDBGrid
          Left = 0
          Top = 224
          Width = 377
          Height = 89
          DataSource = DS1
          FixedColor = 14935011
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 8
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'COME_DATE'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'kind_price'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZK'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REAL_PRICE'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'kind_mc'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'state_mc'
              Width = 57
              Visible = True
            end>
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 89
      Width = 187
      Height = 376
      Align = alLeft
      Caption = 'Panel1'
      TabOrder = 2
      object DBGrid1: TDBGrid
        Left = 1
        Top = 33
        Width = 185
        Height = 342
        Align = alClient
        DataSource = DS
        FixedColor = 14935011
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NAME'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BH'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SEX'
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 185
        Height = 32
        Align = alTop
        Caption = 'Panel2'
        TabOrder = 1
        object DN: TDBNavigator
          Left = 1
          Top = 1
          Width = 183
          Height = 30
          DataSource = DS
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alClient
          Flat = True
          TabOrder = 0
        end
      end
    end
  end
  object DS1: TDataSource
    DataSet = DM.T_Px_Record
    Left = 424
    Top = 120
  end
  object DS: TDataSource
    DataSet = DM.Q_Person
    Left = 376
    Top = 120
  end
  object Q_Sex1: TQuery
    DatabaseName = 'data'
    SQL.Strings = (
      'SELECT SEX,COUNT(SEX)'
      'FROM T_PERSON T_person GROUP BY SEX')
    Left = 80
    Top = 176
    object Q_Sex1SEX: TStringField
      FieldName = 'SEX'
      Origin = 'DATA.T_PERSON.SEX'
      FixedChar = True
      Size = 2
    end
    object Q_Sex1COUNT: TIntegerField
      FieldName = 'COUNT'
      Origin = 'DATA.T_PERSON.SEX'
    end
  end
  object Q_Sex2: TQuery
    DatabaseName = 'data'
    SQL.Strings = (
      'SELECT SEX,COUNT(SEX)'
      'FROM T_PERSON T_person GROUP BY SEX')
    Left = 112
    Top = 176
    object Q_Sex2SEX: TStringField
      FieldName = 'SEX'
      Origin = 'DATA.T_PERSON.SEX'
      FixedChar = True
      Size = 2
    end
    object Q_Sex2COUNT: TIntegerField
      FieldName = 'COUNT'
      Origin = 'DATA.T_PERSON.SEX'
    end
  end
  object Q_Job1: TQuery
    DatabaseName = 'data'
    SQL.Strings = (
      'SELECT COMPANY_JOB,COUNT(COMPANY_JOB)'
      'FROM T_PERSON T_person GROUP BY COMPANY_JOB')
    Left = 80
    Top = 216
    object Q_Job1COMPANY_JOB: TStringField
      FieldName = 'COMPANY_JOB'
      Origin = 'DATA.T_PERSON.COMPANY_JOB'
      FixedChar = True
      Size = 2
    end
    object Q_Job1COUNT: TIntegerField
      FieldName = 'COUNT'
      Origin = 'DATA.T_PERSON.COMPANY_JOB'
    end
    object Q_Job1job_mc: TStringField
      FieldKind = fkLookup
      FieldName = 'job_mc'
      LookupDataSet = DM.T_JOB
      LookupKeyFields = 'JOB_BH'
      LookupResultField = 'JOB_MC'
      KeyFields = 'COMPANY_JOB'
      Size = 10
      Lookup = True
    end
  end
  object Q_Job2: TQuery
    DatabaseName = 'data'
    SQL.Strings = (
      'SELECT COMPANY_JOB,COUNT(COMPANY_JOB)'
      'FROM T_PERSON T_person GROUP BY COMPANY_JOB')
    Left = 112
    Top = 216
    object Q_Job2COMPANY_JOB: TStringField
      FieldName = 'COMPANY_JOB'
      Origin = 'DATA.T_PERSON.COMPANY_JOB'
      FixedChar = True
      Size = 2
    end
    object Q_Job2COUNT: TIntegerField
      FieldName = 'COUNT'
      Origin = 'DATA.T_PERSON.COMPANY_JOB'
    end
    object Q_Job2job_mc: TStringField
      FieldKind = fkLookup
      FieldName = 'job_mc'
      LookupDataSet = DM.T_JOB
      LookupKeyFields = 'JOB_BH'
      LookupResultField = 'JOB_MC'
      KeyFields = 'COMPANY_JOB'
      Size = 10
      Lookup = True
    end
  end
  object Q_Type1: TQuery
    DatabaseName = 'data'
    SQL.Strings = (
      'SELECT XTYPE,COUNT(XTYPE)'
      'FROM T_PERSON T_person GROUP BY XTYPE')
    Left = 80
    Top = 256
    object Q_Type1XTYPE: TStringField
      FieldName = 'XTYPE'
      Origin = 'DATA.T_PERSON.XTYPE'
      FixedChar = True
      Size = 2
    end
    object Q_Type1COUNT: TIntegerField
      FieldName = 'COUNT'
      Origin = 'DATA.T_PERSON.XTYPE'
    end
    object Q_Type1xtype_mc: TStringField
      FieldKind = fkLookup
      FieldName = 'xtype_mc'
      LookupDataSet = DM.T_XTYPE
      LookupKeyFields = 'XTYPE_BH'
      LookupResultField = 'XTYPE_MC'
      KeyFields = 'XTYPE'
      Size = 10
      Lookup = True
    end
  end
  object Q_Type2: TQuery
    DatabaseName = 'data'
    SQL.Strings = (
      'SELECT XTYPE,COUNT(XTYPE)'
      'FROM T_PERSON T_person GROUP BY XTYPE')
    Left = 112
    Top = 256
    object StringField3: TStringField
      FieldName = 'XTYPE'
      Origin = 'DATA.T_PERSON.XTYPE'
      FixedChar = True
      Size = 2
    end
    object IntegerField3: TIntegerField
      FieldName = 'COUNT'
      Origin = 'DATA.T_PERSON.XTYPE'
    end
    object Q_Type2xtype_mc: TStringField
      FieldKind = fkLookup
      FieldName = 'xtype_mc'
      LookupDataSet = DM.T_XTYPE
      LookupKeyFields = 'XTYPE_BH'
      LookupResultField = 'XTYPE_MC'
      KeyFields = 'XTYPE'
      Size = 10
      Lookup = True
    end
  end
  object SPD: TSavePictureDialog
    DefaultExt = 'bmp'
    Filter = #20301#22270' (*.bmp)|*.bmp|Metafiles (*.wmf)|*.wmf'
    Left = 328
    Top = 80
  end
end
