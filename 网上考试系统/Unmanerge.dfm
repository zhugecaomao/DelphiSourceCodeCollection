object Operatorfrm: TOperatorfrm
  Left = 183
  Top = 89
  Width = 808
  Height = 580
  Caption = #26435#38480#31649#29702
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
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 800
    Height = 553
    ActivePage = TabSheet2
    Align = alClient
    TabIndex = 1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #20462#25913#23494#30721
      object BitBtn1: TBitBtn
        Left = 280
        Top = 320
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 0
        OnClick = BitBtn1Click
        Kind = bkOK
      end
      object GroupBox1: TGroupBox
        Left = 272
        Top = 88
        Width = 241
        Height = 209
        Caption = #20462#25913#23494#30721
        TabOrder = 1
        object Label1: TLabel
          Left = 16
          Top = 32
          Width = 48
          Height = 13
          Caption = #29992#25143#21517#65306
        end
        object Label2: TLabel
          Left = 16
          Top = 112
          Width = 48
          Height = 13
          Caption = #26032#21475#20196#65306
        end
        object Label3: TLabel
          Left = 16
          Top = 152
          Width = 72
          Height = 13
          Caption = #30830#35748#26032#21475#20196#65306
        end
        object Label4: TLabel
          Left = 16
          Top = 72
          Width = 48
          Height = 13
          Caption = #26087#21475#20196#65306
        end
        object Edit1: TEdit
          Left = 96
          Top = 32
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object Edit2: TEdit
          Left = 96
          Top = 72
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object Edit3: TEdit
          Left = 96
          Top = 112
          Width = 121
          Height = 21
          TabOrder = 2
        end
        object Edit4: TEdit
          Left = 96
          Top = 152
          Width = 121
          Height = 21
          TabOrder = 3
        end
      end
      object BitBtn2: TBitBtn
        Left = 424
        Top = 320
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 2
        OnClick = BitBtn2Click
        Kind = bkCancel
      end
    end
    object TabSheet2: TTabSheet
      Caption = #25805#20316#21592#31649#29702
      ImageIndex = 1
      object BitBtn3: TBitBtn
        Left = 296
        Top = 136
        Width = 75
        Height = 25
        Caption = #28155#21152
        TabOrder = 0
        OnClick = BitBtn3Click
        Kind = bkOK
      end
      object BitBtn4: TBitBtn
        Left = 424
        Top = 136
        Width = 75
        Height = 25
        Caption = #21024#38500
        TabOrder = 1
        OnClick = BitBtn4Click
        Kind = bkAbort
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 793
        Height = 121
        BevelOuter = bvLowered
        TabOrder = 2
        object Label5: TLabel
          Left = 72
          Top = 8
          Width = 27
          Height = 13
          Caption = #22995#21517':'
          FocusControl = DBEdit1
        end
        object Label6: TLabel
          Left = 72
          Top = 48
          Width = 27
          Height = 13
          Caption = #21475#20196':'
          FocusControl = DBEdit2
        end
        object Label7: TLabel
          Left = 72
          Top = 88
          Width = 27
          Height = 13
          Caption = #32423#21035':'
          FocusControl = DBEdit3
        end
        object DBEdit1: TDBEdit
          Left = 120
          Top = 8
          Width = 105
          Height = 21
          DataField = #22995#21517
          DataSource = DataSource1
          Enabled = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 120
          Top = 48
          Width = 105
          Height = 21
          DataField = #21475#20196
          DataSource = DataSource1
          Enabled = False
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 120
          Top = 88
          Width = 105
          Height = 21
          DataField = #32423#21035
          DataSource = DataSource1
          Enabled = False
          TabOrder = 2
        end
        object GroupBox2: TGroupBox
          Left = 536
          Top = 8
          Width = 185
          Height = 105
          Caption = #32423#21035
          TabOrder = 3
          object Label8: TLabel
            Left = 40
            Top = 24
            Width = 84
            Height = 13
            Caption = '1------'#31995#32479#31649#29702#21592
          end
          object Label9: TLabel
            Left = 40
            Top = 64
            Width = 48
            Height = 13
            Caption = '2------'#32769#24072
          end
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 176
        Width = 793
        Height = 345
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #22995#21517
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #21475#20196
            Width = 60
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #32423#21035
            PickList.Strings = (
              '1'
              '2')
            Width = 46
            Visible = True
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 136
        Width = 220
        Height = 25
        DataSource = DataSource1
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 4
      end
      object BitBtn5: TBitBtn
        Left = 648
        Top = 136
        Width = 75
        Height = 25
        Caption = #20851#38381
        TabOrder = 5
        OnClick = BitBtn5Click
        Kind = bkClose
      end
    end
    object TabSheet3: TTabSheet
      Caption = #24037#20316#31449#32500#25252
      ImageIndex = 2
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 529
        Height = 425
        DataSource = DataSource2
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #26426#22120#21495
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #29366#24577
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = #32771#22330
            Visible = True
          end>
      end
      object DBNavigator2: TDBNavigator
        Left = 0
        Top = 424
        Width = 790
        Height = 33
        DataSource = DataSource2
        TabOrder = 1
      end
      object Panel2: TPanel
        Left = 536
        Top = 8
        Width = 249
        Height = 409
        TabOrder = 2
        object GroupBox3: TGroupBox
          Left = 16
          Top = 16
          Width = 217
          Height = 369
          Caption = #29366#24577
          TabOrder = 0
          object Label10: TLabel
            Left = 64
            Top = 40
            Width = 54
            Height = 13
            Caption = '1----'#26410#30331#24405
          end
          object Label11: TLabel
            Left = 64
            Top = 72
            Width = 54
            Height = 13
            Caption = '2----'#32771#35797#20013
          end
          object Label12: TLabel
            Left = 64
            Top = 104
            Width = 54
            Height = 13
            Caption = '3----'#24050#20132#21367
          end
          object Label13: TLabel
            Left = 64
            Top = 136
            Width = 66
            Height = 13
            Caption = '4----'#26426#22120#31354#38386
          end
          object Label14: TLabel
            Left = 64
            Top = 168
            Width = 57
            Height = 13
            Caption = '5-----'#24050#20998#37197
          end
          object Label15: TLabel
            Left = 64
            Top = 200
            Width = 57
            Height = 13
            Caption = '6-----'#24453#20998#37197
          end
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.CDSManerge
    Left = 16
    Top = 72
  end
  object DataSource2: TDataSource
    DataSet = DataModule1.CDSInformation
    Left = 184
    Top = 120
  end
end
