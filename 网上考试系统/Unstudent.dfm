object studentfrm: Tstudentfrm
  Left = 170
  Top = 162
  Width = 775
  Height = 474
  Caption = #32771#21592#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 767
    Height = 447
    ActivePage = TabSheet2
    Align = alClient
    TabIndex = 1
    TabOrder = 0
    Visible = False
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #32771#21592#20449#24687#24405#20837
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 60
        Height = 13
        Caption = #20934#32771#35777#21495#65306
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 288
        Top = 8
        Width = 36
        Height = 13
        Caption = #22995#21517#65306
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 368
        Top = 48
        Width = 36
        Height = 13
        Caption = #24615#21035#65306
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 16
        Top = 88
        Width = 36
        Height = 13
        Caption = #20303#22336#65306
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 8
        Top = 48
        Width = 60
        Height = 13
        Caption = #36523#20221#35777#21495#65306
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 520
        Top = 8
        Width = 36
        Height = 13
        Caption = #29031#29255#65306
        FocusControl = DBImage1
      end
      object DBEdit1: TDBEdit
        Left = 80
        Top = 8
        Width = 160
        Height = 21
        DataField = #20934#32771#35777#21495
        DataSource = DataSource1
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 336
        Top = 8
        Width = 108
        Height = 21
        DataField = #22995#21517
        DataSource = DataSource1
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 416
        Top = 48
        Width = 30
        Height = 21
        DataField = #24615#21035
        DataSource = DataSource1
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 80
        Top = 88
        Width = 369
        Height = 21
        DataField = #20303#22336
        DataSource = DataSource1
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 80
        Top = 48
        Width = 238
        Height = 21
        DataField = #36523#20221#35777#21495
        DataSource = DataSource1
        TabOrder = 4
      end
      object DBImage1: TDBImage
        Left = 568
        Top = 8
        Width = 89
        Height = 105
        DataField = #29031#29255
        DataSource = DataSource1
        TabOrder = 5
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 176
        Width = 793
        Height = 353
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = #20934#32771#35777#21495
            Visible = True
          end
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
            FieldName = #20303#22336
            Visible = True
          end
          item
            Expanded = False
            FieldName = #36523#20221#35777#21495
            Visible = True
          end
          item
            Expanded = False
            FieldName = #32771#35797#26085#26399
            Visible = True
          end
          item
            Expanded = False
            FieldName = #29031#29255
            Visible = True
          end>
      end
      object BitBtn4: TBitBtn
        Left = 680
        Top = 88
        Width = 75
        Height = 25
        Caption = #35835#21462#29031#29255
        TabOrder = 7
        OnClick = BitBtn4Click
      end
      object Panel1: TPanel
        Left = 0
        Top = 120
        Width = 793
        Height = 49
        BorderStyle = bsSingle
        TabOrder = 8
        object BitBtn1: TBitBtn
          Left = 248
          Top = 8
          Width = 75
          Height = 25
          Caption = #28155#21152
          TabOrder = 0
          OnClick = BitBtn1Click
          Kind = bkYes
        end
        object BitBtn2: TBitBtn
          Left = 368
          Top = 8
          Width = 75
          Height = 25
          Caption = #21024#38500
          TabOrder = 1
          OnClick = BitBtn2Click
          Kind = bkCancel
        end
        object DBNavigator1: TDBNavigator
          Left = 8
          Top = 8
          Width = 176
          Height = 25
          DataSource = DataSource1
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 2
          OnClick = DBNavigator1Click
        end
        object BitBtn5: TBitBtn
          Left = 624
          Top = 8
          Width = 75
          Height = 25
          Caption = #20851#38381
          TabOrder = 3
          OnClick = BitBtn5Click
          Kind = bkClose
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #20934#32771#35777#25171#21360
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 16
        Top = 8
        Width = 769
        Height = 169
        Caption = #35831#36755#20837#20934#32771#35777#30456#20851#36164#26009
        TabOrder = 0
        object Label9: TLabel
          Left = 16
          Top = 24
          Width = 60
          Height = 13
          Caption = #32771#35797#26102#38388#65306
        end
        object Label10: TLabel
          Left = 16
          Top = 96
          Width = 60
          Height = 13
          Caption = #32771#35797#22320#28857#65306
        end
        object Addressedit: TEdit
          Left = 16
          Top = 120
          Width = 345
          Height = 21
          TabOrder = 0
        end
        object datepick: TDateTimePicker
          Left = 16
          Top = 48
          Width = 153
          Height = 21
          CalAlignment = dtaLeft
          Date = 37773.3441677546
          Time = 37773.3441677546
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 16
        Top = 192
        Width = 769
        Height = 97
        Caption = #25171#21360#33539#22260
        TabOrder = 1
        object Label8: TLabel
          Left = 264
          Top = 64
          Width = 12
          Height = 13
          Caption = #21040
        end
        object Edit1: TEdit
          Left = 160
          Top = 64
          Width = 97
          Height = 21
          TabOrder = 0
        end
        object Edit2: TEdit
          Left = 288
          Top = 64
          Width = 105
          Height = 21
          TabOrder = 1
        end
        object RBsome: TRadioButton
          Left = 48
          Top = 64
          Width = 113
          Height = 17
          Caption = #20934#32771#35777#21495#65306'  '#20174
          TabOrder = 2
          OnClick = RBsomeClick
        end
        object RBall: TRadioButton
          Left = 48
          Top = 32
          Width = 113
          Height = 17
          Caption = #20840#37096
          Checked = True
          TabOrder = 3
          TabStop = True
          OnClick = RBallClick
        end
      end
      object BitBtn7: TBitBtn
        Left = 272
        Top = 360
        Width = 75
        Height = 25
        Caption = #25171#21360#39044#35272
        TabOrder = 2
        OnClick = BitBtn7Click
      end
      object BitBtn8: TBitBtn
        Left = 432
        Top = 360
        Width = 75
        Height = 25
        Caption = #25171#21360
        TabOrder = 3
        OnClick = BitBtn8Click
      end
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 416
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.CDSStudent
    Left = 376
    Top = 8
  end
end
